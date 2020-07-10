Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.2331.1594346331035752612
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 18:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n5kqiYeF;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: rgowda.praveen@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id d27so3304552qtg.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2020 18:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DgfcWhu64rMhvlhrIenf/iQRqrp1oqCeTpIVq+6R1dU=;
        b=n5kqiYeFMrapXvSTDNuuodB0XZIbGBcApafLNpXAJJSw5AQYWKCaoHyDL4h8+fn5am
         989n6KSoI+udU5t398a+qaVX/SeT/A7xwnSQa3kJWQlM+s8q3nxc8NmOlYQZi8gxI568
         PGeRsikjJLzZoGkDLoy35r7/R+XLVirVAb8J8RN0fbNAov2ssdwB7v1w3+p5uYAAQvUQ
         WhF6+7ck0UiwP/YFCVfYgcluhIpKkFPP2gXiJPBf/wOzTCaMCrMI1dP1NzJ7gVMtdFRx
         1L/958DTYHieswtWfq4ihxR3kkuc4BXP7hE5I38lc7hAcJleVUTVruu5HOcyYtymUzsR
         kDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DgfcWhu64rMhvlhrIenf/iQRqrp1oqCeTpIVq+6R1dU=;
        b=tzmLue6+PW+i8+1lQjjhXR00vCwqK6mTDH6kZhgJvLD8njgfn5gtbOVO+b2x1XOYnN
         dHETryUQx6DxSFzEY22AJl0nRbEl9M7x/nLlfP8l9uZ6czB6kiQ7njuHdXK3csJo8qtT
         iNjjQ35MTFOCaKoX/IgRv2QJLok8SKxF6CoEUhxdHspMWajE/UVzVdKz9sTIDwHDyBq/
         BxawayLHxcm8qQNsW43TDb6MB4WPnrq+R5B5NkoJiDbWvp8xXf9RGqRmqZz2oIqHVBoc
         ClofmJ12Q4P7SQJ8Foa+IenLAoUKh4sx5lnu5aVxjCUY0M9QFzemZIEgBkV5Bj5BqwZ+
         W4zw==
X-Gm-Message-State: AOAM533MUHiiPK5FfpTODaeFbyVV+91WU32r5J9xpc0+0qQ5DVSa7wBa
	rEUTHlk/uU0w/wz0XABoYIkbnpOyAwg=
X-Google-Smtp-Source: ABdhPJyw06z/4WDAxXwQZYA52RUi0rByh3Dwgaz0VC7IeASfb70ssy+PBxDpHgxsVac2gxrgzxE7Zg==
X-Received: by 2002:ac8:2bba:: with SMTP id m55mr38204230qtm.214.1594346329956;
        Thu, 09 Jul 2020 18:58:49 -0700 (PDT)
Return-Path: <rgowda.praveen@gmail.com>
Received: from CACSVML-19150.cable.comcast.com (fw800-d-hillsboro-or-corp.comcast.net. [198.178.9.164])
        by smtp.googlemail.com with ESMTPSA id a28sm5516238qko.45.2020.07.09.18.58.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 18:58:49 -0700 (PDT)
From: "Praveen Gowda" <rgowda.praveen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Praveen Gowda <praveenrgowda@gmail.com>,
	Praveen Gowda <rgowda.praveen@gmail.com>
Subject: [PATCH] Update fstools SRC to latest
Date: Thu,  9 Jul 2020 18:58:26 -0700
Message-Id: <20200710015825.64379-1-rgowda.praveen@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Praveen Gowda <praveenrgowda@gmail.com>

Signed-off-by: Praveen Gowda <rgowda.praveen@gmail.com>
---
 recipes-core/fstools/fstools_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-core/fstools/fstools_git.bb b/recipes-core/fstools/fstools_git.bb
index 3bd56f7..8541a62 100644
--- a/recipes-core/fstools/fstools_git.bb
+++ b/recipes-core/fstools/fstools_git.bb
@@ -9,13 +9,13 @@ HOMEPAGE = "https://git.openwrt.org/?p=project/fstools.git;a=summary"
 LICENSE = "LGPL-2.1 & GPL-2.0 & PD"
 LIC_FILES_CHKSUM = "file://ubi.c;beginline=1;endline=17;md5=8ccc371d64f0b3a8d91065b678dc7095"
 SECTION = "base"
-DEPENDS += "util-linux"
+DEPENDS += "util-linux ubus"
 
-SRC_URI = "git://git.openwrt.org/project/fstools.git;branch=lede-17.01 \
+SRC_URI = "git://git.openwrt.org/project/fstools.git \
 	   file://0001-Define-GLOB_ONLYDIR-if-not-available.patch \
           "
 
-SRCREV = "37762ff488752c1686b359816aec75831b49c55f"
+SRCREV = "d34ea8eb1e12259a315cdef7aa0cd3ceaea68e00"
 
 S = "${WORKDIR}/git"
 
-- 
2.24.3 (Apple Git-128)

