Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7A4CA5FA5
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:57 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46630.1790553831979926673
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SOlnRUoL;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc78d45f78fso1399884a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553831; x=1791158631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDowRa63ZiJqn1u6fx/rKnKsA48Th36jN/CfVL+Ee14=;
        b=SOlnRUoLlq8c2JLGauovSt9DJ70Le+RZVdc8I49ALy479bUYzRhVbrOgvg1GWqJ9qc
         HRnYov6vK87F0Vwfmo7HpD9oJxT6CuYC4AKyJP68CQFk15CjzABY86ExCDee1C/zSXDc
         Jkv9ynFhmIaMI9cPOzzeGeXCneLg231wpFLD7RWSoUwq2T2XPG7AtlmJGx6G0Kd96Asf
         gJbej4gUL1XGYQCxdPMt601V3326tTaJhZAhPh1lV9/byFTOOUai5Le25dKTHVY1dTQJ
         OCPAv8x5sS/fP8jQToGsPqzTNMx0Yes/nKJAy6Cll7LUKCjJ8ii1HA3q4zwSIo+3AlIf
         pTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553831; x=1791158631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDowRa63ZiJqn1u6fx/rKnKsA48Th36jN/CfVL+Ee14=;
        b=TkGVlDgsKq/BJWO+WzM/31KAMNC693OSTJPNGpq03q2IFrquRutVTc1e2fzS5poGNr
         ttWu1tZNNkUKW+k0pGrbAqNmRlGlUB155KXGJ67+Pg2ExcrMMxgtlhYJsh0GcL/YOdWG
         scFIGfQCY7ma5amlEqqn+5pfxXvbg/q8U6bJz8tClzUrRFccZlAaiDaGgOmLc09+WCRK
         +m8YnoP8H68JjSaoVhpfgV36ksCBij2MtGYy+Af/TBjVN8kX3zvcT87XHHKi6XfzeXTh
         zOujvLIkPvxVZBYoFCQuFLOysZscoJhr8zsrq/V98OYoMvgKyAfADPxuZdCPBJn1Hly5
         4S8g==
X-Gm-Message-State: AFq9FYKydyG4jyLxwmdyku7J64AIvHsc/pGSHMojmMqXpNSBBkzYN/Y0
	KkUYiatZI95hI45Y2xM2BcNYU9neHS9Ht8ml9LfIwnFRJ6DQWLIrMLVqMmU1fw==
X-Gm-Gg: AYBFou1xzHH5bY4R5W/gq25SdTTz4o8q2xf210gOCEDOQsSvRYd0x/bjczJyZ78CDY3
	apZaJRoNRvOYpY97LxAOuAZaAAcYFb9jlTwip3l48mNR1yg4xcmaDzZOTaUPRMC0G5JeCpp7DQa
	peHnGrUNX+20uanJ7deZmnr/uYQfFGeJQ7UrVIHik+RO5ZbiWVXNRtXheZs8gVvZ6UOzGRkia9c
	kWMwNRVQfZEKp4ohAGHQOgIGiF8h3aBjbFsxlhVeZGZPxrXc3Meuah3ZWbF38NW/dXbXwnG13QX
	tvGzz7eKwBBk0Wgs15IJA1vyx+tsFo/aGcqHsK+7IxbCb9qJo9F3vlURMAEsThqMTb8y0XRM2ih
	9pYpx/uFAO6KdG/YtWr39L56p1iWLoP67KnggfnpLDjoQTL9ShkGzUzYNn0Bj1/dpM9qWos0Klt
	U13tZdQNyXCFxhfL//v+M31Cw3HEeWWfKA4m6gOIMK9u2exB8X9I/9nE/4LBsZfMQxGPNcvSV12
	L9uOVB68GjFlsKb9lgTcBI=
X-Received: by 2002:a17:902:ef4c:b0:2dd:ad74:ac20 with SMTP id d9443c01a7336-2df7dea7d02mr87289465ad.27.1790553831026;
        Sun, 27 Sep 2026 17:03:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 20/30] python3-gunicorn: upgrade 26.1.0 -> 26.2.0
Date: Mon, 28 Sep 2026 13:02:52 +1300
Message-ID: <20260928000302.2528437-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130407

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/benoitc/gunicorn/releases/tag/26.2.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-gunicorn_26.1.0.bb => python3-gunicorn_26.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gunicorn_26.1.0.bb => python3-gunicorn_26.2.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_26.1.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-gunicorn_26.1.0.bb
rename to meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb
index 2f27264192..545947446c 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_26.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "WSGI HTTP Server for UNIX"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dc9171ccd8fcbd7827c850148b3ca98"
 
-SRC_URI[sha256sum] = "1413d777bf99d31ebeb08acd354b01f1ecc44db0aa7b811ae7b86c669232e4f7"
+SRC_URI[sha256sum] = "62b864895d9ebff0b2f9867ba04fe811c93121596540830c9c916d0769668447"
 
 inherit pypi python_setuptools_build_meta ptest
 

