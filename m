Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8FB60D67
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 05:22:22 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id w62so281345wes.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 22:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/CwHwwRK9QjlKQneJ5L6Q1MTQJX0EWeNV+0Fj+YRAzE=;
	b=A1UYibcPsMlqll2bSykBZmKkEoDARv/6ekM3hfTyoW804ZUoTi1WfgfO5Gha+6lqgq
	VCT4ihyuXz3s+pzP3+zhyMuPUV0j2aJ0+U0Y7EhJCpPm6z7BSDEA7KrDAeKf+oPPmRJb
	upOzYg7d+KBQ/aTXWeb7y67J3X/12MsDIphJUnhXXlNt8chaxKnVPKBBnuKP1iiNt81S
	souAjbZCqiUzZ1VKguj/dy4PjjyfrbhC6SGXBgUzkroJafWZWwxt/AnBF/2/u58P3EVO
	Avry4AROBQ1F28Ag8Ej4EkM8osC6S+Sdkv4IGrutswvFphfSj8OAwKnJsxiKppOyGWJP
	fCWQ==
X-Gm-Message-State: ALoCoQlnYn7rt/3d3HtkIZVpI68PwNJFKOkwwwuHjcOzoe8dEU31dFwwgTZWJixKCu81QnAN15DZ
X-Received: by 10.194.58.79 with SMTP id o15mr287866wjq.62.1398835343435;
	Tue, 29 Apr 2014 22:22:23 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id dn4sm1172576wib.18.2014.04.29.22.22.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Apr 2014 22:22:22 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Apr 2014 07:22:20 +0200
Message-Id: <1398835340-20639-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] openldap: inherit autotools-brokensep
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
X-List-Received-Date: Wed, 30 Apr 2014 05:22:28 -0000

Also remove hack that deletes headers from staging, it's not needed anymore.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-support/openldap/openldap_2.4.23.bb | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
index 434029c..5c6f9ea 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
@@ -29,7 +29,7 @@ PR = "r1"
 # environments
 SRC_URI += "file://install-strip.patch"
 
-inherit autotools
+inherit autotools-brokensep
 
 # CV SETTINGS
 # Required to work round AC_FUNC_MEMCMP which gets the wrong answer
@@ -151,20 +151,6 @@ do_configure() {
     oe_runconf
 }
 
-#FIXME: this is a hack, at present an openldap build will pick up the header
-# files from staging rather than the local ones (bad -I order), so remove
-# the headers (from openldap-old.x) before compiling...
-do_compile_prepend() {
-    (
-        cd ${STAGING_INCDIR}
-        rm -f ldap.h ldap_*.h
-    )
-    (
-        cd ${STAGING_LIBDIR}
-        rm -f libldap* liblber*
-    )
-}
-
 LEAD_SONAME = "libldap-${LDAP_VER}.so.*"
 
 # The executables go in a separate package.  This allows the
-- 
1.9.0


