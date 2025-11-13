Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63EACD4F2F
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:15 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17886.1763014811789984598
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A3yLaw/h;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso374607b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014811; x=1763619611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gb+W+c3yhuxfhWFIm/GglJyF1xfAHf6w4u8isGtP06A=;
        b=A3yLaw/hsKx9kE61NDMDXo/2vCMlvoclUcMxzBaea+RhcPqHZAf3F0YmEv3vkJtX2P
         aTP8qXKK02ny2+6NTcVtYLQzUreN3o0f/ieRFQqDS6Sa8ZjADFEWn5KOfdoXf8GBbEmr
         8bc06yANvItZd9oUnzTuKPuIqyHSblP6SC/zbjFOMPTg0Qq0OGdLvijWF2yKqUQ6rqu0
         UiAg3Sl5YDxlOfqP4ejioPatyb/x9zCcxa3Z+wZhimsRn21AY9xe6DCk5TGe4tyyOatK
         4uAJLow0CvjUgoGt/nVQwFO6tZVToQWOL3FQ8nHqc9vUr48AWnKvy1CRpggoeFp21Fl9
         uKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014811; x=1763619611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gb+W+c3yhuxfhWFIm/GglJyF1xfAHf6w4u8isGtP06A=;
        b=fkDlGnk/ZxvJP8lKM/JeEBN31nLQc8DACd4P5QupfsXKwD8dwDJ2ak8h/zsL/BeHwY
         eyJ5HAyFE0LVx6akuHYtKTHq7cTMPPurtTgjiw+ChHU3ihSR4qJos6iz2mvz9P29mhYl
         kalTUso01UZg086naNIHrX4pkvrI/veCnex6gjhoaV3PSsEqpYSLxbh8+ccE1Zd0NzRd
         D1cn7pZklYCE8rcQJnj1rh+qSvUoMUlGwSRG6scq6uAwhCS3xSqnd2NcwIyfuz6N3RlL
         NPs+Q7AVzUfJvRPViZ7gcLH7Rqd6DOx4fOtdx3ZMqz+CezRmkgHVIPyIzkaVWPjL7E9m
         Nrwg==
X-Gm-Message-State: AOJu0YychDd8dyQl/ijJfRCBgV7tSwkjx6PBLIhF0TYwrMKb4sNOlk5J
	ez4mTyKlMOyFHH7Fj12qM0pm8sZijyYfjb/35lLZDKRiyFIQssN6KsTGA436cg==
X-Gm-Gg: ASbGncuQhD/RdmASW+aCnZMq0d2h67nMzGuZft+9VMYlNI42uWGP/Ypw3dLAlu04qbA
	vlQWNVyd2Cu1wtntIu94lKRLYL1cVDYAkxjfU4VY9aVbgjoXjORieOPpMeTHPfCtPOC81gHWhKy
	rvoKgHBJr3eMtEc28UwCwicLI3ZXLG924EOnstpqoouV48nZTmGRxBqUiT+vfjAhoDZGcoHOTMd
	2VXK5aBM8+ZrjsMyQtHR3VuEt+yRkc/u/NVyOjfvyH/ZNTV6KzB+SWOHTGf9j6eFOgPR8pOZI07
	vL9NGJWTOQLnslcn16GOt501SsGa3sKsSKnGzCuUCP/7Y4D9qded/Y/cq0xQNRdUJ0PUq3vm5fB
	OYWqtJ9gs/QrSvmyer5/z++FjAkO+76E/UcGEaIPgpaSI+UJLoSV66qjgVDlIEUNMXgKO/5zQf1
	wnJfsIIqkJLQF+vA==
X-Google-Smtp-Source: AGHT+IFOG2cV0KJOEfS9EZ58rzJYgbaqUim4TUcX6bdjNqFuk6yZv7PifSZqXbqCE4G7ZRssatFo2A==
X-Received: by 2002:a05:6a00:1404:b0:777:797b:7318 with SMTP id d2e1a72fcca58-7b7a25a9d42mr6782575b3a.7.1763014809653;
        Wed, 12 Nov 2025 22:20:09 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 13/38] mcelog: upgrade 198 -> 199
Date: Thu, 13 Nov 2025 19:18:48 +1300
Message-ID: <20251113061914.3756301-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121611

From: Wang Mingyu <wangmy@fujitsu.com>

0001-server-Correct-prameter-type-for-connect-API.patch
removed since it's included in 199

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7596d6a497e3ab4ac88fbb0c64526d3a1b5aac61)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mcelog/{mcelog_198.bb => mcelog_199.bb}           | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_198.bb => mcelog_199.bb} (79%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_198.bb b/meta-oe/recipes-support/mcelog/mcelog_199.bb
similarity index 79%
rename from meta-oe/recipes-support/mcelog/mcelog_198.bb
rename to meta-oe/recipes-support/mcelog/mcelog_199.bb
index e302f4175d..0a48fc48ce 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_198.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_199.bb
@@ -5,13 +5,12 @@ and should run on all Linux systems that need error handling."
 HOMEPAGE = "https://mcelog.org/"
 SECTION = "System Environment/Base"
 
-SRC_URI = "\
-    git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;branch=master \
-    file://0001-client-Include-string.h-form-mem-function-prototypes.patch \
-    file://run-ptest \
-"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;branch=master \
+           file://0001-client-Include-string.h-form-mem-function-prototypes.patch \
+           file://run-ptest \
+           "
 
-SRCREV = "ab58f07b9b1a4456fca0f5f41639d5cbecc80e36"
+SRCREV = "c17897deb52daab300c585a6a6c2456d062d80cf"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"

