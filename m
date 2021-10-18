Return-Path: <liuxiwei1013@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC97C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 02:02:54 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.31068.1634522573170498966
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 19:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oA4JBVtH;
 spf=pass (domain: gmail.com, ip: 209.85.215.193,
 mailfrom: liuxiwei1013@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id e7so14459031pgk.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 19:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hj/nCdrZDrL7Hm7y3EnhNVGajrqdDW/qpEIpT+HPKfs=;
        b=oA4JBVtHWBi/jesdBuvTktCjgRIW0lSd7fxgEi8rOkTTrkCLW8NNm7uhjTvaGp5gED
         DDxzwDhr8Ho9t5lDubHZAChrXk0hCfs8f+lC1JTLKFNn2S2pN6X0j98DH8bDStSi+4Cp
         8M1qlIm/xF/JrJPUvEdgsYBif+CUQDEOxaorZr7J2dYOvMpfgCy8eVi6Cep0eHR6FH6e
         uveOEYbQZsru9Sc4LB7Y07GYJwyXdyrAPcC/ULXwQ5ouxPdnLPZYZRX6wdIMAqhjxUwn
         xpYLpxNaVdWJN7pfnAsejlRP95kIFKOvwxLlOzdb8Q/y+FhmTzJm+U/APKEOadlFZB+3
         gM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hj/nCdrZDrL7Hm7y3EnhNVGajrqdDW/qpEIpT+HPKfs=;
        b=mi0iyeB3bTp9OzOpK5TzuchhOZGEFdEE+X1gIiWbe1IJft8Mz0Czfu6ATXvww1baeV
         wioXiBVkMRCaW5d7hX53Emvxel8uPj0c1RUdsAU1I3TwiDupj9rzJjnajy/tOPm3ca6c
         TjBhqnccsvt62OZG1KJCULBefmyKzXuglvkMLKN3Uy+ZJOkgAHN7u/kzbg2ASsUgKJDt
         fTY8UtrxptuIEf2cRyMdXZAnbKg0KRFdS5V8jFMgnK0IUTPJbAe7agiAQQzykDQ/bbS2
         axrTEL7RHVx0PBymGkxWK7UKoRsuTgYYn3v+dqNak08uvQY+Kv2GIuRjXhsh+rKMIDVd
         QsNQ==
X-Gm-Message-State: AOAM5319aNbhITy0eK5tJgPNiepA2KC8GXfl7waoLExyoqdBP1vFjCQa
	ASa307Rt2uDAYRSbOXZzenBCcCg/fV0=
X-Google-Smtp-Source: 
 ABdhPJw44nLDQ11kEnDxSzaf4TjTuNy+3hT1eIcQN1eEsu2Jl9Iim0SBu65O+TBmQWe2RWAc3PdwSw==
X-Received: by 2002:a63:7d5c:: with SMTP id m28mr7829295pgn.170.1634522572516;
        Sun, 17 Oct 2021 19:02:52 -0700 (PDT)
Received: from localhost (95.169.4.245.16clouds.com. [95.169.4.245])
        by smtp.gmail.com with ESMTPSA id
 om5sm11196480pjb.36.2021.10.17.19.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 19:02:52 -0700 (PDT)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@inspur.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	joe@deserted.net,
	George Liu <liuxiwei@inspur.com>
Subject: [meta-networking][PATCH] Fix escape sequence
Date: Mon, 18 Oct 2021 10:02:35 +0800
Message-Id: <20211018020235.120033-1-liuxiwei@inspur.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 02:02:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93416

Signed-off-by: George Liu <liuxiwei@inspur.com>
---
 meta-networking/recipes-daemons/ippool/ippool_1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index 19fbd0fa2..9b8317d7c 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -96,7 +96,7 @@ def get_ppp_version(d):
         return None
 
     bb.debug(1, "pppd plugin dir %s" % pppd_plugin)
-    r = re.compile("\d*\.\d*\.\d*")
+    r = re.compile(r'\d*\.\d*\.\d*')
     for f in os.listdir(pppd_plugin):
         if os.path.isdir(os.path.join(pppd_plugin, f)):
             ma = r.match(f)
-- 
2.30.2


