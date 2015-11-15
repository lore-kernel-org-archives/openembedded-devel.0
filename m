Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id AAC6677385
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 16:17:44 +0000 (UTC)
Received: by wmec201 with SMTP id c201so89553102wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 08:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YbOiKKFuZERky9l8AQ4C2apXpNSvKRB4WqJa2Ueq8RM=;
	b=RuTQd38emPdgeaqAOV89AHTG42GrU1UbddDv1iCJ/sCAGl4d/vzZdiRvS/QnX9os2f
	KppbcrIn+hm4xor3MP4gSdrtVXzO4WwgXg+WHupt95QqcRizGksI/s4CAi2AIvCB/Kmq
	geQpv6nQlhbsa3r0McvMANakL4AcG1zHvLj/fbo1XpNlpr3KfUbMd/fY2ascrf9KiA8g
	iuOH1Fud4FW2XEaCgvCzWCize7AaKnY7V3rQ1uk17VT8cmJvYJxV7Tgl2OSoQQycWTVb
	xJ2dQWpbKtAwBnb6QjF9wVeUgh+ZyILO26GJuVMRMdZIP2lAjHTI7yHcFAkewBVOMFMM
	5DGQ==
X-Received: by 10.28.225.84 with SMTP id y81mr13105226wmg.87.1447604264458;
	Sun, 15 Nov 2015 08:17:44 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jh4sm29982670wjb.33.2015.11.15.08.17.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Nov 2015 08:17:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Nov 2015 17:17:35 +0100
Message-Id: <1447604260-5460-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447604260-5460-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447604260-5460-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 3/8] samba: add dependency on libbsd cyrus-sasl and PACKAGECONFIG for dmapi
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
X-List-Received-Date: Sun, 15 Nov 2015 16:17:44 -0000

* dmapi is in meta-filesystems
* hopefully fixes:
  WARN: samba: samba rdepends on cyrus-sasl, but it isn't a build dependency?
  WARN: samba: samba rdepends on dmapi, but it isn't a build dependency?
  WARN: samba: samba rdepends on libbsd, but it isn't a build dependency?
  WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
  WARN: samba: samba-python rdepends on libbsd, but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index 04df8a3..cb29ab9 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -40,7 +40,8 @@ SRC_URI[sha256sum] = "033604674936bf5c77d7df299b0626052b84a41505a6a6afe902f6274f
 
 inherit systemd waf-samba cpan-base perlnative
 
-DEPENDS += "readline virtual/libiconv zlib popt talloc libtdb libtevent libldb krb5 ctdb"
+DEPENDS += "readline virtual/libiconv zlib popt talloc libtdb libtevent libldb krb5 ctdb libbsd cyrus-sasl"
+
 
 SYSVINITTYPE_linuxstdbase = "lsb"
 SYSVINITTYPE = "sysv"
@@ -57,11 +58,12 @@ RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'lsb', '', d)}"
 PACKAGECONFIG[acl] = "--with-acl-support,---without-acl-support,acl"
 PACKAGECONFIG[aio] = "--with-aio-support,---without-aio-support,libaio"
 PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
-PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
+PACKAGECONFIG[pam] = "--with-pam --with-pam_smbpass --with-pammodulesdir=${base_libdir}/security,--without-pam --without-pam_smbpass,libpam"
 PACKAGECONFIG[lsb] = ",,lsb"
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
+PACKAGECONFIG[dmapi] = "--with-dmapi,--without-dmapi,dmapi"
 PACKAGECONFIG[zeroconf] = "--enable-avahi,--disable-avahi,avahi"
 
 SAMBA4_IDMAP_MODULES="idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2"
@@ -77,7 +79,6 @@ EXTRA_OECONF += "--enable-fhs \
                  --with-piddir=${localstatedir}/run \
                  --with-sockets-dir=${localstatedir}/run/samba \
                  --with-modulesdir=${libdir}/samba \
-                 --with-pammodulesdir=${base_libdir}/security \
                  --with-lockdir=${localstatedir}/lib/samba \
                  --with-cachedir=${localstatedir}/lib/samba \
                  --with-perl-lib-install-dir=${PERL_VERNDORLIB} \
-- 
2.6.3


