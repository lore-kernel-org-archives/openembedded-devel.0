Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.2440.1625965702879893846
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jul 2021 18:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gX79NoFL;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id z2so4197588plg.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jul 2021 18:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PJ7Nx5Qe6Tp1RQH+qdiPmfc+3yMGfCWamYJcmcqSbZA=;
        b=gX79NoFLkPtfm3Ywb9+nr6h/x2E2TxjVIT2fOh4d/vDEZZ7RxA+gbhs/OaeOZ15G1W
         Fxv4J6vhJkCTwEc99JqSJShMSpQ3VG1Uj9RoSpvpoldLJh/IkVFGFoF/7AVKjMO4RxWH
         es5AY1NN6XQXMRt8YfxBhVGmJTRsHrGordgthBwLjUFsgtamgXRm7mt3M6evZc9TVQqz
         VNdE1kjRQ6bsbcHoMXz1pH7Qw7nVVqhZmnsCgN55Q2RdftlV3W0jeFwo/jTZEJL7L09V
         7oJCjTojHfjZCyzheIOw0RaRteic9/K6UFNNBUlpFIngIjZtZeqDrTiiG8yhn/PIQ6qE
         U6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PJ7Nx5Qe6Tp1RQH+qdiPmfc+3yMGfCWamYJcmcqSbZA=;
        b=VBWk36BPddqZkE3+K3Ycr2GIaFUJcp+2fnPMU9RPC0K2q7DNSuDCYkHlsdn1F9wAzI
         o5cJ+kKWDE1AuUVpjF1b6HUHvQDhEdzDc880eiBM3FUpuEw2ZU7WnVoy/nKZMN3Tja41
         GaKEUmIkAGJtSx4bWZg+eN5v0SCO+R+zSRyjcIClEt9bPdq0Rpskk5R/76QMGDZXXUzs
         XzpIIM2FZydARUdaZ7Y0ZvPXW1zNPDfG88ncJCVikRfiLSodbmASXXYt8hV35bp2qorA
         r+xmEmZNEZHMGlI1qWqP26mQrQpJrhrPNr+PWo+59oZPjAHpBVGTbRLuAZQ/1GG/XHii
         XUOg==
X-Gm-Message-State: AOAM5304lEHDgiIpN/g8f185V4rf1S4APrNV/VcK4ZfuTqjCGnO5AEtg
	mLlVsL+pR4+/X3uZl3oa1voE7NUiSX2Pjw==
X-Google-Smtp-Source: ABdhPJzcWhKQPSwt5WPfuBgKnew/UMjBxja/xEAn4bmQIEtTsiWr3UpYbnZQfoqxZX1C4MSXSTVGpQ==
X-Received: by 2002:a17:90a:390d:: with SMTP id y13mr46450120pjb.52.1625965702294;
        Sat, 10 Jul 2021 18:08:22 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::7ed6])
        by smtp.gmail.com with ESMTPSA id z3sm12199024pgl.77.2021.07.10.18.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 18:08:22 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [meta-perl][PATCH 2/8] libcrypt-openssl-guess-perl: upgrade 0.12 -> 0.13
Date: Sun, 11 Jul 2021 01:07:58 +0000
Message-Id: <2233a973f2896f0c47ba18ebe824ce90e0d7279d.1625965484.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1625965484.git.timothy.t.orling@intel.com>
References: <cover.1625965484.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

0.13 2021-05-03T15:37:39Z

    - use --installed option while executing brew --prefix (PR#9
      @skaji++)

References:
https://github.com/akiym/Crypt-OpenSSL-Guess/pull/9

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...-guess-perl_0.12.bb => libcrypt-openssl-guess-perl_0.13.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-guess-perl_0.12.bb => libcrypt-openssl-guess-perl_0.13.bb} (86%)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.12.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.13.bb
similarity index 86%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.12.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.13.bb
index 6f35e39bf3..b0a1937576 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.12.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.13.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea914cc2718e8d53bd7744d96e66c03c"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-Guess-${PV}.tar.gz "
 
-SRC_URI[md5sum] = "9e86baf96828a38c967003a5e66f0c39"
-SRC_URI[sha256sum] = "0a18d18768cf42b49b15c9dea626199dc74346bbbc76acd3d817b9c1d2bd471d"
+SRC_URI[sha256sum] = "87c1dd7f0f80fcd3d1396bce9fd9962e7791e748dc0584802f8d10cc9585e743"
 
 DEPENDS += "openssl"
 
-- 
2.30.2

