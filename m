Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48016.1795411823316068820
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pFeWEu3n;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3712b6d9843so2374882eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411823; x=1796016623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Miu+4Wz38tjTWlUNRGkUR25FMZrY0LILI0Qpdzd2VQQ=;
        b=pFeWEu3n8dMgcA9tLK6onHt44huhnUwpuautrSedJ4wJpCAtbTvRgUz2mxfy/EvEd8
         9myhMdhdnzQ0VojepTtXsHNKezLiYtbrvTmtYyLt7DORy6NPjcr4Z/ajAAhdJq/s7Zus
         68U1HVxtsQbXkJy/vMXUpjT24u5y5a1YLSHom235EcLYfsceNlT0G0sJ5j3Qz9w3zNN0
         ygUSw7PQ2CNP607uPX/IXxIAU6JAlD/e0CxpanpYG06VdIIC7sf3Vsx5PEzpWScyfwvJ
         4U6Y+eeWwj32q+wsj+Z+YA+MW2NuyNrv6YFRYfNtZ4nfuPnauFN0Igk/72KR1wz5MiWX
         sHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411823; x=1796016623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Miu+4Wz38tjTWlUNRGkUR25FMZrY0LILI0Qpdzd2VQQ=;
        b=kRC8vpv95MlRb1qbZwNG/hktNo06k8UdhAAyDeHWP9ZDJaVJ1CYgYiW9IWp2XfcUI+
         ZIqcsp8tuw6NZZwFTDWTL2Qe1m+E++GXPayuW+/CJJlUaKwqTPxE/iNyyC/vdStYg5qO
         mNwgG8LDOa9HgFXi2AMlkv1XdGGffBwMa5Z9yGFFE9lpe0+ziTZfwLZdmZw5FlTz/25J
         eskQzgzBhmNfELkCNivbnjrCAdOeAoYGRYa39FYhEhU5TZ2Sw8Pd0rDoFRHilKALWeNE
         Y84oLEu7QQmTu3Bb+lk6rmie2JSxSm/B4OqpkJotCu2zCVyFL6wySCNqMJ4FV+0EwgYA
         5ltg==
X-Gm-Message-State: APuU4Z+0QMq5Bd2+5bzeDumTBggUNOd88UKjI22J7tMgnnXiRf/f8uTq
	8TXJNQJETqjCe/j7q81TEJtyG8/bEqfqPok4ZjZqwofE81+z5rzYkGQ407T0Z5QdTGQ=
X-Gm-Gg: AZFdTZf0p6WQpMct68N/XbgJnziVKIMaBEpM17ezyZEBWEbMIvp7WPnnKVzgfZI02IL
	fECbO8zfd8NzKQx5wzW1RxGI/0BQuSxewAnw9I9vyzppxV6BnDdhnP5dRz9BSHJ/miMvU2A4vVi
	ZJMR2utO3Ib0hCgHAo0Ne2qqPw6Qaao+dZ27vazk0ztzPqFxeUXo8rdJJ97B2/p/B+oakep3Jm+
	JNW961+XTD6BgxyK+/tZEDlqiydJSFSTQe/3R5SYstCaDYbVRKyWcy2R79G6HmduL2ICiAvLVdY
	UqsYh3yjOr/E3F4re37ebbJV+xjyulWh388CBoLcVbjyDns5ntn1EPjVvnU7X2HRhV6OhGUS5z9
	0aSh6LezhUvgbDUpLY0l48kQshJbhd5XPN9RPqa6rDLrR9u0Ck6cobrVaKZ31d/owrJafWLZe/t
	DJLu1Zb0R/tR0vjlPUz3ej6y3cEiU95cBx0dgSQ4uE5GTUanxSoFhpjImos4GQkSFMS/QcdGG5/
	4xfDw3dwOGo/reOnSEqdMZlI2AnLaN/FPlQW+Tieotnx0lt3a/2uewSpTUvpKMHO3SvGesuB1TW
	a4Sv/OH5JNsQoLxoJzF/OTQRPZRdAzCgIY8/GumgBr0MyWk/7dwZGzaht0YHVMBbzdKxKXIAF1S
	ffwz7gyZ/qt6+Dk3cAR3F+l0GcmmXm3ZYnSdct47T6+WlSF5EDlhtQViykMydSBCQm/hKIGuoWv
	kjXMwjYIHN9uuwhh/zBw0ju0WCQQ8tULIIGkCmWaseuAILLPRFNkGVJbAciBiWOwk6Dchp80l1N
	WuTa0BvfwZVXoMpGnGMQoDkFPunYuweMvOHbwNTO0lD4biSwJdjc7jh6WGjsl6lL8Hgkygmb5bh
	C7tp
