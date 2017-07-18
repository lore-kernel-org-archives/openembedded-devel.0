Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0D4557804E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 10:05:58 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id z78so1266841lff.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TDGYUxjiCf1Pr4TCAfEi4qzNnRBo1ER9dg/WC82tKC4=;
	b=liwytjgigUHqzgX0EUf6waDtA5P3cgdb2SkZ7lOHwLghuPcJvWOOszhMSecmIDvg2G
	lxZXYRKMf33aW6Zi3NEnQrTd9EAijEIPzwMwrZDrv88rKUuG848ZPMF8EDmT5ez5yds5
	+bkeixwCWFCAgpZpgVOD/ShK16meT/nmnV9ah6O2pcOI3BkZKECLsmjGY5sN6NMddzn5
	iXr5NOrWwOZRke/vQ+LAIHC1K4hELzDNsUWdVA5wSyuDMVPH+ppSQYlZ1G3WuY+N9rSY
	KL9/fjfx3W/82/J32e2YfCrFz7aenIrnqdvjAe9MXazkqxyPrk1MRsYZIwMrrAIVxCJD
	wqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TDGYUxjiCf1Pr4TCAfEi4qzNnRBo1ER9dg/WC82tKC4=;
	b=Jawv9lc7P0O/VwN7V2GbCegCJbCn2V+Q26YX2XxvKMf1SqyMdF8PFRHxUesxxuGUO0
	iNgqjN2l4nhfWPsi7UOyNNkIHuw2y5pY+lDCITqtgGdzQOB4ziDjiCVunmUVHeLhnYtR
	BXfeh3dt47ryjSlxam2Yauq5YjsGYNeQXeS2sahVE09s8n45Vrr9roJh5GO2/DMdUJqE
	OG+Sj+cWakfgwYcnK57TPLOcHrl8W5dwYvDek8UoM42BZFJbSvYicClBB1eeA6ML7rh0
	/nxYpgvRRZbW3IdgZwIgHkftmmDxbi/VRzRCPUkqfF6u3KKHw/ziM8LZH2ClTYJ6+Ctj
	3ZGg==
X-Gm-Message-State: AIVw1112cWxTYGyVeFvsKUr18vgOMhTIC5uvIfwU1UAXFRzbuyiiU/K2
	dVxVTWfWhFaxq5MNa7s=
X-Received: by 10.25.218.26 with SMTP id r26mr360615lfg.149.1500372359228;
	Tue, 18 Jul 2017 03:05:59 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id j12sm455132lfh.23.2017.07.18.03.05.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 03:05:58 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jul 2017 12:05:40 +0200
Message-Id: <20170718100541.2916-3-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718100541.2916-1-ricardo.ribalda@gmail.com>
References: <20170718100541.2916-1-ricardo.ribalda@gmail.com>
Subject: [meta-clang][PATCH] lld_git: Only apply -stdlib flag to clang toolchain
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
X-List-Received-Date: Tue, 18 Jul 2017 10:05:59 -0000

GCC does not understand the stdlib flag. Resulting in this error during
configuration:

|   x86_64-poky-linux-g++: error: unrecognized command line option
|   '-stdlib=libc++'

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-devtools/clang/lld_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/clang/lld_git.bb b/recipes-devtools/clang/lld_git.bb
index 5b31ff5fdbc8..31af909d25ad 100644
--- a/recipes-devtools/clang/lld_git.bb
+++ b/recipes-devtools/clang/lld_git.bb
@@ -34,7 +34,7 @@ OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
 EXTRA_OECMAKE = "\
     -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
 "
-CXXFLAGS += "-stdlib=libc++"
+CXXFLAGS_toolchain-clang += "-stdlib=libc++"
 
 do_compile() {
 	cd ${B}/tools/lld
-- 
2.13.2


