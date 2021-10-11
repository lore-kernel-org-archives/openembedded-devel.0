Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1A7C433FE
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:41:59 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.2783.1633977718014231421
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K+Bghum/;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id i12so46437480wrb.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UfnB1lR6csW6RQ99j6me+D7P+UnwWh4rLTuBtws3i7s=;
        b=K+Bghum/dyE7dqlE/mCh3PwGQfPmDLRutJ3DR302tKgT5/nkrsbecg1uy1tC+e3Cup
         4d3T7T26xRmG7tJjNmD2YtSMNoGlLZoLmvCCSlN2rfRklOTtfy69w+hybwHa9RemTv1u
         hRcQ/Gjz5BHjeMDM5B79vv60DU0vI8SYh/7HSLGEDKHfr4+E7Y044bUZ6PmFU8DoAUoT
         dGYshDvW/JVkQjtdDYufdfi2HTK6TUD/ESeNHAXLZfjMcvAQqOupftnspkX811+WLSg+
         5TK/I7aD6XaSBgaKN3qrlGgr2hf3bjhtS8t/C1dn5ZGQB0VJpDYSMGBrsi1y9uZdf/O1
         xq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UfnB1lR6csW6RQ99j6me+D7P+UnwWh4rLTuBtws3i7s=;
        b=2aN7Y+EdwZeQZ6yfK5htimWvjUGyZ8fgAfmHR1yT4zgWuXgAsPghffYQEpfrbXbOvn
         YFsrZFv5sWhmT6Gmc1sjOdGUXMzjfCyI3wDV8IllVHhpuVmuwMEDhVaqv7zIuO3q60aO
         8qIZL1ltMm4E9/4qq5vnELrVEXu/mVYhkGky67u8SAyatPId6vNjmlA1ICMbhU+2pWvg
         atvUsoZ7V7sZ8LR5b0r3hPg6pxaGlP50fApaZNqwHLLRQXk36qvtvQ6q8jY7CT63YQsM
         /Pl2tyJ/tv/XM6RyXgKcUkOs7V+JneT5gZQGWXiKrx8yBMz/ZTDSxFcmRkFgRULTSZ2b
         Gp5g==
X-Gm-Message-State: AOAM532dP+YGBn7tDhPNooq2jRpUwY4Rd1Ph4nvM7yriZagXJ75yNiEe
	xpljVqNSlSWCQQ2zfJcaNtSR81K1X4h5Fw==
X-Google-Smtp-Source: 
 ABdhPJzCQUXoVTA0R0mWJojr8LnDIn8O2y1d+pIu4DdngYaU/OcabNqELOd6P5w8NRQx6vlgkfsbKw==
X-Received: by 2002:a7b:cf29:: with SMTP id m9mr727086wmg.64.1633977716671;
        Mon, 11 Oct 2021 11:41:56 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/24] nodejs: use -fpermissive
Date: Mon, 11 Oct 2021 20:41:30 +0200
Message-Id: <20211011184140.653609-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:41:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93228

This resolves openssl 3.x errors until upstream addresses them properly.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
index 471501979..e44398721 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
@@ -128,6 +128,9 @@ python do_create_v8_qemu_wrapper () {
 do_create_v8_qemu_wrapper[dirs] = "${B}"
 addtask create_v8_qemu_wrapper after do_configure before do_compile
 
+# Keep until openssl 3.x compatibility is fixed
+CXXFLAGS += "-fpermissive"
+
 LDFLAGS:append:x86 = " -latomic"
 
 # Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
-- 
2.20.1


