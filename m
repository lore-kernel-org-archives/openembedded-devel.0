Return-Path: <jatedev@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8571C6F898
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Apr 2014 15:48:57 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id o6so6799220oag.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Apr 2014 08:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JSLUZS8V5xQUIV0Cx8WwmdTlWlYEZv5hq+r/kUfYFcE=;
	b=h8ALgJqV1XQ0kX6q+2J5vghZMAoT3xVSDykeF5GIOtqggfQPWiwTK/vU+haIRmRDdt
	OckSmX/ZZp4BoB+f1ZlNOQYFKrt7p7L/9Goz3Twqwun3wqd0qjJoi5BMsNJQPwvZ+pyr
	uOPJ1u58VV0CZbz621JNPqnMd0zMOfVBmtmGNGV/ziYWR7om5uoa4uzMUmOi/bjHRTk7
	hwlYq4uYvUgfczkuF/eFqVQu0CJLR+aWkc200DC25dNVcX+6or3xptRS1qMHoGvSr61M
	thSx3SpXQBA93m8m8PEp3d2d0aWqO9ke+dfPJbmwR5oM6JrNPmFyAs66vGihzGx8iSU8
	FMbA==
X-Received: by 10.60.62.178 with SMTP id z18mr2533017oer.61.1396885738104;
	Mon, 07 Apr 2014 08:48:58 -0700 (PDT)
Received: from STSPYoctoBuild.syntech.org (exchsrvr.syntech-fuelmaster.com.
	[199.44.250.2]) by mx.google.com with ESMTPSA id
	qp6sm30802952obb.14.2014.04.07.08.48.57 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Apr 2014 08:48:57 -0700 (PDT)
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Apr 2014 11:47:02 -0400
Message-Id: <1396885622-28017-1-git-send-email-jatedev@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Jate Sujjavanich <jate.sujjavanich@myfuelmaster.com>
Subject: [meta-oe][PATCH] Fix samba's DEPENDS which was triggering rebuild
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
X-List-Received-Date: Mon, 07 Apr 2014 15:48:57 -0000

From: Jate Sujjavanich <jate.sujjavanich@myfuelmaster.com>

Use PACKAGECONFIG to properly provide the option for libtalloc

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index 7391bbf..b527a66 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -1,6 +1,6 @@
 SECTION = "console/network"
 LICENSE = "GPL-3.0"
-DEPENDS = "readline virtual/libiconv talloc zlib popt"
+DEPENDS = "readline virtual/libiconv zlib popt"
 
 SRC_URI = "http://samba.org/samba/ftp/stable/samba-${PV}.tar.gz \
            file://volatiles.03_samba \
@@ -35,7 +35,6 @@ EXTRA_OECONF='--disable-cups \
               --with-aio-support \
               --with-winbind \
               --with-wbclient \
-              --without-libtalloc \
               --without-acl-support \
               --disable-avahi \
               samba_cv_struct_timespec=yes \
@@ -44,6 +43,7 @@ EXTRA_OECONF='--disable-cups \
 PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
 PACKAGECONFIG[fam] = "--enable-fam,--disable-fam,gamin"
+PACKAGECONFIG[talloc] = "--with-libtalloc,--without-libtalloc,talloc"
 
 INITSCRIPT_PACKAGES = "samba winbind"
 INITSCRIPT_NAME_samba = "samba"
-- 
1.7.9.5


