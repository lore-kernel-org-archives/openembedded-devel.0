Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB1BC61DD3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 00:26:10 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3458.1788481566149325508
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 17:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BBfTqFRh;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38511175ad3so370711a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 17:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788481565; x=1789086365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LsL/mGC4iZvqnYM1/VfFdbPA/QUQakPwDY1QbtMIgpM=;
        b=BBfTqFRhnLrqcfyIPiIL0rQ8c58DTrz/vT4XS49lQVu3HJUR0Bzx2a2SSJXik8QNNp
         YBmDjxnzmoothlsgDcMexXajuMTWY7G4ygNv4GIc9BQ87M1q/zhHBU7PSlysnXBWO44Y
         WPlZQofpVCsXO3Azt9PyubeEIddvU2tXkml4q8/CSJQv/zDpruojDCAz4T7gUeRUjLPc
         EbSXI5QuJQuxr9QukSWG1T0jJk+I6tjum6MEVAblftbr7+m/2JPFdNKV5s0PwkGaoxAx
         AEiwV5U6zwh2qLqtDEI5h6w9+LaTSjsXXh2K0jVT2hdmu0iER7jCw5SNcND0CTs4UgjC
         4E3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788481565; x=1789086365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LsL/mGC4iZvqnYM1/VfFdbPA/QUQakPwDY1QbtMIgpM=;
        b=I1zVYjPJc6ek6VGKRZPZENmlW8RnbsCm6afTR2bLg4Cc5jPpHla4SUjT6aJ4IZbhnA
         WrX5D9NtNSlSBWixSzN4V7ljXYGf/f0yp0bBdGF9NSqDpaipzZuKwUlaHDrhjx1bBe4v
         VB05racxEW+bsw4i/VuPX0LU+C6c9P3VTBS/RomRPN05DODqFArKx5BFm/J+AyO9TJWs
         iMYTvYzE1iksX1OAhetvlH1HOpdE44hoGahibz+7aHFqhab29KI8DnwpQwH+VOMgvbls
         Tpl69EIzRuL4HgX22smxuXQsT7QzFHm2nXZPc1EnXqGLWsWYcIT9KV9ZDuhkyIbm19Ky
         4Glw==
X-Gm-Message-State: AFuF++mVk3KbCI5rzA4a6LlnjG2rZJZkg5l2Z4l4eNrlBGY4ZPsUlaQW
	WUKd4ponxudmOHrfJvUJGTZLl84KaEkUoRB8VK2PaqmHtKu+3R7ldM5RrW2/Pw==
X-Gm-Gg: AYBFou0Uo6gQ5piIWltlbEwKfsSkkd8y7ODExd+eNzknCSYE6D+/KoCZG797/72XJDY
	quVEuL+ErZh9PdSMX+WftMz9EmXL/NAVcBoxODV+tGSlYLlwP1fkRAgrWH+v9ZWfI243XGJb9ix
	3jXGeNg1nEvJfGX3q95jEZcsTR1aYNrBxosq8qxRkge7R7fkK1xBD7kT1nvqLtb4hUo/8QqV/8w
	qx12b0losiErVa8bZC1+BWSnPRbfObMnjc6rkk6vBDDksKKyut5wY2BzVSYas7KTcLu3TGxK1NH
	IBVqjyC2ykSMArPI/KTmnt0TY3kLdtCFIqxkIwIlYDZU5aP7BpEZOem6ka9Zo3qUl5QnNkOECRH
	JidnUpaTjJbnngfHwhDTyRyavMEREft+MXy2dzJXsn4o0I1u59ab9tOyPD0QpyeOq84HIzHJtsW
	HW4NO9ueoIsKzZxz5rznXZpGuD6nJoU2z84EX3ST7qcKztwYCttbECapJbhaNgQF9gkuo02EZf0
	XwMSK29/dXgi9Gxv8VDYxFvDlOprBv3t2Was5gTj2oL62aRufh+Qs5AuUmpLHu8whDT02g56SCq
	1ZBegOdH5TribB5LB/BQYHGZihXaz/wFHrfwzKo4OpxmV6cq0c0YepGs7lzPrToNKIUxtDCBS3R
	PO5tdmA+Orq8Idpzj0yO6T0jufoVIE4la10PisySjrVQT8Q==
