Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6661ACC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:41:44 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12146.1792111999752330385
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 17:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i6dVRSul;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ragaprasanth@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e934449bb0so20505955ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 17:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792111999; x=1792716799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2R60X9bn76kkmmpdbPzQkgoFknRV59OqR2qUFVw2vhQ=;
        b=i6dVRSulqMYT3kW0H8OuHmCd4R+J2umd8FkQIH0Bvx/kbOd6/Klov0+mSWFYPmwwJR
         uRsbB5h+OaPKhG7slIY5EiTDEnxgQU/6bYna4bEcXg8uNeQu6wBxKdZPBZB/MCdoA3db
         ncU881uyWC89ai99w31Eq5wP2jO/DEESkG3+cXNrOVWSCDuhSvHhhc3OksSd2hQqKqOe
         hNSEPmEh5/rFn8iWqzqbwh7OaMT2GrS8MuKQIczlXKIJatb3p8Y3Kd2X8+PLeU49s0dS
         fFhTDpAmfv0DpFSVkTdsLKfZUAZin54bB0WAD7E9ZqbN1hG1/owESA0N2IfqYJIbvjKw
         yOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792111999; x=1792716799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2R60X9bn76kkmmpdbPzQkgoFknRV59OqR2qUFVw2vhQ=;
        b=pTww4FTssbi0Cct5xXnr/N4SXAte8oNJo3KKU9kSTFNnVW+BtwKmxYb6Ww06HLHeeQ
         ACgnKPHZ0kSNM+6vA0ncNFtcswe9ChvkTSeXBPbeu5gJRcwwgsU494EEOKRfBSAEJ0Qe
         BLXimB2V2ZHowbK8K9d8wi1L/M4xG3iMYdf3KmoLMjBhqiZa8QNCvwcKg53ItxSYTeYi
         UngBu/w7YGLQb5x3Ekf/SazUk+Wuv5fAFoyBdEZr/eJjfruWgQ7juQnFuzSHPWW2qZ+X
         yb/+Pop/wcNY5snv5OF/kSWgXHFN1ehIsHOV7aq184c9iCMHWZTAwhUgsXNUsW+uNOZ0
         luGw==
X-Gm-Message-State: AFq9FYL8cpshtA3WihuCo1WGzZc5VsXkGXwVjQa6cMo2+glnDjlUTAMl
	+Nq3eRx2Xv6MQQeIvJrE1QpQdO/umf8BrRkod/IXJE78mlTHBJMqreVJlTHK9w==
X-Gm-Gg: AYBFou1gsqE7JRDNldrbz/9+iJEPa9m11YTVFKczibgHqHusFigRF9vXe0pnrZ7q7nS
	EoI4CY3AiGiy5uOBuHleBBFZepFW7uFxUGG6zqbG+JIlA4cRug2FCKxDeslclXV3+/ncMtwPhXx
	5JMLgQV29e+rGQhVZWJqG9FnOo5zK6N7Q8oduEROmIWq1iiD0SknI60fyZDIpdhMQgEXU2mZXrk
	xV7It1ttZWjpwznFissm+k1DKRQcuejIbVS2zQDj2zgf9P+HwWr/l5BBj8HN7aiv083dqyVSDao
	050eLDZbuxVIyxdTX4ZWsICJdfU4FC/fMSZ9IidjY+AtYniGFt33rlMlgXjRvBcS3nlLez/F7/D
	7L/Bib2xM9WQygCJzEUHJEnwa8B105IEl5WODKGPIeTPxWvmxGA5lFaTeFghWxufXp4v6T+1yLb
	78gaRsdTg8iVSNWDrvsvANjHAg9y/cQZQwbenRHOylP0YHKwqOqfVnAnHPrn5TiGvKRVL+nkWWD
	HrGvbGlTOLqm0ITquXTHPr3A8n2TjPL7w==
X-Received: by 2002:a17:902:ea05:b0:2e8:3a21:cb57 with SMTP id d9443c01a7336-2e842cd4478mr194280185ad.19.1792111998887;
        Thu, 15 Oct 2026 17:53:18 -0700 (PDT)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e834f32sm2413895ad.41.2026.10.15.17.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 17:53:18 -0700 (PDT)
From: "prasanth" <ragaprasanth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [meta-multimedia][PATCH] libcamera: build with 64-bit time_t
Date: Fri, 16 Oct 2026 09:53:02 +0900
Message-Id: <20261016005302.3710890-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 03:41:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131036

64-bit time was turned off for all of libcamera because v4l2-compat.
libcamera fixed this upstream in v0.3.0 by also
undefining _TIME_BITS for v4l2-compat (commit 705601 "v4l2:
Unset _TIME_BITS in addition to _FILE_OFFSET_BITS"), so the
workaround is no longer needed.

v4l2-compat.so still uses 32-bit APIs on purpose, so keep the
32bit-time QA skip for it.

Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---

libcamera.so before:
  recvmsg@GLIBC_2.4, ioctl@GLIBC_2.4, clock_gettime@GLIBC_2.17,
  stat64@GLIBC_2.33, fstat64@GLIBC_2.33, sendmsg@GLIBC_2.4
after:
  __recvmsg64, __ioctl_time64, __clock_gettime64,
  __stat64_time64, __fstat64_time64, __sendmsg64 (GLIBC_2.34)

 .../recipes-multimedia/libcamera/libcamera_0.7.2.bb         | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
index 955cf041ba..b468d2b9ed 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
@@ -94,10 +94,8 @@ FILES:${PN}-compliance = "${bindir}/lc-compliance"
 FILES:${PN}-gst = "${libdir}/gstreamer-1.0"
 FILES:${PN}-pycamera = "${PYTHON_SITEPACKAGES_DIR}/libcamera"
 
-# libcamera-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
-# both 32 and 64 bit file APIs.
-GLIBC_64BIT_TIME_FLAGS = ""
-
+# v4l2-compat.so is built with 32-bit file and time APIs on purpose, so it
+# can wrap both the 32 and 64-bit calls. The rest of libcamera uses 64-bit time.
 INSANE_SKIP += "32bit-time"
 
 CXXFLAGS += "-Wno-error=array-bounds"
-- 
2.34.1


