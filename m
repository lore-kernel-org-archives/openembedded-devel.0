Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E11E69163
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 19:41:54 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87249.1766432506880102508
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 11:41:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sq3XL1Jt;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so1937718f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 11:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766432505; x=1767037305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fj0mwpBTjLGWjO3nqY+pUfMxOKfUtKnCWBF8+btw9ws=;
        b=Sq3XL1JtILeg338ZqCCUxjc++RkiBxxHkjqs0vloAcG8GW1yK3FY68Lj6DPCobK2fd
         1NoTm0OwYqi19N/vUFVnXtWSMfav4QvpYoWEwieU5UtPGViPq4qD+oD4OGYSay6/4l99
         T43KPQM1mW8o39IPXCm/Oy6SZijH/9d/jE4V9vTu2YIWHj9L+Ir4lwCTwvozn4yX1rJu
         tqK2dHMAYnUQF3bUtJe0kBISsqrfbrY6a+/4C85UlNlCW45kyEZ1RxQn+NXUBEEgcdFV
         b3jm8d9cr4vYs2lXKoqFykUQ2ppdbuE8QNJ+OSjNzeE6YxVGBoh0cs0XWZ0o0u+q0iAc
         pn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766432505; x=1767037305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fj0mwpBTjLGWjO3nqY+pUfMxOKfUtKnCWBF8+btw9ws=;
        b=qW8Km7drtchTpKixBrSZssIGag013TPMhUnw7KR4Pru98vLAStkElrIqjF7vOrQBIY
         6isboRYHQYdvB767QFqk5Ep1HvTuGXOZvpEqinEmW1FsrHZQOSY9QhYNopEj/a4WTspf
         s8tZfK+xsSBcp7RGyPBvlLrfDq8jgmTrRuP/dPOjdK0n4eT1nAeJuTj+3CaKGzd3w71R
         wKjoFtEe4IyiTGrmDs6bmoNBVmkkVOzTP3TI5Zay5vUmk4gXYNs7V6QCauiCipYGYOJ4
         yNL18+pmevNQYAy6crd5YpAmEiCG/uGsl40gXbVZlY0pSFXsJk/bTxTnDjKblMqhwzy/
         JKjw==
X-Gm-Message-State: AOJu0YzwZ89a4fnjsszSBMX6ahOsnAcVbQI/mRHHAajICRZkIrGAWa9n
	cth/egQQUyLPgZc8IALmiq3RWPcxNiTT1o3Stuv4Q54jaVZUhcROICSmMZZ++Q==
X-Gm-Gg: AY/fxX5XsIXQFVRtMUHJtsqqa8Gjx9cPEgHlWm8GUbjw+yDAHlWvjk5Eamujhw6S65N
	jsQqgShsuXwRuDq+kWZqwjcCCowWTTKsc9/jP9vUPEGzPDbFyAJY3CVOChM3GTqUDAr8NMbuvC0
	IrCiSZrYIYH1A8Jw98jX1dWi9SIGYnD7rMgAJADWL6uVcxDGfnb2YZSw7YUMRVxBwLVkTIM2yub
	JbSMqlcY1B2zMi5NmhSYrfkL/kEYRShZjRpAFEkhm0vf/YO9YUnqmQr8lf9YDaKYAUZ24dDd3KR
	CR41cJFW0SAfDYRYbodoOsSgNpNoJiP0AFopyAOj8ftv51zxTR2QTLH3crsL7stLEPzQ5KRKkxO
	3uYuuidyDsfkG0f6TZK3RPan78lFNiqY2tAGW6Nc2lgpZKawPBRef/PIKt+es9DsTgMfdXqlkIl
	urTdryYPQJ
X-Google-Smtp-Source: AGHT+IFIEjG8+oWRCGEpUT5239EZub5BhDGkvjYlNRsyCvgwit+pYT50bisinCh8A50ITMQqTn0Nog==
X-Received: by 2002:a05:6000:2285:b0:430:fafd:f1d2 with SMTP id ffacd0b85a97d-4324e4c6848mr14361745f8f.11.1766432505134;
        Mon, 22 Dec 2025 11:41:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm24064349f8f.27.2025.12.22.11.41.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 11:41:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] uriparser: upgrade 0.9.8 -> 1.0.0
Date: Mon, 22 Dec 2025 20:41:41 +0100
Message-ID: <20251222194143.1725064-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222194143.1725064-1-skandigraun@gmail.com>
References: <20251222194143.1725064-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 19:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122801

Contains fix for CVE-2025-67899

License-Update: license was moved to subfolder. There is no hash change.

Changelog:
https://github.com/uriparser/uriparser/blob/uriparser-1.0.0/ChangeLog

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../uriparser/{uriparser_0.9.8.bb => uriparser_1.0.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_0.9.8.bb => uriparser_1.0.0.bb} (71%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.9.8.bb b/meta-oe/recipes-support/uriparser/uriparser_1.0.0.bb
similarity index 71%
rename from meta-oe/recipes-support/uriparser/uriparser_0.9.8.bb
rename to meta-oe/recipes-support/uriparser/uriparser_1.0.0.bb
index 3d76190d39..b5a0a9f42d 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_0.9.8.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_1.0.0.bb
@@ -2,10 +2,10 @@ SUMMARY = "RFC 3986 compliant URI parsing library"
 HOMEPAGE = "https://uriparser.github.io"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168"
+LIC_FILES_CHKSUM = "file://src/COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "4cd0e4f93b477272fabceeb0202f269169fe6ec3044e10fac6acbcdf354bb080"
+SRC_URI[sha256sum] = "291f25264a5c025005b1bc39de3c029e6a6ca0a8d6cfa5e61cb5b03702c0884d"
 
 inherit cmake github-releases
 

