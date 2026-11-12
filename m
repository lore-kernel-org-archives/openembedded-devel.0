Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6838.1794458683555952356
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 20:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=nXOE/G3v;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b6399ebb41so3376749b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458683; x=1795063483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2h/7Xw7QWiKqNawLALhqEGQOuq9Yggf5eN9lcwkDIwU=;
        b=nXOE/G3vJ6HUwVVkLP7yb4sW3oHlWE6gBfr4oa+wjjzR/iQnKCF9i8QfiGbs2NeDC/
         rh7F84WBeis5T5phOXLUdjpwoJNUI8i9tE1OV9jpbDR8gb3bT8wYXHU+SDUs2rfuoyjQ
         sjZ7q+u5UTfmQtiiWE5idQ92hpw60PVuUa6LjxUg+gzFN0LQJd14IjpTMKhjL6mTwcBo
         fLPtqYAk4B2EhxvITW8aFx8p8co7xfB50N2SJtLLXuZbNlnEuWzHrUIG/bacBA7CnpSS
         PeSgFlAQrCgKW01lXzwiCBnxBhKht2yK4I0E3hoizQOVpmOQxAd3pjRuAe5xUje2l1ml
         YmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458683; x=1795063483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2h/7Xw7QWiKqNawLALhqEGQOuq9Yggf5eN9lcwkDIwU=;
        b=uNcy3xq9lk8VDeJpMBEvhq8RCYrhubDoW5KuJ91CCLr5qvQxJ+l0aHqaf47cci0Uc3
         z/9FVNzDkfMuoGfgy0VMLRDnTbEPrC5cipIEmFNPi32nN6v6Q7Vb8MqWv+qP23wQH195
         ian1Xh6SNAhGpyDrD/VxCYEmKNMLcssOyjIyJkjzhYIxp3zSZP8aPu0R+TSF0CTQ520O
         vakNXrXIeCfqPHWQvVQqu2EUd6TESLCxKr4YYryttg6+XgivK4TL5AL5v8HDK6Tp/ipo
         RV0iic0p6YiY0Q0QvNToOLcHQFG4UqXkAaNtNl4ZsFb7zElcH1s5AcgFJoycxH6x2J2r
         4NYg==
X-Gm-Message-State: APuU4Z/9vgG+Ym9IJeu7FmRcC0Z4pAhJzOF8IvhEix0XeT3dYAOdX4Td
	sUbkoxeJiHPbKtc1e3/E3w1E45CxGkWairMPfjwJtk4oYoQX3C+KoNfjngObsw==
X-Gm-Gg: AYBFou1nZQkehRzCRUpV+brKxTIqFz2Eqz34WuxVdIS/8IsSzCYvTatolzkHyg0srpo
	YueD/zW8MVMWzltT7NSsgZ0S8PAEa/2yR2mAJF+F/mcgYMMHM9htGRq5inh4upAhYWcBkZ005YV
	0Qtkc6Tgw0tXiMbWOE4jEqgXYJC8ILQ/zBzPe9VN/VIfS86qUbdvLycY4lA4ut1Dq3dItPGHeBq
	JUZzTSBEZDsTpztSGHhUAJ9WbEjCadDCoInwvUS7HFJ2c9cA9QsewQSe8ARjyUYZHK8cbJtzwj8
	z0xtVf/ocvzXelmFRsKirJsr0esA1wsMhaQY+jnZabW9tFKeKsYEu/TenOWM88V9iAtWk534pa8
	gmH5rTX2PRS+Z/rQlI7xZTbONTFnfQh+h2c84UdFRqz4mwtxBmZ2GpU56Ji88KWCEBvu8W7wau2
	E6Ud1wc4Hs81O/NjQYarC6MjoKPTvaQXcir2+OjMlfdBKCYUtf5IFE1uVfGNy2Z0aSp6UTYAdZX
	C2+Ci7HpPTSEcknd08BmcVpw19E/IFwi8Jls16r66vDpqs9/ihcFoHARixJoVez9RHkaWN6cKCB
	gvRaJN+0LRP6OZ+qSreJeZXKFoGzgWCw7aPvUjzHrQS9TVpKOnUex0qVQ564VA==
X-Received: by 2002:a05:6a20:a120:b0:3e2:1418:aae2 with SMTP id adf61e73a8af0-3f2ffbcee70mr4861629637.68.1794458682872;
        Wed, 11 Nov 2026 20:44:42 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7dd5bbsm2238527a12.30.2026.11.11.20.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:44:42 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 4/16] brotli: set CVE_PRODUCT to "google:brotli"
Date: Thu, 12 Nov 2026 17:44:14 +1300
Message-ID: <20261112044426.3933391-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
References: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 04:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132155
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

cve-check class is setting default CVE_PRODUCT to 'brotli' which ignores
the CVEs from NVD Database.

Reference:
CVE-2026-111497
https://nvd.nist.gov/vuln/detail/cve-2026-111497

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/brotli/brotli_1.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
index dca16cb79b..14d7fe96e5 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
@@ -20,3 +20,5 @@ do_install:append () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "google:brotli"
