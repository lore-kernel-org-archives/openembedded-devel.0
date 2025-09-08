Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B258CAC582
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 21:53:29 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.6735.1757368023272833605
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Sep 2025 14:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OzHnZBnD;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: rmmuniz@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4b490287648so82739321cf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Sep 2025 14:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757368022; x=1757972822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPYtidlTrQT1VkdbZHVNSL0vh6JBxus5SCwXNeVJw3A=;
        b=OzHnZBnD6SrhDGKPBVUOvvZ4M08MHi9GyaHUMJkr50OI4bQi0YGg2QuER7FwoC8c0j
         v1nIatMadXqfsBJE9/S05SZYkspk8CXBHJnmj6QcQw8NH6mHsiXHQaDoUAi2LIG/Lbbj
         uQjHSg+cSGRRtz3/RAwEphg5lSUuxu1c5g9Aq7I1bbWgGc4ufGJuMrrA7akqUEGW8oFK
         noIDZQ8pEKr7BMMhdENDZ4GhTOqbAYcBBNo/L5lXxMLoWzzvUUAoN+2R7sOG1NXf15E9
         nJyNsVT0N0RrtgBOYgaUYAEojTcVqk8ODBHfRvc39o06aSzsamlqVn+VipIpC3xxxsJB
         In8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757368022; x=1757972822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPYtidlTrQT1VkdbZHVNSL0vh6JBxus5SCwXNeVJw3A=;
        b=NPKUMeVUrOUccvkPLaTVaObNrGRsS2X+ilwajQSUw3vQJliPNJcGSBTHIFUnybu0Se
         NqCwfArIsRyGW/R2Jw7SIZgyleaR/ZsfZaS9fIn0PIdPPhshXJECFZRjjBNfJqpzbLZr
         FvHBc8BNiLVRghbo11062SsoQv3+p+Mrl+yvT6Z49hQMGulHkJMYQaaSjGRnvChoqDqW
         s6nUR4UybO4WhvF8FvZkz1q+t9WuRcOghWil3XCAk3LZ/WUE+NKyMm4ztwhwg9YlNTjk
         SeuCho5b4loeHWXvJSFspG4wfwE6psLXeog+2P+GAbrJpbep1Xs+6g+neDHhKtpzhdZV
         KekQ==
X-Gm-Message-State: AOJu0YzY9fo5jQbhE0JOF0/i8Pn5RAEqo7o5Z/U+ccSxHCRR7ADqmWRS
	LaVzwZn2LXSeUDqK+ImaPM2EqwDLk/7EuEpdpvKsdNdKcONMitNwAl8dkWAF7BpO
X-Gm-Gg: ASbGnct+IN83YGlhw7W24PZpn57miyNVGG5K4FmeABFwe+KmfsbCihY6I1w11QuT9iZ
	QZvTeTxZ3t6/CNR38KzXnE2Wxas4YavIWvNejxMrJut1kjyuvnlSXFSsuGUdgSVHRlwajUX5J7F
	hurRT0faHgNhu7vu3AdhQgjyGbtudsIRdMrTQS306tq7HDIIFz/IF+9KhdScJR9pmvs/epgD8Cj
	/yfcsg0Ak4mSCJTro5I1zZYlueVlgl6ovl4h+t36xJnT6alvqrUELzn5A+6xdHJHdwfyfZuZFLX
	2dKcist5j72vWTAqdzIN6JFyebV/bfS0ocrneF4ViGi7rj0W7iyfSVRHl6sGCxvP2IgQijxxit7
	qkhftl7UVnnmt4y6/hko=
X-Google-Smtp-Source: AGHT+IHNZHUQF4p9jylgf17VmFvINr1/VamN8iUYzrQfDojFOzEwDWjf/4kdKD4YesA8baq4CGA0Cg==
X-Received: by 2002:a05:622a:14c8:b0:4b5:f75c:156b with SMTP id d75a77b69052e-4b5f83ae156mr107409581cf.24.1757367599002;
        Mon, 08 Sep 2025 14:39:59 -0700 (PDT)
Received: from rmuniz-SER5.. ([64.228.161.9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b61bbf54f7sm680501cf.47.2025.09.08.14.39.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 14:39:58 -0700 (PDT)
From: Rene Muniz <rmmuniz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 2/3] python3-evdev: add missing uinput header
Date: Mon,  8 Sep 2025 17:39:46 -0400
Message-Id: <20250908213947.481697-2-rmmuniz@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908213947.481697-1-rmmuniz@gmail.com>
References: <20250908213947.481697-1-rmmuniz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Sep 2025 21:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119337

From: Yoann Congal <yoann.congal@smile.fr>

Without uinput.h header, the evdev module can't be imported because it
lacks the UI_FF* constants.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
index 28c8ea4bc1..dc777cb987 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
@@ -12,7 +12,7 @@ do_compile:prepend() {
 }
 
 PEP517_BUILD_OPTS = "--config-setting=--build-option='build_ecodes \
-    --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h \
+    --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h:${STAGING_DIR_TARGET}/usr/include/linux/uinput.h \
     --reproducible'"
 
 RDEPENDS:${PN} += "\
-- 
2.34.1


