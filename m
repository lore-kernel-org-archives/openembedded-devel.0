Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3817E144
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:48 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id f97so7724100plb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xl9Tl6/sXJGl8ds3axnzxmTqTmtrJ5H2dbk7nSBQGxQ=;
	b=P9mSQMS1s7dE0DGtQvzELn07Olvf7aFQh7vb5Rg57vz4o9JCaRYF42Lv6K0DqDBBnF
	gOZB2tp+tSJCNKS8jm2iBX2aX0xreHa/IB6RHdmbQeBEx0kgq1cL/oMCkGQHx0mAwsMB
	+E9F1NMXXvURkjnwl6FvWcBXg1pvlvQSHaMAUMWHIfMyA+KIXFTJrxi5dF+MOHATU2hz
	3uQ246StEu2/hvNvHe4M748LGEJqEiRCTHmf0NwcE1O2iv4TN7bxwDbbaEZnozkpQF8F
	QhGnm/dBB3q3K/qMnhJfyfice/StEgrCQGM9jFLDL+yiE/B5GhgQbSS5UOsCGODJ+sCG
	606A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xl9Tl6/sXJGl8ds3axnzxmTqTmtrJ5H2dbk7nSBQGxQ=;
	b=Lc99T1rC+HCpLU+WdiUjxOCjP6QzEx32l1+9wuPoG7qiwhvB9JIvO+/eZhdX6Qzhpo
	KfrFWS5W994yrq7VUv2CJUHQu023pzUq76iE0L73YzDcgcmbPH90Wr28QPM3nKqyVL3s
	LaLYG3IRT8AtpsxOjdAWfuvmqNeBgitnBPITUoZJ0w/LMBYynNwrBoj+DT3PHSaBm+sF
	llcAnmATM5SSQRuv66qPZvgBTaGJtQHDnDh19NO764YmIR1NyXPvRlfKHyry1jwp0d8D
	yRwCtMPAZC9kfxiPLjBLdK2Jc5w9EFCk2DFTH3lTtMXhQIdz6z9FBhVbFcZhwKP8ShKY
	yd8w==
X-Gm-Message-State: APjAAAX/gSllUWh0QwaLc5ycPUtcDoL5W10OtfFL/eutdI7R9CsR0l6o
	za//LgZgfkbKKev7iUSqDCWTSbo0
X-Google-Smtp-Source: APXvYqw2u4stvZEO/fx0xkPG1jj6cdGqb0adzYKHsAiwoGWd5uqlX0FAHP9lmHBuQLyVmo3xxLfhPA==
X-Received: by 2002:a17:902:ac98:: with SMTP id
	h24mr23784440plr.265.1558411009422; 
	Mon, 20 May 2019 20:56:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:13 -0700
Message-Id: <078349138c98bccf7740fa54dae2056ba2c2cad5.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 13/34] cpupower: Inherit bash completion class
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
X-List-Received-Date: Tue, 21 May 2019 03:56:48 -0000

From: Khem Raj <raj.khem@gmail.com>

Fixes
ERROR: QA Issue: cpupower: Files/directories were installed but not shipped in any package:
  /usr/share/bash-completion
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/cpupower

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/cpupower/cpupower.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
index abf1585..cf70eb2 100644
--- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 DEPENDS = "pciutils gettext-native"
 PROVIDES = "virtual/cpupower"
 
-inherit kernelsrc kernel-arch
+inherit kernelsrc kernel-arch bash-completion
 
 do_populate_lic[depends] += "virtual/kernel:do_patch"
 
-- 
2.7.4


