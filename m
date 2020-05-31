Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.18027.1590941813278282314
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jynCn8L2;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id m7so3265926plt.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GL7KNzWBnsqR3c8otRoqavVjKgtEk3Xvj8f0k8W6Rho=;
        b=jynCn8L2Oqu72QcLnCYHFOQhfeZHpstWGkG6FFmTjItU/kH+5nhZEYuOZ2rO8whfi5
         IY9wOUVdmz5qDPLdYXUbiRICHHU/ONE0V4obmxukN/VVXfqg4G+33fKC8pZdNLbVf9O6
         hY3ewGKZOpquV3IS4mNPM4AEBUkEabxlukg6PakpXEDsHMa56NSB4oGMfdqsBQGVJqx2
         Z1qO77vQPl+CtxvVZogihYnShosEOoOLGskWxR8myA+tUWYEpPt3jVbcItWt8t7ChokD
         AKpZ0E+GkH6vZvFlXANd0SxS5NppgYfTQFZ9oCtX01isTrpSyETlI6FHg7i0CW1SRJpv
         tN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GL7KNzWBnsqR3c8otRoqavVjKgtEk3Xvj8f0k8W6Rho=;
        b=OudjnzBzp6R4PB1eD8zk0Inp7hdzEfYh+g8ZWVOycMfrA/lhCZEkIyWBg7U88Iwvx6
         hKQbM++8q3VSBVmUeGBFDP44QVKjH5OvU5ra6zDB/kWNFuuIE0UhowO+hhdrqpIIfGT/
         SwUufClJ1PSuzIcJqIXwJ3V5f64Ijz6rdDpBel6DEDH/S6OwBPJauyVPUkmhJ8I25GNB
         elW4zSUaeJfGHbQ1dbZa3l35bZHlidBXu+Iol0x89U82Ah8NlhmT5H/LTEJs0Q00qdQF
         ZxLISl2az5cc7cvpD3ajT2rP2WZaXuIt9fhCtbrcpC9w0Kxnw3zOPnvfDIFWIaVOhLaz
         bO1w==
X-Gm-Message-State: AOAM532lUl8XbL17mg3ACdQGxkfculSvtilYUmJVtzKlXg+d+DAFSXHZ
	K3but+CcDS5ngAKsXpinpWF//eQo
X-Google-Smtp-Source: ABdhPJzgDzpTGFZpxRjKWnhaiu3YDds4xKe+l8leJIO5A43Vw2nRAgJ5kpcPkylSWETxhinsuskjNg==
X-Received: by 2002:a17:90a:aa8f:: with SMTP id l15mr20188597pjq.211.1590941812729;
        Sun, 31 May 2020 09:16:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:52 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 23/35] kea: upgrade 1.7.6 -> 1.7.7
Date: Sun, 31 May 2020 09:16:10 -0700
Message-Id: <52a22f4fc2b0103d9793427d4b182bcfd7e36e5b.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a5d7311490e12a296241bcd8adb0090c226842ec)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/kea/{kea_1.7.6.bb => kea_1.7.7.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/kea/{kea_1.7.6.bb => kea_1.7.7.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/kea/kea_1.7.6.bb b/meta-networking/recipes-connectivity/kea/kea_1.7.7.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/kea/kea_1.7.6.bb
rename to meta-networking/recipes-connectivity/kea/kea_1.7.7.bb
index 4e221c39ee..e25f8e6fb0 100644
--- a/meta-networking/recipes-connectivity/kea/kea_1.7.6.bb
+++ b/meta-networking/recipes-connectivity/kea/kea_1.7.7.bb
@@ -14,8 +14,8 @@ SRC_URI = "\
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
 "
-SRC_URI[md5sum] = "26f48997a37a670a406d5020ce64a7fb"
-SRC_URI[sha256sum] = "1da3d50e0c8e92e1aa6d66100b5afd7b93ba2c50b0a4ea114fd9dcb8be982ca9"
+SRC_URI[md5sum] = "4f8d1251fd41ef2e822a4eb3f0797d46"
+SRC_URI[sha256sum] = "0bba8b045672884a928ff4b2a8575ac5ba420eb6ba47a9338f1932bc38dcf866"
 
 inherit autotools systemd
 
-- 
2.17.1

