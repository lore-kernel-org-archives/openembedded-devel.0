Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5436B6057B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 01:27:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u041RjSH007446
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 3 Jan 2016 17:27:45 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 3 Jan 2016 17:27:45 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Jan 2016 09:14:01 +0800
Message-ID: <1451870041-5001-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] mime-construct: Perform more mangling for perl path
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
X-List-Received-Date: Mon, 04 Jan 2016 01:27:47 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

native perl is in /usr/bin/mime-construct, introduce the below
QA warning, it should be replaced:

WARNING: QA Issue: /usr/bin/mime-construct_mime-construct contained in package mime-construct requires
tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl, but no providers found in its RDEPENDS [file-rdeps]

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../recipes-extended/mime-construct/mime-construct_1.11.bb          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb b/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb
index 6db4fdf..61bcd13 100644
--- a/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb
+++ b/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb
@@ -20,3 +20,9 @@ inherit cpan
 RDEPENDS_${PN} = "msmtp perl perl-module-mime-base64 perl-module-mime-quotedprint \
     libproc-waitstat-perl libmime-types-perl perl-module-filehandle perl-module-posix \
 "
+
+do_install_append() {
+   #change the interpreter in file
+   sed -i -e "s|${STAGING_BINDIR_NATIVE}/perl-native/perl -w|${bindir}/env perl|g" \
+      ${D}/${bindir}/mime-construct
+}
-- 
1.9.1


