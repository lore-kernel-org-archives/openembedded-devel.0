Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36195.1793161470871638153
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Be+NeVsj;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so340845a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161470; x=1793766270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrJMNcGZHCA2dnWbt7JzXk2YA1A3mKdG0q5nJaYh+ds=;
        b=Be+NeVsjI1I/pZTo8vHDFuN1aQQxjCR/CaxLQkU6LUbv9iAMfh69elecfKN3/bTzRL
         W/ZSBA/zPDqAjXW79F4PrmbU0dTYDDzrgEMdHa0/vXn8uAXEPOV+Hv02HyoLHcIBPvJO
         FrF+3hhBuuYgYvE44ROts1p+tNDQqcxtil7uJvI1Csra9vujv0vGfKWoMO3gEbLEWSy+
         Z2axqo6EbuWNSVsiQR5DhZAnO0Bzezr+BE4HVqkW8S/6Jw62AjvkbNhvGNm07ZsjRNaM
         YZpVDs0QmEv3zJMnwT+WI8djl7p/JUmz6CQdm4BHPXvCjyHME4LGrkQedfwggKaYWP/S
         QpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161470; x=1793766270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrJMNcGZHCA2dnWbt7JzXk2YA1A3mKdG0q5nJaYh+ds=;
        b=VggZ+8Qucxw+DXh1w/HW6K0vfzx5K/Rsb+eDZF38Myc0fWlUK30Nqkg+CnV+3PkbNk
         wOBYwJV6Fc06ejbky/GHtTUstx57lVf0Uy8koAvJ8FEia+6JsVHSjdhygj0/2VgfP16x
         uqPVaCmL5djtKitEfU/qbDxm/5fBhjuCv8ydJS03KZedcwzzArskWbz5GZ9a0UC4keEh
         FousJb8U1KeN5ejlT0VIQ1YCvF4fBxbJ32cIL4L+i1vsbiat8HIsg5j3jVPJsb/bau7x
         fHh4FUxEzeGfPNFJdfjcnBkDJOpE0kp11L2xFrNihIkcy1lDHNcEcrYe270Y68EWlrNt
         TR9g==
X-Gm-Message-State: AFq9FYL8SChHAaZCt6B11phTuAJPXCwlYBagya6zjDTKnX0gn+h3qXD3
	LjScoY6fuZ0wPMlVDWAMJ09HCtiRtpaPqT3xGe9wkKn7Awp4D+ON4ilz2KHe9A==
X-Gm-Gg: AYBFou0vd5w07hBjGG3PKhP+akazLUrDShgUF4RIhp1yYE4bcDh9DFPfz06B/kPjflc
	Vjm/iMUZjX1iXQVR/UocVfGPJQFJslmOgcrUXCd7HwwmJZohNs3U0L+v3F5q9wJmrhVEgPYzqOA
	uvsXbXpU3DeJYTThb8cs3QtC1F4u8q812pVWmgw7ayYvL5SBk6mq8oWnXTPL6DYDc9fKItrBOBC
	CDNYVN8s559Aheh0uNXp+63RzQfn6hrtl/VkW/w9yKjUfwsd+FsWWrpGD0q9WNZz7VRssk1PsLF
	3JOHE8eRNuUxKQmEILZhbhUxJApz4VVX4/scgW4ZLwBWfr7sEql4Yu9BJZ0hs/vA0ulN5Qs+FXb
	h3Gf9UJhRNawoYAiLor1L933/iiVVri61tIcUEPERq3HNAzp6oGrPoSUgd0A0VFjTrFA4hoGBF7
	I9RnOYfVBoKdmQMubwGa3zBKs+x4ouTjEyFCZnVltZcIXNSQ5G97bnkoPRIJGcNv6MM2PovWsxa
	clcGUGkxVXD24JxjPXECafT7iSrT0njpFg5OIE/q4jSUcgslNtExLV7M/mB0pQY+cUThqULrcqF
	vb5a3upsKteiPZHlyoLcukcVgMtqr9V2WswnJCpCQX/OJjk1aQRlOG67A4j0ag==
X-Received: by 2002:a17:90b:4f84:b0:3ae:2961:14d5 with SMTP id 98e67ed59e1d1-3ae5824a0d5mr916122a91.42.1793161470238;
        Tue, 27 Oct 2026 21:24:30 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 10/60] libspdm: upgrade 3.8.2 -> 3.8.3
Date: Wed, 28 Oct 2026 17:23:08 +1300
Message-ID: <6cb8fca0bc2898cc5478acd9e4d0c24c2963d329.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131562
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/DMTF/libspdm/releases/tag/3.8.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libspdm/{libspdm_3.8.2.bb => libspdm_3.8.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libspdm/{libspdm_3.8.2.bb => libspdm_3.8.3.bb} (98%)

diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb b/meta-oe/recipes-support/libspdm/libspdm_3.8.3.bb
similarity index 98%
rename from meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
rename to meta-oe/recipes-support/libspdm/libspdm_3.8.3.bb
index f77057d9fd..3ab77a5cfe 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.8.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=8f9b59a81a88da8e812af43728b72dd7"
 DEPENDS = "openssl"
 
 SRC_URI = "git://github.com/DMTF/libspdm.git;branch=release-3.8;protocol=https;tag=${PV}"
-SRCREV = "f55cf6d48ec69b4ac60a63903e9c6a2cb0fd155d"
+SRCREV = "98253fee253c9e0b4313e64b373af3c7614c90e5"
 
 inherit cmake
 
