Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FBEF433F7
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:19 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7042.1776318674723275375
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NiAHt7n7;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b6b0500e06so14433399eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318674; x=1776923474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpbCvk5OT7goWQxTt+Ep3a4ug5gVYXyIIYnnITlQHTY=;
        b=NiAHt7n7eCPZXimVgqFkd1FtEA3Y0/bvL9eYro7D/58a2cc7cUKkrL9lBLH4RM4rFW
         8HuNgTHYSHPV4s352WWgjRZbVDr+oOuCxTlU4GnAbmVT8qHfS6OXj1+wMHkN1EVwaAs5
         fEOxgR+VPR9BBjTVe5XcTF7U+/MGyyPbkwGeibZnkqWhZBKw2jsTDtSJjgjNnuXY3P3N
         j+9a+q34shfsbqOMwmU29ylRIvAbErY+DKE8JshuARGQr0LyTksOD5IR7rF2xrnPxuQ3
         TtCcLPFzbvKWIZjTg68l1wk4yH40EiRKFYajMNeDl2sxyRPjb/bei4r64whebQZ4uz4J
         V2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318674; x=1776923474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gpbCvk5OT7goWQxTt+Ep3a4ug5gVYXyIIYnnITlQHTY=;
        b=oQwsXnFF0TYy2Zqbcn8x6OGv/ju1CNyhu91m5p5LASRpRNGlzJke+QGNbjYxb5YJXm
         wxPLBghY9gyPWvX4chRwGzCXBTPU+PlN2CE6xcNVLxt0ZQXSospik+XByk7zy59cImUl
         1NF12/h3+yq2L3zuLleI0Qi8lRTUZeAQUwFh6zF6/C4Qe6W0N1vIxzwXmyKYfjuNNIfU
         C2ehBynvzQ7WkutgZizjU8CfpMKElM+b0rJs9oFTnEXpEvgPLbDQ2BEyNC+eiW/j49FL
         xr7vqfOgW3+GWrsqZWrRzCl+iCWNQrjoxpwJxd2B7ozJI227pnOdOAp0XL7/77BUs5CD
         Y8qg==
X-Gm-Message-State: AOJu0Yw4GChd8xR/Hrm9+rEp3xhukgH+4X+McgzxBCuCoiuZd4MrJw5n
	FONWJE11YnoaUZU32Kki1D0u1fKXUS/IcuZd8BxRDfzQGUZ5LwLYdW6bXKlQbcCS
X-Gm-Gg: AeBDievaTqS3G+XK9SxowE255Lkq36JhG6lEpzjlfg1RgEtDTLvwD9l4paKcJ3HHGLH
	opMw6SHVEgzNHVvFVOe0pH8pbDKxkbeIrfRswsgbcTLmbZA/TSs9PECeDWpEF3TbVOCOLJI6oSQ
	mp8JE+UCMVAs+giy8ASXiYTCa7rDD4xZD4jinoYsDDsBco4uW4GGQjYGVzl3NbCrS8kqpkJ7inz
	1bXBRZ2tr+WSTrPOUi8yJDDwehRJwKhQlmHq6FOMLihtciozny6i9eGH8iiC/kMOllomDP1ad65
	3XzmpqQkWqf8PAICDfC7ay5dx+VHZBEhTTlU9CejGrA6urB3R1XKXJbAFSBWiKjwGFG5CgkCqDQ
	Of3J6nn1vGmixasWsX9+YNtkHoaeZOytypwzNgbp0yriJymA/uHrAagPpQdVlnCM4lIdnd6PiVk
	xjwE9KED5hWp4CIRNz0y0iu9eZBUKDnixKhhV56k3lzHpSSnqLq6YuJwxkt4bxpwdxW14Z2a4gn
	MK+wTbqp9jog0a4LDEQhC2c3aDqfD2w0M1jC8kYg/KJXQzGnvs1e7sVTEbYTr1lMkECoOK+Re0n
	vbkfmj84VmT/BTyIRNuptI7skKCDH8JXsLHGAKgFlSAYjIMW2Bc=
X-Received: by 2002:a05:7022:327:b0:12b:ee7b:51ec with SMTP id a92af1059eb24-12c34e6b527mr14464938c88.1.1776318673632;
        Wed, 15 Apr 2026 22:51:13 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 11/18] meta-oe/recipes: disable C23 support to fix configure check
Date: Wed, 15 Apr 2026 22:50:51 -0700
Message-ID: <20260416055058.792189-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126390

