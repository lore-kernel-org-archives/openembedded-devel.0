Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3887E7FCAF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 17:02:16 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id d73so10555122wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 09:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kdtQzSmX56Gx+V42pUxXIKJ8ctJjGhgZwL9fUFb5fiI=;
	b=FMSCK3n+RM5G+7Wu8F4oFYoDrr7w5jIT0cSFhiA6kO1qi2Lmr9Oen+XOL2UZQ3bViC
	LowLn1iHGEV/T4kX7gQNY+6GXXWPCNz/DfVlHlei4UndgxRC0NeqICAhRhsBKCYPWZV7
	znifsgmcDBXUShw6+4vgG0PYvq/CjaPlP51h2IR97ooLdiqEttoDzU3TjlGHekWAdnzy
	uzvKnbAm1c6iOceSbCHWFPmljN18HluhTburrFLF0AONRVOZorXmQy0D1Cu/Yu/8CB+N
	nwIGbDPZiOauB7dk69P4iLcTh709ZYQU4DPp7zdH8tlnqxC9S8XThgb+xxdnNarsaEps
	3Y1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kdtQzSmX56Gx+V42pUxXIKJ8ctJjGhgZwL9fUFb5fiI=;
	b=fKvR6IACDU+RbXStDOZKyBBgPRkfG/U+nhHkmP7wWB1gP3JA6XJICrO56n9jErNloO
	9I2YTx5lZJg6dDlN68TdinrB8c59ThZkkPw65N9g6SlHlJESlVg1Zafy4f62aMSb+tHk
	ZO3p/MozuwAUtMi3hABY2Ts9fRGkiTruuIU6affQMKvY4BP/GbApY5ScuHRaptF6LyxB
	28JptH/hzw5qfADlWiyrl3jQ6aSBtAQFUwnlCNF9/7/r6PpHjrDMtsSvmA9Sa2HI5MqX
	GZmYms0MDUr7rFtQyZcd9NvpRq8wDsjSUNNFlJqv3I6JaKKs0mpaf9Ik6kB0HooplweD
	mqxQ==
X-Gm-Message-State: APjAAAXoCdp1BQtOLA4TP00jLVX5cGziT+KBBpUSnK3ow4qZm9Kpe2ko
	Vziv89XTik918674YN4xXzuJYGGR
X-Google-Smtp-Source: APXvYqyFGD1PVov1cLCQ3Bwpj8QR3IkIRKaexvTSHyxrnJb02dFmxlTrvk5bLRobcBSapvg5GXjztw==
X-Received: by 2002:a1c:6485:: with SMTP id y127mr21954241wmb.11.1578934936712;
	Mon, 13 Jan 2020 09:02:16 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	k16sm16050396wru.0.2020.01.13.09.02.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 09:02:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2020 18:02:09 +0100
Message-Id: <20200113170209.95601-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113170209.95601-1-alex.kanavin@gmail.com>
References: <20200113170209.95601-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/3] sysprof: move from meta-oe to meta-gnome
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
X-List-Received-Date: Mon, 13 Jan 2020 17:02:16 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch  | 0
 {meta-oe => meta-gnome}/recipes-kernel/sysprof/sysprof_3.34.1.bb  | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-gnome}/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch (100%)
 rename {meta-oe => meta-gnome}/recipes-kernel/sysprof/sysprof_3.34.1.bb (100%)

diff --git a/meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch b/meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
similarity index 100%
rename from meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
rename to meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
diff --git a/meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
similarity index 100%
rename from meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
rename to meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
-- 
2.17.1


