Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15057.1794153709034599768
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 08:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=aHVIZ4W+;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so298559c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 08:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794153708; x=1794758508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2J8x1ZxvZLdaxhAjJTD3gPlJc1nZxkyj94vvHfN+4M=;
        b=aHVIZ4W+jSlM49m38LdgZlUH9qwf1KbtTBGKnlw/bfHk3LqEFseqKaKkvYgL/Em9qe
         Gmfz/Ai1HnQFmidCX8pWCRvrlpK2K3eiutWsHvi9LrOG/g4D4SoGmjnbmBQ1lG9FFgak
         Zqq38c8vTLFGsD5e7ZWd6bdA1mJBkBtmzVFV+lmod47f7/fPtgozD+Eom1mRczDMIu7F
         YNsByws39PuGvWx91tbr4WxEbEY68XGeLZKhUachwhyqxyE6yMGVUfIT233R8Fyt/GDm
         5wURKDbsMiQxz5NFch/1JzZBiRfnET7aFtf+4izPwYmMTZKU2Nx+1wsNrsbAdj7MOZVy
         hJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153708; x=1794758508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2J8x1ZxvZLdaxhAjJTD3gPlJc1nZxkyj94vvHfN+4M=;
        b=KRbcdWw6Jz/0aFTis9MWzVOvRdyX5m57FFheag0o0/5nfiBUZbszrvXZyXLioY8r98
         pLH/Arq6OJ3VwJkK5wbABV7T3u5CdPJRiyGhzbPIK3fQ3H7WieppnhK4YEBC0vZGT77u
         SaZK1o5/KP/Dx0E4lpr0NnnwKOeu/HsPFITDEno4NY0sTadVE66Cs1IM1PNmPvyYq13O
         z8hD9zAfmnw9SR14fDnqbyYWhUKigNiUnfJQYljPygV/OX4JfaAtkT6l7dxYQ6ryFajZ
         7Xlsk5EF/H7MkTtDQl9B4mqzbU4e/RDer5lPS6KMQglXuaZ4WZBenMmmhh4AiUquZf4f
         ESrg==
X-Gm-Message-State: APuU4Z98La/8mVkj7Y5DGngpeyx+9884WvG/0oUdDfTgtyuVf2h6zRY3
	63EZyV4xCST2U32Z8I8g5VsqeOIT713tH1iAOTvjCd/eRNOKz1HTvq2f/l4Y9hVUIYc=
X-Gm-Gg: AYBFou1MAQ6BznoTA/8t6jve8OLx11TRGAeOcshUZkkOacICVfUvA1rkiP5IfLU2/ey
	V/0NJbQKnqqeSU3L4FudEZ/vdRjDUSbW+psVM/sH5wmaPMKZsFVVZPGsFAc6JSD4b2Ho8kq3g00
	iuRjHFc7XpfKd7s0Kb/9zK/QcWDuKiZ3IN3xmo+AJnKbPKRdehVfwfMkxqSzREyGZ4RF7klIpja
	NIsdkekrQOXubC3iyLVSGWrniF4Fb+4WFr3s7zIObjgOlWP7H3Z6VcntWZK7cAuzRvbKHgb5naY
	TBZv1gnBLksgj2SiHkKH70L3uiWsg8mlUtslozs9yqO6RzF6f2izZ2B75LijL6TktyIX04EH7I1
	ainiY+MwZI7e54FZS8cpaU6PYlJfvG9xDPNQsevVW5CKq3GzDL72JPnVYLjD8I7K+XHF4Y8u05f
	XHriO/aXxZoOePxwkFqUTLpA66sjNkyWYd3C1quYgQbKcTmCGc8hP8za5O6IiFvxXo8NOhbnXQK
	VaiZExCXZtcfUPUl1WGKczTE/3JxgU3B0thVLn18ulOc1h34Vun84J7Zppmq4ghddRZ0o2X1S35
	FLZYX15OxYHFgK1JLJVotrZ9L6HezdiK+oeQ1TpAe1kETzmJ+rRw1X6G0mFbnGyb1w6E4w2e4Jz
	QWOW1PAOUmjp4ViVipxUQMoiWkQfAWNJ0N0JylgNgsyfGtTVNmaTQLNS8DCq0BAEv3Eo1SV5erf
	IY5tXjGmEH3N5ljIFQFGmSOMJzV5QnHO9daluvCW3YpI2OZ1pO8VQba/4nTg0qZeeXCeDVC+yWM
	npvTepRKb7JUKB5wWGN2oGNWVXgwwm6dijBQzknOMuBHPH4TSSRSKCWo9HsQYdUxe+C5sYiX+gM
	5nCy
