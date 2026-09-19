Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C44C982EB
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 22:21:03 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20624.1789856453829685780
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Sep 2026 15:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RGLUhRqP;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: raj.khem@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so16707915ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 15:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856453; x=1790461253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uaHTFsXoK06SwTyMR+GTSDEihvnTmQNg9z3XDIT1Kk=;
        b=RGLUhRqP6SbkkVsCnAlj8EW8Bkfx+Anr/yzPDalHqze5YrJath/SeEFDq6ez/TcvWF
         zG3aXaC8GtAJM+wSWrGs2n2otkZn4+/ydnnKt1A67W2TOuAYewyzo/fSz1577kTalrT/
         JuiODyVNP21Qo/PUdp9gIebZZFE+2VfhP1BFUolPoRp8JKJs/rofOzTRGH89o1oqetCE
         TJREm0uCGrwWVN+zZUn7Ro5YX2x47uUZKF8+m+UEta6tjOB5A+okzjrKrbAtAvPV1b8F
         odw/xMT/d76A7bZMC9EZl9YziiDD2JnckMuquxvqY8GH8ylY58rfeVhSfyVzS3DXU5yj
         Y4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856453; x=1790461253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3uaHTFsXoK06SwTyMR+GTSDEihvnTmQNg9z3XDIT1Kk=;
        b=JdVuQtaJT59oQ8wee8j74Ehd97ThqYHex2URW/0F5j/SYYBgmEC7ljX/Wam3A75qCh
         kVMUdETv6An+xyOX0ZKaS4IYbnSUseoAmHwDmgoFWPZ0VEsifwKSeBboYep7PMLiRn1V
         ZNNIMgW+vp6xU6rW/ryzylgBldhAjF+r5T8KzUGXJTkQpuicUuH87VbIpJTnsK/PNqOY
         9TNW3teYCYx7zzoFXJ2XZJnH/mx/BB9vbnGqENzuyburXV0bBKGBufatVeONw8tV1zyc
         X7T4QssYCCdO7wsTw5dJsai157fKR4rfgWeq2+OAoxPpVUmxxYyaSlNUhhJl81GVRLVl
         BEHA==
X-Gm-Message-State: AFuF++mgZ3Q7zAqmtH+COtJ/lLxjGkp3G1FJUzdiUHYEnNCAs7krKZL8
	iMqc51ENySCSIvpZJKNEKUY06KA3jSgHRfWe5xu/MouCcpJZotKH/K5sCMEZtg==
X-Gm-Gg: AYBFou1JZNQyVXFK97nCrpE+D7PYtBu+Q37vLBtO66Dv8AKh179or8Sfi03QvLaSGAS
	MnVyh2IkjG++hYoEPoEU8H+2N4QQyEEDC1uEzXC5WJzRt9263k22N3OxFryA6psUNdox1HTVZEE
	D1b4W6CVcnv4AJGUxW8w8aNn5voEUkPlSwkXbgS2rYlOav27fbn95oWQE+msj32IedQuwxjpYZt
	ku6d0Twmz8CUZJHAlRuXnxBf1LyYTog9y7Eglbu5BnUAxRJwMH3L0jtynWTs8t/v8kgbwELrPgf
	vRDFhtvMBjzOt7KJhkqDuN2hocV7AlpQqAcYxMQEt5mw3HVry1y4A4f3pNaKAj1PBlkok4OPCyK
	jUymioUTRAOcR5R00onNEYDBROWmVNmJnrm7tXyl8+wRO6zZ/K/RIseXAzAqWvkYArjm/xHF9pj
	vGkxCbHHzf7k7c0n58nQBiTq+8FwrP5kZna51AlqthaIVM0319pCYEzMGB87P8mLl7GG37E6Alw
	2FlRDzi8PyzQ65kVrfWoXrVX7Qw1xACl2oelZSwofRZy3HB0otw4ldesRPeVaFPolSzvdZue35t
	6A3+QzfHpLcUFV3bcQnEKnd7T9Lbxl/oa5CJF4xyABNrl2WJJvJ8cBPEOyKIOvNG+cdVFxE2wwJ
	kyAZ7barlgb15ozHPrLKkMDRWd2LuLvNwerNONJf7hoY24ijOQiTQHaCCWA2/Tlb7avs=
X-Received: by 2002:a17:903:2349:b0:2dd:c100:a5de with SMTP id d9443c01a7336-2ddc100a706mr45119785ad.50.1789856453049;
        Sat, 19 Sep 2026 15:20:53 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm10494651eec.30.2026.09.19.15.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:20:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 3/7] libcrypt-openssl-rsa-perl: add missing runtime dependencies
Date: Sat, 19 Sep 2026 15:20:40 -0700
Message-ID: <20260919222044.2143524-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919222044.2143524-1-khem.raj@oss.qualcomm.com>
References: <20260919222044.2143524-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 22:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130120

Crypt::OpenSSL::RSA 0.41 does "use Crypt::OpenSSL::Bignum", which was
not installed, so the module failed to load and every ptest failed:

  Can't locate Crypt/OpenSSL/Bignum.pm in @INC
  BEGIN failed--compilation aborted at .../Crypt/OpenSSL/RSA.pm line 7.

Add libcrypt-openssl-bignum-perl to RDEPENDS, and perl-module-mime-base64
for t/der.t.

meta-perl-image-ptest-libcrypt-openssl-rsa-perl on qemux86-64 now passes
16 tests with none failing (7 skipped).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.41.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.41.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.41.bb
index ee0b88f4b9..0ec5ed4035 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.41.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.41.bb
@@ -12,6 +12,7 @@ SRC_URI[sha256sum] = "82fa839897b88e9c245b6265f3be26d3bc879cae4c7a8151fad4a307c3
 DEPENDS += "libcrypt-openssl-guess-perl-native openssl"
 
 RDEPENDS:${PN} = " \
+    libcrypt-openssl-bignum-perl \
     libcrypt-openssl-random-perl \
     perl-module-autoloader \
     perl-module-carp \
@@ -36,6 +37,7 @@ RDEPENDS:${PN}-ptest += " \
     perl-module-test \
     perl-module-test-more \
     perl-module-lib \
+    perl-module-mime-base64 \
     libcrypt-openssl-guess-perl \
     perl-module-english \
 "

