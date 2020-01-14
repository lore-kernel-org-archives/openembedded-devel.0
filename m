Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6287E7FA32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 13:30:15 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so13756033wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 05:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OOtWfrdZMIxTEuvkItQ/Pl//Gj7Qkl8XsvG6PZSPW7I=;
	b=XrlSckQvJfT1Nr3XbNlJgzqrqjtSjxjIJjLuYkGmHCU416w3ghiwq+lC5cDx7xMiMd
	pQ76ULMtVe9IkCgoj+yOQOJknEGnNm2ytpfqm+Log+ZO95gfg3+2ylTLmlOFYSVW3dl5
	q/JEEb/WEeG72YerofYliQif5HgkFXDWpCZUNdrEgo7FNi2KfdeRauEuAtls2/MRjuoC
	BTctKoUFiM7LhTdXGILQnWFwnl+Rmcz4AySuK7VX6e12OWu4TEvH57CZTiOrDW/gxd5x
	5UYozX0qDX12Ouh+mkrkiRGYFgi7WUH24N+yPKXMXcLALZa2P3y8WOQHFKqv7KNJ2YEZ
	ljlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OOtWfrdZMIxTEuvkItQ/Pl//Gj7Qkl8XsvG6PZSPW7I=;
	b=ntdPA+IPeGYQWn7SvUIQ8y1ppnGq9KooPGAp0dYkUcdMa/1YiE/qz4QKI+L8DDrc74
	JDjL2pezC7fWFsxxt2cHYMsiXLwVumrpPmr7ripn7jI7dChugulclLNC7jQSaB/2Hw1c
	uNlkjC8Op8ADrlVFrripiGuohm4ey1jkAHxFm2S2WIRVD4NJA02vaaC92kTHjrFtyv1n
	yImHpvEeUaApSZbYg2vSe3sGDimE8B6VBYOw+Zrc92DpWp0IMc8W0XguNM+TW359CXg5
	c0YcrO3JZxm3X9EDwH7rZTeyM/Ut9YNnTa16G4yp7OFj+URPpky+CSN8ruvUdUVnXsQ5
	bUqw==
X-Gm-Message-State: APjAAAXUQ0UJJgk2BQLU124LFhjay+edI1ypSDVADvPuaWp3MoFbKYqY
	9WR1mctJPC7B0AfQPK3sYReFkm69
X-Google-Smtp-Source: APXvYqynyZ4wLMl5v7Jz69tqdFw8DMowMhPaiPTX4C0lk2kfjH1h9myZerky5vqawMuwqy4RKTTQ2Q==
X-Received: by 2002:a1c:3187:: with SMTP id x129mr27219543wmx.91.1579008615835;
	Tue, 14 Jan 2020 05:30:15 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:5d32:c012:e829:5d33:98c5:aa8f])
	by smtp.gmail.com with ESMTPSA id c4sm18612649wml.7.2020.01.14.05.30.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 05:30:15 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jan 2020 14:30:13 +0100
Message-Id: <20200114133013.30045-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] websocketpp: refresh clang patch
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
X-List-Received-Date: Tue, 14 Jan 2020 13:30:15 -0000

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch
index 421789728..f1d037fae 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch
@@ -18,7 +18,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 2d13117..c17354a 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -148,7 +148,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
+@@ -150,7 +150,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
          endif()
          set (WEBSOCKETPP_PLATFORM_TLS_LIBS ssl crypto)
          set (WEBSOCKETPP_BOOST_LIBS system thread)
-- 
2.17.1