X-Received: by 2002:a05:7022:3b87:b0:177:9a5b:a89 with SMTP id a92af1059eb24-1b39feb70b6mr2948233c88.29.1794153707792;
        Sun, 08 Nov 2026 08:01:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375603ee8sm6191699c88.9.2026.11.08.08.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 08:01:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/2] openldap: Upgrade 2.6.13 -> 2.7.2
Date: Sun,  8 Nov 2026 08:01:43 -0800
Message-ID: <20261108160143.1662655-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108160143.1662655-1-khem.raj@oss.qualcomm.com>
References: <20261108160143.1662655-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 16:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132011
Content-Type: text/plain; charset="utf-8"

2.7 is the new release series; library ABI is unchanged (libldap.so.2,
liblber.so.2). It also builds the symbol version map through the
preprocessor (ITS#9739), which drops most entries for code that is not
configured in.

- back-perl and back-sql were removed upstream, drop their
  PACKAGECONFIGs.
- Refresh remove-user-host-pwd-from-version.patch for the
  LDAP_GCCATTR((unused)) attribute added in build/mkversion.
- Add a patch to guard the remaining SASL-only symbols in ldap.map.in;
  without Cyrus SASL lld fails:

  ld.lld: error: version script assignment of 'OPENLDAP_2.200' to
  symbol 'ldap_int_sasl_config' failed: symbol not defined

  This replaces the -Wl,--undefined-version workaround meta-clang
  carried for openldap.

License checksums are unchanged. Tested on qemux86-64 with clang/lld:
openldap and samba (with ldap) build.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ort-SASL-symbols-when-built-with-Cyr.patch | 56 +++++++++++++++++++
 .../remove-user-host-pwd-from-version.patch   |  8 +--
 .../{openldap_2.6.13.bb => openldap_2.7.2.bb} | 16 +-----
 3 files changed, 62 insertions(+), 18 deletions(-)
 create mode 100644 meta-oe/recipes-support/openldap/openldap/0001-libldap-Only-export-SASL-symbols-when-built-with-Cyr.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.6.13.bb => openldap_2.7.2.bb} (92%)

diff --git a/meta-oe/recipes-support/openldap/openldap/0001-libldap-Only-export-SASL-symbols-when-built-with-Cyr.patch b/meta-oe/recipes-support/openldap/openldap/0001-libldap-Only-export-SASL-symbols-when-built-with-Cyr.patch
new file mode 100644
index 0000000000..307d1040ae
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/0001-libldap-Only-export-SASL-symbols-when-built-with-Cyr.patch
@@ -0,0 +1,56 @@
+From 5a05f63b8a693739834069ecd7dbec66010567bc Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sat, 7 Nov 2026 23:46:45 -0800
+Subject: [PATCH] libldap: Only export SASL symbols when built with Cyrus SASL
+
+ldap_host_connected_to(), ldap_int_sasl_config(),
+ldap_int_sasl_get_option(), ldap_int_sasl_open() and
+ldap_int_sasl_set_option() are only compiled with HAVE_CYRUS_SASL,
+but ldap.map.in lists them unconditionally. Linkers that reject
+version script entries for undefined symbols, such as lld (default
+since 17), fail to link libldap without SASL:
+
+  ld.lld: error: version script assignment of 'OPENLDAP_2.200' to
+  symbol 'ldap_int_sasl_config' failed: symbol not defined
+
+Guard them like the other SASL-only entries.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ libraries/libldap/ldap.map.in | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libraries/libldap/ldap.map.in b/libraries/libldap/ldap.map.in
+index 677d244..65613a3 100644
+--- a/libraries/libldap/ldap.map.in
++++ b/libraries/libldap/ldap.map.in
+@@ -140,7 +140,9 @@ OPENLDAP_2.200
+     ldap_get_message_ber;
+     ldap_get_option;
+     ldap_get_values_len;
++#ifdef HAVE_CYRUS_SASL
+     ldap_host_connected_to;
++#endif
+     ldap_init_fd;
+     ldap_initialize;
+     ldap_install_tls;
+@@ -166,12 +168,18 @@ OPENLDAP_2.200
+     ldap_int_put_controls;
+     ldap_int_sasl_bind;
+     ldap_int_sasl_close;
++#ifdef HAVE_CYRUS_SASL
+     ldap_int_sasl_config;
++#endif
+     ldap_int_sasl_external;
++#ifdef HAVE_CYRUS_SASL
+     ldap_int_sasl_get_option;
++#endif
+     ldap_int_sasl_init;
++#ifdef HAVE_CYRUS_SASL
+     ldap_int_sasl_open;
+     ldap_int_sasl_set_option;
++#endif
+     ldap_int_select;
+     ldap_int_timeval_dup;
+     ldap_int_tls_destroy;
diff --git a/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch b/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
index 7a1b5aaad7..91acb9853f 100644
--- a/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
+++ b/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
@@ -6,12 +6,10 @@ Subject: [PATCH] mkversion: remove user host pwd from version
 Upstream-Status: Pending

 Update this patch to version 2.4.47
