Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEF0CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 23:27:17 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.8324.1761175632588983064
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 16:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PYG7D5E5;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7a1603a098eso124836b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 16:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761175632; x=1761780432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdO42SslM9g0kLFrj28C3Rj40IWCy/JfvwZG5jRoJao=;
        b=PYG7D5E5JD8ln0MN8KEb7AhDXFigf/723DVubgi8KVeqmGWB+pW6YtdoT+pppMP9/Q
         pUITUvwBQJ8a4ytx6GPdeIDu8YYp8GYeYxz08yP3DpIRdSsbtlo61Y1NDZePZvgb4/Q3
         rXFWXbme5OfpOYzmpyXXtDKbdXqAbNT+bRM2p6SCiLnUfPygHYy9Da+JV2dJLJkDcUp1
         CjE/WXuuQUkJaLAFnCaFaLulw6kWMNFeUIF+rR3ENv/OQqjFcIRhR71GHM7x/LTB+xXs
         XBhaMPMilP54B5DbrtoP5+8q2TxU2bnnMaS3VNRmBNI7l5lTOjFYncAv6zX5fGxK5OBG
         NfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175632; x=1761780432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdO42SslM9g0kLFrj28C3Rj40IWCy/JfvwZG5jRoJao=;
        b=j5SgYmGF8PLyKiau8sFCwFm8jbBNhd5DvjtBjR0w92ICZRiJ7Xck8t7qRrTvdL8ppJ
         +1RPCcVQFHV7l1rErLa7oWbeLcG6LeJ3ASzoxe1i1uZDusTlBYXVVBtD7DRp39Hr507H
         TYifAPRrx13/4diOF08g34vrfkt56h/bXzPKfkHZMiqliwJ2YA+aQMU33XSlu4jG6BTk
         3Lna/tL0DNtVSOiDI0vPSSa6jFAM7XK6137OikegwbbJDSxR9Wf8u6g99MVP06mz1Ewa
         UbtA0Cc0fr9Cin/r4e51tg8ygRtAIxkxG+gPMg/rQXAVab+QqMPs+UcqIclxCq7Ub5K9
         Xi3Q==
X-Gm-Message-State: AOJu0YyF9cigqU6NDR7WMAqghpkS8P+cnobrfATky3+/FaadTO9V3qne
	of2YM4mVWpMuA2P2SfddUcIz6aXq148xJTx0yV1Fmxp/LS/cSFQSbMyhxHKMqg==
X-Gm-Gg: ASbGncsxiQwoZ1SfD154kxcpUKxqvpu19jmCaIWbFXLbwXMp6GbboQDJtsGRY4/40FA
	dW92CLOZGF9NoBKllcBhXJhMKxmiT/mfSNMmhb33W4m+tqE4QBxEeG9FtylUgcLKfQF513QR8eP
	WtmJmiQ89WxzWPrXr7gJ0bvj2ZHYJC57l1VB0iWqoi/kQkpREtm17iH2g2L/5K5ojYIdpsYnzNQ
	kWrLcHietT2GCKEcZtO7T6CIlFYeQfLrq3APKZ7ZvUfIbSMNRUXsWA+32R3PU6CyJ+7uCyNcOL+
	6uqPJZirp0KY1AENVj1gnjZ+fvZ8dR05mhh6mGU3sUOJM/CRPcbRq6CRY4gYlKxTrX6p+e/2+ct
	q2yLnBF7OPAUOv76sIQTGxNdFg9IE2oL1bbvJZtnAshjhpraagXNvghMXrPhPYOdhHNbJVDUAPO
	BtiPAjjims91jaLBF7HNsF+koM
X-Google-Smtp-Source: AGHT+IHigKGl8PD1XQGwAVyl9Vrj2TETpHRTPf6fYm4U7P7/I87S9ev4awqYJmjfXXPFCCpWR7k/Kw==
X-Received: by 2002:a05:6a20:9144:b0:334:a23b:50bc with SMTP id adf61e73a8af0-334a8610fddmr27758775637.37.1761175631720;
        Wed, 22 Oct 2025 16:27:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb01919aasm331129a91.17.2025.10.22.16.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:27:11 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Soumya Sambu <soumya.sambu@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH v2 1/8] python3-django: upgrade 4.2.18 -> 4.2.20
Date: Thu, 23 Oct 2025 12:26:24 +1300
Message-ID: <20251022232633.1703690-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
References: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 23:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120902

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for CVE-2025-26699

Release Notes:
https://docs.djangoproject.com/en/dev/releases/4.2.19/
https://docs.djangoproject.com/en/dev/releases/4.2.20/

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 54f5df8907cbf1212d0733ffddc049c7b8b8aaf0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_4.2.18.bb => python3-django_4.2.20.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.18.bb => python3-django_4.2.20.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.18.bb b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-django_4.2.18.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.20.bb
index c9be3c0462..3fb8b03224 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.18.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "52ae8eacf635617c0f13b44f749e5ea13dc34262819b2cc8c8636abb08d82c4b"
+SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
@@ -10,5 +10,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.2.18" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "4.2.20" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"

