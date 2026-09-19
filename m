Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E420C982D7
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 22:21:02 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20623.1789856452640140588
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Sep 2026 15:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ayf9RfEG;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: raj.khem@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so1528620a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 15:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856452; x=1790461252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abfImL4MU2OwUHbxywc3tYPH/Aly68ji9F2s80D6a+Q=;
        b=Ayf9RfEGLFB6C2kpHV1s2u9AEo7RaJfoNq0NCyFCVq8MXnHlotdtpWGV/Y/3NxbIRS
         zQWjdZB1hm6NDsIA7cNnM0JGeG5tN9+poNK4WIqbHMyeCGcsEBepaqrgwgkXQzjB6FfQ
         mtr2L5OxIW2D49Hw0Pw8V9BlNImT7yLEN00y3e/jSlbEgI8mTx19JN78RENY+76gQjXx
         nqkCimYvSrvduHYugomDbOss7vlMEn6q+de6cB203zgRhZ9Z0evp9U4yzly+2mdFznr/
         1gugcKSxvV4HOLDpf1R9lYuENlibZHV44GEFvN+RhJJVgYgij3bLqv3X1gWjHxZyNMLa
         RApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856452; x=1790461252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=abfImL4MU2OwUHbxywc3tYPH/Aly68ji9F2s80D6a+Q=;
        b=onIW17ecEfuDUtc6FA8toa2n88++Uu09UwQUSfMj5zTcNZJa71t2E6dkEkjoyr9d/k
         T/Y4Gg/7ssD27pcLJovxz2fdPpJ57Q1A3Y1W8CuB/XJXNjXWFuAN3LCn3/uVe8MIuuti
         2v/k6dkWx9PU69kHhMO0fAKOJvJbhI07gBVHnOUvHl0brzRxdhQ3+NCqqIySJZ7hALB8
         ARlXJO9ZUBzydCWVKnG/yKu2aqkOkcLoiomuQc3k7sf+sHjN94UgiINqu/LgKupCrKKI
         72zRi2o/eR+jYxTbluzvDdy5CMkzSAuWdYPIAYjE6e0znKuAdkg4LQVGV9P+h85VV8H0
         B/6w==
X-Gm-Message-State: AFuF++l3bfc9hzuKk5LLIT+YeR7Xv46CrpjjJb6UGdQz4ilBisnXMNqQ
	zdgZigzOq7weDR1u+xsTGHX8I0nL37Zd6j3u9UH0xTc+HzdyIFsHOGgnMw3UHA==
X-Gm-Gg: AYBFou3DyEAx5yDg/aMvgb5pimUJJAlHIvWjr5pylz04AUtS8o2LLicqQY7crBQ2iNr
	aIdReeuF1SAzB7CfZ4ewKbxAs85qMj3/3nd9VnUbFu4JnYIzjPG9PPwcD81Al4UNFNSeTCCKPR+
	RsCHeZgM3B/DnYkYSkxdn89z2qaC/qySPKXka1OhBs/rthKju6fX3jtEtaVi+tXKG7JjBRgbq4O
	zZEEbjmgKVg854KSYlhG1i7umBb39mP5qOnydlFv1BYkP9Cp9Ri6491VsiiPzmPSlRQOxm/bXxX
	yG0gd9hL0sRCty8tIDbyTOsmCAqb4gafUoIWli8cmrx7NeZLUhIW+zsJTxaHpsBw7ze6TcYpcY/
	0LTYIgVEhrHcly7w8Oy8r1VDIw5LqmNmMqX1sYiBMTxB3gPoIo21HGfhCylPOkw08nKGGIJPp9T
	ZvjbmW+0kkxBSd2qHrCKF7ty3LjaKeHo7FSZgZVuHIx7ZmC81PDLWAfoZQSFEGg1jZB3xqeXRJG
	XWW9Mze8b+mgfC9vXhjjBeiLjglh2ejVPYBUfSnOrhYUD3xmkBcuhOMYxHBREWKHnWhmLqILaPU
	W1GcA3Yv8SvbdQfYlWcwz/UMWAA9GPDBjFTVGQv2g1Gr4Ks0hx1GqxK+iR6IRkr7RWc05cjrXgv
	lO7vqaGxJU6OVryXChZ4Nc0EGfUPi596wT1PwIEFAaLKKoUezoJ8NKo4A
X-Received: by 2002:a17:90b:3fcc:b0:39e:6c69:34d8 with SMTP id 98e67ed59e1d1-39e6c6936a4mr4912327a91.60.1789856451759;
        Sat, 19 Sep 2026 15:20:51 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm10494651eec.30.2026.09.19.15.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:20:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 2/7] libcrypt-urandom-perl: add recipe
Date: Sat, 19 Sep 2026 15:20:39 -0700
Message-ID: <20260919222044.2143524-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919222044.2143524-1-khem.raj@oss.qualcomm.com>
References: <20260919222044.2143524-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 22:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130119

Crypt::URandom provides non-blocking cryptographically secure random
bytes via getrandom(2) or /dev/urandom. Authen::SASL 2.2000 uses it in
its DIGEST-MD5 mechanism.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libcrypt/libcrypt-urandom-perl_0.55.bb    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libcrypt/libcrypt-urandom-perl_0.55.bb

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-urandom-perl_0.55.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-urandom-perl_0.55.bb
new file mode 100644
index 0000000000..9f7a91a954
--- /dev/null
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-urandom-perl_0.55.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Crypt::URandom - Provide non blocking randomness"
+DESCRIPTION = "Crypt::URandom reads random bytes from the getrandom(2) system \
+call or /dev/urandom, providing cryptographically secure randomness that does \
+not block."
+HOMEPAGE = "https://metacpan.org/dist/Crypt-URandom"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ec17831373365f90a71812362a07229a"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/D/DD/DDICK/Crypt-URandom-${PV}.tar.gz"
+SRC_URI[sha256sum] = "ef9f44141073c13573e85b148ff9a9089c45825b7d6608d832e4263899d3a2d4"
+
+S = "${UNPACKDIR}/Crypt-URandom-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS:${PN} += "\
+    perl-module-carp \
+    perl-module-constant \
+    perl-module-english \
+    perl-module-exporter \
+    perl-module-filehandle \
+    perl-module-xsloader \
+"
+
+RDEPENDS:${PN}-ptest += "\
+    perl-module-config \
+    perl-module-encode \
+    perl-module-overload \
+    perl-module-posix \
+    perl-module-test-more \
+"
+
+BBCLASSEXTEND = "native"

