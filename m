Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D518CC02184
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 13:49:46 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.16914.1736776184159506577
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 05:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pMLB0xVN;
 spf=pass (domain: konsulko.com, ip: 209.85.218.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso113481266b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 05:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736776182; x=1737380982; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yhPOgF80xJ1mAVrxGIuzD6uVzW1mpL4MwpRGBzfjtg=;
        b=pMLB0xVNxdWv9bY8jazRZaqKcWS6GKYN6SwhASl/QqB9BVs3f3d0sA20cMJ+D30IWX
         xFsMk95nweC+f4qG3iFr4FCI2SeS/3u2/ih2oorZ80/IqEoiHX9oNEXo2Huh4Cl14t/T
         robg0zrW8jS1Mthovr+7NI4B3xLvSmDxKp0Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736776182; x=1737380982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yhPOgF80xJ1mAVrxGIuzD6uVzW1mpL4MwpRGBzfjtg=;
        b=hejwi7AMRsjKXg3Nil1YEJV88tIL5iEUOy/1Ff9igeNUd0r475zILbrUxNDa8PhPQy
         xgrkv+5znjlu/swpZOo88qz3FfaE0ExDGVZ63HI67GMjcv4vZLKD41s/gOC82rHMDRFW
         NxOE5I40nmZOyo0SDc56WDE2dwjJt+6RxKvEscVrVOfR21ZGFy6YYRtzzZdbbJieXEto
         p7nx9ZJJP+MYyeVjAEBNIRDhCL38LWzStMcofUjH6MzitXnSpTHylUghRpQHMol2V/s8
         wps+Ki/uu5jDUC8b1njFNLjVpQHFnCt5IsniJ+7NR8qrCURcuQPfsg88BN1+aLtSuEXS
         ZUEw==
X-Gm-Message-State: AOJu0YzaND5Ok9c22Uu/2Ld48V8mJTpME8+i4Iyq/n+qG/i5TgH4l3ZM
	nDQeaEVlrP57ovNPnHGNuijXFPYAJdwJKw9p5QrBx31IIyB/Y/NifxHiNO2jzPf7lwA1KBPXQEQ
	X
X-Gm-Gg: ASbGncuOpCQMDGJ64vBOXCnkqyrw6JvEs0a+lIB6ip6Nhe749i3J6KJb5291C8roxR4
	Vem590i6DhnXjsMD3vZ6liitVcrHj7Pb++UWBkicn+VxZ6KHyh4B+gN+HdoEKH6Dlo4SnaS6oXU
	hRca0FucNL7bB26OnseSVx4cIkCIV1RsSOmxyGam24ULT0VvQdgfB2tXH9RZuSNzt2JBfK6yQ8b
	LmTDXsFZC7uTsiydQ8cHilHT5i3ze/Lad4z1+FtmDTRVt6d96p7CNUm6o9crC3j/HZCUgs=
X-Google-Smtp-Source: AGHT+IEL86IjAhSmsUd6G0P0Dt0QC/1D8jnskI6JLlBxmZJdj93mx3yQPTQQxGx6TiFwPJoMiYFWHg==
X-Received: by 2002:a17:907:3d93:b0:aa6:66bc:8788 with SMTP id a640c23a62f3a-ab2abcab45emr2122681466b.45.1736776182281;
        Mon, 13 Jan 2025 05:49:42 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90dad57sm509938366b.66.2025.01.13.05.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:49:41 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-pyscaffold: Upgrade 4.5 -> 4.6
Date: Mon, 13 Jan 2025 15:49:36 +0200
Message-Id: <20250113134936.3594358-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250113134936.3594358-1-leon.anavi@konsulko.com>
References: <20250113134936.3594358-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 13:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114836

Upgrade to release 4.6:

- Modify Cirrus CI template to save resources
- Update Cirrus CI configuration
- Update Gitlab CI template
- Prefer importlib.resources.files instead of
  importlib.resources.read_text or pkgutil.get_data
- Update version caps for dependency on platformdirs

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyscaffold_4.5.bb => python3-pyscaffold_4.6.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_4.5.bb => python3-pyscaffold_4.6.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.5.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.6.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_4.5.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.6.bb
index dda81e2256..a8fa531a05 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.6.bb
@@ -9,10 +9,9 @@ LICENSE = "0BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14a49c74a1d91829908ac756c07e6b91"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "d849f9a2e15bdcf165e19f96835f0b17e1a2d59d4c561c445b827a081de6d262"
+SRC_URI[sha256sum] = "4085b8de9200b9f319df6f8ea7997288f159a8e4b284b062d9b2a4d6a9c1234c"
 
 inherit pypi python_setuptools_build_meta
-PYPI_PACKAGE = "PyScaffold"
 
 RDEPENDS:${PN} += " \
 	python3-email \
-- 
2.39.5


