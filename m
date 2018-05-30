Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C19D574E1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 08:34:57 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id f8-v6so46174823wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 01:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hB/vye8b5Wg3lt7GTQncAKCK4AEGwqcKMglP+8eiHQw=;
	b=JymJp0eKL/sUYJQDPRlUraBpPaBH3AMJyeL0W5tkrxz4IltxevWJ9oTHhNZdTj4fOE
	BaGNQzJ6ajyBfdaAgdli8OtNZ3+QNC2TYit0XD8rvDs1m8FtazLpluQTszKm/Ilq5+Qh
	ysQ9i74Z0dS9gSFx1sNq8dVm7zrxXnRBy/g1uK84WYi1hY8WXBlvta5NiryZURRcm1Ke
	WFSo1vDAPUwA28qpIKx1r+fUNLeCvHGx+fDL2mr90ZIR2dav5SOV2YZnGBgOYUKr48Pg
	ebW6Ghodqefh3h/2XTqFvl5e4v3f9m0YijnvYyniRX5CpflDeD1CraVlvQQ0eSbQXO5v
	YE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hB/vye8b5Wg3lt7GTQncAKCK4AEGwqcKMglP+8eiHQw=;
	b=pzm1zBpmaxhzZbL8lch/R6sG3gUeYGAu3+JrSnhzo+KnyKXN8tPZ3O6J3urbu/lBEr
	ivesHyizeoTvcQpV8yudf1EDRDR/+3A38zGgfMufqQmVI/6iB31d34dN2CTTGy5NGrZF
	XchM7oj7gsCqoo3U1xN5PpeAQiXU/Ce+6tk3KjJ9wjJuF9YtEzMJki0gabvSoyP/WYFs
	Yeq7PXG3nBcDOqfPsQvIJ8yukibnNNt3//XKMZjfts7uCzBwSXWd1N5uO6WIcSR6N9xP
	9T4KkEA3QW0Fdp+V1RZmeOk4YdVFi/5GMgfm/nFRqgXrQBahqWUDZSISUYhCFF1eA5o8
	97BQ==
X-Gm-Message-State: ALKqPwd7oXUTbixCH/dU6inARFfDql7aM7V98qTXV9l6iF3ChZgJdR6o
	U9eih/i8vGU8++oi0kW8bVmIivJW
X-Google-Smtp-Source: ADUXVKJIkKoios9rtLGsHgMHvrFwnqnODKr/BYiHwUSnQDClxMGD4xZKSkMuuAgzP3e4PmMA+YCEXg==
X-Received: by 2002:a50:fb19:: with SMTP id
	d25-v6mr2411343edq.117.1527669297676; 
	Wed, 30 May 2018 01:34:57 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	o25-v6sm18685230edq.62.2018.05.30.01.34.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 May 2018 01:34:56 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 May 2018 10:34:54 +0200
Message-Id: <20180530083454.18598-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] clang: Fix sigsegv of llvm-config on the target
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
X-List-Received-Date: Wed, 30 May 2018 08:34:58 -0000

llvm-config is, by default, broken by the SSTATE_SCAN_CMD. This patch
removes llvm-config from SSTATE_SCAN_FILES.
---
 recipes-devtools/clang/clang_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/clang_git.bb
index 5730b9b..3e2d2c7 100644
--- a/recipes-devtools/clang/clang_git.bb
+++ b/recipes-devtools/clang/clang_git.bb
@@ -158,3 +158,6 @@ FILES_${PN}-dev += "\
 
 INSANE_SKIP_${PN} += "already-stripped"
 INSANE_SKIP_${PN}-dev += "dev-elf"
+
+#Avoid SSTATE_SCAN_COMMAND running sed over llvm-config.
+SSTATE_SCAN_FILES_remove = "*-config"
-- 
2.17.0


