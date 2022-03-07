Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252A6C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 03:22:34 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.22421.1646623353147056189
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 19:22:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xk+so2+z;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id e2so12582256pls.10
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 19:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fyMi9m9PKkbdc7fRQm3trW3o7MsxGHoaB952fFctxKc=;
        b=Xk+so2+zibn2zCcumvIOjWJ5bREKDUNsG/NAdeYgE54N707W+lBUy3xCq9uuaItYUE
         omyGFs3YkTuLAJzlmYOPBogtLny4BtsbsYf0mz4LVCS0yvSp9CMSmvV3qUpypuaksBjA
         ElwPN0RfOeGzDxt75XSQdn1hVBl40cKDEys0y2F1NWZC9l3HAhfceBCB67NOvnMeRvLE
         8bm75M0+nobbnjsYRXHiCPfd2ndaWYADJdEDHvSklQqgv9djRD2CejUEIz3Si6yj/ui1
         Dc2PX9krBytDCwfyrQz+zSgLR3fQApmUcB5FXjHAfMUXpXMA3yT2f1f9oR7DrVVR0GQS
         IfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fyMi9m9PKkbdc7fRQm3trW3o7MsxGHoaB952fFctxKc=;
        b=vW7qLDbCH6ZvMrnB/Cs8Rbfndkcth3tkwm/ZT6kUE2bS5hKO4YcpZzhMkl5ElYnNp/
         pwwCuEr5An7upYqiEUU4xNDUvr9pFDqCroC+CktYSMVQyuwOMuxbgEXshARveV9gMk5d
         1v5U51953NVHk7LXvtldS/U3QIqU+2qiBIvQ5CQG8lL9kbVnxhs+BkizZMS5Y56VGq4k
         GYfM112LZTNFq4JV4GgyR4m+IxwBgg7FVsA25bZ5trMJ4M0k2CVu1HBoFv6gQ4CTAOXZ
         stKPwntkWWw9za/siAOXHG7/rlmJsS/h3TNI25wNqC0n+/PA8gsMcbpSyYzzgfB5XzID
         NA+g==
X-Gm-Message-State: AOAM533PjS1SO7WXE6N5FPTf2ibvY/4ui8gY/nZnXTluAuCWrBwXDHfL
	hYFlD7BYWoHs1aXfV0MddTbgPRUzH3llag==
X-Google-Smtp-Source: 
 ABdhPJzjNLGBQLitdPTbp4jPr9usJpVdncWMDyYf/LA/ZWM3OL0FNMAw8u6jh15lN/LcnOFX4T569A==
X-Received: by 2002:a17:903:2303:b0:151:d3dc:42b3 with SMTP id
 d3-20020a170903230300b00151d3dc42b3mr8438375plh.85.1646623352438;
        Sun, 06 Mar 2022 19:22:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm13509606pfh.46.2022.03.06.19.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 19:22:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] packagegroup-xfce-multimedia: Check for x11 distro
 feature
Date: Sun,  6 Mar 2022 19:22:28 -0800
Message-Id: <20220307032228.3555244-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307032228.3555244-1-raj.khem@gmail.com>
References: <20220307032228.3555244-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 03:22:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95830

Parole needs x11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-xfce-multimedia.bb            | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
index f925864fbd..93e5bbf71d 100644
--- a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
+++ b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
@@ -1,6 +1,9 @@
 SUMMARY = "All packages multimedia packages available for XFCE"
 
-inherit packagegroup
+inherit packagegroup features_check
+
+# parole needs x11
+REQUIRED_DISTRO_FEATURES = "pam x11"
 
 # While this item does not require it, it depends on xfmpc and xfc4-mpc-plugin
 # that wants mpd which does
-- 
2.35.1


