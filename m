Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17.1794324465339581606
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EkhwfeDD;
 spf=pass (domain: konsulko.com, ip: 209.85.218.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c49c32650adso131972566b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324463; x=1794929263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jozik8412qNS4naY53c6Kx5SCQL/VDmqgAZJWsrtB/c=;
        b=EkhwfeDD0QqyZZzMYw4EWwHdxzvsJRW9bMJ1T6zph4uAQXtL211davrycKdDR6QVx8
         Hk5juFmAx5RKRHjfI2gcdbk/5FHbvdZQnHSnqltvWvzhG8LL/ttU90oKOFhvnSTi3q7P
         SFZ7ggLDrfOAeSTfds/Hx6cF4UIiIJ3+NKiCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324463; x=1794929263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jozik8412qNS4naY53c6Kx5SCQL/VDmqgAZJWsrtB/c=;
        b=znWQ9YD0bhkbl2L6qgX62Dhrs+3suvb+jdZ7Y2Y2RWOh6nKbzOk+8G1P7nm6Il3hWd
         9J5TCyDEFtaYm9uRLXfBa8g+d8xcE6NYNQT88gl4o+hkMXi+vUNjFqNyNeBro8TE9U80
         fPI7wxN2Wh/9AHERM1nw44mckyx1QzMtfbs+zOjM5B3qD9HVk6a4WWsY0VJPxFDqW38J
         diXNeVyDEwztdY4crKnC74mB5F3ra1T+/9VsHHAbUHspFA+RicpPfqGfipave+p26j7q
         rcsW9Juedw4hI2FvPCMQeCSOOTVNmlyMDVH/gyFwqtdMZuO+cpz5a2CiG2ou8PjA4CVX
         PEJQ==
X-Gm-Message-State: APuU4Z9799TTgW9ymm4M+Aca90Qv1H5maV2085qP0Kh4SeLAEnVhrb/A
	dSO5XB+2GwqO6wBsDxtiz6Er3FBkpvqxVHnvyRjprp3Ed9A2iIqlAmvpunlHSEi/t5MTQMqffvc
	8meGA
X-Gm-Gg: AYBFou15OaU2CcBTOZPGo2v0yXmoGE8PVUcQl6pzQoNio4ODdi+GTrRPeilJBC1/GO8
	qe2QVK5y2yCE8qlDawXkQ9HPsWfIIGnZQvLXQwdvpOCtP0rYcaHTD9w3w7iSjIrA6tT6DwpDsFn
	2qoCBb9o8ZSQoWwMftwxxvT32qxL+QnDk2RFTeDZoOnsRlMoJ/xCCzU6IX3jSLRKl73ZZgb12pi
	SvA4KuPNwfe8UCa0fsygv8C1gDkVaRypRPdFe7UAD1616UMcov8LFCUn3SJWTbCUVAg9DGrrIW4
	s7AiUgRJbzjtV5ZZ43d9cWUofyJ62oYeBqj6yZblv+Vx+m3voK42ZsfMyXIGj1AI+iQxJpU3Vy5
	wVEsrY53EU70jijbKrwWqqdYPKlFe8K5D4fkvJF2lSQAH0Bi0J5VR9IHjVsbz6wb4LR5jSIn4Kq
	b1jvNS+wAfSrEy5BUDkyFMDUBGAZAOM6OVa2H2kLcDZS5Rd3dJYxBdzSGipwBRcpepXLZLmjMAc
	aCbrw2fs2cNAZ3Txr3Zpve3DpkpTYFtRzFBSnGjQqBrOOT7DxHYxt9+dP2+zTWTpgEUHZdSA03i
	diKMB3Tx1huo+m/XhRp2hyQFdKQNEo/uUAxu4ocZbZfIt1IVLdZ8VyYa6kx+h6oFOPwdNAn1elL
	iU9g3cWVvH6SxkKq/v5edqjjPTFeWq88rqg3r4rJ8X7ImiQ0uUP9FxQ==
X-Received: by 2002:a17:907:1b0e:b0:c25:2d27:5652 with SMTP id a640c23a62f3a-c5049581c78mr253255666b.11.1794324463375;
        Tue, 10 Nov 2026 07:27:43 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:42 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 12/19] python3-regex: Upgrade 2026.9.29 -> 2026.11.9
Date: Tue, 10 Nov 2026 17:27:22 +0200
Message-ID: <20261110152729.1065911-12-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132086
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2026.11.9:

- Git issue 633: TypeError from optimise() (unexpected keyword
  'in_set') for (?V1)[a&&[\PL\pL]] with IGNORECASE
- Git issue 632: AttributeError: 'AnyAll' object has no attribute
  'rebuild' for [^\d\D] with IGNORECASE
- Git issue 631: RuntimeError: invalid RE code when searching with
  (?r:(())a\G){i<2}
- Git issue 630: RuntimeError: invalid RE code for a fuzzy limit of
  2**32 or more
- Git issue 629: SEGV (NULL pointer dereference) in
  Match.fuzzy_changes with POSIX+ASCII+IGNORECASE flags

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-regex_2026.9.29.bb => python3-regex_2026.11.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2026.9.29.bb => python3-regex_2026.11.9.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2026.9.29.bb b/meta-python/recipes-devtools/python/python3-regex_2026.11.9.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2026.9.29.bb
rename to meta-python/recipes-devtools/python/python3-regex_2026.11.9.bb
index 238ec46751..e6a2e97ce1 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2026.9.29.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2026.11.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8b5fcc4771732191b2b7d1dd68d8f0353f47f8d90b6150f6dce58bf1112442cb"
+SRC_URI[sha256sum] = "316a70fbd70e999c9664681cb0eb5b4982b2cc0f623c7c86a8a112e1bd4c6277"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.47.3

