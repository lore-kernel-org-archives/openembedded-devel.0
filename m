Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3603C83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:38 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.5749.1752004654131972206
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zgs78039;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32f1df5b089so32927321fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004652; x=1752609452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxDi2PWK837Bwc8w88ziEbPwI/v4J8BYZlDwbc0Nzng=;
        b=Zgs78039xkNMAQ8cTCAMSpbnk+YNLjRB/DNRjde/PF+Kskun4zIopRPq3ev/xV8/Un
         OFLsilKFszQnNjs8Ge5LgGl7rrOIIwC04tb9vZxdt9bQqUxUKMw0VULFtteqaqwfQ2ht
         dgmSLuYZRmszEF/fIb+3ac+dUnNchpZ6ndmltK8y2UIG+wuOSwTM5A2paNXbJ+HNSdPj
         gMHEj4wU327sxFV4WFGBisBvegYMNj98sl5cwgXs8WpUITINxzvM9LK0GMqnxu1U+opx
         nRD50gESNU/KtNySCVgaZJD/1lR3k46qdTIMBNl9TaKw8lZSYIH0WOXkikzvHs/YW8gJ
         GfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004652; x=1752609452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxDi2PWK837Bwc8w88ziEbPwI/v4J8BYZlDwbc0Nzng=;
        b=FQihN1o4a6+hg7BO5EBepF8uOfFwOhzP4GXcBXaq3jIEU86EA3Bzni2v30/AN+VIwd
         ZKYKnjZPWcrtETgxIpi8vrbFMkjVOgsICxRV7s5S0fIDEyHKZOXDWKozd4ld30N9KW20
         X+rIOEvjBiSpXUa79HMBZ4LgGMVXVkrL5mfbBHFG+VNHno1xs+LDCF6lbfxcjZfF6W1s
         UWM0iqqBPMMavVWlbmLjexcNlDj6QFsHeXmqYahAb3Qf3/sIwFuEk3M+IZ50kjD2xHu2
         mbgE5VrveZmlOoB6DkZgYGddTiZb93FcJcWGURDXfXsH/0F8CFk5FUIU1zevDBRM/yhS
         C9nA==
X-Gm-Message-State: AOJu0YyyX4HggKRZawwNWYSdTBrF1GNocbk379NW3iW5ZNTGQKZlyNmZ
	LUiyhDUXzWmTvVQPOs2cLCD2VN3jzeoluddMSVhRWlnACHDBRDAqmNEFdB+LqQ==
X-Gm-Gg: ASbGnctSQ9N7P1Iy2E0+M4e1TUgzCxmLmVnUvkN79wGkKOvpakxOV1RuhHxZ7fh//jp
	JSGJk29NISqbySJCZYgrr5wM/4XWHov5s+hFXY+/PPQgIRVxC8CgvlTRgddXCfDFGUUpf5tbBXM
	g297b541F0FXv4ZNNfdSaGedO7c3KbOaYO9h68DiS8p4v3Q1G5E0AP1NAjq/28Rs4L4JFfuzNR6
	xV/Y09VlVTyuJ1maTZIwPKaS++iGo93OiZOjCDit4V4Vw1QYAc0Puv2njbagBB0QjwUWm4CMTof
	2sMEBzpl01hvb30G9IbmN+orl1GoOMsVPUiVYEKAFpw1j2s7sizj70vuzQ480ovuxHxMzP9I3YG
	Yd2U=
X-Google-Smtp-Source: AGHT+IE0fhnTixYNbN8KEZruJsHYow9M8uAQlHzipYNb3qRSmh2xgpdd03jHkwdoJk9mcNz/YIPBuQ==
X-Received: by 2002:a2e:b8c8:0:b0:32a:7d76:262e with SMTP id 38308e7fff4ca-32f39a9ac80mr14810481fa.3.1752004651785;
        Tue, 08 Jul 2025 12:57:31 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:31 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 04/20] hiredis: Upgrade 1.2.0 -> 1.3.0 to allow CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:20 +0300
Message-ID: <20250708195636.1678606-4-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118326

Changelog:

https://github.com/redis/hiredis/releases/tag/v1.3.0

Fix:

| CMake Error at CMakeLists.txt:1 (CMAKE_MINIMUM_REQUIRED):
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
 .../hiredis/{hiredis_1.2.0.bb => hiredis_1.3.0.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-extended/hiredis/{hiredis_1.2.0.bb => hiredis_1.3.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb b/meta-oe/recipes-extended/hiredis/hiredis_1.3.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
rename to meta-oe/recipes-extended/hiredis/hiredis_1.3.0.bb
index 8678447cf5..0cf03bfcda 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
+++ b/meta-oe/recipes-extended/hiredis/hiredis_1.3.0.bb
@@ -8,8 +8,7 @@ SRC_URI = " \
     git://github.com/redis/hiredis;protocol=https;branch=master \
     file://run-ptest \
     "
-SRCREV = "60e5075d4ac77424809f855ba3e398df7aacefe8"
-
+SRCREV = "ccad7ebaf99310957004661d1c5f82d2a33ebd10"
 
 inherit cmake ptest
 
-- 
2.43.0


