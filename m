Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id DE1B3787ED
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:44 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id q13so5717130pff.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=u293BbTEFQX5IDKg1P0QrsVNQjA8nXb4y7DMDfHYYO8=;
	b=j7uFEkyWEg8caTRKkjHRNsYufWwlqEHPm1E7UIhMxvg3Z94DHvHc8nrUGe3ZOvt3U0
	xkx9iSwv8YYLUrjSoMjd8X0/c5n4tuE04W3E7Ir1MQKbfd6JKq/pDVXPILyTjUILJUNs
	wm3wYj3AGifvhCUBPfQTBd1Yx/5YkygIfI6PH/1I9vHQgPpQm0shmswhsFNUTbm1QW1d
	d7xNGUeI1/UBuByf4oBodqbFw2HQYr7b+IsACXSWLN1SXyeKQeHBXHM1ag9uVN/S5WN8
	0Fs9ec5Y5zTrc3Q8YIuS0hU+XLMMZqJdyFpi9ExVdcD6Kx9I3oyyviaER9/EfpSsV0uj
	xV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=u293BbTEFQX5IDKg1P0QrsVNQjA8nXb4y7DMDfHYYO8=;
	b=MuMFQwBatJX0OTgUfR/8iKZ5CGlsCdeyVlf2PQm+riaXJ47ab+a1Eh59z6nB9odgfS
	dvMjoLIR5MeWN3MpS8yUMiyEfh3bTdEEAwWHaPfNlGN78Y3IOhMUNWLbmu5l3GxqTmOo
	VZEsZkmUSPqy+eyVTn1OeLvNfOXLPqYZ0Bb3EMV3+CpJgtSBIrckhJm8HYFYh1oGQA2w
	eXZaEuSqKBrrhcX0qgf9z1i0/W96X/K7xx1nnneGBXA9DPbEwbZ5ZRRin6tMoL2wMMPJ
	xLLFUZrFDQmCpeRXQ8TUVhA5tfw17aD+7b4CJIQj/Jlv4b0Bl3m4KFn0C3AXJZfw2Mx2
	qr0w==
X-Gm-Message-State: APf1xPDnLnGxmn9pXc7nT925lE8+eXbLRa1w+yJN3mTZ68nqMYeHNII1
	QDnbM8M0dtcnctz3TxHP/JjWGA==
X-Google-Smtp-Source: AH8x226qfYOG/1Z8g5P9RBq7I5WdHNbVswQCyMOLclaM/tSaX6TPB2W1OPWHJbUgZr8Uf3tGfPOw0Q==
X-Received: by 10.98.245.18 with SMTP id n18mr8264387pfh.25.1519594426160;
	Sun, 25 Feb 2018 13:33:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:08 -0800
Message-Id: <1519594406-24490-18-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 18/36] leveldb: move to recipes-security
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:46 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch                | 0
 .../leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch | 0
 .../leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch            | 0
 meta-oe/{recipes-extended => recipes-security}/leveldb/leveldb_git.bb     | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-extended => recipes-security}/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch (100%)
 rename meta-oe/{recipes-extended => recipes-security}/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch (100%)
 rename meta-oe/{recipes-extended => recipes-security}/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch (100%)
 rename meta-oe/{recipes-extended => recipes-security}/leveldb/leveldb_git.bb (100%)

diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch b/meta-oe/recipes-security/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch
similarity index 100%
rename from meta-oe/recipes-extended/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch
rename to meta-oe/recipes-security/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch
diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch b/meta-oe/recipes-security/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
similarity index 100%
rename from meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
rename to meta-oe/recipes-security/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch b/meta-oe/recipes-security/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
similarity index 100%
rename from meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
rename to meta-oe/recipes-security/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
diff --git a/meta-oe/recipes-extended/leveldb/leveldb_git.bb b/meta-oe/recipes-security/leveldb/leveldb_git.bb
similarity index 100%
rename from meta-oe/recipes-extended/leveldb/leveldb_git.bb
rename to meta-oe/recipes-security/leveldb/leveldb_git.bb
-- 
2.7.4


