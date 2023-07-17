Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8640C001DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 15:20:37 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.11193.1689607236272328901
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 08:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=CriT7yTL;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-768197bad1cso196220085a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 08:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689607235; x=1690212035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJ8mB+yT+NlXcipVlwixzwMLeJcdJeEQXfbNIH9GqVY=;
        b=CriT7yTLkvMcU4E/DyQqwE/ieUn8qvKzDrTFZ9GMWfizu7rIjo2xrdm+lT1GbfPG75
         3gg9D4KXPCQlloYnIqfQYW2Shimh81RqG6wGugnsWQEoZXpjEGUBFe2Q/VIRYtAtFP3v
         ppAbIXpwuHB3wdlmiAekXtz/ZD6CrrauRVU9u03P7tqZ/9t0S1DYrCRx2FzXBxXaU448
         LKnfQPzmEZA4gMWdYDVraoXharGaLyephCs7lGhHxQxebuZlY7T8fA6MORJhGp4HXwjn
         7H0+c5RMD2uCpfpgzN/SXNYgF5Q4r6Gc7JOAcfQHE1sdTGsjCnDIUytPqeXZ1RpM/I5K
         JSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607235; x=1690212035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJ8mB+yT+NlXcipVlwixzwMLeJcdJeEQXfbNIH9GqVY=;
        b=bTPrhWEZZzB18qhx6kGpUfVEkwne3nqbX/Haqs1qdBA0oJrHtc/fAKo6l831jYmTON
         QhrFkZgS0nREDmFIogQxONdymn/OPYcafl0qMFqeLo32joNNbgHEkIkeq1k6/pTALopC
         MNIO6GVw7tCGJJ8gHS13NteDJVybOgaKBqHgwndLihScXBCwGi8yDElZEDlv+VKBAclI
         5A1YBOFlirb6bcOyppHY5w8QTxrJ9SiI+KPQf6U5pkgtry7BilggrInVYIuGIwsvgB5B
         IA+sWs+30YdcbX8gTKpbFk005k4G65Uc+eNTWfNzY2HooSHZt+JxODqt1CZj2OIlq6E1
         fz+w==
X-Gm-Message-State: ABy/qLaOd70FOmhNbOLfFqd9wyii+03ocRtZROOWi7fY2BGyK7T47c6F
	uiu2zT0GlnaWVa8GeDcJZn2y46vTDE3LPTZdxPY=
X-Google-Smtp-Source: APBJJlGpaRAIhlQ10LQqqFB1mHnIB8zyFFsQm+VEo4eJh5GUveomBIyQjSODS2jnSRwbW3jTpSY+sg==
X-Received: by 2002:a05:620a:a19:b0:767:28ca:3f4 with SMTP id i25-20020a05620a0a1900b0076728ca03f4mr15138281qka.55.1689607235223;
        Mon, 17 Jul 2023 08:20:35 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a144800b00767d2870e39sm6144226qkl.41.2023.07.17.08.20.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:20:34 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/9] python3-argcomplete: upgrade 3.1.0 -> 3.1.1
Date: Mon, 17 Jul 2023 11:20:26 -0400
Message-ID: <20230717152032.3161667-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717152032.3161667-1-tgamblin@baylibre.com>
References: <20230717152032.3161667-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 15:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103879

Changelog: https://github.com/kislyuk/argcomplete/blob/develop/Changes.rst

Changes for v3.1.1 (2023-06-11)

- Search through asdf shims
- Use ` as escape character in PowerShell (#434)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ython3-argcomplete_3.1.0.bb => python3-argcomplete_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.1.0.bb => python3-argcomplete_3.1.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.1.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.1.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.1.1.bb
index 859ef7b10f..504e7e2ebd 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "3a81445fa51c9875c36789ae5386d5e95c5c43d503963a0029a747aea74de1e3"
+SRC_URI[sha256sum] = "6c4c563f14f01440aaffa3eae13441c5db2357b5eec639abe7c0b15334627dff"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.41.0


