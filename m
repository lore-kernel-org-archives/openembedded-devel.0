Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17796.1795793636379123822
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:33:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JvygdrbW;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so28081575e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795793635; x=1796398435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4veoBzg1JnDq0/g3TrdfY7TKR7TrdbQ9k4npvR4/gmA=;
        b=JvygdrbWPFnz6DqEJUvgMi+qaS0PQ6OfC/Bit8AdfDKqhuCF/61oy269T1zd96C5Qp
         M+XXf+wj4/xKoJJjkjmXs/mp2upbwUhS+aAesu/Z0GmPhkvw2ZnWUFoH/9wndEFLjWMa
         BfivMPLbFZbF1MatXQTAvF6HHoji1FlIZd+sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793635; x=1796398435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4veoBzg1JnDq0/g3TrdfY7TKR7TrdbQ9k4npvR4/gmA=;
        b=KB8HNgG6sAOSergdF4mpNIu8Rz1ZNAZZh8VPmGVB5UoVNtnMl3ZLsYKLKdibNv4sds
         KzIcttRvlcmKtjuaMTeh5uQVXF9nQ/sYuNH3VR+AgS7UN3VFRL2wCxvejxKtPlC2sMj4
         GGcCa9nNh3i865zg4LX7PpPD+VAZQ23sQu6JpOdCZF4nEHTT8sOxqBv19H0izQ8hAsHw
         BqOgg7X46WmQQJdN0bWXUQxfAgMdkYghLNBumK00HgxBgIXwXST7yRB8puo5DruCnn9w
         0ybsw8Rs9Z1kxNUpexNV04PjXqHgdGPIUTYmadLb3bsvuoQm5Xi8nDvIntP4vzGIxREN
         scYg==
X-Gm-Message-State: APuU4Z/HFqY4ewUv7YXjcT9Mc/m4reZKZmAatjUvghqW0xhHb4LhC2aC
	dk72Pyuzr1NRcsKyJ4O29itUg/6v8ycmj1UZmWESuE9mMEX/nWqrfOnPXwlnSBdGaN/t78UCydw
	6lNl9
X-Gm-Gg: AZFdTZfsjHJ/dJGB2wDLwTCw30q3UEcZAuagDJRMjDjEUnlfMH+Pg1qmI/y/cExt7Rj
	m4szl0n3Yj/yuqUQFRuylkrzrccyCsneuBDBJoNeBSEJxqovF+AFv4BkZispBJWRyLGsQnIcX4O
	QVzU/OGL6sTH+k02MuFBelbv3BMFkf7AfCyRssOIk9GH2jm8qnpGtlnK1sEucydRellMQiqd6Du
	mjdiZgqa9AyF99ir6UTaqnXKZqwmPMeRl6BEW+0LCO1pWsN0OoTmsA1TVUojWhyV9ku2l533lq7
	byJk9qVAaaoIrZS+afuRGwBZcwqJwu7xS0674EKGb9jCvRzywRltzYJMDmmvdXaECJMibkBeQpM
	Y8T1pCfTiZkejXkYbBQZj8cu8Gy4E2jxabsssDx6GbGGpLLN+fzLbEc7i2oBezDL5vOwM+xbjnZ
	3JZ8Bi5Wpy+/V7Vsfp6z2ARSSXsQsK80pktfYy/a9LDflchrGoFafIeaicoPtdIhe0cWvMIM1Nd
	x2Z0FV9p1nuo+vDiladdLeYYVUzpVQoHYxZ4Z0xLOukKuzfG/oNHSbr+U7zeinzKseEzntqNmd0
	9MWgJyGRCP7xzAi+lVgIM4Gy1Ybqz1Ci0iQuD9BVukFWksFXp/02K2iK52nkvAQo1f0MsQqKMVP
	beVBt2YqfYMiYh9XQYtNzGOjK57CaOnjDO+wS+VIdT83zzCgzAwbAXQ==
X-Received: by 2002:a05:600c:468c:b0:4bb:6d61:af7c with SMTP id 5b1f17b1804b1-4bb88944bf5mr495242735e9.35.1795793634760;
        Fri, 27 Nov 2026 07:33:54 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm24174207f8f.9.2026.11.27.07.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:33:54 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-semver: Upgrade 3.1.3 -> 3.2.0
Date: Fri, 27 Nov 2026 17:33:47 +0200
Message-ID: <20261127153348.2880928-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127153348.2880928-1-leon.anavi@konsulko.com>
References: <20261127153348.2880928-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 15:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133380
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.2.0:

- Raise MAX_LENGTH to 255
- Update filelock to 4.1.0 due to security issues

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-semver_3.1.3.bb => python3-semver_3.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-semver_3.1.3.bb => python3-semver_3.2.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-semver_3.1.3.bb b/meta-python/recipes-devtools/python/python3-semver_3.2.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-semver_3.1.3.bb
rename to meta-python/recipes-devtools/python/python3-semver_3.2.0.bb
index 8268095a4d..31e6cd1f76 100644
--- a/meta-python/recipes-devtools/python/python3-semver_3.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_3.2.0.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/python-semver/python-semver"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3ce011bad2c5218ddd4973952a6db93a"
 
-SRC_URI[sha256sum] = "87c113ec65f76e40fa471cce41041382cecf8516240d97e0d8b29d866a0557d1"
+SRC_URI[sha256sum] = "adf2c822d2d8908a1dce0121da7da6511851fbd33080e61da8d2ba1e0677e8f3"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3

