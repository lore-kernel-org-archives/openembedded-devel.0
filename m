Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B132C5DF6E
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:39 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28119.1786651778558135103
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Qw+GUp7r;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39266382df6so192002a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651778; x=1787256578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6yK8/HkVnhXHy8UfV1zbJKn8YwLrGZTgmYC/TBoVBB4=;
        b=Qw+GUp7r/8cwp3UkdRDS05S+P1VLy9Ol3wyEEyi+xOJuGP7RLSKllJOTJoPslZPMGB
         +0xptCbFIML3D+akYsLKuBsEpDQg0KlzJZP2IJSO41ynwpZdKE2hrLIBgWi9xtu98hNt
         +WtJDvKdrpCIoKnJhZqgZwU/yF9fKVi2eU1gPVYRxBndvCsjpWW35XrXV6OQTU7wpQF9
         G5FhmfbdEtG8Wd759rUHlCNgeF7CEumtbYOHsxBdVMaf5masC0TfefTDRGyogPmBfBkz
         oj52QWjGZ4mPQFM/fI/6hUgPA2k044wUMUgxYGBAW6EpGyfTJPtLgJEY4k/UOVg/6kZW
         CNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651778; x=1787256578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6yK8/HkVnhXHy8UfV1zbJKn8YwLrGZTgmYC/TBoVBB4=;
        b=BRJJODO+wLFcAOZluEyO5IBMzi9lkEQ9aHx6mX0LKZ1TS0zS1PZJPpZ60UxMeADfJV
         a0BPTdh162YlhVGRbHScOz6mcCLgo55iP+Me5hSFhsxP4WPJTXRbNJaCQ/Mehbcdh+dG
         FDDF5QuE7SuWaTlJuhIioWq1rNwXkT9K9tthmxBQsK44z5okbXGyolkg4suOcfyRHgSW
         Crr9qauSEkLNJtLt1E6C013QGNm/B2X6xfX3nmFV+ApISwsoxfovGQ2gQw7FGFHnvkkO
         IGdRit4q68IwMQc9qRA3186zTP7fVj4DGMquxrz40Dr7GzmWFezA9vNj6arfcrKuydGx
         nfRQ==
X-Gm-Message-State: AOJu0YxWRnu0cn9+4tDMHU3hIXi8kXMrHarKWym3vClEkE9rlB+66TV9
	2cd7rvqtauYAbKE5F0D0GQOmdkgSDswNCZ8uDKJJW9IDwn4bVGoegeWoVO5Qycbr
X-Gm-Gg: AR+sD11tm/6sfkX8E93NeOXSY4GCYj9XKEonoHyQhfLsioKfoQX9r9IMfJJxaOO8c4Q
	sJVqGmYRIkHdrjh7C/ChEMs0DNLgHo2dUdhciMvDy/puKhRGfhR9NPUlKXM2jU4qEkPG9HVYvYW
	FXR5Dac6Jqj2dYG0HNbu/3rn0+YkuXZlYtIumZJknAXmIyL/LMfQtiDsKJWvlB+3TenDf/30c5m
	17L6hTc8CiFfncQgZIXaC1ZEeXMULYKitMiwmJ9g/6qpKJaPBJz0yFEUn/Bg6WTOMyItKVQsY3n
	CW/O8NRqN2HjUvTMoL5u0CSptKB0q4SXxq4cqh1gOMO+cmW93U1jkC8+UCPWevVkSy4j3AOih/f
	Fz3AHkcE0asQ/1uNfM+puzqpChU9y6u5uzxjSotxHmZfo0bIQpTnaX0GYNYoceQWYHkb/aGBAsc
	utkM+B1mSludI4A58b/kf5eryx+NXAoFHOECe5DZw1S5qC8KLQ3wnKZ3ANp0unMmAcasVhQet7s
	uj08YriGs835175hdIMhp43zgAlxOW5FsELYWdwjzYw8GzbQHGFrL3h6/4vat7EmH6QBQrmznPH
	3j6qIE6jxIAG2Q/KzY7aLLjzzrYKYjbACexoo3DNT6vtJEVeoJG9SfNYcBwdCuLS5vqYL07lcgT
	i0hxfEEDm4/dAjTl9gMBlLuSrSazSZQzjxswtSWIGtFcs0g==
X-Received: by 2002:a17:90b:3c4a:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3933b6f15dbmr665509a91.3.1786651777819;
        Thu, 13 Aug 2026 13:09:37 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 33/80] python3-imageio: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:47 -0700
Message-ID: <20260813200834.1302829-33-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128977

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-imageio_2.37.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.37.4.bb b/meta-python/recipes-devtools/python/python3-imageio_2.37.4.bb
index 5beb1c5239..de59f27c89 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.37.4.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.37.4.bb
@@ -9,4 +9,6 @@ SRC_URI[sha256sum] = "e45cbc5e83502047fb138f7f585f7f105a136a57eea5f4b3cfc6ce1b52
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} = "python3-numpy python3-pillow"

