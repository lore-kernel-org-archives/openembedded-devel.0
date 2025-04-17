Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53E5C369D1
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 12:32:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.7705.1744893159946085701
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 05:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kTNOlHkz;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so3810705e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 05:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1744893158; x=1745497958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fb2YGTtJaJZbjTn9vkArP06lnXf//XRlX3ypcgFYwNU=;
        b=kTNOlHkzpG+8Qle4DAtR2Cf7y6hCOYoz8vdcYG9tOyjK1eBgsFgThxFBStqahDUteS
         JBcGsF/uSgK0CeCc68h9HXx2MX4S7yEtXNaQHV7HBKZissBva/foUFYGKqJUdpQpdQ1o
         gPvH8+5sQ3MwKcbG4G4YdJ7t+nn0TtyU1MOMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744893158; x=1745497958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fb2YGTtJaJZbjTn9vkArP06lnXf//XRlX3ypcgFYwNU=;
        b=NhKQA312CrjT3x5vjl0kvBrAEPF2H2Vo/4rG6aGEu7PxfBEycucEQTfVCrTRPgJcHm
         h8TQCpevSBYeiBmnf1iNMWz/n/YVN76vgY5jKwzC8f+lRANdsC9sPsV6sQudqVUC0yOo
         OFwU98I8O7lgyZdcnhlwnYyzTuMG7LavLn5zSzD4idMeZuWvznp/IKQ2Nok3G5L3JQPF
         yYioLGEf7r6fUaXtWlY/wxxjlKouT1QxZsUE3A1TwHubAzKjQrSl50lZDJL926OwTsk5
         vp7nm/jZ563SNpNZnvIly9mQXAFZzFxng9YSXGigudp2XD234o+Pr3S8a+ytsSY/KKBo
         0aTg==
X-Gm-Message-State: AOJu0YxnPZIazb8dQ0yg4YDV20h3rPEIKUqDBjBGPGNFp5mmPOH/Uo/O
	DUzb1NX3pQjpWp4N8t9dXjQVrIHfIX6bWPfmvQoFDnGjyp6UE4RxrTU1nA81ZLEYOeJdP1OZSXF
	n
X-Gm-Gg: ASbGncswxREusFEJpGvA6uAPoUBdvR5ADL62VnM+vivimWG/oIevErjYI+niz1Jb8Cl
	GdSe1tyDOlDMMgvvomN4kj8Pe+aEfQGsT3WxV35oBP9U+qAcqcU7cj+oHeQQOuIBMp3UuGumnRp
	RaMNaJJBRW6kb3dVxrHmNiorFUv5X2fTOwJcKTXcZAiaLL5IC4X+geJ7bX/BC03N/k++qjEbjmW
	0xTdMEzTE/dc12Ze+sMuzSz4TgVcZNVBfSKfAn9jfAFxmxgPISWz6GXxRxPZBv5aW+3ZMqnRNow
	QnxUo8KwwupY7SYuLGHbZN1rnGrdXnj0nrfjZ8CsHZoa9QbeQIC4Uuc=
X-Google-Smtp-Source: AGHT+IGCxDJ8Oxh412OG4mAGLzUn9YrTm07nOxfNSpBuT56R2EidU4Bv/zXKqJ+Z7GqV53eGIAPhMw==
X-Received: by 2002:a05:6000:1acf:b0:39c:1258:2dc7 with SMTP id ffacd0b85a97d-39ee5ba050emr4969513f8f.56.1744893158001;
        Thu, 17 Apr 2025 05:32:38 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96407esm20208804f8f.17.2025.04.17.05.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:32:37 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-eth-typing: Upgrade 4.1.0 -> 5.2.1
Date: Thu, 17 Apr 2025 15:32:30 +0300
Message-Id: <20250417123231.3063208-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417123231.3063208-1-leon.anavi@konsulko.com>
References: <20250417123231.3063208-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 12:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116935

Upgrade to release 5.2.1:

- Set name as optional for ABIComponent type.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-eth-typing_4.1.0.bb            |  9 ---------
 .../python/python3-eth-typing_5.2.1.bb            | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-eth-typing_4.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-typing_5.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-eth-typing_4.1.0.bb b/meta-python/recipes-devtools/python/python3-eth-typing_4.1.0.bb
deleted file mode 100644
index 4491de979c..0000000000
--- a/meta-python/recipes-devtools/python/python3-eth-typing_4.1.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Common type annotations for ethereum python packages."
-HOMEPAGE = "https://github.com/ethereum/eth-typing"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
-
-SRC_URI[sha256sum] = "ed52b0c6b049240fd810bc87c8857c7ea39370f060f70b9ca3876285269f2938"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-eth-typing_5.2.1.bb b/meta-python/recipes-devtools/python/python3-eth-typing_5.2.1.bb
new file mode 100644
index 0000000000..727a19aab6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eth-typing_5.2.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Common type annotations for ethereum python packages."
+HOMEPAGE = "https://github.com/ethereum/eth-typing"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3ef06eb4d4373222e59a338e2eb9a795"
+
+SRC_URI[sha256sum] = "7557300dbf02a93c70fa44af352b5c4a58f94e997a0fd6797fb7d1c29d9538ee"
+
+PYPI_PACKAGE = "eth_typing"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-typing-extensions \
+"
-- 
2.39.5


