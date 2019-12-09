Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 313477F9A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 14:45:28 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f129so15247087wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 06:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9cj9BctQTxDA1ijnWT3pOlmIPzNXx2BB/t5dMiQioiY=;
	b=OUmsVMV5wi/fX1vlF6LNNTdmZDW7u10XqXI0pnnTSmDNzRt8cLOTG/jR7Lwlh/JCd6
	TriQxvqC80FwT9sdkyGnNuhnluGqAkPSw/REE9UsQBMOnmbfFfJQ/xiOnG3o1K+oUJXf
	pvi5Sb1At/OllC1ua86CLr803VjKj+Y1OubvpSeW1otyubue3raCAKmsWclxK78l04N8
	z75gAgu6gYfsImO1ZRdDElOXEkFnumZ0BmxyeW54feZXKWEuxcGpEmT2/U1QTmXQ6oGr
	ItSFVpca3I4f8h8g7T1J5XQUbAl+zdvFtcisJcjNLW9gcLkV7zgoIYrnxIC1YvX0M/xw
	OcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9cj9BctQTxDA1ijnWT3pOlmIPzNXx2BB/t5dMiQioiY=;
	b=CE0A+r5IO0cN8F0aSWqWa7iSLk2bQWl2dZX2JK1sY2H6FFMweiqupGiZe3R7FI69eQ
	VYxnzdGsvIfuf8x7OB73N4sXWxU1CAPaKEGLF5IzMGpehdAmj8vtQnN6akVjVRjX9Ty/
	ooWjnw4mzf0WhaKxCH2YL72oKP3qkauhoEIiqBJDyyquyEBNN2DmtMNJwGX6Fwaz2I+z
	NIVjqgKuuufLrYlDW4NiMi2R1N9McDmgYHKkVdCWLOfFTO1HyOU04dq3ls86HJdaXNlR
	7UqTbQHM53/tNxH047K31Wg8heDAecCPBwTRk9uKSCT/8wjGSmR5BzITRMrCRL8/Pglg
	M2VQ==
X-Gm-Message-State: APjAAAU0StlYt7N+X01DadVtEN+ZvJgq50hYbGI8uWb7aljLMGjLDrid
	dTsYpGhdHsu2GMaL48TUZkUnEw==
X-Google-Smtp-Source: APXvYqz/ORlOxxPuqGadv0NeT71Fp9kZ0IAMV0lXcr3A/rVfVLhFOfOOkEQ2yKcL+cCR9eiSJJyFmg==
X-Received: by 2002:a7b:c8c5:: with SMTP id f5mr23613990wml.155.1575902728923; 
	Mon, 09 Dec 2019 06:45:28 -0800 (PST)
Received: from localhost.localdomain (lfbn-1-7161-157.w90-116.abo.wanadoo.fr.
	[90.116.92.157])
	by smtp.gmail.com with ESMTPSA id t81sm2082wmg.6.2019.12.09.06.45.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 06:45:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 15:45:25 +0100
Message-Id: <20191209144525.21752-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] librsync: new package
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
X-List-Received-Date: Mon, 09 Dec 2019 14:45:28 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

rdiff is a popular tool for calculating binary delta patches. It's
provided by the librsync package (unrelated to rsync already available
in poky).

This recipe adds new packages for librsync and rdiff.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../recipes-support/librsync/librsync_2.2.1.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/librsync/librsync_2.2.1.bb

diff --git a/meta-oe/recipes-support/librsync/librsync_2.2.1.bb b/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
new file mode 100644
index 000000000..9d224767c
--- /dev/null
+++ b/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Remote delta-compression library."
+AUTHOR = "Martin Pool, Andrew Tridgell, Donovan Baarda, Adam Schubert"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
+
+SRC_URI = "git://github.com/librsync/librsync.git"
+SRCREV = "5917692418657dc78c9cbde3a8db4c85f25b9c8d"
+S = "${WORKDIR}/git"
+
+DEPENDS = "popt"
+
+inherit cmake
+
+BBCLASSEXTEND = "native nativesdk"
+
+PACKAGES =+ "rdiff"
+FILES_rdiff = "/usr/bin/rdiff"
-- 
2.23.0


