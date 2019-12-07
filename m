Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id E69C67FA19
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2019 23:45:40 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id r67so4287557pjb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2019 15:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=S/kxMCkSfE1o65evjaeJ08NKeWHdet5aatQWOK9acB4=;
	b=uf+OV2nkrtTigE1LMbEh0ez0B3KjZ6PQcMbKQZmgsOBdru52K7/6MBp5b8/vLERASB
	8gvW/zYmm5Z71LhADcvxU/Bm4i54GbheD0qO+6iPWx2tC/nuyIMdf2zDnOWNtRIw8YV5
	4Jdx9QrBUhomcZ4dlKRiy8oWLQ3qbIjecFeEBvBVf7zjPTLrkQyXGL78LYk3FRX9nvw/
	0GRqJFi+8bxQkGoyBCIoq3A31hdu7yN+xf1NoYtzraKfvXERhFiLaYCD+V7pgv4SIDhJ
	hlasOU0BUhcgjpOJk0RFq8+q82QHOBKHEXaaGWba9+3YWf+ivvyj+VvWg+vBbvMPt9m7
	dWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=S/kxMCkSfE1o65evjaeJ08NKeWHdet5aatQWOK9acB4=;
	b=tT539Iraw/uxTodAfqMqwvMtfJ5Q+Im8fnT8hz+m8UqchAnjXVkd/+lFZfF+eXNLCv
	aCJrwMOD065JTqAMVecKkffAdVtmhPNcJvuLmhczrzh2QcTNxyn8CQu/RurxV+C23uIY
	36xYOnxn3U+T0T6oK83yhtYc75BdsU9qK6AQBTz+/LO3ilQcYv3xNqz/TYOEc/U24bjt
	FEqKvXpCsqjqgDQ6gxfYM0CD5mqgZ9TujjwW7kIW/JLsCZ7GtqhI4NnvXAVwn/+gpaxh
	mAatQ3D4heJvU1OrBLpdg+cq7t6pqJEt16DzDCx5kVSgUC4P0ITH6GPhpIOhk04a4r4U
	E2Gg==
X-Gm-Message-State: APjAAAXXnXhiG5oXY4nB73JBXGjMWknVys6qScWweOoqAi8L3zjjwlA8
	J0DUYsgtzurO1zF+qVfoyqoD5ZRzV9g=
X-Google-Smtp-Source: APXvYqyrVNTDL3J6IYzH5im+ajaoGoXiSPO6Et7YaORnygE4iUH0Lw611mXE9qSXIMPP38LrWrzD8A==
X-Received: by 2002:a17:90a:5d95:: with SMTP id
	t21mr23512364pji.120.1575762341489; 
	Sat, 07 Dec 2019 15:45:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id
	h6sm19601553pgq.61.2019.12.07.15.45.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Dec 2019 15:45:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Dec 2019 15:45:29 -0800
Message-Id: <20191207234529.1222139-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207234529.1222139-1-raj.khem@gmail.com>
References: <20191207234529.1222139-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/4] udisks2: Update to 2.8.4
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
X-List-Received-Date: Sat, 07 Dec 2019 23:45:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/udisks/udisks2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/udisks/udisks2_git.bb b/meta-oe/recipes-support/udisks/udisks2_git.bb
index f0aad95384..9b0655c69b 100644
--- a/meta-oe/recipes-support/udisks/udisks2_git.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_git.bb
@@ -20,8 +20,8 @@ SRC_URI = " \
     git://github.com/storaged-project/udisks.git;branch=master \
     file://non-gnu-libc.patch \
 "
-PV = "2.8.2"
-SRCREV = "7a787aa3b340fc7f1ca72d748635d6c5445edc58"
+PV = "2.8.4"
+SRCREV = "f333e13de8d32f2b82237ccd180c3458d71e78b8"
 S = "${WORKDIR}/git"
 
 CVE_PRODUCT = "udisks"
-- 
2.24.0


