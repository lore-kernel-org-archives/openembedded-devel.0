Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6294C4167D
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:11 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.1849.1652344924004989402
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=kHda6MoT;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.51,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f51.google.com with SMTP id x18so6279236wrc.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0uRDPkZcZCf6pTkUEXzD1JDGct+k1hhuP663fXUKq5c=;
        b=kHda6MoTs+kukOL3qpejDFMgym6T+qGnzrFzRuHbmWHCkacmk72jzko2dQ0AP75W/W
         +M7WpvUePiSbQfCEpGovW5Xx1P0fkzRlrUNSK6wtglHTrcZ7iCw99VMP2pTUSy972Xy6
         yigeaQzI0QjPlHO8ms54m/1BbSgTZyW6bZSEbjt6sU+4eEmaivCMg6EMWksg5fSZIO+C
         LR5vDCUenvO2uX+yMzHTI5g91eJkVM/Ar1EITrLkgZJkFTr6b89Yky4W4g7wOM4vbF41
         ZPeTZewN50Cf/9z7cqW/6mj3Mft9fDPCLP++4L+u05X0X+Q63StdMnV7j+2mPl5ksTT5
         P3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0uRDPkZcZCf6pTkUEXzD1JDGct+k1hhuP663fXUKq5c=;
        b=APk32nISwYSp4tfHsjdOFoJWtSU6FM5w26J1T1ondykWtX1tCyG309tM8WNPgj/HkS
         dYe3MqFkYY0QfHv8YLJlANavvtKg+vTmK22vCWHOw1chAotNSuO+/U5gcIQmHJqT/Hav
         k1qq+nR7ITTyiu/XWiNdOfscztCJBZAj3YOpRtGzd2+8SJzKwTUwEmboqHaY0gpW3EH9
         NcunFM1brMJ0CmNe0B3jPn2I0r5TdBeSldUTxMhdilSJtR5/1la2Oi65j8HYqgwBRS7j
         RXDpBsov/U8+YkyLVxlUn0HMlnwJWKfk8iaRfdUKST68lJE+d/tHy9pP23pCiPp9dQKS
         flVA==
X-Gm-Message-State: AOAM533+5e/DoKaqMBSg/YFzOLj+Fp4Vjstxp94bd8vye43WAeZI41RI
	bU4gY0Y802FLOAAPXOhSklyVVg==
X-Google-Smtp-Source: 
 ABdhPJxuZ4l9YL29lr/sY7U2J8aY0nooRZKRGLI4r729vHYEJTrjKEdWhHEc88U6XFHakW53fCAKNg==
X-Received: by 2002:adf:dfc8:0:b0:20a:d256:5b5c with SMTP id
 q8-20020adfdfc8000000b0020ad2565b5cmr25964460wrn.97.1652344922576;
        Thu, 12 May 2022 01:42:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:42:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 04/16] python3-eth-hash: new package
Date: Thu, 12 May 2022 10:41:40 +0200
Message-Id: <20220512084152.1388464-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220512084152.1388464-1-brgl@bgdev.pl>
References: <20220512084152.1388464-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 08:42:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97052

Add a recipe for eth-hash: the Ethereum hashing function module.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb            | 1 +
 .../recipes-devtools/python/python3-eth-hash_0.3.2.bb    | 9 +++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-hash_0.3.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 922a08af5..4b32c7db2 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -110,6 +110,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-email-validator \
     python3-engineio \
     python3-et-xmlfile \
+    python3-eth-hash \
     python3-evdev \
     python3-execnet \
     python3-fann2 \
diff --git a/meta-python/recipes-devtools/python/python3-eth-hash_0.3.2.bb b/meta-python/recipes-devtools/python/python3-eth-hash_0.3.2.bb
new file mode 100644
index 000000000..c9630b172
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eth-hash_0.3.2.bb
@@ -0,0 +1,9 @@
+SUMMARY = "The Ethereum hashing function, keccak256, sometimes (erroneously) called sha3."
+HOMEPAGE = "https://github.com/ethereum/eth-hash"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
+
+SRC_URI[sha256sum] = "3f40cecd5ead88184aa9550afc19d057f103728108c5102f592f8415949b5a76"
+
+inherit pypi setuptools3
-- 
2.34.1


