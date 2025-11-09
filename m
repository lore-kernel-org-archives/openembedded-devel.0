Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F503CD13DA
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:57 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27305.1762704049617091961
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DDs08gcF;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47778b23f64so2688745e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704048; x=1763308848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IsZzjpp+v5Je1sTXzuT3gP1EG9UF+/MtYZ1UfEFnJE=;
        b=DDs08gcF2qp5BrLRtZcXWb/zmhk620hzrbwBBZNtjqGcG7PloOaxU2pc9oioG2mMs5
         r1Z4vadi2mks+sMQ7wHN/84elF1hj96lcNBfvXUfwu/ffnXxNJiQPEaGTD8PQTTjmufh
         BuQnNR/UgDhQ1xbWd85VgrlRfM5mvdBE3UUzglv9NSCxql5VhfCnvsHx2L3uoX+e6Dxy
         u1eX6LvopWVS+EAqKvbw5Upf/t4rX/yhLEtY8MaGFKAq8+xSeQi9kqw9OPXPpg2zGidA
         9Jz4phve1w7plVLHu0na7pqILVWKUopdJ8oiNGFQRO/yr8OZicMb8Ofi7CWErxeJFk8K
         9b6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704048; x=1763308848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/IsZzjpp+v5Je1sTXzuT3gP1EG9UF+/MtYZ1UfEFnJE=;
        b=wYutytLUROyyUpM6Vsjs8sgr4VFurlqg1aTtOcvuWCNCu58h2/LTMXa2QQW9c1M1rY
         uIESdgOdGE/Svv00QJHJ0Lk1r7qFQ0iGlQgMqmLxjZ0PEulZZvSHiziJOUCTnv5JYM8O
         oJ2D07L72IlQdUvnuI6dkO94q+quN8jyJcQSKMHsz78O/CropVz69eWyEdFLudj3YFIb
         gnCCbU7KaPWKNl8JagrCl0Y4EEk4pf9NcBG8D0e6PTrPOKTR0qR65/GCWDHj5XKnb1QD
         p8vBAtXV8cEFpP0Vtga5C4bJu4ElisRTH46oUoUGtn4FDW/JQNPLMa2tCb2OwS9n0jOs
         Z09Q==
X-Gm-Message-State: AOJu0YzYStf1Q+fjwMDPEHDcaZM6WMXukXckk/uZEsz3uVrT2WVTmV1D
	lVUs5wj5TMbM29N4USFahNdcA4q6rSsiTsuiRDt6E6ez0SHGJuLpTkjaFnEz8aah
X-Gm-Gg: ASbGnct4UmfVZcmn1gLiE7evkG1xVTfg+JKGN/y1BzwrfTKlJiuoNNP7G0fE4QVnec5
	HJKm0qlEg6Zfz3S/vzdqeafqeua1yS2WQldSBQMaVqJYHCQ3k0fYbpsNmgcl7Pk9OxMp6+att86
	pHBnViZ3sejQWEQsBxRHGpvCXNFnG2F2/tOglCVz6TcfL0+oXZy4PZC694Iecy0k1aYuYN8/yqX
	65idS77TLn8iUrAKNh1uzN6zoVJZMQ/RT1g/gCLaMl6mGbkhJXofvuZs4zijBFUNzdp7WO9F08f
	9tmZL5dEXIOgti2wZZxPdTSk8g8oqHOd2dDYrwMNgiCEuBZdG3lERYy5UWWIMPZSYIm52JKoeNn
	5cajVL9F7KghL4R0MlAVPR1qmtyawoRnbj6csj4LfZZv9+XtZeYvJFrP4b+MRzBaPP0nFMIqCB2
	AlMlbRjxut
X-Google-Smtp-Source: AGHT+IECy3l/DYznCznhBAnvE723rc0TQiJnDKD/STj6TKXcjiAlzia/X8MA6LiiL9GCNEBww4ZLIw==
X-Received: by 2002:a05:600c:45cd:b0:477:1ae1:fa5d with SMTP id 5b1f17b1804b1-47773286285mr38175685e9.20.1762704047912;
        Sun, 09 Nov 2025 08:00:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 23/27] consolation: fix SRC_URI protocol
Date: Sun,  9 Nov 2025 17:00:15 +0100
Message-ID: <20251109160020.2522353-23-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121439

Switch to https protocol to avoid fetching failures (anonymous fetching
with git protocol is not available anymore on this server).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/consolation/consolation_0.0.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/consolation/consolation_0.0.9.bb b/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
index 17981b6e9b..b7a27f3255 100644
--- a/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
+++ b/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
@@ -14,7 +14,7 @@ DEPENDS = " \
     udev \
 "
 
-SRC_URI = "git://salsa.debian.org/consolation-team/consolation.git;branch=master"
+SRC_URI = "git://salsa.debian.org/consolation-team/consolation.git;branch=master;protocol=https"
 SRCREV = "5ef08f0cd6ede62de14de477b74fc3611108c676"
 
 S = "${WORKDIR}/git"

