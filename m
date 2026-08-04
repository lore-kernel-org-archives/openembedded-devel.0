Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EEDC56202
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:42 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24829.1785872493658761020
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JP6d0gIc;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1156268a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872493; x=1786477293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uY3a2w2G4lSrPrwFVO4KCImk33jszD7GbfCUOwhFvLA=;
        b=JP6d0gIcRlCsScLLEczX2UwiyJT/N5CI6i6aCX/HX+lu8ZioIs4fk3qRFEO/QjI1xU
         InFwmASAY0izt+7/GPnzhdhixphUFV2efYRmhJ1JB3LGFPJfZV3R+SNHNC86YxmlkjEu
         A1WpZFINUMCtudAl7ugEGXtimKiSVGh67hu057Iy7g9lc0K/v9stRocCk4BxYOg+TPk5
         8zeZUX98JjwIIKEMNbqsvw7vu18p4XKZbB3+cdy/gqCUedpqzDTpEhCD614BYOsfMbIS
         XY0bD3+wmFxGKlOMTSLkomuFBBhz2f94Q+CtOhEGNtsBcP6u15SWZaRTYBe61REXURqB
         hpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872493; x=1786477293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uY3a2w2G4lSrPrwFVO4KCImk33jszD7GbfCUOwhFvLA=;
        b=qEO4ZmA17ZsOE68Y73/noQ2Zib4OgIWBBTK5FAuljFncKdgPgpurW9FQzCZ4Tl3mDG
         SlvPSJk3P29xD36UBo+Wo6Vt37rklblYxPmg7JLwrqsEibcq533QZBlxPUKkG+bY1BWe
         5Qqo2w4nOStS3M3JpdOeCkai21+UoHwMvSlaj3uw3lGH5jfEBdrbhuX7+1DmYPxrYXiE
         J1hVRqZKuV5NhFr1G7+lPhMEqOPa9Ow/JzGOsTZs2TujoZk8SfY33hffYyvoNZfJMgFy
         oaLg8bbo/pnugmLAOsVMtMdGW9x10Pq6KFvNRoB3+DPivShTP1mB2WvACNvcX83C9Aej
         l5PA==
X-Gm-Message-State: AOJu0YzMAGc7Ifi1BnTIQKnejVMJ/7J/akxjIlpbk0rHEzt+aBFrO4rp
	krrkbblfOHNdP3UcrpBi+Usg8+5BhUIJu1kCnzmyf4wvMTQCuk9fr2TqVl4eanrm
X-Gm-Gg: AR+sD132/Ivna8BsYD2Bx5jfN4NVt+jtrIbHBmXH2Pbhvqv9DRzYq8hwFr4Jvc5MoXA
	F6LINnZ11/0OYDWBcxk/pNcG3TYnrDCmz3KdS2wsqnX4yVNuDxzgZw9BIeuwLUj1/G3r1YeTEKD
	hcFleQ/I0cT+SojG99UAs161p3NerdSEkPkuw4FaxCdrO8jFXXaHVl+PefDC+e+uv2fXSWgcPyW
	n+Xj636ojMX8yvzq49oW3ZMcb1F0Whwc7rgHlV6jhGMFrJkupP55qJnbg4AS5U9oxoxwLSk7RJt
	byX5lKW82KA6eS3n1QNaMGnJitB6qLo/WP2fj4KkumHgZaW6HKNGEW+ftiD1QvUrUJ46LRPNYu9
	ZdVOBMKknSOSYTKOPpYj1FAEc0qRUS85s6PJXdjtfa9jWC3qaiz8yAn/74gFHpUI49faWwmTEb2
	4/VYukC2nU9SQ01rDKDput9V0z1awzNmwI2UFVEDnD6eZV3HvOBqL1I96m8H984Gl/Sm4v52cNo
	e6ZJJN/Dn4u
X-Received: by 2002:a05:6300:6708:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3cb6c829888mr6042619637.17.1785872492886;
        Tue, 04 Aug 2026 12:41:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 33/36] python3-faker: upgrade 40.13.0 -> 40.14.1
Date: Wed,  5 Aug 2026 07:40:00 +1200
Message-ID: <20260804194003.3158916-33-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128780

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/joke2k/faker/blob/refs/tags/v40.36.0/CHANGELOG.md#v40140---2026-04-17
https://github.com/joke2k/faker/blob/refs/tags/v40.36.0/CHANGELOG.md#v40141---2026-04-17

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-faker_40.13.0.bb => python3-faker_40.14.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.13.0.bb => python3-faker_40.14.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.13.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.14.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.13.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.14.1.bb
index 97f0e6e8f6..572308c6d9 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.14.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "a0751c84c3abac17327d7bb4c98e8afe70ebf7821e01dd7d0b15cd8856415525"
+SRC_URI[sha256sum] = "b12b657eaa78c99c138b45e77167c9f42309ed1cc40255c5e853ef3113fcdecc"
 
 inherit pypi setuptools3 ptest-python-pytest
 

