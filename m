Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5F535788CC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:57 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y8so5432250pgr.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+qkFT42czVa52ieccNp4S++Bal8wKlaC9hnkvp4Z4p4=;
	b=phAy/YapXEAyJfKofBhP8mRYuXCtGUOIlwoj8aymMefUhwEJB7bv907N3qmh8fNLbY
	1tNt3ZmE1SPUFRCdT6hUcScqeNvk6jifxv5rRrAXxhrIL0mzRN7190/rI3eJFP9PxTfB
	t2B/UuSAmlGVobqfyyrZk6yOfnoz++vVyrQHg+18um4VpBERRt2Brau9m6347l6UWX2r
	EkKwiVXytCLUVQeE0njkfEHneyRDqQ0SI8vAsVklROvNSBSwflEPNJdRGhaNO+T5a3Ad
	BWyqn5XrP3SEMI0o8SsHKZzR8Rxcn5jMHrWCN6pgaj3SVRmIqmQIEoPAKh3f35BMJvzN
	U2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+qkFT42czVa52ieccNp4S++Bal8wKlaC9hnkvp4Z4p4=;
	b=DZDav0WsjMSZjGeJPYXN6exChv6O+z2zeaFBOFjgkqsKrEJtknBAY1XP9x1XyPbMdI
	MJ0kAom4M2IjKXDJGchb8tSncdItWsPYGUhxBZqQGZ0AFlx12hvxWMf1CTw13tlXHIJZ
	nKS+1w2Tae/jn/CE/CO+rXZv8gI7R8Ytm4A3kSLUT9StJxgdnyEuSAZudhRqPWLtaYW8
	sQVfCHuUF2zY9eV7a3sbot4IhNbpRFWg6796tE2xKOHlO5YAPKI+jkdnzhj9PJE64jfh
	akwMzT1ARu84vHEUwtHs4cOzQr0TfIUr7NFvlM3wKOgMYWc/yn/JiSKKbwLrWVbKfkgZ
	mN2Q==
X-Gm-Message-State: APf1xPDczzGKIzZNZmCDhbkr9KiSaftGFmktXHLDZxfIcy10rmoAdu3D
	XlbxiLlaam+mhzi81Cr8+xtcjQ==
X-Google-Smtp-Source: AH8x225T4+jn/KNHqFw80VJZvBVsHUYkfLT8Kct3Eh2cyo+GUsC0KW35oui30k4FHwIvn1u788j6yQ==
X-Received: by 10.98.234.22 with SMTP id t22mr8454634pfh.56.1519594438839;
	Sun, 25 Feb 2018 13:33:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:20 -0800
Message-Id: <1519594406-24490-30-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 30/36] efibootmgr: move to recipes-bsps
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:57 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-extended => recipes-bsp}/efibootmgr/efibootmgr_0.15.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-extended => recipes-bsp}/efibootmgr/efibootmgr_0.15.bb (100%)

diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.15.bb b/meta-oe/recipes-bsp/efibootmgr/efibootmgr_0.15.bb
similarity index 100%
rename from meta-oe/recipes-extended/efibootmgr/efibootmgr_0.15.bb
rename to meta-oe/recipes-bsp/efibootmgr/efibootmgr_0.15.bb
-- 
2.7.4


