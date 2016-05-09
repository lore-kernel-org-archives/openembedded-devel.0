Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA68612E5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 14:39:14 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id zy2so18684759pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2016 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=VTDyFaYMMm6kTXxabPKLjlPrrIDM5liKpEW/265ZdWI=;
	b=zlT33CIs+duowVWxqbZz+20eJo8guGtnE18SWTlv2+kmaGfc6bx+L9MGuGtwpy/zlO
	azaVyTQohySwf2pvMM1CapognkRFgcPSDqoe6yP9K0LBptDpKMdC9cORpqhWnGqZ9jHv
	PlmBeyIfZZZK+tXY+X8+fTSdXdpf9teDwsy0BJtxJtLqvwwVRSdsPCf1EnkT/NCxcfyE
	S0TYAmQAL2Vp1gGtU71jnpujb5ppmPLCuHGzIh0DUnm4NbAv9RRvHxzcIQ5mGdnG4NUY
	sMJ5YZ2eiSa9dS0Idy9O1oxfrJXtYxOymTyU6Uw6Gb5phrtUdAKmRgN9h9oHFSDfhUfR
	CrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VTDyFaYMMm6kTXxabPKLjlPrrIDM5liKpEW/265ZdWI=;
	b=gVVUANuEqmvYKN8KqkQWKET1bodHg3bbvo2vAv/3AnSYjcI/ab5qBpIV/U+UVPmE7n
	die80N9XCIgbnCCmc/bX1s7pRT39UsYy2oN8XfbrZAzWnPHeJLc+698nDi+tuVGWhiju
	ZacCPJAt8x4CdQI4Xg3cJyBU497BjcFzUIHG0IfiKHtHM5QfxLIsJyuMM/ckK2agufZZ
	a2+QlzP6JoMASDxAEzMEo3WRbLeKGZD2SiosO8bHzzuO5wLAIZd+sKA9oLUxIuIP6Jrw
	up3kIvF3I2WSeeKgOAw5hZFttBOAMjkAa5W6Eyz9l6INFjxfE7yDWt8UtrbgI3QPDR9T
	V3eQ==
X-Gm-Message-State: AOPr4FXhAStJSzCEX9TNreWNy16tsrvO+Di8idc1Ik1rIY3VVpZtbmbLZPLI2ZU52nN9Xw==
X-Received: by 10.66.134.15 with SMTP id pg15mr50172320pab.98.1462804754659;
	Mon, 09 May 2016 07:39:14 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 5sm41149833pfi.91.2016.05.09.07.39.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 May 2016 07:39:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  9 May 2016 07:39:13 -0700
Message-Id: <1462804753-19132-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][master][krogoth][V2}[PATCH] uim: Fix Warning
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
X-List-Received-Date: Mon, 09 May 2016 14:39:16 -0000

WARNING: uim-1.8.6-r0 do_configure: Missing DEPENDS on intltool-native

V2:
forgot to refresh prior to sending

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/uim/uim_1.8.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index 42788e4..ae193b2 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -14,7 +14,7 @@ SRC_URI[md5sum] = "ecea4c597bab1fd4ba98ea84edcece59"
 SRC_URI[sha256sum] = "7b1ea803c73f3478917166f04f67cce6e45ad7ea5ab6df99b948c17eb1cb235f"
 
 DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
-DEPENDS_class-target += "gtk+ gtk+3 uim-native takao-fonts"
+DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native takao-fonts"
 
 RDEPENDS_uim = "libuim0 libedit"
 RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0"
-- 
2.3.5


