Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.21502.1611820060583739654
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 23:47:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uVR2NrII;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id kg20so6334169ejc.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Jan 2021 23:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RtFH0p2tj2dWnxYXdXWM3WOfn/BTcWxj+Hr57N5Xc6E=;
        b=uVR2NrIIW4sWcekL7AQ8E8LpkkGG82O6q/T9VGQmCwy/nEO1K9hZXK+Dtdd1e6882F
         sJVjqQ+zmWxYl0vo5YGAW7sPeBwhPzwSqzt32R0iXXQilopJoZ0bQI3F0sJ9rTjlliAg
         iaXUFCXMv5Ql6EpO+0uvUX4oGu4tw5IC4Bvd6CKVM5bFSbYHDS3wDfbwC/ZZpuLydZFR
         f4rxtXbn81nSB5H6t7qt1xleMNr5UNofo33hgPpnOPqxzm4LNWquQhz+Gie68DvrjGe8
         xLEImRvpcaRSwBNFkTXOhOcw9CQGirLwSi3oNbnZI4XC/HvaWgmHvdJf/B0Ridon6Mm4
         ReDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RtFH0p2tj2dWnxYXdXWM3WOfn/BTcWxj+Hr57N5Xc6E=;
        b=M/c/vIalhhxWuXgKnbMqrdjW6wQMbhd2PVYf0VBtvVmQu+hQaQNNEQ9gje8131DlRe
         TfBI7LadwZeFOhK4xqmj/20S4/JOKzQj5oYGBdn4PjCXAgyyc5GnSAiB1FsVela/nZY4
         V8rZ2u2fNsmftq6DOA5d6re6cR1GQhnpUbD8NUDogpkB69RqZv0ECLYW1PVIxtNFCfEg
         UYvr7vCYmME127fptAYmIS/AdjtKyIVOnH299A9CGLM1rB/0qyXvVtw0Kd9Upbk0sgg9
         ADuWAf8cPJGct3VJZN5CCtyaRxNpIOVl9qWgOYpfx2L7OMRQktF0iFXqWSfnpnf4+VSn
         OnXg==
X-Gm-Message-State: AOAM5307T4BQbFWUnoFmhnGtjlzUeqwAQHNSJQjXRdSFRGnfjEgy9eZn
	pxpQ9ivVOdS9SGeRA1uKHzzJLqVWHdFmVg==
X-Google-Smtp-Source: ABdhPJy3Kn0jG/MDi3O1UTj6jwMdKc8ySka/vNnuFFZw4JUEwzT3sSm7Ao3Jvcva1cbzE+6IOWUNPQ==
X-Received: by 2002:a17:906:af41:: with SMTP id ly1mr9471351ejb.491.1611820058827;
        Wed, 27 Jan 2021 23:47:38 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07f659ecbde7b17c1a812c.dip0.t-ipconnect.de. [2003:f0:7f07:f659:ecbd:e7b1:7c1a:812c])
        by smtp.gmail.com with ESMTPSA id b17sm2570850edv.56.2021.01.27.23.47.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 23:47:38 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/5] xfce4-appfinder: upgrade 4.16.0 -> 4.16.1
Date: Thu, 28 Jan 2021 08:47:24 +0100
Message-Id: <20210128074728.1631219-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.1
========================
- Launch applications as children again

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-appfinder_4.16.0.bb => xfce4-appfinder_4.16.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.16.0.bb => xfce4-appfinder_4.16.1.bb} (78%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb
similarity index 78%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.0.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb
index 39198306b..4b5523895 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb
@@ -8,6 +8,6 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "37b92aaaeeec8220ed23163cf89321168d3b49e0c48b4c10f12dc4a21fdf0954"
+SRC_URI[sha256sum] = "bfe3e9bd92695014ee74a2fbb7f5fd1b4c29cf043c4a11598b8958324c81e7ec"
 
 FILES_${PN} += "${datadir}/metainfo"
-- 
2.26.2

