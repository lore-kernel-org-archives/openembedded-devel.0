Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id CC87C78282
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 15:11:07 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id t3so4756516pgt.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 08:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5Hk7Fb4kCJv8zWH7X9TUTdoFHJA4VKyaDFfC3kMrZ1E=;
	b=cx0HJle7ee0mfkuJdHF7Wj8G5c5R/zr6Cv64GUsuvXYqD0X9AnMBn++0n19OBjKsuI
	ALlw/HSPRtHzcWjEEO40iB0IFkWbAA/PKV2VXupXf47tn1edhYa943TNZRPjEUdm30ct
	Hco+W+R5UHC53DpdDv5ACnl5PO/6uSUY/6Vmeh9xuabtV4F5aMGF0sXJljdShYd7DhXG
	Fb7uLSV1YaneaEFcXP8EM60p8uhsdgq39or1SQCpKmPFvMrG/Phz/Dk39lMgrn8eEaO+
	3AmoP+UNDR9rceDw04yuq6TL3Lz6DRsowiayk7+/5yR3vDzvgfIqF4DMYAs/4HbSOo5y
	Jv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5Hk7Fb4kCJv8zWH7X9TUTdoFHJA4VKyaDFfC3kMrZ1E=;
	b=pGWlQbuVK0Fo/VcIT8iSyPMqEFsvhnOZ2a5qNBCltR4uFI2/UCtq4rY2doE3kpWiRc
	y+D+qeJDiCKpxqSpfnN5f2drFNNAN4FDIxK3gNZ0o0XgcHk6tkAMIO74BntEIfVCVf0y
	8X2867W1F/noq4zcqt1XREyMeDHj1AE7qcW7dil6gDnZriAsr/9D3ejbR/RYbOZzeocz
	ZynECnqvP4vKtN9hyzTLaigB483ZD5XWnFztMuISGul+g7lXGfyR8XSY1TfmfpRbfTDR
	0Z+oOq248NpxvmHuGzcGY9FrfstfaZTnT2GFRed1Tg+gu+qeUceoZyYYp2kB9VEkRwqY
	+Edw==
X-Gm-Message-State: AHPjjUjfybEpuYn94zTiKzsXOsfIcaQYywwNy8INVJo4jszPnMZW6HQd
	/pykvRdD6ahrh/Zw
X-Google-Smtp-Source: ADKCNb5J5PTD70qmntXWNNuLPsvAvkWK1v9xBmiUKPjasrZ4Ici5VhPlTVov43XfiVJYorAfFBGU6Q==
X-Received: by 10.98.73.73 with SMTP id w70mr12033078pfa.335.1505142668650;
	Mon, 11 Sep 2017 08:11:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	75sm4374067pfx.145.2017.09.11.08.11.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Sep 2017 08:11:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Sep 2017 08:10:55 -0700
Message-Id: <20170911151056.4577-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911151056.4577-1-raj.khem@gmail.com>
References: <20170911151056.4577-1-raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 4/5] klibc.bbclass: Use forcevariable override to define flags
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
X-List-Received-Date: Mon, 11 Sep 2017 15:11:08 -0000

This is required so it can override the CC settings when
clang is used because meta-clang uses toolchain-clang
override to set CC and friends so we need to use higher
order override, forcevariable is highest order.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/classes/klibc.bbclass | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index f864104cf..2aacf241e 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -3,13 +3,12 @@ DEPENDS =+ "klcc-cross"
 
 # Default for klcc is to build static binaries.
 # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
+CC_forcevariable = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
+CC_forcevariable_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
 
-export CC = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
-export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
-
-export CPP = "${CC} -E"
+CPP_forcevariable = "${CC} -E"
 
 # klcc uses own optimizations by default. See klcc(1) man file.
-export CFLAGS=""
-export CPPFLAGS=""
-export LDFLAGS=""
+CFLAGS_forcevariable=""
+CPPFLAGS_forcevariable=""
+LDFLAGS_forcevariable=""
-- 
2.14.1


