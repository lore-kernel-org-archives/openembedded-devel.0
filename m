Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.47264.1598851869303821127
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2020 22:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YijXA7Ya;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id c15so2494876plq.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2020 22:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a1NKaR4sF1mtPiR1/OwDCkLQy4r3Sxqckk7Gd1G54+M=;
        b=YijXA7Yatv4skhzH9g0bVcOzDS9EdinssxDLXAhaj67n8utScH1YJn09HjO6DfYJ40
         0XWlyGnNkXuEU0Fk7+GznohYmZZyVJFzbELTwYBkpN1Y8fTfear/KfwnuB/DX9P8BmQ/
         WUYGGMfckUOQ37JJV9kvZtF4Ih4ookCroFuorJgtzOzSwqzRv8cnaDebZwZ1zI/l2bIl
         jGQwNp9nfqIR/VHBEuOvRrpIMiW9y8uRQeRBkhgFFqXR9nHCzOuWSZJ8v08gRD8xxLnx
         O+KY+uelWqL58M3uGesh2vtbO4f5ZdzgQ/+XSVzdJAFI8Xn+WkBi3lhX8mkUZ2pZq3tl
         4SNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a1NKaR4sF1mtPiR1/OwDCkLQy4r3Sxqckk7Gd1G54+M=;
        b=FmJHz9bT/yWicPOk+al/BH3QCT4CIqUj3lnmId9gLaodcV0RT2g83lfFLyfnF8NJKD
         rBWuS4GEV1iH4t2GfiJWVahFz6Wok805NedE1GRoZZjOSxojWGbrkzPQ2rhK39O+LBWz
         oDdbdgw1+xbfknXkiImDCRtNDua0c+jsyInm85HFxuyO2ujJeUlQ7x+t5cJIfURf0CN0
         Ff7HPONd5ygUYm2Ec5LNgAS1YRR80tV0wssLt+VMVpDKZ8hmddEv4/0RH4B/mwQMwW/L
         LGe/1ydqOKwum/0N+kCI553XPRE1vIZ2BRAQTPalPNCHSlxBMnvAg8niAa3+Qp9pa9+g
         xr3w==
X-Gm-Message-State: AOAM533wYA3v6twmXTpf5aTSLMZIhqmKauzCnmi7exowE9mDlbBy94jU
	qF5FosNlPdppv906DVQXquIgqHhs4TVCqA==
X-Google-Smtp-Source: ABdhPJw8k1PNyBZc54aMCyroO9vyJxJXy2wDMDgkBJwqnXhQH57uW1jT8OrX8FqHvJRDRyQNzUgpgw==
X-Received: by 2002:a17:90a:d982:: with SMTP id d2mr125689pjv.68.1598851868514;
        Sun, 30 Aug 2020 22:31:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id y9sm1568350pfn.85.2020.08.30.22.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 22:31:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 6/8] mutter: Add a comment to remove pipewire-0.2 dependency with 3.36
Date: Sun, 30 Aug 2020 22:30:55 -0700
Message-Id: <20200831053057.1541321-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831053057.1541321-1-raj.khem@gmail.com>
References: <20200831053057.1541321-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will serve as a reminder when this recipe is upgraded to 3.36+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
index 29b9fc62fc..a3e479869b 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
@@ -52,6 +52,7 @@ PACKAGECONFIG[native-backend] = "-Dnative_backend=true -Dudev=true, -Dnative_bac
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=true, virtual/libgl"
 PACKAGECONFIG[glx] = "-Dglx=true, -Dglx=false"
 PACKAGECONFIG[libwacom] = "-Dlibwacom=true, -Dlibwacom=false, libwacom"
+# Remove depending on pipewire-0.2 when mutter is upgraded to 3.36+
 PACKAGECONFIG[remote-desktop] = "-Dremote_desktop=true, -Dremote_desktop=false, pipewire-0.2"
 PACKAGECONFIG[sm] = "-Dsm=true, -Dsm=false, libsm"
 PACKAGECONFIG[profiler] = "-Dprofiler=true,-Dprofiler=false,sysprof"
-- 
2.28.0

