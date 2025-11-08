Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A00CCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 15:08:48 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7236.1762614518558426450
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 07:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ITtsyqyn;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b31c610fcso183882f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 07:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762614517; x=1763219317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8+4lDCVRNyl28CreOVSs/kCDViEgYG1unmniA0FUug=;
        b=ITtsyqynpKQaWzZBXQ07AdCgZ1QIS0sWL8eRWmjqKs4fITiJwQLhBxg6zgBPdIR86F
         NoHtUMz5hh7WtZWorZkMSSOnD9FrNidwzmnaMYEvbi43ZBeCLX+Jf2deQOdg2KaWbRS8
         OGzOyP938sJRXr736PEdeE43DBcK8pXIre0REV2eINopgI4c5eV0s3+1sk4AQ9l4uqQu
         u3ps3c9lCNa/btr6Stkw7d6FBvj7kcoG3SMZ32t3xubZl737i0Y9gs8qyDKdzZmVPg5E
         lk9Q2DHEqG0U6yLZSOHUG7hZcKyJ4MRVQ8NSm9XkcaEpLaAcv54MvHVn5MSiDJXXDNtY
         Nepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762614517; x=1763219317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q8+4lDCVRNyl28CreOVSs/kCDViEgYG1unmniA0FUug=;
        b=ZusZBgwRh2DQwGsYdn82LXyUlyi84ruVZ9ZDpp1GHE7iSC4iDxKnugZUXUAm3JWOwa
         g9IARn9paXTuiLdrgYwGtyeLi1SNARAgltizfbpbjX/TzCjvorvMW3U4iUikOt0dlY7L
         gwjQQsRPegUu2qh45SWqCA3Z8J9gP3GZ+yR6EYiXaWGSj+0vLF3MJ7QZofxUdxZAnJJ+
         yRSV/Ows/t72+iPlIsPKRfyyMHqU08m+5sGg3+n9jjDC2GJB45f95MRt+aP6VEkdzHwI
         K7gHUqXIWFiWaCFeZ6ahUtEyVrC9DgslIchcwnrqdF+kZ00afoO8PCr5lzf5+xIUCXLH
         YhUg==
X-Gm-Message-State: AOJu0Yx9LLF0H9zlPpkKECq3KJ85LsBsc/5FJdqVvS8QkDUegcl91CRe
	ZDdCsV1hb09wEoYGK6/EeI2fyQi1R5gR/44a8nkrH8C/oeqhd/gCoBfMTssxwTa8
X-Gm-Gg: ASbGnctYLQW7OaWvTb4bSqHVMjGNFJbgPEqlR9esoVCXYUQIGTW7k3if8cTFcuXEOft
	wRtzoDPPDkmCm5WXao/glCpb7xeL4ulCYXd7Dnn4VJ/1HDS93ItVv7tBbDqRImk8CyffoYnN90H
	gBd2bXX0aDweedEOoW0uoqKdkwNpGRpETT+RsikUWA1VOr0a6vHPmVvzSjHF1rP0g3Y+c3Rcnaq
	ngTSbmBOf0VFcpCbc55P97EiMMMGdKocjXfUvM0Dk34p+02AWejlMp1chf7l/oV++mQjq11pqnb
	HEjiWrSnAL9IkGUyAQzuefaTPE9UoAR8DJRpt1Ky3hUQz0m7mLap2XzJ3aqbwHhg8KyvvszfJUM
	TAwpkdXx6+e1093bkYhuuMPUN6z7cULL2Gsx0by2RyGycMFMXrat6Ez20v3e8oxgTSqxeTN925g
	nVW7vULWpC
X-Google-Smtp-Source: AGHT+IFLFy/T+g3uKh82LMY06ycE9sg2CNirYypgWVsENS+v9A57u5RpiJZWnzsEVoTYnxrONPRPWw==
X-Received: by 2002:a05:6000:1447:b0:426:f40a:7179 with SMTP id ffacd0b85a97d-42b2dc1e7e9mr2257554f8f.26.1762614516800;
        Sat, 08 Nov 2025 07:08:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e13csm11869284f8f.19.2025.11.08.07.08.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 07:08:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/5] vdpauinfo: fix SRC_URI
Date: Sat,  8 Nov 2025 16:08:32 +0100
Message-ID: <20251108150833.3299165-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108150833.3299165-1-skandigraun@gmail.com>
References: <20251108150833.3299165-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 15:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121397

The previous repository was moved to freedesktop's gitlab instance.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb b/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
index a7db743239..f36ac5e155 100644
--- a/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
+++ b/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
@@ -13,7 +13,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 RDEPENDS:${PN} = "libvdpau"
 
 SRCREV = "d3c5bd63bf8878d59b22d618d2bb5116db392d28"
-SRC_URI = "git://anongit.freedesktop.org/vdpau/vdpauinfo;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/vdpau/vdpauinfo.git;protocol=https;branch=master;tag=${PV}"
 
 
 inherit autotools pkgconfig

