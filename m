Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7535.1792574974057576294
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PZxcBWpm;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1846bc43c28so28811c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574973; x=1793179773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzz0hcAvL+TyoSxim3TwHHje7sMt8f5EYUsJClBYJfg=;
        b=PZxcBWpmJKktit2o5YVg+HfgajGUhQA6FIUTFUNbwvgJxYklxiC5pRYcJUi7Cf0z+F
         nwoR0kcMzCFhLu7zH/6HtRnT82t9vDA3U8mh6eSsYOhGPxCb8pOOMzio7i4yKGXPxjpC
         K2mOrMM02Wsb9ef6q43XCwTaVWZqBCFE8UUyoYMVUTpgiUZWHHp7qjQA6d/ZlYPUvJi6
         8F0Vtyq8pxrPh4Q1virROR2qKMyhNdDs/LeJJSzUy8JzqfjfjNZLNpmc2PXn0im421hw
         WEDcSMPlAV4NleJTJF9h5dmD6cVoE6m6U+RxwqgCB4yPLCNpvRXkpmS3fdZ+vF/p0jSJ
         ZCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574973; x=1793179773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzz0hcAvL+TyoSxim3TwHHje7sMt8f5EYUsJClBYJfg=;
        b=iZIunRg+4hEQlR0UkzDsPWGeeuvbf3WcsDKLkjpdx8uvXd6x3h3TCfEOFSDmgMqXxW
         c0TFPzKAKq+gbQVOjB2bh5Lw1f8McIaMThb4EWoTp3g1N9Kxt8uQ1iRuFAM7/KBm8wGh
         90hbELxnVo7OBrXRgRrO/elC6Q+p0+h2tuZlpPF41xrf7H42ZoaS5UEuoEXYVXu3+dEi
         ayXAG9WsddWRVhEtr7dCyhaoaa8xCeu6JFiye4DgXQsS8lekkxrma0AzHz1SueRq5FYM
         fx+Eo1oivEoR/Ff84W0dQMJgSsXX82/WKCer4mXIZfZA1l4Guoz6hqdnFaTLDX5DCT+i
         7e/w==
X-Gm-Message-State: AFq9FYIqMQQf5WDsWR+vRJognQo/DQTCcZZPo1foPdLqWXhFd878FXjy
	tbCwt5UeoNBXu7tzzVZ0G8S14U1hLk4zSdiFmC8eJpnfq4pc1mmH1OTqjOcJ+g==
X-Gm-Gg: AYBFou2l96DCmnDu6OHeG0JHdgbWQHQDH2jEy1HPUg/afQD8/coggeHrrus10/uYS3O
	yA+sBNnE5yNFuutDHGe7oLdDltSMMXeRpp6n5tgPzlllwHKwEXgxGSxC3PTRnh/ZRfzkT31jRqS
	nLzfYBwpzQlwj7oEMi9r10IgP+PvoSD3rE26IeHy4m7VZNzNynkMxC6wWFEcKclOmSsuh5sfRzh
	4aAb4cz+5ikF//mh1XLH1i45iaKRkZdruUjhUHn0uVWrZOlzy3tnKdp+anWwcFasS5bO2yQY5b5
	G8fNl1wVwo66siJH59YuPqcYD16jqNjZ5LS/X3Pgc4dMVkz6/xcmuTKwS53zU+BIv4GLycJ+c4D
	gnIEIrG795uDwe1nPFsNhzYM98RO8UXghYJeYeWiCiyZPlQZPRDdsbd6IlIbgcVn75KzEi3RFQ8
	D28jOMQleaSp+b1VevzAnI67s0M2HJm6Qxy/SCbx+0ZjRvDOPNPMeZyATDDVdLetym6rpJ0mV+D
	XljyC+VATz4Y2Q7+ZXIG3aQaB8Y7xQd3S0ZZ624ygRe/2xmzQPkdvx1bMrZFtKFpwDxbs3otERF
	rHYYzZOh0XsQBwXeQ5JMA5lZtbzlyEI=
X-Received: by 2002:a05:7023:d0d:b0:149:1feb:6dae with SMTP id a92af1059eb24-190a6adcb4cmr2400707c88.39.1792574973365;
        Wed, 21 Oct 2026 02:29:33 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][blacksail][PATCH 13/44] python3-pyjwt: upgrade 2.13.0 -> 2.14.0
Date: Wed, 21 Oct 2026 22:28:26 +1300
Message-ID: <20261021092857.3585453-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131200
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/jpadilla/pyjwt/blob/2.14.0/CHANGELOG.rst

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-pyjwt_2.13.0.bb => python3-pyjwt_2.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.13.0.bb => python3-pyjwt_2.14.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.14.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.14.0.bb
index 1b018f605b..a2cb84587b 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.14.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "41571c89ca91598c79e8ef18a2d07367d4810fbbd6f637794879baf1b7703423"
+SRC_URI[sha256sum] = "77283c83fb56ecf566a886c757a714bc83668e38156de2cce8263302f42e0b86"
 
 CVE_PRODUCT = "pyjwt"
 
