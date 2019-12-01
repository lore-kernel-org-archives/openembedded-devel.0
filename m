Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 45AAF7F639
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 18:46:41 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x28so17331575pfo.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 10:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Xhnt0gjN0sjV233pr7ktRMq44SGsJM/7/Um+k0Lp5tM=;
	b=bZ3csSV5XS9u7fnHPXDolesO3J+qCXbcY5UMZ28tFs9lg4AxRkH0SwXg2Ybi5Opvn+
	YphhGXYqwNhLoBuK+psCY7006aaAI+axE2qvbXlBVBiZ3I7O/uqjiCpZSUvugmDzydud
	+9++cBr8bEQzjhJMDizNG4n2miuYMajGQvLCr8KTi5DqKAeE074LvgCO8a4p7hR/vGCA
	1pXm0X1TPBcI4KR4Krzfha4BpogGaV3DZ/uTLY1GdKXh8aQeMTMKdEM84f6iOIftM05u
	JtuTbl1dpElMN1/1deo+QwOQangBxxkEWDD1YkrO0uw88XRLjYCpeAr9goPz1DyLVmGD
	9+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Xhnt0gjN0sjV233pr7ktRMq44SGsJM/7/Um+k0Lp5tM=;
	b=Frh2kLhAaaSua3zaZ3wstWJk6TFwmVzTRPXcMeh5JgWlF0gT+TX4kGzYm8w0+rNS2M
	2ydzkk4mn+HL7aZ5PAGXlmiQM+G/mStcv4uZGaN1Clx/q/OiP8HtVVauZu5ETWCGHP4u
	rBQw/GCfGihJeAyJZuYHXLjPvhtapLyRrEPcE1m7zzYgP0ICqTvGnW1HYlyVhW+Lyq9s
	YRQshntwPXcWMx7T4J6dd0p2AMecvGecymnlc4OKTUowRChQ2CPGkt1aX/7S5wRdnLUk
	IconGY+yo9tNOmhxf6yWj/+uVgzFxdBIkFbBOsIbZGIFO0sCr7khMOmruOa12Gg+FEwL
	ZFRA==
X-Gm-Message-State: APjAAAV2HOqO16MbMVdo8RURCf7l2YfK94i/51igo+5AYzTQGHS+7xkH
	S8SWgYRO/XQjre3ZvRSVNhvi7Dmq+Io=
X-Google-Smtp-Source: APXvYqzHW3qiOK/Y8bhU6rFG4nh0bVhi6TshV0O6xC+31bw7zh28HF3SB/MWRu/P9SSpWOlgbyZPGQ==
X-Received: by 2002:a63:fb05:: with SMTP id o5mr3361959pgh.355.1575226001907; 
	Sun, 01 Dec 2019 10:46:41 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8500:1c20:55f2:e19b:8d5e:a884])
	by smtp.gmail.com with ESMTPSA id
	y24sm33916800pfr.116.2019.12.01.10.46.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 10:46:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 10:46:22 -0800
Message-Id: <20191201184622.889513-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201184622.889513-1-raj.khem@gmail.com>
References: <20191201184622.889513-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 9/9] kernel-module-emlog: Use compile task from module bbclass
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
X-List-Received-Date: Sun, 01 Dec 2019 18:46:41 -0000
Content-Transfer-Encoding: 8bit

This ensures that right CC/LD is used when building the module, which
should be KERNEL_CC and KERNEL_LD, otherwise it starts to use DISTRO
default ld and cc which could be non-gcc and non-bfd liker which is must
for building kernel and modules

Also hides a gold linker failure seen on aarch64

| aarch64-yoe-linux-musl-ld: internal error in set_address, at ../../gold/output.h:322

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-oe/recipes-core/emlog/kernel-module-emlog_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/emlog/kernel-module-emlog_git.bb b/meta-oe/recipes-core/emlog/kernel-module-emlog_git.bb
index 51f7226ebd..a554a4c947 100644
--- a/meta-oe/recipes-core/emlog/kernel-module-emlog_git.bb
+++ b/meta-oe/recipes-core/emlog/kernel-module-emlog_git.bb
@@ -7,6 +7,4 @@ EXTRA_OEMAKE += " \
     KVER=${KERNEL_VERSION} \
 "
 
-do_compile() {
-    oe_runmake modules
-}
+MAKE_TARGETS = "modules"
-- 
2.24.0


