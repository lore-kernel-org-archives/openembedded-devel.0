Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6170478862
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:51 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id m19so5444154pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=m/S5L1DXav7KZi58S8kAw+SAmO/mj0A9BzdcPDtMFMk=;
	b=dGaVvQziu5D6vC1zqn36jp1xblzWcY5VYiK1Rob8cO2hut2XC+NQl9SBlwODC7NcYY
	ww+EvkFSMT/h9UMb9lDjgnNxHqmR7LhwRBuvnL+k6riVGHRKTgOT2Pl9gANJlIa0ztVi
	bUifQCeJ5uLJgJrJl3nS09hsF6Dlin2e3Ji/x0TCkBo0g3k9wPW4JEa0uvfHB8K18Ffi
	5pJSBWlxSKch3lclDV8xYVc/kAAewl4Mr5S9hQoacAhcXPKGIzxKTqcNXyuUChLXhB/P
	NQRZqY3F5LJV+GWBxKHfMNgQnD9oeZzM2T7Tyqj2sqC/f0HKe0Fh95IesgdSJNf4RL/7
	fTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=m/S5L1DXav7KZi58S8kAw+SAmO/mj0A9BzdcPDtMFMk=;
	b=meMDDaRclHH+O7v48UF8qQUxDos793fZFbV/JoVGzd6CfNgJhMXoGT5SsIiyK1xmla
	Jm/foQFPhNSHzCiDJJCZn/nPoRcWZdyu6KgQicGds3Uc/N8T9xOD4pvob4ahjTQB9/bP
	3kv9EjtrJOojyR+eR4rwz0dZ6NjQBYP64asU5NwlbEaupSA+oz0yQHSbxprnvFAC8dHv
	18rZ2y1vJcg/LMN5wxeOGOVlr1obgunDxcd7s3kUEduM2EciyWwwXrjNpkBRi/AqHQ0D
	I2gi+x7C4R7sgpL28i2Vca6nzmMm/AlhaQhPzUispjbiLerZvOgw3xxIaaVPJjufpcjK
	UWoA==
X-Gm-Message-State: APf1xPC9S7oFT+ydhqv7W9JNnXpGWUifsquONLumeNXHZROpJWBl92ZB
	a5VU8+9Xwu053KYz6zzdMFlcMw==
X-Google-Smtp-Source: AH8x225+P+dUVpkj9Ft1kgodyW9CxvsNqglxIjaCyme8sVpCJLdzYdQlCTxdfvh2F/vMcmUhCCA75g==
X-Received: by 10.98.89.85 with SMTP id n82mr8322247pfb.233.1519594432703;
	Sun, 25 Feb 2018 13:33:52 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:14 -0800
Message-Id: <1519594406-24490-24-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 24/36] libcrypto: move to recipes-crypto
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:51 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-support => recipes-crypto}/libsodium/libsodium_1.0.11.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-crypto}/libsodium/libsodium_1.0.11.bb (100%)

diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb
similarity index 100%
rename from meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
rename to meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb
-- 
2.7.4


