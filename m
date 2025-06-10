Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41884C678DA
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 14:43:17 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.88434.1749566592658025382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jun 2025 07:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sx3i/fI1;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70e78e04e48so43002667b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 07:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749566592; x=1750171392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr+w4IymTBKfORP8+NBjmwGr9Fa3v3bcGUXiIg62c5o=;
        b=Sx3i/fI1ikk6Tw5yQJ5ZfzY0eqTcVMD7fa0CL6djz4Wj7ERQPjqF93NaO6zFZk5g5D
         4NTjvW2/vUTO4OitRqTunwM00V3vM6I0jNNwQGm1eUSVM81LsYOAr8TcJ665ZwYrXtzK
         ChrJ+q3HyGWAP6RkjsWuel1VREu/L2mj+KWoDbpC9srFBwliKbls6EV2xPR0YdzJ+7VS
         jWHnsszlwCqkZL2ZJtHQsq6pYRM1+l0VLTRE8M6ZQ0lat/BJOpuD0Yk03SCYvcTVB6hE
         szgZ9huXQ8h9Mp1EIdCWVM9V02Q91WHOu3YDJx0IBT29R0pBaAI62qAbQm67HYE3kM6U
         EolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566592; x=1750171392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gr+w4IymTBKfORP8+NBjmwGr9Fa3v3bcGUXiIg62c5o=;
        b=GEkGSssUOELowd78jtaJ9z7pK9nyv+dW43xKvn+UClNpF3xUNpFAcjSLzaSqsuzovh
         HTzeaWV6nuC+vm9JIwW46rOda8NCLlm/b+3tGH/AHT7BnT8ftGOn34Ruz4FcB1k020Dl
         Si+qS8KFtmGmAA0yTzXvCGhFQ4uPRCxRsu4tBHsifuiZaz1s0jd0+Mm4Bhi9XsZU5Nz/
         2TsO1nLRtsouLduZ8WT5VCjy4SF0Dtpeer+grWL9taGXHJD9SR0xk0m7ljzHEzjMC2aD
         MGdmDX03JC3SD76hi5abAki8UsPEo1BovhgGM/0WeBPcpL02iGWwpP52M+8Er56j19aS
         2cCA==
X-Gm-Message-State: AOJu0Yy6tj+WdtZb68vLjP7K7mZuogOnk6eS+f9oXcw/wwHs3hzFmrtX
	kTHjpcJaYZkmZ7mJfGdIHRiTw7sDe33cQ0Iou7Syt3pcFCj6v5BNV575YpLHtBBf
X-Gm-Gg: ASbGnct+SDCqfHtqhX/NQ4D6z8BYy38kme7ihd8fKQR2a3Hwo6NFs/2PNoZdwYxGtzy
	g24hbG70XFw0ScMpSUXza0/ifiQ+IrGQb+AplVJ1DztOY9179SPwjYM6a0diIbh3qKGH6WLTcJm
	zI8IVl4sT4UOTSEHkovaQiOKtJVGLvfcLoJxDP//i56Mih0LnWktsZfCS+cRIhmlnQWePSOwEc1
	DUAmzFTMDSzS1hYF6axGLY7iWkhJO383iVQIxQdimGRWnsFrOJhB/06Ryhv6HjjxeSjr51xvgWo
	U2UANJ10d9JB/mnYCQNo6htH1jgVH90DFZipCTpIv7VXrK7TVq/nm/Nks4IdpbfiQ9ZSjPT14Qd
	FqgM+GprMOyq/NgTUQs8c
X-Google-Smtp-Source: AGHT+IFWMqxfWIe/tjNOzbna6zvxYlwnP3V1srdTO2k0CnkOt1XmoDACLCqN2nezLYbQFG1XBFQ40w==
X-Received: by 2002:a05:690c:1d:b0:70d:f237:6a53 with SMTP id 00721157ae682-7113fbe7a11mr2483497b3.9.1749566591188;
        Tue, 10 Jun 2025 07:43:11 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f9a0fc34sm16379947b3.97.2025.06.10.07.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:43:11 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 2/6] xfdesktop: upgrade 4.20.0 -> 4.20.1
Date: Tue, 10 Jun 2025 10:42:50 -0400
Message-ID: <20250610144254.884143-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610144254.884143-1-schonm@gmail.com>
References: <20250610144254.884143-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 14:43:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117866

Changelog: https://gitlab.xfce.org/xfce/xfdesktop/-/tags/xfdesktop-4.20.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../xfdesktop/{xfdesktop_4.20.0.bb => xfdesktop_4.20.1.bb}     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.20.0.bb => xfdesktop_4.20.1.bb} (86%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.0.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb
similarity index 86%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.0.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb
index d3360b293f..a24ed76d53 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Xfce4 Desktop Manager"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfdesktop/start"
 SECTION = "x11/base"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
@@ -21,7 +22,7 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "227041ba80c7f3eb9c99dec817f1132b35d8aec7a4335703f61ba1735cd65632"
+SRC_URI[sha256sum] = "acccde849265bbf4093925ba847977b7abf70bb2977e4f78216570e887c157b8"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.43.0


