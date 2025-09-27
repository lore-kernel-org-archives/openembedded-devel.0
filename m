Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02098CAC5B9
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 05:53:35 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.6610.1758952413780542109
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 22:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Aau/qkeC;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-33292adb180so2699072a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 22:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758952413; x=1759557213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SUqf3MYkcLSIbUAyn6mdEQPjPS4ZUVSqtpJCqgF18E=;
        b=Aau/qkeCEU+He1KMo+75QEaSQUbg42Y98TaoOkL/IwMyikj4O+m+67U3PkWdWVzxMp
         cKazibKPiPXeR08JTRbZIaUlYRR3A/gxcKxREKGnsN5y6979DEi6epu4HD1pjAleH37m
         ClAaqpPMXZD6U6Q78G0lqs51q+X6haI7AZvuGm+4ntzVyEteIjGl9kze32f5KKZUNw4w
         yD97eGjI8yDNzGzNh3ki7Yxsur+4X987lRbQxHQV3C11FCj0dA1oE5ZLWSKDUlIDujnh
         h8cUdWarPlhnRhmrIc3Sae9ccBM0PBfKG0h2yO2cUuDVbKxuIcfys1KcR3ZD7cfqtFD/
         SbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758952413; x=1759557213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SUqf3MYkcLSIbUAyn6mdEQPjPS4ZUVSqtpJCqgF18E=;
        b=p8nq87xIuA3JEeRsGdv6//N+xjUrRbzvq2gjECDm7RPz0+5GG7oHweeYbzg1Lo+mey
         Dj/KIxpti8/ooVK7lb43uN4AHi6CiLZo2yreZkFF//hkKIMv4q28ld1tFkQ0LzGux6jC
         N/2q5K/oJu82FB56Lp2I9zAUG2Ahoh/rWrEKbqiwsZ/wc4ccQQUucWinquVFzz1d2Ome
         8EJ7iVXhftJyfnFwL+1J0pZW+T5/hjv0CVAnDeP7Ksdn0ugeX8XwKXHtr3QksFu+WBYf
         XqKWbM+Y+b1CAfbbygw5jBYuVuoh5tzckdomwmf4PLWJaiPvleN17Cu3Pr00ElqBv0rV
         oV5w==
X-Gm-Message-State: AOJu0YznbfAkr5/Kw/MkMfBpAk4ebbbYmp1Y7UpUkyd4VA2/OoEWhLIy
	kMSyC133A5+ZaxUIaNCP9KFhqkCyN+wwJhox9nlZ/A+ntmlJk5wkh0JEZMSJqFWg
X-Gm-Gg: ASbGnct8LER/+DJbYAUvODAH58W+3lU/ky8m0755igN/mNHF1PjKjcVcyrnp7Cf/mOr
	X3ibUjrUU9HgBXjxczPuprM43zcd+Pu2RiePOeQjRNvi8j3EWev2F4LdJvmZaphCGkyKPOP/tO9
	AtlRf0KRz/Cy7ONim+Wj4403alxX8+VAfgoCp4w/DxxOCf2n3g5Vy9DXia3SVLSZ9wR+u2Svlla
	rEkcK/qbhBvJam3ccbr7O2K+a3CAqk6qM1IXgG9H+3Ntk03ZVLwKTSsYxJiar22zcp45nywq+Tk
	oSRHL79TK3Lquq73y+Geaf38smsJnvpkRtBYHmROY8U0rSbigDoWL9svbt1hObKL0ZpFkoEkjCf
	HC6i8gsHruLL09TGsypSMwqTJ06ETMLkgamYmALyx+L4Rys1g6fhl6LfC0MCa/f2DeT9e6+1UlA
	YmqQK1hZMUAc5ACRz8rVxCe/K3h2VJrsLFqMuR9Ffc
X-Google-Smtp-Source: AGHT+IExc0oFb3kT8K/rt2oF+HFP9FeUZFy4le1Y896H6MDETa05fxb+UARwkx/Xx2gLBA41xlpDyQ==
X-Received: by 2002:a17:90b:3885:b0:32e:3e2c:8ad8 with SMTP id 98e67ed59e1d1-3342a2d9bdemr11209493a91.20.1758952412829;
        Fri, 26 Sep 2025 22:53:32 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fa7e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be148e8sm10722394a91.16.2025.09.26.22.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 22:53:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [meta-oe][PATCH] perfetto: Use gn from native sysroot
Date: Fri, 26 Sep 2025 22:53:30 -0700
Message-ID: <20250927055330.364599-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 05:53:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119953

Prebuilts shipped with sources is a x86_64 binary which works ok
on x86_64 build hosts, but we do have arm64 hosts quite commonly
used to build OE these days, where this fails miserably. Therefore
use the gn from gn-native, so we can get it targtted correctly for
build host architecture.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/perfetto/perfetto.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index a2a4c9f39e..d697485e69 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -49,7 +49,7 @@ SRC_URI[gn.sha256sum] = "f706aaa0676e3e22f5fc9ca482295d7caee8535d1869f99efa23581
 
 require perfetto.inc
 
-DEPENDS += " ninja-native"
+DEPENDS += " ninja-native gn-native"
 
 # Use clang in order to enable traced_perf ( see https://github.com/google/perfetto/blob/092d0ceace6fa516fac1bd4e715c226eaaebe26e/gn/perfetto.gni#L177 ,
 # enable_perfetto_traced_perf depends on "is_clang")
@@ -73,8 +73,8 @@ do_configure () {
     cd ${S}
     # Rename a few build tools if they have not been renamed
     cd buildtools
-    x="gn-linux64-1968-0725d782"
-    [ -f $x ] && mkdir linux64 && mv $x linux64/gn
+
+    mkdir linux64 && cp ${RECIPE_SYSROOT_NATIVE}${bindir}/gn linux64/gn
     chmod +x linux64/gn
     cd ..
 

