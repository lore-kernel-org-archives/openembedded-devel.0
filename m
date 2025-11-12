Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99252CD4847
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:36:02 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6301.1762976155170159260
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eKBA/Wyr;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3c965df5so26565f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976153; x=1763580953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDJzk8IXeNuz1MmDvsp6oTApVti51/dR9ZH8ryrz2AE=;
        b=eKBA/WyrUEsM8g5huBMp1PwgL+xEvtPHcQwQchDm7Z+FxNr0Wvni7mhufFOTuWTqTo
         3EVl+FO6SoD3LWlSFb+d94Q4897K8Y4lw3ZyPy3Sv/IZHLz9gkiRyvM7Tp/X7gNCfcvZ
         IPLdhPPWIpAvt4lziRcbsyv2gSfX7JHhJ5h4kaenpnkFcCY1hROUMffmGiN6tEciRybN
         AMWOXzby6Pp9LanuN4htAAEDAAaM0Xgx5Co/5jlT+QJlOP0bdj96t2DhzT4B5juXuOB/
         ZKl70aHmEz2l8Tgpf4sEqISEsF2bdNAt4BDOgEaBm/suqEDm665+8iGmQwqS7gAqf2bf
         JBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976153; x=1763580953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zDJzk8IXeNuz1MmDvsp6oTApVti51/dR9ZH8ryrz2AE=;
        b=Ch11h6Wu4zsnSTyLnmwYa+56UftNaMI8ffPRXTR0Gv8P1THPtWuBnPTAwBckZe3Pu2
         9BnxuiYgJeIQm6AF7HPNPeFraIv9H9SdAA+EjdpwLkypXWoyLSfKQkPJpIojl/9c7iaQ
         4IOuvRhM4ophq0+o54Wa6jo/oiZ844bcE4gDxseukS9Z611fRwiUiOilrWgvT2MH98MY
         5BYWqV20RqUY2d/EEiy1o9MAm238xA5Iapcg8biCgfzBxPjjVElUpkS0N5sP3ZsgeYeI
         s3hYnkGKxpzXpFgIn1CvT2+hVqg2EkpSWD7SBMkCC9eicHQQO1JigPVdFW8YzmGj3FSt
         CJkw==
X-Gm-Message-State: AOJu0YzENr8tr+MtwToTRhnNFlmRhNLrA9+iHPnpKw1uMPbRcD2nQlg3
	sRF6hp6384gjzatICBpJTXaBQ6g4b0CVbg6t8JAXLxL6G1cuUx8UERIyuIzWrSia
X-Gm-Gg: ASbGncujlgBnhMTdb0k87QEq2XB76sV5BY2JdOvNRGMZhK18GSBEm1r59+KtESxQgsf
	iZ8yYHlCIUUwYZfl0w+PLXMRMpCxagclUMyRY8XinKtOp+6fQwj/PlNIZnLn5H8NVLnBV98gxJQ
	JZ3bKTDlx9+qVyAHdlJyeJ9qOe0TcOuAohCspuy8fpeHnMf7JTlggFo7GrPiDES4EGLqmUXq3rF
	e3yRtVDkURbO3YFkchM+LDKQ5yanRPUdkpWIy9uKRVblixiHMrfeHTCganz6H5ioMvkUtzH1vr5
	YhDCp70QKw7ffFa7E21/ABJjRRLT/NqFjRm57Pf4uOYYAFZYAcY6UyKsMMEU29HcJ38uUVrmGZ3
	oZ9MZqNLSM4LMRa9UqMBoin203bNF0tmTbDFLdME4yUPLZWn/+zEwmFYg2aZ5UeLrYuQ5ZbXBa5
	rLQNDKP2dF
X-Google-Smtp-Source: AGHT+IFghQ9pJU03qCU3jTOaTyJBDaQMARJlocGt5ykgmXHEPKYhzA5ov4zNMnvndPLfkV9M7Cke+g==
X-Received: by 2002:a05:6000:649:b0:425:75c6:7125 with SMTP id ffacd0b85a97d-42b4bb99e63mr3326808f8f.16.1762976153454;
        Wed, 12 Nov 2025 11:35:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 14/21] iksemel: fix SRC_URI branch
Date: Wed, 12 Nov 2025 20:35:34 +0100
Message-ID: <20251112193542.1589821-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121575

Master branch was renamed to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/iksemel/iksemel_1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.5.bb b/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
index e01c0897bb..1b27ab15f0 100644
--- a/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
+++ b/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 SRCREV = "978b733462e41efd5db72bc9974cb3b0d1d5f6fa"
 PV = "1.5+git${SRCPV}"
 
-SRC_URI = "git://github.com/meduketto/iksemel.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/meduketto/iksemel.git;protocol=https;branch=main \
            file://fix-configure-option-parsing.patch \
            file://avoid-obsolete-gnutls-apis.patch"
 

