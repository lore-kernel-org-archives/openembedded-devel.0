Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D966C369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 20:49:42 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.39605.1745327631433379016
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 06:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mR5cJLjl;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22d95f0dda4so15656055ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 06:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745327630; x=1745932430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cxheHnpXMYVcS9+BZaEWDL05Kip3Taj3gDCRdIrWry8=;
        b=mR5cJLjleTe3OERGDFqS5rxB4O7gsWn1M4XAWw0ySRzjvkaE1+Tv2D+m4hDX48+QHF
         9O4NNi002ZzEZKyjioBoIVram78Co3e07u79b531SjMdMCDcvFWpWp5iBslmTD9py0SE
         37yqecCUp9fjZuvVCRFh2H1nibx5FbJloXBBwF0p1PdvTsdWB9tZWi335JHPcSq7fT5A
         OkRrS1EhtXs0g5jAKtdh9QDtzAr3wep/oNrFsgEv3C9emhT2LYeo2Rreh12nPUlTNHMc
         TvPOLBg97w6JQDoTamZ5y3ZBvdMUWgRtU0S86Cb+oBf10MdZc250was+4QDS5dpq3S68
         88Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745327630; x=1745932430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxheHnpXMYVcS9+BZaEWDL05Kip3Taj3gDCRdIrWry8=;
        b=vKwejjy0pfaaRcNKYzFKeuX0DwndVulApLEBdPvvFfKT5/cJidtgjAV858CFqFstd7
         yqiFTYyc0UjPub+7s21pCk0c/XA3xs97sBdH6FoQoZtmaH5xKjO7qys34aGCo9haQjKH
         zwPVvRy2y/5nVOSbWPkq7/7cFBQJOc4ioyptUjZ0Hxkz/kG8qCsDZ+PkUEBj40XKqdB4
         JPg8pX7TJRtXXT1utBlVzTmIUtO6MoAjz3ggEqpkXbb1s/ntjAXEIN5+YdMquwxoBADQ
         LOABvmHeMq6UayRfzMEVjujpaprTRsbue4cO7I5GFlqs/rszng7n0/XIY+siKp3SoMwo
         UyYA==
X-Gm-Message-State: AOJu0YzDXhYzQw8XUQeNqyOWNbJQGJo/0iMMLr0FQ6iFbVLhId/jiQud
	74VQ0gkekGjmhDhpyVN4CDj3fIk4yS0xxzg7211pxMRl2pSte1zv4/x07g==
X-Gm-Gg: ASbGnct4Cw+HdXXIenhu1YLRGxSHsjrzwLKLsWnXZUhmg99DSt6vVyu7ZyqP3Y2YnSj
	1MwTdVK0+orRLGzEZ/wwN1/n4lXNuvTDGy+AcGaYhMriVMYXNUO62IcDOh/wph+M2SEW3vuHV5u
	aMijwlu94mFACXFOTLLNjAXgG+hBZdafn3SEsdQ6Sd60U2NXvrdREuWZMZQAuv690lKgR55Nfbp
	xBpfPqT+mQFPturxjZLUwSDeHLURbEVyahwcECAhJRG8mZJ1sXeDxKc3IKRcUaXxMx8aKfAbDMN
	ZcEGgwG8HjzcZmX8eMMM4Y+qhTL5YwPSl32k7dGuNw3UD4H3s+kOLiH1Fb2GM4g4G/lPsQ==
X-Google-Smtp-Source: AGHT+IENaFrkJZUvWM36RQmoIWxwg/P4R3DSVPfijFCWyevfPM+ibLMKHKHWysjXnHqJAwKGLVKsew==
X-Received: by 2002:a17:903:990:b0:223:f408:c3dc with SMTP id d9443c01a7336-22c5357a703mr227362125ad.9.1745327630386;
        Tue, 22 Apr 2025 06:13:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:905d:5320:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bda765sm84536855ad.39.2025.04.22.06.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:13:49 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libsimplelog: Fix using CMAKE_INSTALL_LIBDIR
Date: Tue, 22 Apr 2025 20:13:32 +0700
Message-ID: <20250422131332.5039-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 20:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117173

Fix using CMAKE_INSTALL_LIBDIR instead of hardcoded 'lib'
Increase v1.0.4 to v1.0.5

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
index 461b96035..764425dbc 100644
--- a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
+++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
 
 SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https"
 
-PV = "1.0.4+git"
-SRCREV = "781f5eaa1713e7f60e9ee79ab5143c0bacfcccef"
+PV = "1.0.5+git"
+SRCREV = "fa8c68f8dfcf72adb346f1f4d6dfad02829052b5"
 
 S = "${WORKDIR}/git"
 
-- 
2.47.1