X-Received: by 2002:a17:90a:da8f:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39b26208e7amr3261998a91.12.1788481565410;
        Thu, 03 Sep 2026 17:26:05 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm2466575eec.2.2026.09.03.17.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 17:26:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH] libpeas: upgrade 2.0.7 -> 2.2.1
Date: Thu,  3 Sep 2026 17:26:02 -0700
Message-ID: <20260904002602.3513303-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 00:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129749

meta-oe now carries mozjs-140 (140.15.0) in place of mozjs-128, so point
the gjs PACKAGECONFIG dependency at it.

Refresh disable-lgi-check.patch

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libpeas/libpeas/disable-lgi-check.patch      | 16 +++++++---------
 .../{libpeas_2.0.7.bb => libpeas_2.2.1.bb}       |  4 ++--
 2 files changed, 9 insertions(+), 11 deletions(-)
 rename meta-gnome/recipes-gnome/libpeas/{libpeas_2.0.7.bb => libpeas_2.2.1.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch b/meta-gnome/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch
index 9ed7adb8ce..1cc40dd2d7 100644
--- a/meta-gnome/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch
+++ b/meta-gnome/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch
@@ -10,15 +10,15 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  meson.build | 11 +++++----------
  1 file changed, 3 insertions(+), 8 deletions(-)

-diff --git a/meson.build b/meson.build
-index a8100af..0fb15d2 100644
---- a/meson.build
-+++ b/meson.build
-@@ -209,14 +209,9 @@ if lua_found
+Index: libpeas-2.2.1/meson.build
+===================================================================
+--- libpeas-2.2.1.orig/meson.build
++++ libpeas-2.2.1/meson.build
+@@ -210,14 +210,10 @@ if lua_found
      else
          lua_prg = lua51_prg
      endif
--    lua_lgi_check = run_command(lua_prg, ['-e', 'print(require("lgi")._VERSION)'])
+-    lua_lgi_check = run_command(lua_prg, ['-e', 'print(require("lgi")._VERSION)'], check: false)
 -    if lua_lgi_check.returncode() == 0
 -        lua_lgi_ver = lua_lgi_check.stdout().strip()
 -        if lua_lgi_ver.version_compare(lua_lgi_req)
@@ -29,9 +29,7 @@ index a8100af..0fb15d2 100644
 +    lua_lgi_ver = '0.9.0'
 +    lua_lgi_found = true
 +    lua51_lgi_dep = declare_dependency(version: lua_lgi_ver)
++
      message('lua-lgi version: ' + lua_lgi_ver)
  endif

---
-2.47.0
-
diff --git a/meta-gnome/recipes-gnome/libpeas/libpeas_2.0.7.bb b/meta-gnome/recipes-gnome/libpeas/libpeas_2.2.1.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/libpeas/libpeas_2.0.7.bb
rename to meta-gnome/recipes-gnome/libpeas/libpeas_2.2.1.bb
index 76ed820e66..4c9c4666a5 100644
--- a/meta-gnome/recipes-gnome/libpeas/libpeas_2.0.7.bb
+++ b/meta-gnome/recipes-gnome/libpeas/libpeas_2.2.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "glib-2.0"
 inherit gnomebase gobject-introspection vala gi-docgen

 SRC_URI += "file://disable-lgi-check.patch"
-SRC_URI[archive.sha256sum] = "1e9a9d69761d2109eff5b7c11d8c96b4867ccfaca2b921eded49401192769ec9"
+SRC_URI[archive.sha256sum] = "589eca89b437006edf3755478df037c740a2a84cfa5d202dbad6095e828e2488"

 PACKAGECONFIG ?= "python3 gjs lua51 ${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection', 'vala', '', d)}"
 PACKAGECONFIG:remove:riscv32 = "lua51"
@@ -17,7 +17,7 @@ PACKAGECONFIG:remove:powerpc64 = "lua51"
 PACKAGECONFIG:remove:powerpc64le = "lua51"

 PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject,python3-pygobject"
-PACKAGECONFIG[gjs] = "-Dgjs=true,-Dgjs=false,gjs mozjs-128"
+PACKAGECONFIG[gjs] = "-Dgjs=true,-Dgjs=false,gjs mozjs-140"
 PACKAGECONFIG[lua51] = "-Dlua51=true,-Dlua51=false,luajit luajit-native,lua-lgi"
 PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"


