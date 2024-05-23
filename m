Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD64C25B7C
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 14:39:57 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.216.1716475195013908150
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 May 2024 07:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NK6U17vi;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6f4472561f1so2757464b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716475194; x=1717079994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQj86n4bn9CTYZwx2xYYeH3NDXg3DU5dmQD0iGiEfS0=;
        b=NK6U17vifCrAAAFCQBCzybA0wKlAjT2GNK1XF1BD6COwygmW+2MYjzI2MuoKGb0oSY
         kKQGzMOJ0O/N3nEhKuHoNUbSCUPpB4vtt10WZEiY4efOGvDAc0x76k2G20H/aY4R9J0h
         jWQ2SnK/t/3zKLJB+HwCgFpDfFJGpTO7KHut9RL+UdCWLCNj/Vu/TxleMRBt3zOHW6JJ
         Gmd69ABZaD0HmGCKo8R8tzQZuuV9GxDf0hQEQavmZjuvCyidT5kBAWqqgCUw00iuDsqi
         4JfsE6DiTsioIskd1wRigRqcLCfnorYeXm2Sc4gEi1VuQtBtuyZsGNI1dRtjjBGkcZ6k
         nu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716475194; x=1717079994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQj86n4bn9CTYZwx2xYYeH3NDXg3DU5dmQD0iGiEfS0=;
        b=NzXRXGuLhCpDEsc1x/Xnm/4DSiZ7FgrdGRa1pC6KxY1O1C8zM3/BdRTJzu0kIXjc+O
         K1PTCJKkSbAGXLOJPqLj9uNJEet0fvnD9/98xf8NvIv0qi/OP9Ptq+T5yodmMrwFKUbc
         zmh1od+3eGLUivu8l6LDo2Cz4QlKSP5oJ26st8AuugqFK1dixMTCRYUE88ROZ/sLtFsX
         N77Deqdc1TpoluyjIo1cASQSVrbO/H6CAbejv8LEHJKW5npyp1qZ/LjsiZg93nXHldl7
         Qe5molvsYbiZXOJmCMotysgfeHWvPwpm/yubJdnw67uXL+YMylGhkPAiIOUB9MjkyV0f
         wdBQ==
X-Gm-Message-State: AOJu0YyrWGMoIFcovpwq1ZmmAsVDfbxJXwg2gnlftakryEZKVUXXMrfV
	SB64SHVTzmarLzw1MHzrJkzghq+uVe5/8xWgc7FQbDuO5C/lQXElShCh1CES6Dw=
X-Google-Smtp-Source: AGHT+IFra7BnjfZmLgV+mEz6MHKPVdbnFjGdtD1498rUB9q3jj5ZxEK0zkLK4oYSNnD8t1Z4Zt0/DQ==
X-Received: by 2002:a05:6a00:4088:b0:6f8:b1dc:d980 with SMTP id d2e1a72fcca58-6f8b1dcda8fmr1290831b3a.31.1716475194095;
        Thu, 23 May 2024 07:39:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2b2fe07sm24090347b3a.216.2024.05.23.07.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 07:39:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/2] oscam: Upgrade to 1.20
Date: Thu, 23 May 2024 07:39:50 -0700
Message-ID: <20240523143951.2957739-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 14:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110503

Switch SRC_URI away from svn and use git fetcher
streamboard.tv svn server seems to be not accessible
all the time reliably

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-dvb/oscam/{oscam_svn.bb => oscam_1.20.bb}     | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-multimedia/recipes-dvb/oscam/{oscam_svn.bb => oscam_1.20.bb} (74%)

diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb b/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
similarity index 74%
rename from meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
rename to meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
index 0a9a7499ac..e20358955a 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
@@ -6,12 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "libusb1 openssl pcsc-lite"
 
-SRC_URI = "svn://www.streamboard.tv/svn/oscam;module=trunk;protocol=http \
-           "
-SRCREV = "11718"
-PV = "1.10+"
+SRCREV = "190d6dee96ca70f8b614932b1498332b1504632b"
+SRC_URI = "git://repo.or.cz/oscam.git;protocol=https;nobranch=1"
 
-S = "${UNPACKDIR}/trunk"
+S = "${UNPACKDIR}/git"
 
 inherit cmake
 
-- 
2.45.1


