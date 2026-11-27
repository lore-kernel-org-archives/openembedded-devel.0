Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8116.1795739791157648714
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gN2LAd0A;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f0414c1062so45286455ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739790; x=1796344590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdM8q+c1Rf0H0HbTqBvXaU0bQ2KzsFgeW6hA/bkLi/E=;
        b=gN2LAd0Au+dkBaGlxpdaJ1v0uaXO38i8xVHfFRzzFXQK+MK/82JSIn3tT2GlutyJDf
         6MWjFxZNCyjBxg2w33Gt+VL3Ze1zs8c6rb/ukR7jvb05DJvnJhaI3lBRVb691Ga94Q9W
         PbgbXfH4coFd6CFTfYYzhxuD7YCtifRhWhETCF8diTU3bTURrbLRMAooWxZCVnGBwR1z
         RinLApSw2Me5cHYp+gz5e7CaBQBWtSQHSDi4z59fP090reVLjCt0XBLxuURdH/R6Cgpq
         AyXWl4yCpsuyMzocAh9e6eo71HNU5sa7UiNJiiiTrTbLIXqb0VVH+A1KMtIdmaqdjW0Q
         aXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739790; x=1796344590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vdM8q+c1Rf0H0HbTqBvXaU0bQ2KzsFgeW6hA/bkLi/E=;
        b=kDMcmKUareYincH5M/bjdD52w6iFIpadOt5NOtxLSAvq8o4ZRIg2vc+qPg9LMu5Mr+
         VGeJy0yQw9oGD+PtWQvI4yRDfpqq+ZS4YTdVkBQODyUlMiieia+eNN7SXXGbqYBIw/rE
         d+xN1lU29v4iGcGyhJK+NQvOPzV/PjPJSgYUAePqkdU0Qn79ROmjFIhxbsgH7hNGibaO
         aY61S+T5jDnPSTv1YkPf+/IJ+Kh4G9QrdmBqDRAciB5NS83sV2IdnRCUM9uYa7cEUV+F
         F0wQqB77zxJe1tauRv+a5MN+NvOjnUxEhHe+wdNsiawPNA09qz3ZmyThWHOIkojmN7AO
         2HzQ==
X-Gm-Message-State: APuU4Z91kY9NdL7bArY8M5/3AXpNip5yoD7bxcfZYtMNDrnnKJwNC4Ud
	YmLgmASvEnQe912eqTrlQM97YOt7fX7H+Y/FrN6NYCco5K1Vpv6pADE92R8qiQ==
X-Gm-Gg: AZFdTZdcf4LOb37gLLZDBEzyAFLImZnrX27ScWeD03tIKE0tRpdZz/x9Lmtir6IQSV3
	asXkwMcJVcaIzhLJ2ZlZ2D86Wy8fGbkjBEp2uK5VeN3Js1pz3rKpuPE/wVLvYmwzpoAQQECzc9u
	Knw/LQLqyU+Jt0k7GOcWht8hkP2fuOilw3R2+Epd7KPw7XYZ0J7etfZOb14kBFbg0KHt5tPMPMm
	bdL1L+H1ICwE5mA7AS480HHdkn3vgZ/k2stcOinqF88ymW5VsN4DAH5fCC8jRj00aXc+cLu6ETx
	yL/+fNa4xxWpF9F8Ogq8tJO74PlgECXWpgTwTES+7qdnj2BlicaCkezdU+pvqZOG9WfxCfuK9C2
	XaKSchc/DOFUii37B48C9dsFC8BmmZwVhDI/dEkPJDR3lWmA6Rwh9T8Y1dyBT17XP2fhrzAjFY8
	yvQFvTJNahZWiN0qdeamMEXfkJuswtQxzRKYNJe5aY3KqL6CTznfhXt+O3SvR3vBmZWp9FDTOYh
	p+7NlduWcp2h4HCfeCn3A70BhdnLfbJFrYHYXwzjromOxauIEvi78K0UgLetHousC/eEgR/vr0U
	dRr4qhuSi8ML1mn1RcWM9CjVXEhhfSdSm/sXeL5VL3uZ2e2BBD7rqY0hPHTW+EfAoSSg8u9XuQv
	elEAceqnDEGjZWPqW08rIuilGbsJ7fSOh9BoV6RaAK+d9kljs91xGZv43uu6u2ui/PMPdXqZIag
	PeSMtfTO5bSj0wHZhRLtTtcABErRM4MpHDESNGVGQEuM0ul7GxEdMh6xn3mK760Ud8agkpGvG+R
	3IXxPAHe9FeRisW8aWxrEo/r5rHqZPHQfAnkaoCV1rn7dQyivkXl2X1lwP4ShF4+AySE6wtjEdQ
	H/VP
