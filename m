Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9D5CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 19:55:13 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.1647.1760990105166920235
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 12:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XbyUVccp;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4710022571cso40493185e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 12:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760990103; x=1761594903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FhPy/Fo4hQl/Uw+Cw5qRDHbH597oSqFHc/SlNu9xpDE=;
        b=XbyUVccp9yFJAVPwgQt8wqnC2T60agss7NHwZU9PCBiqbhdTD+jgtz4OFu6u81vSZZ
         pGNF3oGpUb4zd8OE9OALrVzptP5BoIxJ7/dbTGXXpsE3vSskP25Zq0RryMslr8yUceXo
         AswjsSpRFWkJnfojTg8WOB7Y339fKSVQHNPSn1inrxVAokM+JmME7drtEm25W+1np/SF
         QwQ6PYCLUPLJgBdtEwg5/lOyoDMcHI3T3ST5ptoACaaW0BMtL3lBgXuOkXJEr16S2Shq
         6J5I4CJtkaJEpDetqgrzfV6QNXQDVu4rplBabltMkLj7G21L21rGREPa0LnuFHmqgP0g
         EOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760990103; x=1761594903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhPy/Fo4hQl/Uw+Cw5qRDHbH597oSqFHc/SlNu9xpDE=;
        b=R0wWq3ggve2TsWvL1SgWJedTy2TZvSeR2HUhm5i9PBNzbMSA95psY6O2Zoa78WgUZa
         5u3Wa3PR5fhQZeVZYoJw21SUQgI8T0yVmCAP3oQUQx3ErsLE2Ceu0P0KWgdUZ2/Bgf4c
         wGrh0/jN+Eh+KyiablP2Dkg6ZPtWLxJ6LH0MoaDasUY2eevNvvoMulPao/pAQEmetn56
         hdheOKGU4Okq3YwC92S6nuqXg5JgxQb8dwrdCV11k6o7qkL240W0aNur6lw+tDKMvqOt
         6NsRxPjfhC7fdyB/lb8dgnn/FIO2sV8gMId0spKH9rUdS73pP0qPNk7jqdWUzJEhS+YM
         BqeA==
X-Gm-Message-State: AOJu0YyMlqjPEZNvR+SSEQFeVZOKwAk9+jeNtvnO2KzoM9jF5Zf6q507
	gPUabYTWeKO7qyDuP3pFdo9BgKEOgMpyL0JlBHzVRgzzntLAQ2np4xeeMaolXQ==
X-Gm-Gg: ASbGnctXxNfPoyTu6LBN6dM1kuloI31x34GZIVb5K+rbwDOOJC42EJu6ZN+hpKkmnR8
	G3N+9e+pkpqlqy9m3TDyaPmM5DCO5zBVaBZlFZV1sLLDPlVbws1Hn7MdPqkp8HmGw+40JUDJDkP
	IrP88IW8IAzLgodygoxyd1a76staWgkV7N9Yfs0lZOKZ6q4/q+hdGPXXZi4hlVdKxVOr/MoUQ9U
	mJhq7f65Z79jiTxTh3JmBOIUFipH/eUcOUlIzApAbKuvus4lILhU2C0qgEcvZl+WhgESDYlnVq7
	3biKqbfgoNSaOS1vxIeCla+SX1A0/jHGRltTz2aMxW0+TeqCF/Xfiq/rN+YTea7kJUx1ZuvONDw
	dg8bL6asduxbMqXRfO1jOnrtuBlBbRYLaW/piBNw+kh15Ygaz3AsZy+jd1d9PZLPOwdUaCmVR0f
	WebvAK3/oP
X-Google-Smtp-Source: AGHT+IGLxUC/lOLEhlJQfGsUfQHCVaYyaP7/GccPye7DOt5p6aDt1YYVdqbn3XXdruxJk9AUSZ9guA==
X-Received: by 2002:a05:6000:288a:b0:428:476e:e0ab with SMTP id ffacd0b85a97d-428476ee150mr3627307f8f.60.1760990103378;
        Mon, 20 Oct 2025 12:55:03 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a993sm16767915f8f.24.2025.10.20.12.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 12:55:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sana Kazi <Sana.Kazi@bmwtechworks.in>
Subject: [meta-oe][PATCH v2 1/2] cryptsetup: Update the license field
Date: Mon, 20 Oct 2025 21:55:01 +0200
Message-ID: <20251020195502.3538265-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 19:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120823

From: Sana Kazi <Sana.Kazi@bmwtechworks.in>

The below reference clearly states that GPL-2.0-with-OpenSSL-exception
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
Therefore, update the correct license.

Reference:
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
---
v2: no change

 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
index b5be30cbb2..c297de053d 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
@@ -6,7 +6,7 @@ and can hence offer more features than plain dm-crypt. On the other \
 hand, the header is visible and vulnerable to damage."
 HOMEPAGE = "https://gitlab.com/cryptsetup/cryptsetup"
 SECTION = "console"
-LICENSE = "GPL-2.0-with-OpenSSL-exception"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 
 DEPENDS = " \

