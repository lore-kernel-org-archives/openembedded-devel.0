Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8F73A6C318
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2018 14:33:09 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id p2-v6so8311945wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2018 06:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=MjLiZkO9zRhM8E/KtPVZp9bDqYk0cCWH4n5xzTve4kc=;
	b=JActfOlvz4otk0qRI3Bb948k0kRBh4H4S5ZmQz8hUQzgjBLmxjUjbN0IWylBHHa56r
	ReuiZu5cJCO1TbOeQ9PXMKuQidUS6IF1BU7E+fW+1zKy5506Jk88SVZ8k0aJLR8/CWz4
	7nR86kUUI7U2tJV5Z94DM1NW2CBAmhysI8Uli0iFkv3old69yGSgPhXLuj27vmsLdgeK
	Y4R+UYPG64t1n4O8s/7Pij/3thNXYikS0uFXO9zGBIm5E5qR3eUVAd41cZqG+Uo3x+d8
	Kf1ZpHyP70tWj8jLiXhCiAiXi9hac2B2T8yFT0120Tqw9LT2QTYmE+dPosk1duRwUS0x
	V9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MjLiZkO9zRhM8E/KtPVZp9bDqYk0cCWH4n5xzTve4kc=;
	b=Z5rb3TZTpRhmDItc3ZfrI5fpL6Sg/8BAdzYgIE1NcjC4rk5mT7RGwTizI92sJvecmi
	I4J6BGhziKybxTSfQgzxD1B3wbJWijT3NtbrzJ9TA3GPMItPLN8dYUu6N7M8CdwhF0Lf
	WOk/yNQ/iQZLzVVCgf/R3Bo1xp3rKuO86bJIDeTex8RDqkXayFoh4uJUpib9+PUYOTDu
	OEKIVh2p5tAnaY+R3xr1B7kMaTe/ZzPeI8Jr5pPrzOGI9kjwmw6twT5+IxB0KxrInS8V
	asj6mG3NPaALMBcFtKHkKqfV4F9hhmjp+SXewUsBd5/69CXSTAN4rt8IoiZLg9rR2h9b
	cZbw==
X-Gm-Message-State: AGRZ1gKTDkPzoFn1NreDHAGkTYmMI+kx6rAfugEg3yF8KUI/mwSoNedH
	vPbA31anlROLaJgqlPoW4SXPXXlW
X-Google-Smtp-Source: AJdET5djoNbQNPNUC7ifZSHaE8nQ/3TGHxcwu6LO31MqisBfXfmHH4vOmyctwFKbo0vgrs/CX7KN6g==
X-Received: by 2002:a1c:730b:: with SMTP id
	d11-v6mr7755419wmb.107.1542033189608; 
	Mon, 12 Nov 2018 06:33:09 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	m69-v6sm12327963wmb.8.2018.11.12.06.33.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Nov 2018 06:33:08 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2018 15:32:58 +0100
Message-Id: <20181112143259.11488-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
Subject: [thud][PATCH 1/2] lvm2: update SRC_URI
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
X-List-Received-Date: Mon, 12 Nov 2018 14:33:09 -0000

From: Mingli Yu <Mingli.Yu@windriver.com>

Update SRC_URI for lvm2 as the previous
one is invalid.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
Tested-by: Stefan Agner <stefan.agner@toradex.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 75f4d89a0..5728d83ea 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
 
 DEPENDS += "util-linux libaio"
 
-SRC_URI = "ftp://sources.redhat.com/pub/lvm2/LVM2.${PV}.tgz \
+SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
            file://lvm.conf \
            file://0001-implement-libc-specific-reopen_stream.patch \
            file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
-- 
2.14.5


