Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14861.1793092889733437485
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MK8iFBM/;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so30384025e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092888; x=1793697688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=roXaH5ct1s56h4oHvsrA7IOT//FdqjVkQXdAVM6TQUs=;
        b=MK8iFBM/iUd5hkdRlp7zlXIiQ/tUIafWrQL1dWiK78fFowZkFT7cwsqIi31uPUFNnV
         f+Bc8PKeMvbjNRQLHTtvdI2rxE4YZQ3xPkcefat0O0vEWSSEN+/n2+X2BMTnA6C7xlUN
         X0zJvLXBqubVkfcGDPPX/m6Frmhc8NO0xjHWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092888; x=1793697688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=roXaH5ct1s56h4oHvsrA7IOT//FdqjVkQXdAVM6TQUs=;
        b=w9qb7dlLpkXMf4/BHcO/enuY+7quKpBmpvqYa06yDj3QQpKBxm3jsEv0HmpUWNZwgF
         gRhf4/67c9CRQ6P4+Fw+39lNiGsFA6P0hlPbJAVwyTPnHARufXLaQYvw2U7/0lomaMtf
         z+4cte1F6R1gGZC0AgXt9ewLp5b4fXvHWyHTEfoRCeVKG67rxJVfTFg7Op9MyiI6lmzi
         k6l/r/ygNSTHCdxE+r2m67Iv/4FF3hs2G84mLt0M7c+ebkuHO+FjF2Q9X3QiGtWBXOsn
         gssSleE//NreSI0My6jLHpdrzfaKywmYH5WOUeRaxwwBcpZrpzv5AItz+bdi/KaLPDmu
         8RBg==
X-Gm-Message-State: AFq9FYJ7OWh4NpyTeSMdqkaXgCh+tn7faALzWfIu65p6bxt0h5KwTdwN
	SVpOHGeu5Dz/ilhwmsGRmXvZ7c9sz8GiRo11ta2EVn87aB5yg+dzCDdyXkYbug9f6U67tQJnZuh
	cNHrD
X-Gm-Gg: AYBFou2IzvJhqZhr1jUwqY7/yddfDEH/3Cb5qmntDDpy96JhoV87K6AclZmKyiHAwI6
	Xj4+4jaHlTfiNZQhN58jiGY+7GjmmfTqaryvqBRFlWRhY92f75DDTwjUlczzBmkO+ym/5og/BCP
	FtlWBgSrM4MbbwnbWg0LkYNZ1lDXu5Jbx7jYgM0b6bbPR0YoKezcpfwxXHYaVdlvmvhWc5ttP0G
	xr6Znk3rqt9R7Bye2/lc/Pqiem/oAQGHLecDhCyrdPMbUildlkbpFQiSc6NAMtuOiP4vLM5dOer
	yhAcYctUUjMvhV2AdLCjRqEiyf+JWYmRxvWMowN2SnAAiZ4rmM5Xd483XWE0CFmyY6U9TONWRZa
	9kkfEoe5Y+GYCDORwf5v8gz9tG/xcB9N/7V4nscCUSvSSTS9pOZlNcanhrql59IkHLEpKSi6FQp
	N1PB6mo1e5hrZZbgSnaU1a5h/IlIu5yLooHvucHfdRJCbDqQ46AVRi/9Pe9sRr0e6clQilru4nO
	fHcb23mkXXgL9W3UeeTgokdbjOAKy00Hzr2vel8nT1U3cUrbJpH8UnOsf5y8K2GRlM89uFidIa+
	dsgEOvMyw9vTC4EHK5ZWCbfqYnV7DuBVUqD+1vEAUsgQMW4395OtKKZ3B75Z074gyYjByeA0oPm
	OVGyf
X-Received: by 2002:a05:600c:6088:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4a35ac3b010mr159020315e9.4.1793092888051;
        Tue, 27 Oct 2026 02:21:28 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:27 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 48/61] python3-tornado: Upgrade 6.5.10 -> 6.6
Date: Tue, 27 Oct 2026 11:20:15 +0200
Message-ID: <20261027092028.782979-48-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131512
Content-Type: text/plain; charset="utf-8"

Upgrade to release 6.6:

- Python 3.15 is now supported. Python 3.9 and 3.10 are no longer
  supported; 3.11 is the minimum supported version.
- Free-threaded python interpreters are now supported; prebuilt
  wheels are available for 3.14t and 3.15t.
- Windows on ARM is now supported and prebuilt wheels are available.
- Prebuilt wheels are now available for riscv64, ppc64le, and s390x
  architectures on Linux. These architectures are experimental and
  have limited support and testing.
- PyPy 8.0 is now supported (for both Python 3.11 and 3.12).
- Error messages have been improved in many places.
- Improved handling of asyncio.CancelledError in various parts of
  the framework.
- New feature cross_origin_protection provides a new mechanism for
  protecting against XSRF and other cross-origin attacks. This
  feature is easier to use than xsrf_cookies and is expected to
  become the default in Tornado 6.7.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-tornado_6.5.10.bb => python3-tornado_6.6.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.10.bb => python3-tornado_6.6.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.10.bb b/meta-python/recipes-devtools/python/python3-tornado_6.6.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.5.10.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.6.bb
index 9536008c84..440a00ab63 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.10.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.6.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "a6b1ccd08c04b4a06fb5aeb381be99de5ad1e5375c1785e31d78c880feb57687"
+SRC_URI[sha256sum] = "34c4aa916d7f2b2d5cadee2c6850f5a4a7f3d688cbf58399ea9bd3057af4abd5"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

