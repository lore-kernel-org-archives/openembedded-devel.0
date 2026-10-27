Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14852.1793092874632497301
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=P1DiVkQY;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so33549285e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092873; x=1793697673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mU+wyCsHuts69QsLFcuq2Omk7QA0n310+vvt4YRMJ/8=;
        b=P1DiVkQYN9/PFdp1Sjy8SimjMva1loHCS9I4BJJ2R8WICLewWvj0VXCm032el8o7BF
         CY5TS4GdAcn4ki44l2rysL7VECmOb3mqXTKm1LmJTrw9q+3wWWytfIybWlDlhWiscpbt
         gwXuuV9nsYCElyieCOgqy2qgEwrjS+YhSIOz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092873; x=1793697673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mU+wyCsHuts69QsLFcuq2Omk7QA0n310+vvt4YRMJ/8=;
        b=tvdg3VbgVfGPKqreS4BVDjDadnDKZmIn4i5UcbIjKAFbzdB+tKZ2zVbHZGaI9+CJVV
         vPjOpyyewMXabCV8gJBoac0bQEu7pFeekiKlpQNYIbjnIKuHfx6cmFe37u2Ra/gYBV/9
         oN9RAYanfKYRcLEls7QHzhs5lYOFZTQNZ3ivF0ia2Iml15bT2qRTQ6Gx5g8mFqCuRvO8
         uYSYwbDJ5fujfSZmgL89b7RunztZRqx6JTYfZHpF2Ye4pJp7xW4tTGmQ1Oe/xrNai7Bq
         mwACf7y+bBPaGr0CnQwJI9zPnr9fMZZCY6ajZXhdL/ir5VBp0WXmE0IcxBylq0kR2QGR
         MyAQ==
X-Gm-Message-State: AFq9FYIVHGDTxZbF64IHcwgF+S54H0iJfRmwkKtLMy/iE4T33hUCJ9yW
	URpcK++tp8wdgB4zufymRGXxTjYC1VLklZX3N/+1aRxeBEIdrLncmlnq9d7Ov2mRv5oUZ54nI3h
	qAYLV
X-Gm-Gg: AYBFou1WM9xUadgtIE+uA2gdGyloXZO3nunAUOYSpnir2+eXdcOH5TcOYM+/62WUwZP
	gFooNrQq0LaCKGZhRYyYtXzKYZz890e4RNv3rJhhRlXT3R/6Z+x82m8e14THMzQ4REA9FHUfeQ7
	Hjjox4PhmG9lVelsszMNDvZvzbRq+7xBc09ZkI4MYKsKKBL+8VYceORhqHP6NBk/HBTUSlrCjSE
	Yp2IQ5ltxvJ8Q3fE+//PVmT/3MfBZcPnnCX99yUBdlXfa15K74CAiJ/4tJwqimxXdCHF65Eh4P3
	G9Suv0gWCuBLOnhA7jGRpB1muK3QXkeD18uN9A3h72BQioPGaDOmBz0LGNEi/NYtya8uhRT7FG+
	jH637A6J6+N7hbMTPjaBjemJVWRWihFHWMs6QWP6C2kSlunbt05D5sUmpkNMAZqTglJ1QAjvRAy
	NlkGs1RTlOO46BsFEQ5rlApK67zp/PuRbSxWu2bLmxFoYUBTwo2vo6b9d9JaoaEuHUEaGeruq+P
	CQilKaIxTpuQ5+5vCyXmNzgtBiyBCzcF1kVY95RmRhdmABRWKJIckdUecmyf2t163ppcj3SIoNk
	Jag2+P3gpYx5h5fYTX//AkAPcat1kOvfI3EAVTq2VqHkItOH4h6Tm68fP1VRbrNqJmwqevqKwkg
	1TCpe
X-Received: by 2002:a05:600c:3b22:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4a35ac9f145mr174276455e9.20.1793092872950;
        Tue, 27 Oct 2026 02:21:12 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:12 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 36/61] python3-semver: Upgrade 3.0.4 -> 3.1.0
Date: Tue, 27 Oct 2026 11:20:03 +0200
Message-ID: <20261027092028.782979-36-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131500
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.1.0:

- Remove duplicate code Version.bump_build
- Improve bump_prerelease to alway get a newer version
- 441 update pydantic section of docs
- Remove Python 3.7-3.9 (EOL)
- fix: replace semver.parse() with semver.Version.parse() in
  docstrings
- fix: next_version should bump version for build-only versions
- fix(next_version): reset prerelease when token changes
- Declare support for Python 3.15
- Add optional native parser backend (minimal adapter)
- Reject non-ASCII digits and trailing newlines in version parsing
- Fix bump_build() silently returning an unchanged version for
  digitless build metadata
- Handle malformed collection operands in Version comparisons

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-semver_3.0.4.bb => python3-semver_3.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-semver_3.0.4.bb => python3-semver_3.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-semver_3.0.4.bb b/meta-python/recipes-devtools/python/python3-semver_3.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-semver_3.0.4.bb
rename to meta-python/recipes-devtools/python/python3-semver_3.1.0.bb
index acac3bf3ca..45664c6be9 100644
--- a/meta-python/recipes-devtools/python/python3-semver_3.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_3.1.0.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/python-semver/python-semver"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3ce011bad2c5218ddd4973952a6db93a"
 
-SRC_URI[sha256sum] = "afc7d8c584a5ed0a11033af086e8af226a9c0b206f313e0301f8dd7b6b589602"
+SRC_URI[sha256sum] = "14bc073439513d7773662a338f4db9829cf16c12b74b9568e2d2689975fbd7fc"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3

