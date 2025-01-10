Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C39C02181
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 14:20:10 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.19498.1736518805091553964
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 06:20:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MYXw40DO;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e4a6b978283so5144303276.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 06:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736518804; x=1737123604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IH8NhuB8/Exud/Fl2TD1iuK+XfZ8CXRM/YOP5ASA5nE=;
        b=MYXw40DO90Xb9Zi60gV33w7BIJIK9h9RBMkLWnrD/6or+1aR5F4zBApz6FA71b0r1u
         CyFr6OkjxoElD3v7NgS3UgDJa6gruVZc34tg563HI+F/4PC+59MBPQ18/kLkz3ViWe4+
         v38HqiMChp+ensKRffPt+2KJYs5OhDA0+K2tV5S35DcTnrJjYM1W6Foy12X90c7Pz/W9
         t4X9AWahQncP+oLevs9m6uQpqTX0sj6UGvuUcfsVfMHX+9sITkVZscPL5EgEC8hqceKi
         qPd7rkQuXfn9ZrTKgTYbt43zzCuPp96mhMLC9eyozbBsNiTUIF9dHvl8yq4hTqXkegOJ
         gClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736518804; x=1737123604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IH8NhuB8/Exud/Fl2TD1iuK+XfZ8CXRM/YOP5ASA5nE=;
        b=ol75PU8azowfsCoW9GNCut8DtUdc/iWtwSCiZdAGA0nGmZRr54jcd4RRZUzBz9a5SV
         OrK0BzgXt0X3TCGgmKILutNS3aSlsWDn+Y6lk5ULPmXO4m8HrT2cyg0V6raTm1/YLP6R
         2y7LtlfL1Oi7a3CzOix0IcgJEOjaNMzv1BpbltXYUtM8GFPLlv4s863CwxGzxXzIzzd2
         /SpEQ6Lal3ROyFmgPTbC+buQ/UVZfh1gtnbZ/cxLlOaKmoHdnaX9rs+hXAJo5TEmUjQX
         GcewYSGYiD00o61LtohGcyhfujfo74H/mDieyQSbNiD9iZnSt2mst6WdYAyFGHg9Anpr
         JjvQ==
X-Gm-Message-State: AOJu0YwBsJKASAomLQqCevwy01jM5k54R1cJvkMH3It/3tsdxtC598HG
	J22/IggrN/TRl0XXQnGOU1+Cs7FdE6JN23m+zi/XfDrAXJCEvQAorUa1aXQ9
X-Gm-Gg: ASbGncsALyDbVg9ltsqLPI/rZ5RackVkvG5BcW73sVKm8UPT5CmYr64NPsoQ+uacVpR
	E7y7q8753vxt3TuDrwIPIb9p+sK2GCUsnjsdSYGfQDa+ZxnojYB07fVNxSIcO/50IDM6M6iqIoz
	I08KUHk0Rpxy1BlN0/TirRvAXyp1JoslEf9g2aPzPKMTLbLENz+9xtn8WsYUHOTQMyQTRwwiLcM
	MH51dKLUvXTSgAek6H/Xw5FD6UwYy1WR/YmoYOUvqnoIs7hI1ir7uOh4XxHEl1p74AoYM8=
X-Google-Smtp-Source: AGHT+IGqgTVBi22Da+740ZGqMyp3Uz2iYcJyi0aQxyybY0Nz0hebSr7mVhq2YqRWj4aNNmK5eOMzDg==
X-Received: by 2002:a05:690c:b84:b0:6ee:8515:6730 with SMTP id 00721157ae682-6f54964144dmr43030807b3.17.1736518804080;
        Fri, 10 Jan 2025 06:20:04 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:152e:c23f:add0:82a5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f546c47200sm6373247b3.53.2025.01.10.06.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 06:20:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 2/5] mpd: Fix build with icu 76+
Date: Fri, 10 Jan 2025 09:19:59 -0500
Message-ID: <20250110142002.370956-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110142002.370956-1-akuster808@gmail.com>
References: <20250110142002.370956-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 14:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114778

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 81a0d778f33fd5716c1c1eb19ffada4b94e1df31)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...n.build-support-building-with-ICU-76.patch | 52 +++++++++++++++++++
 .../recipes-multimedia/musicpd/mpd_0.23.15.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0001-meson.build-support-building-with-ICU-76.patch

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-meson.build-support-building-with-ICU-76.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-meson.build-support-building-with-ICU-76.patch
new file mode 100644
index 0000000000..8b85f396ca
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-meson.build-support-building-with-ICU-76.patch
@@ -0,0 +1,52 @@
+From 1a063fee7ec1077e248ff97ebf1f92c5c5941a67 Mon Sep 17 00:00:00 2001
+From: Michael Cho <michael@michaelcho.dev>
+Date: Sat, 26 Oct 2024 10:29:53 -0400
+Subject: [PATCH] meson.build: support building with ICU 76
+
+ICU 76 decided to reduce overlinking[^1] thus `icu-i18n` will no longer
+add `icu-uc` when linking to shared libraries. This results in failure:
+```
+src/lib/icu/libicu.a.p/Converter.cxx.o: undefined reference to symbol 'ucnv_fromUnicode_76'
+```
+
+[^1]: https://github.com/unicode-org/icu/commit/199bc827021ffdb43b6579d68e5eecf54c7f6f56
+
+Upstream-Status: Backport [https://github.com/MusicPlayerDaemon/MPD/commit/1a063fee7ec1077e248ff97ebf1f92c5c5941a67]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/icu/meson.build | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/src/lib/icu/meson.build b/src/lib/icu/meson.build
+index 3ecc0a517..e6cf8cdce 100644
+--- a/src/lib/icu/meson.build
++++ b/src/lib/icu/meson.build
+@@ -1,5 +1,7 @@
+-icu_dep = dependency('icu-i18n', version: '>= 50', required: get_option('icu'))
+-conf.set('HAVE_ICU', icu_dep.found())
++icu_i18n_dep = dependency('icu-i18n', version: '>= 50', required: get_option('icu'))
++icu_uc_dep = dependency('icu-uc', version: '>= 50', required: get_option('icu'))
++have_icu = icu_i18n_dep.found() and icu_uc_dep.found()
++conf.set('HAVE_ICU', have_icu)
+ 
+ icu_sources = [
+   'Canonicalize.cxx',
+@@ -13,7 +15,7 @@ if is_windows
+ endif
+ 
+ iconv_dep = []
+-if icu_dep.found()
++if have_icu
+   icu_sources += [
+     'Init.cxx',
+     'Util.cxx',
+@@ -31,7 +33,8 @@ icu = static_library(
+   icu_sources,
+   include_directories: inc,
+   dependencies: [
+-    icu_dep,
++    icu_i18n_dep,
++    icu_uc_dep,
+     iconv_dep,
+     fmt_dep,
+   ],
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.15.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.15.bb
index f066c405f1..3fa4485a04 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.15.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.15.bb
@@ -21,6 +21,7 @@ DEPENDS += " \
 PV .= "+git"
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https \
            file://mpd.conf.in \
+           file://0001-meson.build-support-building-with-ICU-76.patch \
            "
 SRCREV = "965c466e9bda262790e76edd5272e9e74b407ff3"
 S = "${WORKDIR}/git"
-- 
2.43.0


