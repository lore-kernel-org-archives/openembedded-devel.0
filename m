Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5688C48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 03:42:54 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.5624.1708486966399068569
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 19:42:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MrfYXgRA;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e459b39e2cso1967952b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 19:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708486965; x=1709091765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TtGPuLDlsCIEWk3T2b2kgYxgUFCv2FGPLBWwie0UqI4=;
        b=MrfYXgRAhKIIKHdAbmXNlrhnVXnnzhMuawtCIISmmgNK7HVpUlN8zpbuRamecat17D
         MugM+9HDLOJcZmZeYhxSc5Lt10GgB8NW8rI8coL9izwQJZ3/ErT2bBBoRfBSchTSSnfQ
         S39kA8TN4z/FtT9aQna9rL5NMbwejcVZu017xpe9pelBntIiCqqQRloK/h8MwO+lFcWL
         gNpjtPuBjqhSRz+HEPBnXZOx+0ZhIbJmMdexWRHvBOBcPFAYwfbK894ESlXzg59f++i4
         7F1o4acGuSNMn+eOsnkeJjKMnqaCz6noKLccf4SI95l9xhNvn85nq9lrIM+ZZp2HOPMm
         XfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486965; x=1709091765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtGPuLDlsCIEWk3T2b2kgYxgUFCv2FGPLBWwie0UqI4=;
        b=ebTKW65fo6VVh8FViCz9mNNmkqjWn7ham/JIr64m17TeGRSFCxNqtO4dA5LdUCBuNf
         QYEjzXw1UG8IOdOxDKHds2MMoTCMsrmPEepfHTjnRv69usDcgI9SF75Yn6MMVSUw5AbS
         RRTQqTjdPxK3luoHnnqppoXJ5jTEMEovv4kUpxYKYNzZQ+B7yh0OadjQGz93rDP9FWbF
         E+bwiYFXG5rlh5QES+xN4s0LCHiv94LWZ1h2ty3Eeaa9efcNbHaz2jG2SyAQ9dcXSl8y
         QvuumyyPLps6E1AG48QEiWAE//uuiybPROsPvRtG8F12b5bddrAWvb8yx623cbz3TI5A
         JQPg==
X-Gm-Message-State: AOJu0YynHSCBjSR87byPjRCMVS2N71LJHbU1Wy3FyBcGecBzTIvdmnyu
	D199K+kX9Yt+JYxS3mnOmkFiTftvLHNZiXErKRoC/6t2jF05zh0Pdf7d+5IBVYc=
X-Google-Smtp-Source: AGHT+IGIHYbRMDOYv4ZAWuo235TcOZHjG0PYBiGquKBGY9p8Hm0cVHTErrf5O1wrvK1qYEpKseMQeQ==
X-Received: by 2002:a05:6a21:2d87:b0:1a0:8897:85f1 with SMTP id ty7-20020a056a212d8700b001a0889785f1mr18340404pzb.6.1708486965175;
        Tue, 20 Feb 2024 19:42:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::696f])
        by smtp.gmail.com with ESMTPSA id bn23-20020a056a00325700b006e0416c42c3sm7733166pfb.198.2024.02.20.19.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:42:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] dav1d: Inherit missing pkgconfig
Date: Tue, 20 Feb 2024 19:42:42 -0800
Message-ID: <20240221034242.1552551-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 03:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108956

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.0.bb b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.0.bb
index 0eb622d039..e503af44ce 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.0.bb
@@ -14,4 +14,4 @@ S = "${WORKDIR}/git"
 DEPENDS:append:x86 = " nasm-native"
 DEPENDS:append:x86-64 = " nasm-native"
 
-inherit meson
+inherit meson pkgconfig
-- 
2.43.2