+Refresh for 2.7.2

 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- build/mkversion | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
 --- a/build/mkversion
 +++ b/build/mkversion
 @@ -53,8 +53,12 @@ APPLICATION=$1
@@ -28,10 +26,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  fi

  cat << __EOF__
-@@ -77,7 +81,7 @@ static const char copyright[] =
+@@ -79,7 +83,7 @@ static const char copyright[] LDAP_GCCATTR((unused)) =
  "COPYING RESTRICTIONS APPLY\n";

- $static $const char $SYMBOL[] =
+ $static $const char $SYMBOL[] LDAP_GCCATTR((unused)) =
 -"@(#) \$$PACKAGE: $APPLICATION $VERSION (" __DATE__ " " __TIME__ ") \$\n"
 +"@(#) \$$PACKAGE: $APPLICATION $VERSION ($DATE $TIME) \$\n"
  "\t$WHOWHERE\n";
diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.13.bb b/meta-oe/recipes-support/openldap/openldap_2.7.2.bb
similarity index 92%
rename from meta-oe/recipes-support/openldap/openldap_2.6.13.bb
rename to meta-oe/recipes-support/openldap/openldap_2.7.2.bb
index 743888e5b6..efa2b4986f 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.13.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.7.2.bb
@@ -19,9 +19,10 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://slapd.service \
     file://remove-user-host-pwd-from-version.patch \
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
+    file://0001-libldap-Only-export-SASL-symbols-when-built-with-Cyr.patch \
 "

-SRC_URI[sha256sum] = "d693b49517a42efb85a1a364a310aed16a53d428d1b46c0d31ef3fba78fcb656"
+SRC_URI[sha256sum] = "aad731aa22118ff327b9b4ddfc4b6f18ef9476586205da88a532e90940b523d2"

 DEPENDS = "util-linux groff-native"

@@ -62,7 +63,7 @@ EXTRA_OECONF += "--enable-crypt"
 # The backend must be set by the configuration.  This controls the
 # required database.
 #
-# Backends="asyncmeta dnssrv ldap mdb meta null passwd perl relay sock sql wt"
+# Backends="asyncmeta dnssrv ldap mdb meta null passwd relay sock wt"
 #
 # Note that multiple backends can be built.  The ldbm backend requires a
 # build-time choice of database API. To use the gdbm (or other) API the
@@ -91,23 +92,12 @@ PACKAGECONFIG[null] = "--enable-null=mod,--enable-null=no,"
 #--enable-passwd       enable passwd backend no|yes|mod no
 PACKAGECONFIG[passwd] = "--enable-passwd=mod,--enable-passwd=no,"

-#--enable-perl         enable perl backend no|yes|mod no
-#  This requires a loadable perl dynamic library, if enabled without
-#  doing something appropriate (building perl?) the build will pick
-#  up the build machine perl - not good (inherit perlnative?)
-PACKAGECONFIG[perl] = "--enable-perl=mod,--enable-perl=no,perl"
-
 #--enable-relay        enable relay backend no|yes|mod [yes]
 PACKAGECONFIG[relay] = "--enable-relay=mod,--enable-relay=no,"

 #--enable-sock         enable sock backend no|yes|mod [no]
 PACKAGECONFIG[sock] = "--enable-sock=mod,--enable-sock=no,"

-#--enable-sql          enable sql backend no|yes|mod no
-# sql requires some sql backend which provides sql.h, sqlite* provides
-# sqlite.h (which may be compatible but hasn't been tried.)
-PACKAGECONFIG[sql] = "--enable-sql=mod,--enable-sql=no,sqlite3"
-
 #--enable-wt           enable wt backend no|yes|mod no
 # back-wt is marked currently as experimental
 PACKAGECONFIG[wt] = "--enable-wt=mod,--enable-wt=no"
