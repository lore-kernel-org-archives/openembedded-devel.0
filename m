Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.1301.1591500304941145530
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JJOv+f6X;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id bg4so5290950plb.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wWVPmrLHQo9bqJKd0nRR7T/pvDhACBjoe5luNpNUg1A=;
        b=JJOv+f6XqhRV+jl8YkfeJuH0Sdur42ICJeKIREVE7bg5cmneZyi14+A5X3G3b9+2JL
         fDMEepoiKW+u1ilVtWG5iaZIY1lbvo49+OiRdjH3pMR8AxJb17Ijxa17RmBrKiBrByHw
         eu1Dnc0DtQ/+3sufT3Js7d0hzn6trys2aU0JAgERYqJSwdDDChYxC6J1d5FtJKL01uHG
         o9SAsj77THDxD5OBubTBkd5dtg8sGZjXn5HV+X0Drk3ebjm5DAX9auPEUl6Ql7p55QVW
         OVQoSlCYZysuz4+RgLXDm10s8b3Hth/3cZlOOkhttdZd0s8eoz6UrqxxYijXqs3RfLns
         EAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wWVPmrLHQo9bqJKd0nRR7T/pvDhACBjoe5luNpNUg1A=;
        b=UE0YElI7dulrPmGA0L/lWsgb+7GeKvZd2zqjpFtkDvS4i9trE34R+2Qamn7ER2O67y
         2d3iJdKK6+T7bnhx/BZDpVGNRFGjlEvXeV9yjazrhmq97I6M+s5Q7R162hcHqf4p/BOz
         OkwB65fEEBctjrTMVUAv4vYBZY7VICT7zKAzuwO3OAPRWwNGci3vzC/ZOe3wCa24acCt
         jNUzGqYuowSbLepR/tovsIX0iz3Q5phhW/Bdz+7Mvx6SD12x2SIh16FVHxuP62GEbG7e
         2HHURZrr37g8FYN8MStKfZvEizXNzKpeEDwstNNWIbI04L3TXO/+QeZJRwNpK/Z67CG4
         Swug==
X-Gm-Message-State: AOAM530bil8LfWW+dh8Y0pwErTyyJfC3QFEoQrRrR+0/U7G34J7KCTpO
	dzqfWSYRIhlzBdW7n/lemWozTqmA
X-Google-Smtp-Source: ABdhPJyiiTvAQNo01I1t64g5M1eFkFu3gL7uc1B40tay9M41EXoeL8ouTUR7giRpteKlhRt0RaKlOQ==
X-Received: by 2002:a17:902:d697:: with SMTP id v23mr16668747ply.323.1591500304359;
        Sat, 06 Jun 2020 20:25:04 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.25.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:25:03 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 21/26] python3-smbus2: remove duplicate RDEPENDS settings
Date: Sat,  6 Jun 2020 20:24:31 -0700
Message-Id: <05fcf866561811f4892d098b759b0b45c95e0fbe.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Konrad Weihmann <kweihmann@outlook.com>

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7e5d8e32a383090a94b4fee19980b3e17bd7c902)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
index dee70a03f5..7a61927206 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
@@ -13,8 +13,6 @@ CLEANBROKEN = "1"
 
 PYPI_PACKAGE = "smbus2"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-ctypes ${PYTHON_PN}-fcntl"
-
 RDEPENDS_${PN} += "\
         ${PYTHON_PN}-ctypes \
         ${PYTHON_PN}-fcntl \
-- 
2.17.1