X-Received: by 2002:a17:903:2b0f:b0:2f0:3278:706 with SMTP id d9443c01a7336-2f03f181867mr203070465ad.54.1795739790537;
        Thu, 26 Nov 2026 16:36:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 21/39] nvme-cli: upgrade 3.2 -> 3.3
Date: Thu, 26 Nov 2026 16:35:25 -0800
Message-ID: <20261127003543.2167775-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133191
Content-Type: text/plain; charset="utf-8"

- Incompatible: the 80 bit ELBT of Copy source range formats 1h and 3h
  are now little endian; libnvme no longer installs the udev rule
  70-nvmf-registry.rules; "nvme disconnect" honors the ownership
  registry; JSON output keeps integers past 32 bits.
- Plugins and top-level commands are now loadable modules installed in
  <libdir>/nvme-cli/<version>/plugins (new plugin-modules option).
- libarchive and libkmod are loaded at runtime (dlopen) instead of
  being linked.
- libnvme applies per-vendor defaults (I/O policy, ctrl_loss_tmo) from
  vendor.d files after connecting; nvme-discoverd and nvmf-autoconnect
  service fixes; KX-HMAC-CHAP secrets support in nvme-keysd.

Package the new /usr/lib/nvme/vendor.d files and the plugin module debug
files, and add runtime dependencies for the now dlopen()ed libarchive
and libkmod, which the shlibs scan can no longer see. libnvme is still
bundled as libnvme3, so the standalone libnvme recipe is not affected.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../nvme-cli/{nvme-cli_3.2.bb => nvme-cli_3.3.bb}        | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_3.2.bb => nvme-cli_3.3.bb} (92%)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_3.2.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_3.3.bb
similarity index 92%
rename from meta-oe/recipes-bsp/nvme-cli/nvme-cli_3.2.bb
rename to meta-oe/recipes-bsp/nvme-cli/nvme-cli_3.3.bb
index 95365e17e7..7944806d87 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_3.2.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_3.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
 NO_GENERIC_LICENSE[Gary-S-Brown-CRC32] = "LICENSES/LicenseRef-Gary-S-Brown-CRC32.txt"
 
 DEPENDS = "json-c"
-SRCREV = "ce55132af26607e1904a0f449f94eeae028cfee5"
+SRCREV = "c19af560d1869636104de5ab4e41420cbfdef395"
 
 SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https;tag=v${PV}"
 
@@ -22,9 +22,9 @@ inherit bash-completion meson pkgconfig systemd
 PACKAGECONFIG ??= "keyutils openssl"
 PACKAGECONFIG[discoverd] = "-Dnvme-discoverd=enabled,-Dnvme-discoverd=disabled,systemd"
 PACKAGECONFIG[keyutils] = "-Dkeyutils=enabled,-Dkeyutils=disabled,keyutils"
-PACKAGECONFIG[libarchive] = "-Dlibarchive=enabled,-Dlibarchive=disabled,libarchive"
+PACKAGECONFIG[libarchive] = "-Dlibarchive=enabled,-Dlibarchive=disabled,libarchive,libarchive"
 PACKAGECONFIG[libdbus] = "-Dlibdbus=enabled,-Dlibdbus=disabled,dbus"
-PACKAGECONFIG[libkmod] = "-Dlibkmod=enabled,-Dlibkmod=disabled,kmod"
+PACKAGECONFIG[libkmod] = "-Dlibkmod=enabled,-Dlibkmod=disabled,kmod,libkmod"
 PACKAGECONFIG[liburing] = "-Dliburing=enabled,-Dliburing=disabled,liburing"
 PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
 
@@ -44,7 +44,8 @@ pkg_postinst_ontarget:${PN}-user () {
 PACKAGES =+ "libnvme3 ${PN}-dracut ${PN}-zsh-completion ${PN}-user"
 
 FILES:libnvme3 = "${libdir}/libnvme3${SOLIBS}"
-FILES:${PN} += "${systemd_system_unitdir} ${nonarch_libdir}/NetworkManager"
+FILES:${PN} += "${systemd_system_unitdir} ${nonarch_libdir}/NetworkManager ${nonarch_libdir}/nvme"
+FILES:${PN}-dbg += "${libdir}/${BPN}/*/plugins/.debug"
 FILES:${PN}-dracut = "${nonarch_libdir}/dracut/dracut.conf.d"
 FILES:${PN}-zsh-completion = "${datadir}/zsh/site-functions"
 ALLOW_EMPTY:${PN}-user = "1"
