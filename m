Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.3269.1623379370113620685
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 19:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YdxsgxAi;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id e1so2067802plh.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jun 2021 19:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/pkQOp+0y4gMXULi4BaphJp+QuFpLtUrix8Jm2B9htE=;
        b=YdxsgxAiF/7vR5dXdQ3Oki2d2h/oZ0zNbwNPwiZc76wPIqhcrzlzbVjxqTc4fMOxCi
         ivARcSZuh95qLU6YMNaoTJn0dAc0QNjrqaPZZiA4VYdmLUks1fwOcTAIRMP4dmi3tqmB
         T8IMG20pyLgaK3a2XkEvEUXlSePFLtJJsYhE54xkH2sPu3bfyTUra1S+HAsx8niARav9
         iPxvf8aYr05Tee7pp8L0YtgEz5RCvU9VCNO/DA3nIf5Iawkfq6Q6yU/dx0LXxszflLGe
         sj2U15pM9L0g8zHeVFm+qV8S/nnZ42RHYJCcIBhAA0Lhg1K4wKm3lexYEmjOeJxKXV9G
         ghPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/pkQOp+0y4gMXULi4BaphJp+QuFpLtUrix8Jm2B9htE=;
        b=Jd44KgYkPawuVwfDi15wgN9yjLT0QSUol7DhcX+qbntczHdZAgX2bp6iaa+073bSs0
         ta2xKcCcMKfxVfEkx/YdyE2red0Xju3srFgzyA5tb9XB6pkeL2wEsZVsNfa9RDtrCFHb
         w/EQzYTpo4IHBPt3JEEx9uy2Qe+4LKCMmT7/cI58wobs8ECNVqVFhlBBLV8lBNju/RRj
         8ugJqcTwl+OIzxp9b8qC23uJlJx/s7S2R6ny8tqkxixCW2joP4mHR6GPtNuZpBwPf1Dg
         I3YrbgQN4RvNtrX0DiyPnxg5uPt5QwCDY/XofwjehuwTFVpaI4VlNHf2OCFHVbjsg2hc
         0mLQ==
X-Gm-Message-State: AOAM531OUhuWV+8bPZlDrpoJjjmcO4Ub4H2HNNtZsaQl2nl40BLVvW8S
	NVVBFUk1JPGMaogduh19BkZkE7+pJT/9+Q==
X-Google-Smtp-Source: ABdhPJyAh46LSC8qxe/OGwMYLxPQLTf4/ni5yOTxGGbFjEFRTjjMf3PH5HQB2C70A7h2e2+CTqpMZQ==
X-Received: by 2002:a17:902:7d8c:b029:105:2b81:3915 with SMTP id a12-20020a1709027d8cb02901052b813915mr1739330plm.71.1623379369324;
        Thu, 10 Jun 2021 19:42:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id o8sm3511257pfp.48.2021.06.10.19.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 19:42:48 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH] klibc: Add clang's -rtlib to known options
Date: Thu, 10 Jun 2021 19:42:46 -0700
Message-Id: <20210611024246.2108884-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps in ensuring that we always link klibc apps with libgcc as
compiler-rt does not work for klibc due to missing libssp functions e.g.
__stack_chk_guard and __stack_chk_guard which it expects in libc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 .../klibc/files/klcc-cross-accept-clang-options.patch        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch b/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
index 56905a5159..431c75e3af 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
@@ -5,7 +5,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/klcc/klcc.in
 +++ b/klcc/klcc.in
-@@ -207,6 +207,24 @@ while ( defined($a = shift(@ARGV)) ) {
+@@ -207,6 +207,27 @@ while ( defined($a = shift(@ARGV)) ) {
      } elsif ( $a =~ /^--([sysroot=])(.*)$/ ) {
  	# Override gcc encoded sysroot
  	push(@ccopt, $a);
@@ -26,6 +26,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +	push(@ccopt, $a);
 +    } elsif ( $a =~ '--unwindlib=.*' ) {
 +	# Allow clang options
++	push(@ccopt, $a);
++    } elsif ( $a =~ '-rtlib=.*' ) {
++	# Allow clang options
 +	push(@ccopt, $a);
      } else {
  	die "$0: unknown option: $a\n";
-- 
2.32.0