X-Received: by 2002:a05:7301:3d19:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-3857122312dmr15003919eec.36.1795411822655;
        Sun, 22 Nov 2026 21:30:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 3/9] drbd-utils: upgrade 9.35.0 -> 9.36.0
Date: Sun, 22 Nov 2026 21:28:37 -0800
Message-ID: <20261123052953.3658549-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132808
Content-Type: text/plain; charset="utf-8"

- New changed block tracking commands (cbt-flush/start/stop/status/
  dump) in drbdsetup/drbdadm/drbdmeta
- drbdsetup uses the new "drbd2" netlink family when available
- drbdadm: default cmd-timeout-short raised from 5 to 10 seconds; fix
  require-drbd-module-version-* comparisons and adjust issues
- drbdmeta: fix apply-al skipping the last activity log extent (since
  9.33.0) and keep the bitmap provenance feature
- drbdsetup: attach --discard-my-data to resolve split brain

Move the drbd-headers SRCREV to the submodule commit of v9.36.0.
WITH_84_SUPPORT is gone, so define DRBD_LEGACY_LIB_DIR unconditionally
in the legacy helper path patch.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...0001-fix-the-hardcoded-legacy-helper-path.patch | 14 +++++---------
 .../{drbd-utils_9.35.0.bb => drbd-utils_9.36.0.bb} |  4 ++--
 2 files changed, 7 insertions(+), 11 deletions(-)
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.35.0.bb => drbd-utils_9.36.0.bb} (96%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-fix-the-hardcoded-legacy-helper-path.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-fix-the-hardcoded-legacy-helper-path.patch
index 49c3340790..41a053fc28 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-fix-the-hardcoded-legacy-helper-path.patch
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-fix-the-hardcoded-legacy-helper-path.patch
@@ -22,23 +22,19 @@ Signed-off-by: Haiqing Bai <haiqing.bai@windriver.com>
  user/v9/drbdtool_common.c | 3 +--
  2 files changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/user/v9/Makefile.in b/user/v9/Makefile.in
-index cf23ca1..77bf201 100644
 --- a/user/v9/Makefile.in
 +++ b/user/v9/Makefile.in
-@@ -72,6 +72,7 @@ CFLAGS += -DKEYUTILS
+@@ -69,6 +69,7 @@
+ ifeq ($(WITH_KEYUTILS),yes)
+ CFLAGS += -DKEYUTILS
  endif
- ifeq ($(WITH_84_SUPPORT),yes)
- CFLAGS += -DWITH_84_SUPPORT
 +CFLAGS += -DDRBD_LEGACY_LIB_DIR=\"$(LIBDIR)\"
- endif
  ifneq ($(filter local package,$(ENABLE_COVERAGE)),)
  CFLAGS += --coverage
-diff --git a/user/v9/drbdtool_common.c b/user/v9/drbdtool_common.c
-index f85a067..403ceac 100644
+ LDFLAGS += --coverage
 --- a/user/v9/drbdtool_common.c
 +++ b/user/v9/drbdtool_common.c
-@@ -334,8 +334,7 @@ void add_component_to_path(const char *path)
+@@ -407,8 +407,7 @@
  
  void add_lib_drbd_to_path(void)
  {
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.35.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.36.0.bb
similarity index 96%
rename from meta-networking/recipes-support/drbd/drbd-utils_9.35.0.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.36.0.bb
index 4bd313823c..4fb147127d 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.35.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.36.0.bb
@@ -13,8 +13,8 @@ SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=master;prot
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
            file://0001-fix-the-hardcoded-legacy-helper-path.patch \
            "
-SRCREV_drbd-utils = "e1e02e77e6d068f626cef7c3998ed08b0fde7669"
-SRCREV_drbd-headers = "bdf8650ea6e32d1c4518b7ad6c2d7469896d17ff"
+SRCREV_drbd-utils = "e25b7d4d17e53811c6fd57f3ae7add0b9028cced"
+SRCREV_drbd-headers = "4e1c1486d274c28878f1d2e98b6f9983f27fe9ca"
 
 SRCREV_FORMAT = "drbd-utils_drbd-headers"
 
