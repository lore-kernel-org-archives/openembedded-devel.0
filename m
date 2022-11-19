Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACA1C4167B
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:37 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.23270.1668873491973601070
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HAkeWxrs;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id d18so1822322qvs.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7/D6q8KLcFjT3njTnt1xYYflhTPyxX4+yYBFByBEhU=;
        b=HAkeWxrs87qD1jXFtsohIjHjFFjEEBJ/KQxUhzUrQBm7oZLuXkSWWi0gr1KQsq+jZL
         MXr8PUvE3fpGRcXdZNI8GHLq8gYTB1PSTdVa3nsmXMIgZ2bYIn5DYhYmQmL49pTjvWJX
         TMPKshwANoWPy5UtfeihoybwOqFCBN4eRTw2AmVaR780uCUVm4rD2uUP9vDlisQZDGo9
         2C+f/mIBJz6wExCHBSe+EOmolLUM9AwdCF88OoBEn51/H+jdt3KfE1CYlKzzBBSAS0YM
         rTI82J85aNs2ktdO6besMupFTGxqiVRbGrWC4oRgUMZLoveO+DTw0FlGa8Kn+0Jqxqbp
         B1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7/D6q8KLcFjT3njTnt1xYYflhTPyxX4+yYBFByBEhU=;
        b=B/tzWBj1G0/4YYFgIP1LzqEoL/XKQZQT134eG4VyvuMJKrRTPRrxgHwP8GkO3GnoDb
         LExMClATGeUAqSLmNiTXRIzlxcP+Xy1rp2uM23RNHrxT5NUeiBESRD6olXVS4Z8TQysF
         0JZ37wOXg2xgMnqNNRiOb2spartln5FiYkl8r7Ir+S2gWW/kpYyQXLcCzEn2VOXo3cxP
         BGlH+chNn9lxdEjADoWqYSU2eQTxjPV1uWilLnBUrVJqxSg8oX9nlbY42g7bGmgApwx9
         PTak7CEcfutAYSGBlDJhmZDI6LH/ym/KK5UnDOY30mNJSnGb09QLVMSAFzSfvr5b3uSH
         TSJw==
X-Gm-Message-State: ANoB5pkqsDNa9SI3aHjqmSR7xemgjGUqvo82trDM8iDoVyri5Yg28fq2
	ZD1A7e0uAEz0BvdD2KODaQ/+pzJSri/C4A==
X-Google-Smtp-Source: AA0mqf4GBn/7f3Rl6VV5lOI8kTe+ieGVroeLVUjUan1HvEEI3ZK2gGZRUL18Xabhwlcw7RBjQfScJw==
X-Received: by 2002:a0c:fa0f:0:b0:4c6:90b1:b19d with SMTP id q15-20020a0cfa0f000000b004c690b1b19dmr8788165qvn.59.1668873511955;
        Sat, 19 Nov 2022 07:58:31 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 20/35] python3-pywbemtools: upgrade 1.0.0 -> 1.0.1
Date: Sat, 19 Nov 2022 10:57:44 -0500
Message-Id: <410c3dd0c1273e54c1af76b585eaf3a834bfa214.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99659

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1605c2bf33f0a45ca9c31b90af468022d66f9985)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ython3-pywbemtools_1.0.0.bb => python3-pywbemtools_1.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_1.0.0.bb => python3-pywbemtools_1.0.1.bb} (92%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.1.bb
similarity index 92%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.1.bb
index 3a9f0ad6fd..ea9d6528d4 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[sha256sum] = "0af7e067e0c0ba32cc19c2c2dc67875c591b806c4b49480ebe46e37bfb399684"
+SRC_URI[sha256sum] = "3fd2fec6a11992afb8a34c0181b76c8d36c6fae1b79d83fb4542ce08e0fb4127"
 
 inherit pypi setuptools3
 
-- 
2.25.1


