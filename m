Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.11657.1629037603341837238
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bMhD9dgb;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id bo18so22676442pjb.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9YbmvKHAvEGF71J4+TBfYuWKGOXalcK1oLcR/31fphk=;
        b=bMhD9dgbsxtXw15uVvKYQCmNshbWriVQcFvz6xCPr+c/shcXaj4XENT/tN1b4RAc7c
         xYhf37I+dvJqCvV9h+Ewto7zhvaAKgkHjdTloIBhRXkMYrvMq3cMsq5VCdd9wSNzrm1S
         sfuQPTsJvlpMjEYY8+gGyn/JnYevPN1XD2RanrXmPlw5h3uFyff0E0jcxYnSy3t7bGz9
         gvV3mD+SvjMIFqhd/moHWe7VW6rtgvGAIxIodHcTZSGEV6+qi52hByLfS6JVeWqfs+UE
         HO0JlGsCi4aH30AOqWdzWdTW/dIRDd0PDe1gHCM6mi8ITMMxJxsVsKr2tKOALUdbarTi
         RBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9YbmvKHAvEGF71J4+TBfYuWKGOXalcK1oLcR/31fphk=;
        b=lW4/FO2YCSow0USA5pB/vpqS64ZYRbaVAjKVRTSZcK6EYvF/kslS+ww10OkNyz4nMO
         0FcTZCseXO5WMGBech0oALuoiSXvnc6GXdfMMtOd/Za1v7/gQKSeavBIpKsEtVhmbcxP
         dR3ac8cMo9gJ7rq5THugBJvJXQIA4Ymtsi01owBoQ2CGpABeFonXFCB0s1V9atsJf13D
         ZcDY0F0/OGUJT6Wd61zyB8FfD2E4jA4w6D0ZpqcBW+oKWLW7oC+FxcUQAvHg5I6b0W3G
         fCJ4PV88204X++d0pAKaOsHlseLiBi1PoftDp1ctqCpZ2yUFwMCG53Jm/2vFnXKPQ2rz
         b4hQ==
X-Gm-Message-State: AOAM530eBiI9/JAvKnXgMvbRho2NPiewSuq4TAOdAQywGYG66ukM4u2+
	kcm6EHUCrAmvVwbMy8dbwhzWUiTqrqCrFw==
X-Google-Smtp-Source: ABdhPJzvHOGskqAWkEbkbPOGz0+meHdvhWIxWFNTOEnxg6MR/4FNlYQBkBk2E0Ph0apKStXbFA7vVQ==
X-Received: by 2002:a17:90b:3907:: with SMTP id ob7mr12535783pjb.15.1629037602729;
        Sun, 15 Aug 2021 07:26:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id d15sm1668901pfd.115.2021.08.15.07.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:26:42 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][hardknott][PATCH 2/2] fvwm: Fix build time paths in target perl/python scripts
Date: Sun, 15 Aug 2021 07:26:40 -0700
Message-Id: <20210815142640.2929628-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210815142640.2929628-1-akuster808@gmail.com>
References: <20210815142640.2929628-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Add rdeps as needed
Fixes shebang-size QA warnings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8cc64128c70c5b6a41b050332abb1d73a10ef4fa)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
index c93c510976..3b01a216bd 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
@@ -82,6 +82,9 @@ do_install_append() {
 
     install -d -m 0755 ${D}/${datadir}/fvwm
     touch ${D}/${datadir}/fvwm/ConfigFvwmDefaults
+    sed -i -e 's:${STAGING_BINDIR_NATIVE}/perl-native/perl:${USRBINPATH}/env perl:g' ${D}${bindir}/fvwm-*
+    sed -i -e 's:${STAGING_BINDIR_NATIVE}/perl-native/perl:${USRBINPATH}/env perl:g' ${D}${libexecdir}/fvwm/*/Fvwm*
+    sed -i -e 's:${STAGING_BINDIR_NATIVE}/python3-native/python3:${USRBINPATH}/env python3:g' ${D}${bindir}/fvwm-menu-desktop
 }
 
 # the only needed packages (note: locale packages are automatically generated
@@ -113,3 +116,7 @@ FILES_${PN}-doc = " \
 RDEPENDS_${PN} = " \
     xuser-account \
 "
+RDEPENDS_${PN}-extra += "\
+    perl \
+    python3-core \
+"
-- 
2.25.1

