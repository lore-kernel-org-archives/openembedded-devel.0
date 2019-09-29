Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id D97D37F2B1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 23:55:26 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id q15so3153684pll.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 16:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RsrANQ4c6zsd1T2DAOiRsQA2ypgMHPVz71iZkaRzrGE=;
	b=VwAaz9ufcU1A9dPnjbifqkLy+M/MdH/btvPWFllQm7zsPVDFAUWisGXnfHcQt69Po/
	o8+0hJTM3A5Kge9qzkaMJkz69vKXlzHkMUCRqiRRiA2qXRp+PUphQB+vQ3zn/q8bMkoj
	3hWIh5ttbt60FBEOQyN/SoQNXVFK3Y+TlnG7AkP2fLpIwhp/rXe6hrhGav7qEcZFD3xC
	18HMJQJR6nOPEHOe/WaksuZL5UAwLXHsdkO9j7HpH6j03ArfatWBCX4RhNSDWFQcvcR8
	a4FKwCErsBPffjgtZXKHNR4fJLMSjsS2VzQSF9YZ7XT1BldLJnMuN/OYfEJhinvESa0G
	Fi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RsrANQ4c6zsd1T2DAOiRsQA2ypgMHPVz71iZkaRzrGE=;
	b=EoIiHgwpvY/+kDfRBvGQ8sSLqPRj/noPXH59V2QEWBJG21ydg5L0Ee5zSyXICueU5/
	31C0DWTS1RWNqidvDoM/5WKWW0wK1oQsqTgEh1eQvFp1yJt0PCczPy2ITPCAVLrVLGQL
	PFL/NZ54IIQrwVDfjjuUwy4Wcmh8lly42kL6LsvHJyh9TWXaK+lQUOmgVCdDV+xUtufk
	bN0Nltoq7WlHnZYd42mGbLJw+5T+rWbk2jMZJ+ppKFuQXWeus6LqX+SAuT8/sT9rExjm
	WsaEaameAZ4YRdGz3lt4yYzASbicQx0ocRioTLVgOzO/36XNM48hKtOFvn7kUesWBWXS
	l9gw==
X-Gm-Message-State: APjAAAUCa+igDho1O9exf4Bys17etYGHOwjbq35FqQLNiwXGS8Nj63Hn
	unkCULzhx0DKwrFSiBiLLDirArKTRsM=
X-Google-Smtp-Source: APXvYqx2m8+oTSNlkIgkDsAThLy00XWJ0Xu3XrSoKMGEQCFNsRfcJHDSPnx6Y7tLeh8cZGTGehWisg==
X-Received: by 2002:a17:902:36e:: with SMTP id
	101mr17412253pld.46.1569801327640; 
	Sun, 29 Sep 2019 16:55:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	p190sm14474778pfb.160.2019.09.29.16.55.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 16:55:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 16:55:08 -0700
Message-Id: <6b9002ca60ac65e39e3be542187bdfdc58706961.1569801183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569801183.git.akuster808@gmail.com>
References: <cover.1569801183.git.akuster808@gmail.com>
Subject: [warrior-next 10/10] dnsmasq: fix build against 5.2 headers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Sep 2019 23:55:27 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Upstream linux y2038 work has moved some definitions SIOCGSTAMP is
defined in linux/sockios.h, not asm/sockios.h now. So we need to
add that include to fix the build.

Upstream-status: backport of http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=3052ce208acf602f0163166dcefb7330d537cedb

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 383e8bee87f446eaae5cec2477ebeff6f30b72e4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...001-dnsmasq-fix-build-against-5.2-headers.patch | 31 ++++++++++++++++++++++
 .../recipes-support/dnsmasq/dnsmasq_2.80.bb        |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch
new file mode 100644
index 0000000..844a709
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch
@@ -0,0 +1,31 @@
+From 52f4b58c14a2788ca08b7d8884d586724d86fc66 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Mon, 19 Aug 2019 14:46:02 +0000
+Subject: [PATCH] dnsmasq: fix build against 5.2 headers
+
+Upstream linux y2038 work has moved some definitions SIOCGSTAMP is
+defined in linux/sockios.h, not asm/sockios.h now. So we need to
+add that include to fix the build.
+
+Upstream-status: backport of http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=3052ce208acf602f0163166dcefb7330d537cedb
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ a/src/dnsmasq.h                   | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/build/tmp/work/core2-64-poky-linux/dnsmasq/2.80-r0/dnsmasq-2.80/src/dnsmasq.h b/build/tmp/work/core2-64-poky-linux/dnsmasq/2.80-r0/dnsmasq-2.80/src/dnsmasq.h
+index f53e9a5be6..d9225ea473 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -138,6 +138,7 @@ typedef unsigned long long u64;
+ #endif
+ 
+ #if defined(HAVE_LINUX_NETWORK)
++#include <linux/sockios.h>
+ #include <linux/capability.h>
+ /* There doesn't seem to be a universally-available 
+    userspace header for these. */
+-- 
+2.19.1
+
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
index fdbdefb..6f3d5da 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
@@ -4,5 +4,6 @@ SRC_URI[dnsmasq-2.80.md5sum] = "1f071fd11454e1cffea73bdadcf70b21"
 SRC_URI[dnsmasq-2.80.sha256sum] = "9e4a58f816ce0033ce383c549b7d4058ad9b823968d352d2b76614f83ea39adc"
 SRC_URI += "\
     file://lua.patch \
+    file://0001-dnsmasq-fix-build-against-5.2-headers.patch \
 "
 
-- 
2.7.4


