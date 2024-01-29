Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9497BC47422
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 06:56:04 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.9096.1706511354539681229
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jan 2024 22:55:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hOKCBFi7;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a350bfcc621so219508366b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jan 2024 22:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706511352; x=1707116152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CB7zOSyDJi8QL3lL+QlifkQ9Gi03v7QrOXIIbYEVNR0=;
        b=hOKCBFi7ISsCXedowTIGE2FPOXUNSxMds+PkwTAEZZS0kJF8sERI2HgiGz4JWy5gwf
         QxaD6QPamukGn3/1cX8xZ55j6Dr+eVE28UJW6BU8LXf+G24F+nq5zDRXWiWhkEp4yOZf
         AJBYeAAY03DLOOnKgAWj4EW+K1a20Pivie8RDvqAvQL3KEa3S6dBVtjrRBT67KKZ9zmV
         o+m/rxBYCQEVu10+2SUlJc4en6bGdX7bd44cC6/QCy+CcBXgs+YVS4+RHzfd9m2hWOU2
         rbjYhwVPN05N1U1B+Mw0q0HrieHEMZSUcfYLuj9SWridaw1JE/6Qnb3X2VPD1Rziq8eW
         UHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706511352; x=1707116152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CB7zOSyDJi8QL3lL+QlifkQ9Gi03v7QrOXIIbYEVNR0=;
        b=luvqww8fdznSe8F9aQuuzocLpOC2acmi1Ai/L71h9jjY0G6wpRA5OkFt4ccbnRPH/J
         cXCsC/adAKbjEqD2W2DmOMGq0TkVsCgnIixDFe2UN7onOVYKsMr2ynYZrMCQv/Vbvoxc
         oHHXpW1uZbcGtJh9kNUj4gBh4lWRWFkOaWrmdON+KC/Z0MVwPvTPswCrJIQifuTB67rN
         +I5esMFoHZRakW8d637nH1ydFuY7IVT0qdy3AcEnyctwyvuHD8dWYTb6SJr1DsBZWkn7
         WHF/p0869QDrMKCV4qEhDmYRmm7NEIviM0N5qhbwe4gairqBmehs5kbQ6iOxW15Y9+8I
         pCxw==
X-Gm-Message-State: AOJu0Yz+X5u3dbaPStPT1D9LduiIl/pTIvqqN75du9Ife1Wej2MPoNRU
	CouvEL+3at4kjiymBiJ4QHPt7giORtBLinqVh6dD8qNKD5NyO4WXNGINqDpErTQ=
X-Google-Smtp-Source: AGHT+IGm4KUjxKGAorhJsNhWTuAvhIR3mxGYqBBFsMqq5QNVFvt7Y8p74/IqUspz9M2DeD7NTptOJw==
X-Received: by 2002:a17:906:144b:b0:a31:8ca6:dbb0 with SMTP id q11-20020a170906144b00b00a318ca6dbb0mr3605507ejc.16.1706511352171;
        Sun, 28 Jan 2024 22:55:52 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id wb14-20020a170907d50e00b00a35adbc019asm951275ejc.111.2024.01.28.22.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 22:55:51 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-aiohappyeyeballs: add recipe
Date: Mon, 29 Jan 2024 09:55:44 +0300
Message-Id: <20240129065544.38133-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jan 2024 06:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108481

This library exists to allow connecting with Happy Eyeballs when you already have a list of addrinfo and not a DNS name

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-aiohappyeyeballs_2.3.2.bb             | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb
new file mode 100644
index 000000000..58c1eb00e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Happy Eyeballs"
+DESCRIPTION = "This library exists to allow connecting with Happy Eyeballs when you already have a list of addrinfo and not a DNS name."
+HOMEPAGE = "https://github.com/aio-libs/aiohappyeyeballs"
+LICENSE = "PSF-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
+
+SRC_URI[sha256sum] = "77e15a733090547a1f5369a1287ddfc944bd30df0eb8993f585259c34b405f4e"
+
+inherit pypi python_poetry_core
-- 
2.25.1


