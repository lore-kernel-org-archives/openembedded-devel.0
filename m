Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.1467.1631345620731469898
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Sep 2021 00:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TJtBa9om;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id w6so2596660pll.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Sep 2021 00:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mpqpFXUCL56daRPyp7cHGGgVNsXS2MZlLuyKhlJeZfA=;
        b=TJtBa9omqYO8yfN2DsZKdqHx7JLOf7wtrZCLzJS7oATc7vkt2ECwGGSuX41hELjSle
         Aj7xYiw676sD9OTWFspEDT4MHobjNjB+diINMN+00zpGAQuYJcQwm8yinWyRxEqcEsm8
         Kl8WkmMmEOXU04+DA+KI/jY/65eCe2fYmfgJLfqfhVCzI3dqXUt692OQJ28Z4fjFAIEF
         PI81qFSYE1/4U+LBOZe90gR7aVxkn29qZibBqA/ImqIOA6vZLjdlcK9CjFFZtakmPXBh
         vSRih7wpNoQZs2SiT9nVqiAIv9ehVCmlMl2miBAnirvqEPq0O5qCn+V1Aed0KlSqX/md
         Q7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mpqpFXUCL56daRPyp7cHGGgVNsXS2MZlLuyKhlJeZfA=;
        b=e6GyT1OMdi8r0IA3id3Tej+xexK7AyVKAUCiqS3wUWXRL4Tk0dWJzRL7BHYz9ytJ5+
         fxlbY4IP3FR2vIZqZAwp9c6AMFHqS+htf9ywhtvio56fhVausHtbUwCIdm027PKxXb4d
         U6dMlo37KFlN/duSC6e3bmVIHImPQZTcWNggHoom4AgSB2cvAD4nQvy+2VROUArS6YLs
         VMxQYDu02K57yGakidAUsdAAy/YE78RCfFROA5pnVbznjeGIpIOCOiwIhTdZGt+KM7CQ
         QceG08plmODqT0hoQ+08pEo9BdyRn7bAeBD7lu2OXly8V1fmMGiguOeSyXW5moXTrrPp
         orFQ==
X-Gm-Message-State: AOAM531hSt378FPOpcwlMEFyPCu5XXMWEZIPFv0JT9za3L3Kjovvj9dU
	FzakFCEKAOEdLLOrCDFSR6LkICdL3poemQ==
X-Google-Smtp-Source: ABdhPJwDcLAJKhN8cii6uc4Vti2Ym+e+N72V2BHG0Q85VHNI+esHHYqv2umnYtPo6v3VreJLczG8FA==
X-Received: by 2002:a17:90a:311:: with SMTP id 17mr1744735pje.121.1631345619739;
        Sat, 11 Sep 2021 00:33:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id l10sm1078101pgn.22.2021.09.11.00.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 00:33:39 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/2] gst-shark: Define SRCREV_FORMAT
Date: Sat, 11 Sep 2021 00:33:35 -0700
Message-Id: <20210911073336.2642654-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since it uses multiple fetch URIs make it explicit to define SRCREV_FORMAT

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/gstreamer-1.0/gst-shark_git.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
index 9348fc1491..fe4bd37442 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
@@ -14,7 +14,7 @@ PV = "0.7.2"
 
 SRCREV_base = "50e3dbd3b131de2a39d3917576e8f834631ec46b"
 SRCREV_common = "88e512ca7197a45c4114f7fa993108f23245bf50"
-
+SRCREV_FORMAT = "base_common"
 SRC_URI = " \
     git://github.com/RidgeRun/gst-shark.git;protocol=https;branch=${SRCBRANCH};name=base \
     git://gitlab.freedesktop.org/gstreamer/common.git;protocol=https;destsuffix=git/common;name=common; \
-- 
2.33.0

