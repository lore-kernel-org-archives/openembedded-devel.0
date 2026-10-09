Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7386CA601C
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 10:05:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4451.1791540312401600626
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 03:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aiIJX1/t;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: scott.murray@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso24875855e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 03:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791540311; x=1792145111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z83ojbC5uJbUYlSTPK7Y83H7EslzC4p+FY5erDxz2es=;
        b=aiIJX1/t63pVJa+r6t+o0JGVZfcHNl1jmlDfxp7kT563W5dHUoZcFEukTn6wekQ5/W
         64Kq209+mJfZ0/niZU4bCMSHxtjlkcT7rldn3YtbMAIKJTVZdRyWWnZIA6UK/oC0aURx
         gvUKxJITU3plVnHSA01IslRkii+CswesfBHMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540311; x=1792145111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z83ojbC5uJbUYlSTPK7Y83H7EslzC4p+FY5erDxz2es=;
        b=koSuteKeL9nIeZnhbX8iuGrs6vzAxsyh1rYqtFBDZng2l8QC7Fs7MX3YjYxqKKrtKt
         fGwT7ZzrRJH5WSJAMQtEK17NIpPhj9Vn4GCdKvnQF8GK4VddQr540VAQLsdy/HbTkTts
         tChpnSy4j/wy+aoOKjBrBFuzLkud/PIAP9fx3psDmTbO0Oor2ukHNvgtlZ85psV/uAca
         thby/rz8vMi2YmW3Yo8SCdw6h2bSaY/cCo7b/ErnZDs9Qze/4lRMloT3m31tlgJ1V3VS
         XMH62QoCMX/mOErvPs6/rj6d4T1BQ8vwjqWM5E0kbq5iP1VD0+w85Pz/TWtAUQrPZazv
         YWCw==
X-Gm-Message-State: AFuF++lJgQx2NKuh3clCLLOCGvWyEoXWsBFrNId7Vytxr3GxyIdkPNtb
	a+eBLnEFZ/l2+ifMXvEWbQnF8kuu/ClAPmtfHgojBXxu4xHhzNzmKRsKe1urHSh73xv4ozAqVMl
	nf7v0yXgK1w==
X-Gm-Gg: AYBFou3LOfPM8Kzi8CGeiQ87zVVbTsRJKhp39jnqdONjCfew1nbQJ3rQna3H6XdFP75
	vYoGD2FT2LfGDMm7fnDfo+gf88Tk22Ismt+5PHpFkgMEHnhDfKuPzoEdV2Cr7lP1WX87h/hIis6
	8fWK1AuXBTup4FNQ6D+jdUo+XsLQ05qOlXixqYCMo2t+xX7/wuZKkUW8yzHY1lwZ6WPwGvNyaQj
	kdoTji9HzUy9gLsX4HVygOYfiR/VavPQzOGsIBaaj1/0XenqcHoiLIVJRt1l01jRj+35A4sU84Q
	gjmT/fSnvtwRSB5Mv8z1G9K5fFc3Jwsn2UZeeZpwlEbVp9fOtTtYhPHeMVzV5QGLVt7Q9NE/BPS
	RtIwMpybWI1LGPjtFd+arYMCBz12GqOintot8RGmp6WMNDByk/iQbGZA0uGa0AU7Tlm5Acm5dvz
	M2rF6nuvrtnDxsPN0Nh/PL1a4Z0PstCdCeN0bm8So3YgbArTDOOm81TxW/PlF2pQqPpO+W9bnkX
	fu1g59WwzjHUu2pTzOW8clNHwCA/S1ll5yfmntPaTB8P043m26XhVTnRrpxLXm9HKpM00PNu9w=
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr27563575e9.20.1791540310379;
        Fri, 09 Oct 2026 03:05:10 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acf232sm3079996f8f.47.2026.10.09.03.05.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:05:09 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-systemd: Add PYPI_PACKAGE_SDIST
Date: Fri,  9 Oct 2026 13:04:55 +0300
Message-ID: <9640637e1da5b037c049fd3d0ea2b38d5a5cfa32.1791537542.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791537542.git.scott.murray@konsulko.com>
References: <cover.1791537542.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130683

Add PYPI_PACKAGE_SDIST definition to work with pypi.bbclass update.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-systemd_235.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-systemd_235.bb b/meta-python/recipes-devtools/python/python3-systemd_235.bb
index 269e175cc5..08d538cbb9 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_235.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_235.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
 
 
 PYPI_PACKAGE = "systemd-python"
+PYPI_PACKAGE_SDIST = "systemd-python"
 SRC_URI:append:libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
 SRC_URI[sha256sum] = "4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71c8c6b8008e695c0a"
 
-- 
2.47.3


