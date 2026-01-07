Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF85DCD5824
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:53:03 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2663.1767779579580664520
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GuuA7vbx;
 spf=pass (domain: konsulko.com, ip: 209.85.218.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b76b5afdf04so354904366b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 01:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767779577; x=1768384377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0L62KnnTKIAyd1que+dcZEX9Pu8LN8zTm7K1OVlGXo=;
        b=GuuA7vbxDH+EbsntpTjR8WbcURaZtKzW9pnpS1GOp3aHA1cVgbMQsblYxOVSmHKzbj
         TSDW2nZBbluP/VOfd6jDHwBGl89gH7NP02Um8BJizdNbCIitBIePApoGY3A7p/Rl4woc
         2sMjBpJ++8gfGjUSsO7QTEfjVvUtz0D/JDM0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779577; x=1768384377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N0L62KnnTKIAyd1que+dcZEX9Pu8LN8zTm7K1OVlGXo=;
        b=TybnnJW4mu1uPuhF9kIAqfq792ZIHzQKNbpsDa4CL1WK31fUDENKsq16QZh4ltawkp
         PRHd205mOYHKlFp/PVWHBs25+2N9aeNJUB0xf7qxgDO+ucf9OhrQjQRYao+kmf7iAsjj
         fe5YfkKjXPk396ilmoyQGL2YAFDi+ih7Yx4ySbL8Al+rQrUsQ6HpHReoy9Faw1uxZo5y
         ID2QMPGsSQplzjhvYjsZ/oGHDg+jga0WZGNqFSR165HJIcbizFI1qqe6IZqt8SWxBRTn
         1jGIkQwFvpABrFuTsP+eK13aOwRZfjwG46LQhc8AuEV6WCdG9kL2zxT21pgaWPwLCUeW
         TSMA==
X-Gm-Message-State: AOJu0Yx1m9SwdjNdi7nlUBNVREKmcJ2jW7hmSc/Xz2A4VH5Wx42so+g+
	N3SrpR7i+jjT0J/p96BIVHqt7ChTy6F4wPVV3IOVp9HR4kSmgB5wPwBmCSzKWJrF8OFtvcDzJLJ
	PT63w
X-Gm-Gg: AY/fxX7KFUkdJvi8ZrUWMVImnI4v4/sH4bQeLoT5KYwJzTW/uKQ60L1RwkyEhWbSZnS
	deWVRQuj72e3d7kKfXC9v/3M3yiSj3Za5h5oZI4ddvsiL6s/8QEpKsMy4cY8omsLMFcJXQIWWLe
	8FaXm8HQ4AKHkpJwN/W3/Q5uGDkHns5pVyTh7eBRIZ+1DIBVI2rWkRy6XOjcoKPOLu7TJ6KwT+G
	VGRvs7exFA2fvuDXP6t+nKK2cjVZUw9aUj4R7BwkusaR1LIlhgMREgNTEhiJF9s6jeOYjBOlKjH
	OIRwK0SZcnVx/I1oHOfb3d6gnAehtBZhKHza+dZ7YyFk1IwjLYZ8he+84W2elpAAto1uM2079gU
	aCLUU1W4Yb1ihxd/iS37l9S9ScWwbDmvW4ryy1stVOwj3KCcaQPlzrCl4Ny8IRli8VoG0fuPWIm
	9kjbzg8ErAA30UqEBYUEi1FVXb
X-Google-Smtp-Source: AGHT+IGfukCHtZHz/Z3bjijin2loWd8Dp4w7f3QUVlxSm5qxHgb+Mm79nc+YkQS3inH9BikiDShWJA==
X-Received: by 2002:a17:906:7955:b0:b6d:5bc3:e158 with SMTP id a640c23a62f3a-b84451ad77fmr199509266b.17.1767779577561;
        Wed, 07 Jan 2026 01:52:57 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b844e46ee63sm72327666b.15.2026.01.07.01.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:52:57 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-behave: Upgrade 1.3.2 -> 1.3.3
Date: Wed,  7 Jan 2026 11:52:50 +0200
Message-ID: <20260107095252.1351613-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107095252.1351613-1-leon.anavi@konsulko.com>
References: <20260107095252.1351613-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 09:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123193

Upgrade to release 1.3.3:

- FIXED: Broke Python 2.7 support

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-behave_1.3.2.bb => python3-behave_1.3.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-behave_1.3.2.bb => python3-behave_1.3.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-behave_1.3.2.bb b/meta-python/recipes-devtools/python/python3-behave_1.3.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-behave_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-behave_1.3.3.bb
index 02bd8ae925..77bbfde7b8 100644
--- a/meta-python/recipes-devtools/python/python3-behave_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-behave_1.3.3.bb
@@ -4,8 +4,8 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1fca0a9c7e4e4148d675b4dafd5c1e80"
 
 PV .= "+git${SRCREV}"
-SRCREV = "c7ddf9aedf4d525a87f0be57dd83f2a3f63dd497"
-SRC_URI += "git://github.com/behave/behave;branch=main;protocol=https"
+SRCREV = "7673da8324be5588642b23511ca4d7a134a0b0c1"
+SRC_URI += "git://github.com/behave/behave;branch=release/v1.3.x;protocol=https"
 
 
 inherit python_setuptools_build_meta
-- 
2.47.3


