Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sgc0g-000426-Mq
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jun 2012 15:28:50 +0200
Received: by bkcjm2 with SMTP id jm2so3831406bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2012 06:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=54JKPSG/BRXkDzQngDGMBZug0afWeW7UpfN3BfJSQ3Y=;
	b=rLdvyUxGoG5vrjBh+GnABaV4kmPuCRRd1vv7dYDNirjClyYgSWqFJigl6gu+hkz5ij
	qp20E5iaVI8xhdCjdFKwNQk/5eJIfrgn7PicdNMgIgHeiScDRSCPylOl1ERiQENBiKwB
	AAOj9PDN7rqxIx/Z5y1eG6txhZ6wr2h9JBvJzrdzPHOw0Jm0s1Lb7R4xkP2C7x1a9Rtt
	P/Qxq148MaNwtqykgjNRTQwfjsbv4MW2ASaOJwQyIBENLfgBPW2uqzEAkc2zlw4O87Gp
	1hpALNvAndVwQkbjY+LXI8/TQ+TcywVt0UeH+oe483U1ignLb6rKIhjqYaQTmMLrlTBR
	bLzA==
Received: by 10.204.157.23 with SMTP id z23mr6480505bkw.71.1340025488477;
	Mon, 18 Jun 2012 06:18:08 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-153.unitymediagroup.de.
	[178.202.232.153])
	by mx.google.com with ESMTPS id h18sm18718766bkh.8.2012.06.18.06.18.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jun 2012 06:18:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jun 2012 15:17:51 +0200
Message-Id: <1340025471-3337-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe] libjpeg-turbo: update 1.2.1 / use version 8d to follow oe-core libjpeg update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2012 13:28:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

without following oe-core's version PREFERRED_PROVIDER_jpeg does not work and
libjpeg is build.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
index 76e2da4..16fb2c7 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe
                     file://jpeglib.h;endline=14;md5=7bb9a39828a1b1e84acd4e8aec1e5532 \
                     file://djpeg.c;endline=13;md5=e85613b52f2906c5dfc0e21ec902cb33 \
 "
-PV = "8c+1.2.0"
-SRCREV = "733"
+PV = "8d+1.2.1"
+SRCREV = "837"
 SRC_URI = "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;proto=https;module=trunk"
 
 S = "${WORKDIR}/trunk"
-- 
1.7.6.5



