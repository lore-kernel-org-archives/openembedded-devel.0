Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE720C83F15
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:38 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.5593.1752004658134709154
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KEeSHNx1;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so45227641fa.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004656; x=1752609456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLtEmXyN+M04XUHkU12mKECizQf3A2get8NAK6XWR4Y=;
        b=KEeSHNx1/M8S0+jc4Lgmze65ruSw5jL1Q85FBkxie4mRJ6hxnzCbdGs8Cb4uUODP/a
         wuc9nqqdBUHOA5Cm4Rmz9Cog/0KAgSHE6vm6JhnVSiRs9B96vxZDg5oXqb3rEXOYS9uP
         pijfPyeaMTCQ3P4wJcgb0mKgQfn/eiiLYDixcjA6rd8GVOPqeYBaH6A0ZK6Qu6STSDTP
         hznP4ssapVZOdeJ9r2rYcZJpS7LjeBtHLzTtNjt8TPMoU47TVYtlED8tKM1mbNdREKCq
         v88XQMbz8VeWp7XJMtDf4ztNpYzxg+361VvjLVhobBPrN3OHOMFt7gUpLx/LD/NMiURF
         jc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004656; x=1752609456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLtEmXyN+M04XUHkU12mKECizQf3A2get8NAK6XWR4Y=;
        b=d24JkW/V/V1TxusrWQaT4OtnGZFlJsTB07L+1TSVq94hYmYemt2T5QMHAsjmvxJG5n
         v071gUKdsU6xn8Iahr+JO9PTmccYJjIeXMU60Be8PLt06VaEpQAF4Az3uESM6/+85wQJ
         /Z8TY5AP4/ukakzGb4DSWVrF7/IOj/6DaCjanpt93esL/GEVDyRy4wvKyHvLLPex+2G7
         gFqLCVpQLjZerYnNP4EeZH1V3zGluaQuXhSRyDhXSLSVA4tN9wkkaXsiAMw55pBWzypW
         YCFOK4YzpkyGA3fMhfOZgtgNlL9j0YT+BhjYUdloTvdr5JD8+dbrk/L3gxoS+D4Lonm0
         fslQ==
X-Gm-Message-State: AOJu0YyicBq4kjAyuAeSjgSPwJMNggGbljwjc2v36tHNRIGDOebl86f2
	f6XOWODGQUIBS31Xck4vFPpUkPYFANmy0Vt1NPLfuC3m4jgI+9DF76Y42F9fFg==
X-Gm-Gg: ASbGncsyTRXCmUmpgRvUKEXt9UFonxfmkmwcShqzNZg38R+l3Iv5WWZm6d4sNOvJ39h
	aPv0tkNvIZU3GTx6VcyZxo8BE+ZbYqIYGawbG7pE8KAYQWHeOX4ksXBMn8HsX7Si1VLUei7id4a
	ed98Hh62zw1OP1GoqFgMHUTTUHcD9CzhjdexnC06YWUMqSpb/FYdAczKDOeqG+9MyLZX+R8caGg
	p6aknotAxwoT/3pOlR0d5zgPViCBLD9Jx3fAyVqXyIw5wjOgbU7u93nDhKO5hqxLO22JyDoxxlt
	GblzzCAFPYEWc4KOI7z5D15A0SCI89iojjnwXQIWUYT+Ms6zePztnN7VgKPOrU5pI7sbzPJ/2t8
	1jOtXqemrzhRmSA==
X-Google-Smtp-Source: AGHT+IHPLudHpRhizWnWwpr70L7wJWGfGj7eZtLfwqTuav6HvaNOoCV1zDyfx0clSRbUck3O37e9sQ==
X-Received: by 2002:a05:651c:1502:b0:32b:4749:f929 with SMTP id 38308e7fff4ca-32f092f1d0cmr61685431fa.30.1752004655665;
        Tue, 08 Jul 2025 12:57:35 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:35 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 07/20] wavpack: Upgrade 5.6.0 -> 5.8.1 to allow CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:23 +0300
Message-ID: <20250708195636.1678606-7-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118329

- Drop patches becaus already fixed in the newer version.
- The LICENSE file has changed so updated LIC_FILES_CHKSUM to match the new md5sum.

Changelog:

https://github.com/dbry/WavPack/blob/5.8.1/ChangeLog

Fix:

| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../wavpack/{wavpack_5.6.0.bb => wavpack_5.8.1.bb}    | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-multimedia/wavpack/{wavpack_5.6.0.bb => wavpack_5.8.1.bb} (56%)

diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb b/meta-oe/recipes-multimedia/wavpack/wavpack_5.8.1.bb
similarity index 56%
rename from meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
rename to meta-oe/recipes-multimedia/wavpack/wavpack_5.8.1.bb
index 651fbc4192..63d0db1b67 100644
--- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.8.1.bb
@@ -1,16 +1,11 @@
 DESCRIPTION = "WavPack is a completely open audio compression format providing lossless, high-quality lossy, and a unique hybrid compression mode."
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://license.txt;md5=bb5d037e3ad41a3c84c9f2d8bb65a7b4"
+LIC_FILES_CHKSUM = "file://license.txt;md5=3a6eec695493cff01ff6f7b7888c5631"
 
 DEPENDS = "openssl"
 
-SRC_URI = "git://github.com/dbry/WavPack.git;branch=master;protocol=https \
-	    file://set-soversion-and-version.patch \
-	    file://extract-libtool-and-convert-to-soversion.patch \
-	   "
-
-SRCREV = "e03e8e29dc618e08e7baba9636e57ba1254874ce"
-
+SRC_URI = "git://github.com/dbry/WavPack.git;branch=master;protocol=https"
+SRCREV = "4827b9889665b937b6ed71b9c6c0123152cd7a02"
 
 inherit cmake pkgconfig lib_package
 
-- 
2.43.0