Set ac_cv_prog_cc_c23=no to prevent autoconf from detecting C23
compiler support, avoiding potential build failures as the package
is not yet fully ported to support C23 standard.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb | 2 +-
 meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb   | 2 ++
 meta-oe/recipes-extended/enscript/enscript_1.6.6.bb   | 2 ++
 meta-oe/recipes-extended/figlet/figlet_git.bb         | 1 +
 meta-oe/recipes-extended/lprng/lprng_3.9.0.bb         | 1 +
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb  | 1 +
 meta-oe/recipes-extended/zsync/zsync-curl_git.bb      | 2 ++
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb        | 3 +++
 meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb      | 1 +
 9 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
index 198552e5c6..3154db2705 100644
--- a/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
@@ -15,7 +15,7 @@ SRCREV = "ebf1c90da05dea94648165e4f149abc20c979557"


 COMPATIBLE_HOST = "(arm|aarch64|i.86|x86_64).*-linux*"
-
+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
 EXTRA_OECONF += "--enable-largefile --with-system-luajit --with-system-ck --without-gcc-arch --with-lib-prefix=no"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[aio] = "--enable-aio,--disable-aio,libaio,"
diff --git a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
index c55a01d3b9..fca29eed05 100644
--- a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
+++ b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
@@ -16,6 +16,8 @@ UPSTREAM_CHECK_REGEX = "Libmcrypt/(?P<pver>\d+(\.\d+)+)/"

 inherit autotools-brokensep gettext binconfig multilib_script

+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
+
 CFLAGS += "-Wno-error=implicit-int"

 do_configure() {
diff --git a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
index 4ca7c081ea..d1480e836a 100644
--- a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
+++ b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
@@ -19,6 +19,8 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \

 inherit autotools gettext

+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
+
 EXTRA_OECONF += "PERL='${USRBINPATH}/env perl'"

 SRC_URI[sha256sum] = "6d56bada6934d055b34b6c90399aa85975e66457ac5bf513427ae7fc77f5c0bb"
diff --git a/meta-oe/recipes-extended/figlet/figlet_git.bb b/meta-oe/recipes-extended/figlet/figlet_git.bb
index d226806050..6a8bb42699 100644
--- a/meta-oe/recipes-extended/figlet/figlet_git.bb
+++ b/meta-oe/recipes-extended/figlet/figlet_git.bb
@@ -10,5 +10,6 @@ SRCREV = "5bbcd7383a8c3a531299b216b0c734e1495c6db3"
 PV = "2.2.5+git"

 inherit autotools
+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"

 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-extended/lprng/lprng_3.9.0.bb b/meta-oe/recipes-extended/lprng/lprng_3.9.0.bb
index 04376b66ed..0f427a7d05 100644
--- a/meta-oe/recipes-extended/lprng/lprng_3.9.0.bb
+++ b/meta-oe/recipes-extended/lprng/lprng_3.9.0.bb
@@ -10,6 +10,7 @@ UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lprng/files/lprng/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"

 inherit autotools gettext
+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"

 EXTRA_OECONF = "--disable-ssl --disable-kerberos --enable-force_localhost \
 				CHOWN=${base_bindir}/chown CHGRP=${base_bindir}/chgrp \
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
index c50a7a3f7a..186e1ccf24 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
@@ -40,6 +40,7 @@ CVE_STATUS[CVE-2015-3243] = "fix-file-included: The shipped default rsyslog.conf

 inherit autotools pkgconfig systemd update-rc.d ptest

+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
 EXTRA_OECONF += "--enable-imfile-tests ${ATOMICS}"
 ATOMICS = "ap_cv_atomic_builtins_64=yes ap_cv_atomic_builtins=yes"
 ATOMICS:mipsarch = ""
diff --git a/meta-oe/recipes-extended/zsync/zsync-curl_git.bb b/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
index e624b26941..79b8ee18e7 100644
--- a/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
+++ b/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
@@ -15,6 +15,8 @@ UPSTREAM_CHECK_COMMITS = "1"

 inherit autotools

+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
+
 AUTOTOOLS_SCRIPT_PATH = "${S}/src"

 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 85eac33369..99d0939b34 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -20,6 +20,9 @@ UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
 DEPENDS += "bison-native flex-native wget-native gawk-native"

 inherit autotools-brokensep update-alternatives
+
+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
+
 ALTERNATIVE_PRIORITY = "50"
 ALTERNATIVE:${PN}-yang = " ietf-interfaces ietf-netconf-acm ietf-netconf-with-defaults ietf-netconf"
 ALTERNATIVE_LINK_NAME[ietf-interfaces] = "${datadir}/yang/ietf-interfaces.yang"
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb b/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb
index 85c521df87..af44864fa9 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb
@@ -50,6 +50,7 @@ EXTRA_OECONF = " \
     --disable-farstream \
     --disable-vv \
 "
+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"

 # CONFIG_ARGS is used to display build info. Replace full paths by reproducible
 # variables ($S, $WORKDIR)

