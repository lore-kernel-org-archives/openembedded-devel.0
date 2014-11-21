Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2129965C91
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 09:16:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAL9Gs6H007114
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 01:16:54 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 21 Nov 2014 01:16:54 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Nov 2014 04:16:52 -0500
Message-ID: <1416561412-28886-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] postfix.inc: Remove references to buildmachine paths in target makedefs.out
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Nov 2014 09:17:01 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fixed the buildpaths QA issue:
ERROR: QA Issue: File
/work/core2-64-wrs-linux/postfix/2.11.1-r0/packages-split/postfix/etc/postfix/makedefs.out
in package contained reference to tmpdir [buildpaths]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index d2f3356..caf1f80 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -204,6 +204,11 @@ do_install_append_class-native() {
 	ln -sf ../sbin/sendmail.postfix ${D}${bindir}/mailq
 }
 
+do_install_append_class-target() {
+	# Remove references to buildmachine paths in target makedefs.out
+	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' ${D}/etc/postfix/makedefs.out
+}
+
 NATIVE_INSTALL_WORKS = "1"
 
 ALTERNATIVE_${PN} = "sendmail"
-- 
2.0.0


