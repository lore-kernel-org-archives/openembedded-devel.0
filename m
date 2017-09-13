Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2F18D7851C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 04:19:22 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f84so7052143pfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 21:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c5dvWi/dXU9h5JPMl3AYM5w/bwTgmmttgkBUs0b8Q0E=;
	b=r9yonb7rzXX4adxVB3fgcknwwjemuatouYauQUHHeCY2SwgtgnwTpK+nUPMyrb+D3J
	iJQ7mDLPz/DHmhRNbOQcPN8y1Y6YVAbg8cSLA8S5moeaCRtgabDMwvmvvS1izDW20rFR
	MW0/dlM66tfYZH6A3GbDX4SuD4sbwq1oolKg+yRJgZ8i52aspo+fpQHzXFwqDGPxosEi
	qAI36FkXi5ybvtksNtaPJ514zWDAe034TKdzIUH8QzxzpgwDZeQbx70dWz9IAthdN1ys
	1bK8yMm6f9/NXoL+mmyzrBUQFqAiMTKFS7GuoBa7o59UF6TrAeKSYoSpQLkE8GhJENHW
	9RrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c5dvWi/dXU9h5JPMl3AYM5w/bwTgmmttgkBUs0b8Q0E=;
	b=JF+8gF6MUCN2sS0c2qZU4kh0aLngUsLc1VFSCVDmA2eBzXA8IxazfEuNfI9liL9sDH
	o6TIVFrm3iwrf1gP3tUEXm9v4otRULmthLGFNVRYelwNiemZF8LEw7tobpcHZm8eqg9S
	IvcLcEAmiERfwqsYkl1PHoR92mxk81btuEQicKOcwdTdvLe02MwLUaYMIK4aEJ683N6u
	r+P+H9Glm/TEbpfmnFDgI/fCyvFUH7c9IPqQFkdJ94A9k6NwWF3spBNYr20MILKW5Zhf
	eMTB1QcwYAXGePcnuXUts8zmUnKEWH84AheX140Bc6Kl1gER2fIGwUTGg7/gSRrk81t3
	D8Dg==
X-Gm-Message-State: AHPjjUje801jBf+xk78ILTT7+1R9jmcEPjah1TOjnBDPGqxy8+SuyH+M
	THKTP0t60BKVxifQ
X-Google-Smtp-Source: ADKCNb6bQlFTXZKhyfvo8zslOmQIQBrvRop8rQ92rJxKoTgm8VapmBURuNMXSCZE70Pp1MlY222LWg==
X-Received: by 10.84.138.193 with SMTP id 59mr19807426plp.128.1505276364154;
	Tue, 12 Sep 2017 21:19:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	k14sm19270258pgt.3.2017.09.12.21.19.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 21:19:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Sep 2017 21:19:13 -0700
Message-Id: <20170913041914.39999-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170913041914.39999-1-raj.khem@gmail.com>
References: <20170913041914.39999-1-raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH V2 2/3] klibc.bbclass: Use forcevariable override to define flags
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
X-List-Received-Date: Wed, 13 Sep 2017 04:19:23 -0000

This is required so it can override the CC settings when
clang is used because meta-clang uses toolchain-clang
override to set CC and friends so we need to use higher
order override, forcevariable is highest order.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in V2: Dont use forcevariable override on flag vars

 meta-initramfs/classes/klibc.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index f864104cf..c9de58cec 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -3,11 +3,10 @@ DEPENDS =+ "klcc-cross"
 
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
 export CFLAGS=""
-- 
2.14.1


