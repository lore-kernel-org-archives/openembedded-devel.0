Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50CACCD1A7
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 19:55:13 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.1679.1760990105970121984
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 12:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kZ9ua1/e;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42701b29a7eso2163847f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 12:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760990104; x=1761594904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBwH8aN6ibIA5VrZCQLdGW8LsB62V19MU4Qk2BI/fQs=;
        b=kZ9ua1/eA3E1sl6y/kizmQXiQyHIaO3psxsESmnKAxHO8KkgQXXRGIT+q6aTr/5z93
         GxLLDiOxxbigD73+ywgejDad3j8YNxp3emIGJ/XCUnV01e7KJJXIin2jgoUWJbwuMXyS
         8SXcLbkCv3nbIKTdxu8w65GRG7Z/vW2ISO+8xVmgbH66ikRryxFp73UgsaIDEvuJDzP8
         7QmEuHpZBGMo6dDTj9M4bCkEronmByTCe0OQdSrJH8Oau2cinYHJydys8M3I1PKPVN6n
         gxSWljsZH+qV03coHL/6KbiQ0t6wRa64OaA1Jz0GSxjmUdRSM0Wj16ef0jISV9520DV0
         +YKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760990104; x=1761594904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBwH8aN6ibIA5VrZCQLdGW8LsB62V19MU4Qk2BI/fQs=;
        b=LQHykls13HPLH0aD7jsF3NnFDXcW7a7QIDzJ/kHq08yLvWM4wY2X/EOU7pILK0scP5
         4Iv4jBMdxUEzKupDheDNbHE0ywAlfXIuiM6tSMmeJVJ7fALWlD/gUIAsCu4PnFOAMcA7
         G2qlNCccizyQy2i9BKxeXQZecCn9BJCSQV07No7iylYsolaO6KdqLFHUVTeVaitm9U+A
         A6S/igvs1REJ9Bx45rw7r/0E7W/Biw0DjIyXT0iHp7WQYMwP8WAIekaB8ujCatRdUHDr
         FbA50ZftLJr/ZUPE9/vtE0zGLCIly/NWxVUiDSRC+APztYk/Z3GDLAMazZFTpK1FKtMP
         YdgQ==
X-Gm-Message-State: AOJu0YxZjzzZJz82ROxQxkeGCSAo8Fh3y79n3gAGl4J8KZ0OI8J3kW5O
	3c0zbSA8MFNoZFAVYqaKl5j2Blm+oP9aCUc7O6+VuhMRVcaLbfnhEUsPN2dI0A==
X-Gm-Gg: ASbGnctkzDQkFQj5D2AtNPNEpzYofs5tz5VuvAGQ7aU0VbU3Jq7jvhs5jIOlmdU38um
	fTSqm9ddffjPh57MTuxAqaFb03SJfaDsY/GXoJKnbNJWAhRu8lQBR4lCF92cuvM1KYEIrsdGerG
	y2CzmoaWOttsAtziC6yqUs+Kl4TFPEzabuca+oFbJSocBRrqeRrAohrITm82zpVmod83MMQSfP9
	bcTS5o9z0Xz7gvSRtZwELxDz702Na4oh8iA2Tq07IcpTG1HRkTVag7WmabJWhtLVJYUvs46mpM6
	gH0hqNWZ08tY5GP6wD2aMg09YZf3Q5WBex+h4eiD2x8gN/qFHXbdSsaJBVmbMf75gfLTYIXnvk9
	841XkqUdAYY+jeikT/IAz0iMxVtVbxOnHpwqmicUSk56AVcJbycj4DGBcFrz9EC0TwHnSSAkVGs
	wmdBVKntKj
X-Google-Smtp-Source: AGHT+IF25LBTUDFsIpqqbVJIAf9E/D4nWEh9t4fcwVLWNPyPMUXtl1hH55v/LDZQntqN/MYd0U4Kcw==
X-Received: by 2002:a05:6000:240d:b0:427:7cd:bde7 with SMTP id ffacd0b85a97d-42707cdc0c2mr8798085f8f.5.1760990104247;
        Mon, 20 Oct 2025 12:55:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a993sm16767915f8f.24.2025.10.20.12.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 12:55:03 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [meta-oe][PATCH v2 2/2] cryptsetup: extend licenses with Apache-2.0
Date: Mon, 20 Oct 2025 21:55:02 +0200
Message-ID: <20251020195502.3538265-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020195502.3538265-1-skandigraun@gmail.com>
References: <20251020195502.3538265-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 19:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120824

The project's readme indicates that some parts of the code is covered
by Apache license - add it to the RECIPE accordingly.

Reported-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: remove CC license, as it only covers non-code FAQ

 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
index c297de053d..a77d488f44 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
@@ -6,8 +6,12 @@ and can hence offer more features than plain dm-crypt. On the other \
 hand, the header is visible and vulnerable to damage."
 HOMEPAGE = "https://gitlab.com/cryptsetup/cryptsetup"
 SECTION = "console"
-LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-exception"
-LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-exception & Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326 \
+                    file://docs/licenses/COPYING.Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+                    file://docs/licenses/COPYING.GPL-2.0-or-later-WITH-cryptsetup-OpenSSL-exception;md5=32107dd283b1dfeb66c9b3e6be312326 \
+                    file://docs/licenses/COPYING.LGPL-2.1-or-later-WITH-cryptsetup-OpenSSL-exception;md5=1960515788100ce5f9c98ea78a65dc52 \
+                    file://README.licensing;md5=45c1ba157f18d08991819f41f56d72e9"
 
 DEPENDS = " \
     json-c \

