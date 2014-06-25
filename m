Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7A1DE6059A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 07:36:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5P7asIp026521
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:36:54 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 25 Jun 2014 00:36:54 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jun 2014 15:36:53 +0800
Message-ID: <1403681813-4014-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] samba: fix dependency issue about talloc
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
X-List-Received-Date: Wed, 25 Jun 2014 07:36:58 -0000
Content-Type: text/plain

Check whether to enable external talloc by PACKAGECONFIG.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index 39fc814..3da0562 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -43,7 +43,7 @@ EXTRA_OECONF='--disable-cups \
 PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
 PACKAGECONFIG[fam] = "--enable-fam,--disable-fam,gamin"
-PACKAGECONFIG[talloc] = "--with-libtalloc,--without-libtalloc,talloc"
+PACKAGECONFIG[talloc] = "--enable-external-libtalloc --with-libtalloc, --disable-external-libtalloc --without-libtalloc, talloc"
 
 INITSCRIPT_PACKAGES = "samba winbind"
 INITSCRIPT_NAME_samba = "samba"
-- 
1.7.9.5


