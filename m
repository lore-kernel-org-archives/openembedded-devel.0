Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.24780.1612725658952017586
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 11:20:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=flIUqarm;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: akuster808@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id s24so12839662iob.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 11:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=56u/WJZ/CvzLP1jSCmJnxPO1RwKpCEUcBX+S1jyBXuc=;
        b=flIUqarmRF3lsJO8AZU+Vk4j12a6bvVFJIZIyJEVzSmFKIMVOeMl/RSPEvZ0B8w2v2
         sJn3zefOgZ0heTsdFW1VxM6/sWAfIwmsp2sIQHmgGs3tQSS7bn2Jsf6gxZm9kU6g/ZFJ
         3WW6+dADKo1aMUgo/vvc0thOUxyb4DfYQ314ypubVyk8s7s1B1pIRCdZPcU5TwuKDPPK
         PRK+rSfSZY1hvngJ1eDKjz6qgguOVQeCYxzBKbyVEihQ528+uqJC8igpc3DDoidK74k5
         2m0rzSFf8fIqxg1J/6sS2KQW3pxUv92a5VzZXpOIHKwAAFLNN/MtkwZ9Ba3UwdUi1XXe
         EzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=56u/WJZ/CvzLP1jSCmJnxPO1RwKpCEUcBX+S1jyBXuc=;
        b=UPyPaZMaBa1wxD/tQWegWHBliD+SDS9n2m+c1Ho2pihEVetKTWXZi/O3eH6McqttSV
         6akuPih47AODVyiqOYkgGmV5xLlnUUYqUHMGXgwD1jRLAZC36fL9sBHTb3qDB/msfX9/
         Np8sWQUg8BMgD+qnGpeluycEaPowYiXjxJ+jf3Dkzmbuvk7kLg10JEPJ73RmOG5OyyC6
         CijPR41rYtY027rCPjSDnpHlG+c5hO+UFGVc1Vf79DlWALsBTccOu87lftw5lx+MewQP
         HnFpeRkIZouGWUwOj2XeRoKkV+oveHoGd5YjiR9q8LyBmwkqLZFDtRPHqkolmqxMh8Ql
         l98w==
X-Gm-Message-State: AOAM532JcJWLwNqTxpaccVPdVy4V1j1L6yqWZfHYH//OyIpzfz1sGgzG
	1UIKQajYjUfZg2BAPm02yJmKiVAkK6+h9g==
X-Google-Smtp-Source: ABdhPJxrieeJwdBDh+cP8Ufvc25C2g55IuRm/+QciR+n3TMCxz/gyMrSpO5M0BLai9c0kWO+3/BrBQ==
X-Received: by 2002:a05:6638:42:: with SMTP id a2mr14335516jap.99.1612725658115;
        Sun, 07 Feb 2021 11:20:58 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:1d07:684d:b210:7d14])
        by smtp.gmail.com with ESMTPSA id c9sm7991306ili.34.2021.02.07.11.20.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 11:20:57 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] meta-oe/README: add Ubuntu 20 req.
Date: Sun,  7 Feb 2021 11:20:56 -0800
Message-Id: <20210207192056.30420-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

When building on Ubuntu 20.04, luajit needs 32bit support
so install 'gcc-multilib'

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/README | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/README b/meta-oe/README
index 8d787df68b..9034342643 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -14,6 +14,9 @@ e.g. on archlinux based distributions install prerequisites like below
 
 pacman -S lib32-gcc-libs lib32-glibc
 
+Ubuntu 20.05
+sudo apt-get install gcc-multilib
+
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
 
 When sending single patches, please use something like:
-- 
2.17.1

