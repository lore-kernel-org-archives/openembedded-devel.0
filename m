Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6222B78351
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Aug 2017 10:31:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v71AVmfO000497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 1 Aug 2017 11:31:49 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dcUSq-0000H9-I4; Tue, 01 Aug 2017 11:31:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Aug 2017 11:31:47 +0100
Message-Id: <1501583507-1017-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 01 Aug 2017 11:31:49 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] uninative: Allow a local own-mirror to work with uninative
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Aug 2017 10:31:49 -0000

The games we play with path manipulation of DL_DIR in uninative mean standard
PREMIRRORS don't work and we can't easily put 'chksum' into the url path from
a url parameter with the current fetcher url handling to make a generic
remapping. We therefore add to PREMIRRORS when we know the chksum to
create a premirror mapping which can work.

[YOCTO #9888]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/uninative.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 8f34483..a410647 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -49,6 +49,12 @@ python uninative_event_fetchloader() {
             localdata = bb.data.createCopy(d)
             localdata.setVar('FILESPATH', "")
             localdata.setVar('DL_DIR', tarballdir)
+            # Our games with path manipulation of DL_DIR mean standard PREMIRRORS don't work
+            # and we can't easily put 'chksum' into the url path from a url parameter with
+            # the current fetcher url handling
+            ownmirror = d.getVar('SOURCE_MIRROR_URL')
+            if ownmirror:
+                localdata.appendVar("PREMIRRORS", " ${UNINATIVE_URL}${UNINATIVE_TARBALL} ${SOURCE_MIRROR_URL}/uninative/%s/${UNINATIVE_TARBALL}" % chksum)
 
             srcuri = d.expand("${UNINATIVE_URL}${UNINATIVE_TARBALL};sha256sum=%s" % chksum)
             bb.note("Fetching uninative binary shim from %s" % srcuri)
-- 
2.7.4


