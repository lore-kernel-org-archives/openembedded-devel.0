Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255CED14884
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 01:05:00 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21893.1767834295667105819
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 17:04:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pd/V3Z1k;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78fdb90b670so25804807b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 17:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767834295; x=1768439095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0W2yuutqnyt6iR0TRnR5Twuatj/UQlH3vscK5qcoHA=;
        b=Pd/V3Z1kDg95Ic2Pbwha3n9ZBOyuuwoIP/0Rjq1BFjmnlaKSfN8lLbPWTzQ39HZFZY
         Flxbp59KHHIo+CwGE8sTG05WEJW3U030nFNZ8kW25QyULwCuZZ0a8t6r8jFLtzJtuaU8
         Ctu0MRy9N6hvl0Holq0QfcemAybFKuFuzTnehSTKPG39qtnQuYMOkpy3Ks1aD/i1C+Pm
         ZCcs6e7uS6Hdoo/iFB2lJSB7IzHvjJOMF1DuZ+TjxQZDUxWU75CfFmeqUYKuPJoW27aq
         MiQV7vksz+rBFhLtcBPumHa/FmWWXuTYeY0YuwBTEBfq3pvK/7Uc1SGZuBxvVQbtNgbn
         cTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767834295; x=1768439095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0W2yuutqnyt6iR0TRnR5Twuatj/UQlH3vscK5qcoHA=;
        b=hTvQ3D+HhgIpfgfTGUGkVKXio9t3NDntdXQeiH6DyOCqy/vboQYtLvBK8L+9iz4H+h
         mWybSoNKVZveO3VtmohTJzvFac6NqgKE8awGKOL6fcF8gOl45dLfA9NvbIN0XkGDcgnP
         GQkUk1mp4aEO5F4Ajr7Tal3l0Kvnbq+bZ2zKWa1xBRNMcbDmhDIf4aVBv6OU5j0N0O18
         77AeDzCWEyqaum7mqzFC1oPb67klywoLWI+rIALkxxA0OjZIBjZTdiLizLehTQTASYGP
         74ZVqkSQPNQnXPS2zngbeR0Qlvw2igeYdNs/0exp+f8+nCIxrnjv3p66E0ZzNTyh4k7X
         sDug==
X-Gm-Message-State: AOJu0YxWvA2+hHdUiBZCmvxT+2L1rnKTffKYbTcyKDPadGFQyBCjw3L1
	dwCrjOfiSqB5rEf5lIug/Z3hdVapmhQFC4qMaIYqkaLmYEZLSzldA0/ZTeNagaVH
X-Gm-Gg: AY/fxX5BgGczaoincRI2ST38vWA9OG5gsfkNv+KYL38mtNIc9fHz1rEzwzcdHGAxUcP
	Gc8Rqf3ELA2oTaA9jPolIziQZrmGi6c8f2d6EGzIPC5cS2TY5ogYOKRUkWacugbkMEcTo22d6FF
	r3PpPcGBlQcRtqwQCyXwkecJxulif2eUairxEwbXSwkTM5EjvaciILkl7Hroyi5JOB+uc6/xynk
	Ygv66V4Ut1xxkl3FTw9G4MD/Rv2b1nwOfBwj4QPyY+UAFZkzR1nJrhu5MjrV5K1Ylfx7UyR1vCB
	qzOJ99PRT8uJHfhdDLou5sWX61Q/SzUbHxlvy7fyvV0QXO0OhdhoZMUKXeX/h1wSEUkfQ34RvvL
	ydcTdpMzvOW+faTMp2NHIU8ow1W9hxWaynxWkxEwtsk9OWNFwtDNrQDSAgK0H2YMaKNamBnWE1x
	0L6EQ+nWNEZkYrFy1PzUBucov8KJE903gPx8mCKAl/yle3XJZxwWaDnild9Y9wuozbausv3dRes
	Bcpbq/PylihEbZZsGKoHr7a9e17b/bj/J0G4rLNJDkVLUPc1ovQvHgiLsokEwtb2Q==
X-Google-Smtp-Source: AGHT+IHiHZnGS7QzIF57gEOmAuAsNvAxb2Znct86suKi8LYnNtiSEOdKkCr96QddYcd89zO43ibMrA==
X-Received: by 2002:a05:690c:31a:b0:78e:1aa5:e994 with SMTP id 00721157ae682-790b573232amr44303847b3.14.1767834294227;
        Wed, 07 Jan 2026 17:04:54 -0800 (PST)
Received: from localhost.localdomain (71-208-41-41.ftmy.qwest.net. [71.208.41.41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa6dc249sm24482767b3.51.2026.01.07.17.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 17:04:53 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-session: upgrade 4.20.0 -> 4.20.3
Date: Wed,  7 Jan 2026 20:04:46 -0500
Message-ID: <20260108010446.31184-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 01:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123241

| checking for glib-compile-resources... configure: error: could not find glib-compile-resources.

Fix configure failure by adding to EXTRA_OECONF parameters.

ERROR: xfce4-session-4.20.2-r0 do_package: QA Issue: xfce4-session: Files/directories were installed but not shipped in any package:
  /usr/share/xfce4
  /usr/share/xfce4/labwc
  /usr/share/xfce4/labwc/labwc-environment
  /usr/share/xfce4/labwc/labwc-rc.xml

Update FILES to fix QA error.

Changelog: https://gitlab.xfce.org/xfce/xfce4-session/-/tags/xfce4-session-4.20.3
Changelog: https://gitlab.xfce.org/xfce/xfce4-session/-/tags/xfce4-session-4.20.2
Changelog: https://gitlab.xfce.org/xfce/xfce4-session/-/tags/xfce4-session-4.20.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-session_4.20.0.bb => xfce4-session_4.20.3.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.20.0.bb => xfce4-session_4.20.3.bb} (78%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb
similarity index 78%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb
index acff2d42b3..af7ab98ae5 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb
@@ -9,14 +9,15 @@ DEPENDS = "libwnck3 libsm libxfce4ui libxfce4windowing virtual/libx11"
 inherit xfce update-alternatives features_check
 
 SRC_URI += "file://0001-configure.in-hard-code-path-to-iceauth.patch"
-SRC_URI[sha256sum] = "5229233fe6ee692361cc28724886c5b08e0216d89f09c42d273191d38fd64f85"
+SRC_URI[sha256sum] = "dbf00672c5316a30b7001fe852e6a5ba9f889afeab8a247545a160d4302f1fa2"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
 PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, polkit"
 
-EXTRA_OECONF = "GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen"
+EXTRA_OECONF = "GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen \
+                GLIB_COMPILE_RESOURCES=${STAGING_BINDIR_NATIVE}/glib-compile-resources"
 
 ALTERNATIVE:${PN} = "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
@@ -30,6 +31,10 @@ FILES:${PN} += " \
     ${datadir}/themes/Default/balou/* \
     ${datadir}/polkit-1 \
     ${datadir}/xdg-desktop-portal/xfce-portals.conf \
+    ${datadir}/xfce4 \
+    ${datadir}/xfce4/labwc \
+    ${datadir}/xfce4/labwc/labwc-environment \
+    ${datadir}/xfce4/labwc/labwc-rc.xml \
 "
 
 RDEPENDS:${PN} = " \
-- 
2.43.0


