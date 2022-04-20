Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2698C64E94
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.11311.1650478802942972717
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 11:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XzrjyiHT;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id h5so2355322pgc.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 11:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=keRQhn/Ziih4yAzkRhK2wnEVj4NjnPTJ3ZfdOMCR/4U=;
        b=XzrjyiHT+lW0z2xcw8d6/MeOoMkKgdPokhdWF1KkNd4M05INSVEVnFJXQKrrvSMYBQ
         CLOqVrHOh5u4HmVVP1vTqGyDcIiIBADqiOt5lNORzKhhR441Ejzz+Qtnown63QrRAUi/
         RrmG9yRSclMH2Q8+L5cHSfwjseylQ3ORTnIU07fb7Am0ddWycwZLLLSarvoys+Mz/Flo
         6vIEZmGMYyrwDWZ5JDvZbwjg2RLGDO16c6go/Uu8cbqUnjLP8rJFdOWH8f5T/pnvepv/
         km6Q9ltCeUEE5J21wTokksareCjRXcOke8vv4IWlus1qgKkb1FbQbH+rcOFAozwG919S
         3zQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=keRQhn/Ziih4yAzkRhK2wnEVj4NjnPTJ3ZfdOMCR/4U=;
        b=McCSn+bdTsRZqc/lxcxo/oDNtZmBDoW4Zwrxjvz121BqjRMhbnkOIDQ5l6eGbq0Ct3
         ksUian1E8QoOY3PLl7qcFByg7fqTSgH4d5g1t5Sh9BPb/FACiGnbmdkB7TSji4FwNO3X
         5lHKeRAgFwjRC9UfoJvWIIF6lp427+W0ERYA9kKGpN24/HoXGPC2GTh1+3w/DuoJwrES
         IKgINS26IKVBwG5yk+6vZRe1eBfuUuXqIQr3yzO9qFvbub/D9xc0HHaikvoXHaZCUWP8
         93DDoSCmYrziwkmOR/gHr3a5n/10QMuBqvWdwjeHjaGynzPcln/ApnndB1Y4bYEA4mGR
         i3IA==
X-Gm-Message-State: AOAM533mjl0bd5P8zqVNHOLlepPZK4piHGxPswr6bczSOzAVmeauh02r
	fqiiZMArrhRcJWtCojdQ7PXWHWTTtBmU5Q==
X-Google-Smtp-Source: 
 ABdhPJz3svjJRN1EV0RN2KxAk0K9T5gM2Fl3mgMcuqk9J2EMIAcfKwGwoqwA07dK5bj60b4kjwOZgw==
X-Received: by 2002:a65:530b:0:b0:382:b21d:82eb with SMTP id
 m11-20020a65530b000000b00382b21d82ebmr20651567pgq.215.1650478802049;
        Wed, 20 Apr 2022 11:20:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 124-20020a621982000000b0050a73577a37sm12859312pfz.45.2022.04.20.11.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 11:20:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mozjs-91: Disable strip
Date: Wed, 20 Apr 2022 11:19:59 -0700
Message-Id: <20220420181959.2435611-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96717

OE build takes care of this during packaging anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
index 9025e4159a..d0accfaae4 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
@@ -51,6 +51,7 @@ do_configure() {
         --prefix=${prefix} \
         --libdir=${libdir} \
         --disable-jemalloc \
+        --disable-strip \
         ${JIT}
 
 }
-- 
2.36.0


