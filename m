Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A3ACD1288
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 15:08:48 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7237.1762614519225246679
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 07:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tk6anfVo;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-427007b1fe5so955235f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 07:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762614518; x=1763219318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfVfG5KcgcGHSraNzhEvRbQm5GC1fgeSKDlBLgSLcvs=;
        b=Tk6anfVo1y/yilqtJD2Y4Ichp4BddQu59rsN9ovv6jUYXnJfyRh0DmIiFfTIkiU0IM
         nT3LSGsyjc0u9c2UNa7Q1SwBYe2B7kQY64W6F5QQub6tAAyQs8GIXlufVc+GLup0ygiF
         JMvtDtj7jG0Le/zPWRwJXZtJwLUmlM82IZSUkAA2L9WOeMXluovzQPVsdjUhdu82jYn7
         ACXyrSHZ+Bb13s0vifinzupFR4xaaUnRKbRLJ/N6JSigg/tdueMFbU7f46DUkscDxONa
         myzB2NRlx5rnPHizSw+kzNlGVXCNlQJOyiejq0qO9OgfGR7a5/A+0FI3ctMCfLItq+rI
         syhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762614518; x=1763219318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RfVfG5KcgcGHSraNzhEvRbQm5GC1fgeSKDlBLgSLcvs=;
        b=OmofNHmHgiZ0LkJy21NB9avrnLbrFV3NAkkeHcwHJxnqVR60WxxgXnaA0MfHEd60lb
         65Rb2JXinrS+atxDybqELfbz1wM+nOD7BsHnmWVgaUW841FTUlphV5Tn/PzwB4EN9vb5
         DGw4vAMxiD98wo76jO2HSlL/kxKJW/VF4AvQ9joWGBmOIMKnYAe68OTZVy0ImuE7DawK
         O6KoVJDMXdcC6XYS4TQBJ2MGe44Uk9GGI9Thj9UTiIwyyUlh03SWll4t/QnFxbPE6snZ
         GtTDCdUKLHMjMsW/ncggaStsBZH0fYacCXQyPbH5SLc4+KsuEP0/5SGg9rFC4Pc0qxSC
         K4Vw==
X-Gm-Message-State: AOJu0YwOUtEDYQP7A/nGDhKZWcPpyCcn5V/s/MpIlN2Tn8XkRyyREvr5
	OeaGiQBBoZ9euT9ERT1g0G61abJkdZSHx9u5xaoECkjIeh/hNXYF5lAgJyxwdClJ
X-Gm-Gg: ASbGncs/sgJk1ViOHByPZRaanoznbrByBAdIpk8fbYWMxAjlGDhcHN4BB7V2aCkI3RY
	mHqyESWOoJip95icDcjNugh2EICJu+Hx6+Hxr9c0JdpTxCdwIdwuxgI1JNOFpiGjqiNMqV65bRM
	wHRzZAxoZVFpfsQGtEmBJrIRbkfTde75QRkBdydXaylvn74aw/SIm06vRADgFqFUtC+ha9bxBkk
	kfARgi9B1bzfa/1nKhmKYKemN1Sjsl6frwpD0WEX7h10CMqw8NHu5wxetVE9Uw7eNlr9NeWcmgN
	tjpafnIhZVq6Ak5ooZ4Otqk+gWIk7Pvcq1IkhN6CN4lAfnykI/VOYlDLd7oIvKFdLFL/qtc78sG
	9tezog/gt9zEWsEKe1B227j87aJTzyBuZNjKybIKpoVUqjviytXH/yWYD7s1QZ4puBs9bIHpu4T
	14643TKsMC
X-Google-Smtp-Source: AGHT+IEOBb2WmQfPdArJHMgnK5eTB7vyH/cvUjIEMLFqW/OP8SKMzCNoS6QbVEm1KfsPhufq63T/rA==
X-Received: by 2002:adf:9dc6:0:b0:42b:2e39:6d58 with SMTP id ffacd0b85a97d-42b2e397490mr1480945f8f.51.1762614517572;
        Sat, 08 Nov 2025 07:08:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e13csm11869284f8f.19.2025.11.08.07.08.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 07:08:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/5] xf86-video-armsoc: fix SRC_URI
Date: Sat,  8 Nov 2025 16:08:33 +0100
Message-ID: <20251108150833.3299165-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108150833.3299165-1-skandigraun@gmail.com>
References: <20251108150833.3299165-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 15:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121398

The previously used repo was moved to freedesktop's gitlab instance.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
index 8fd2ae2e84..d150457fc1 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
 DEPENDS += "virtual/libx11 libdrm xorgproto"
 
 SRCREV = "8bbdb2ae3bb8ef649999a8da33ddbe11a04763b8"
-SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-armsoc;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/xorg/driver/xf86-video-armsoc.git;protocol=https;branch=master;tag=${PV}"
 
 
 RDEPENDS:${PN} += "xserver-xorg-module-exa"

