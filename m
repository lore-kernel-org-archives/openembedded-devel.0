Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92909CA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 10:28:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.35607.1756981679510378037
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 03:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LQwDfvAz;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45cb5492350so5768185e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 03:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756981678; x=1757586478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/FJiCCaigpg7HdWmrBAKYeArlBn4c0CJqOEi3BYeyk=;
        b=LQwDfvAzkq2h8SL5CT+ckbprTBf81oNIcXALvnqCpHYSXd64mVyZQAIi83TiK1F1ek
         47/+SUOXCoYxihi1k3Lrm7yqcfAbZYvNtylj33B8c4a1yNeVXd0HojxPdnpdPkTLDCmQ
         cW0yXVX43AoMUruabgpKGMArQvivjvjhfg3Y4i9lbn+VWYYISbXt2uymVkJ2DPZSJHUk
         5akM3mb/Za2lm3wmg1wlpwnrLaCR3qOUNebJ4i2Ll5TCBy6DBkHf5U4yJXN+WOJrmUo6
         0j2hngoMFUQJxCqI2d+SSrH4CUMGdwsn59h0btSjSay1oQKI5m49m2cFAo/XdrkThblQ
         w0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756981678; x=1757586478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/FJiCCaigpg7HdWmrBAKYeArlBn4c0CJqOEi3BYeyk=;
        b=Zh+mrIvbQmaoG7gOS6zIM082CaDo5r6xCoE3hv0MmQM5VxleeeoyddkyTELm0aJiGM
         wi3sByua+UIub25DaMPyv+8INzjVlGgtlKc/V4pcUvDSAKIo9ykneZmECCzetX3dLCOa
         IeD67OfQsWAVnwKuAuLqo8+5bYPmJjkOwE1rRyuoVXzezd4PAoaAxa10GF0JrzAAgkJo
         aczbZ4eVIZOQoxToY4KytnfHu8ay9dODHdRY3vlsat7TGq+GrZYZc8f0BbKfNIcf30f4
         SF3iaSN4kC9nd+Lf3v7+8Qe7744UovGmf3+rNOwoqc7Z3hb6f2EUQJ3EUmRKBGX92Nsy
         Lalw==
X-Gm-Message-State: AOJu0Yzs9RyI38McZRFuyACz3mL6mq5vc+tTdaTAGkn2WXQWdO71q6Wt
	FZ4cJuZQsT63Xaq88w8uMgS2rOqmrf1oe42ukQxj9zHCJAN+AS5uSV7Ciapb7w==
X-Gm-Gg: ASbGncuL/M7g4ukdnTyA/RVqxqLpZa+n5TQ/1eC5BR18UdlGHgmA5bi/6CIS0USQcPk
	QKlN4y/PMRwfS0P6mvR8qu8eYJvQbgA2vLtQH0ydV43eSPVwV9rPuebGcHA9orThTaT21RaAmiF
	DfQJIB/4LkxZVQwebAg7dZE3G1sqh5UYm8N6zHL1jdif5QwjOr895DiUvrET03iUue3Y3nvRPxE
	tU65l0yeH9J4V5VKe/XtZK29Wq5o/BM4feyCsn7ful0StUkqY/TPkhNd2Zm9P/soYxmOskRc/PD
	mIFqgX8e5mHum3FeL5rAv56Lhnh9RNZBTaeE2JglzrkItWBeiHer90+Ud/MoA3adks19mYPkVSs
	dRPx6Oi5Ryglc4x8zDs+6O2SBT5kbHJqDEbAUra57mo15tJ/T298Urws=
X-Google-Smtp-Source: AGHT+IFPBvohcao8Y4jG/zL42XyPp3wxDE74dMetwrrslxeVLdKG9gUN00jvsZZRwPxPPn+1M/4ygQ==
X-Received: by 2002:a05:600c:354f:b0:459:d6a6:77c with SMTP id 5b1f17b1804b1-45b855add8bmr143752015e9.33.1756981677300;
        Thu, 04 Sep 2025 03:27:57 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd05faa9esm14925335e9.3.2025.09.04.03.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:27:56 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 4/5] python3-nodeenv: New recipe
Date: Thu,  4 Sep 2025 12:27:47 +0200
Message-ID: <20250904102748.602126-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904102748.602126-1-zboszor@gmail.com>
References: <20250904102748.602126-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 10:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119282

It's a dependency of python3-pre-commit.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../recipes-devtools/python/python3-nodeenv_1.9.1.bb   | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-nodeenv_1.9.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-nodeenv_1.9.1.bb b/meta-python/recipes-devtools/python/python3-nodeenv_1.9.1.bb
new file mode 100644
index 0000000000..3c2a29ddac
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-nodeenv_1.9.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Node.js virtual environment builder"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a9e238ffae5bb6447dbac6291e1dc3a3"
+
+PYPI_PACKAGE = "nodeenv"
+
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "6ec12890a2dab7946721edbfbcd91f3319c6ccc9aec47be7c7e6b7011ee6645f"
+
+DEPENDS += "python3-setuptools-scm-native"
-- 
2.51.0


