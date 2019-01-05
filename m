Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4857BFB6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Jan 2019 03:07:34 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id 101so18227561pld.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2019 19:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uHmklYZhIjBxEIRZ9aOKVWmdtOE4c9jnhpiWIJAHHIY=;
	b=gyVz88IMA4NHiHkfzpQqsY96bMdDPLu4RP/3lzOIF+WQrtfu4yBoSNRDg0b85mAs8V
	ib6CulTs5juifdSlK/xcd7BEwUZajMHh8LFDQW0jjXq3NThcdYZKb0hZUoghCwNUHLOM
	/pIujUP4RB6cUB+Z8P9ZmGmkk0subGbOg6HTl8fVW/2RcQirtHjOVMG/r5P1Ypc8REjT
	7SY0VLqHjRWkT/rncbldYRepEWZx+lgoijBuUvO5LQrK2RDLLAyPZL0QUX0GaTDpb/Gj
	NlMPzsha2j5X55B4Aj7yqQCQgt4cqV3DtIrlY9NXThlD+ONTiHyWqxJZ2JSEVOIUFxp5
	rv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uHmklYZhIjBxEIRZ9aOKVWmdtOE4c9jnhpiWIJAHHIY=;
	b=FMNZGJV18wTAibfZKwPxlLueGpEgSHuwRHbWF7kxzTt0QDubgoc1vs3SESEfoM7QNN
	5ilrB191XXGCL6QLcbpz4K7rTFaYihQckax/qqi9bmzXEKliriyEfIb/ZKbmTGHTb0Xr
	67HN6NmEkT64TSCsr+sBJN/wPqAIk3FLnWps6P2CZTgV32S//KoXFgOu1mBVcJ9bCG1E
	Yz8UJpSeywk8hZJ7Hg2jB/n7OB63WiLU2LKteDbH4GIGjUOgVGE1kEjpFGhEWA0XbTUz
	BHQu86Fb9KyPTh393l6/doG8ww0UfL2MRApP0Db8dWT5Wzn05eVJaeXysKNkGGsx3+Hg
	hn0g==
X-Gm-Message-State: AJcUukcW8mQousxwGyaR6GgDL2OOnx18bFXaaaxl6iFPkFLn/YC9lQNs
	05Cl/EkCNMayeIcTtUu4MlRZd9fCH1o=
X-Google-Smtp-Source: ALg8bN7Lw7aIX2MrpJ51Cw3+nJutqdMFuU0is4u8fcdLc5MnYtx86Um5yv3+CZRI0SG6VRws6e/HJQ==
X-Received: by 2002:a17:902:765:: with SMTP id
	92mr53189027pli.242.1546657654688; 
	Fri, 04 Jan 2019 19:07:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6ee7])
	by smtp.gmail.com with ESMTPSA id
	m85sm97325536pfj.171.2019.01.04.19.07.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Jan 2019 19:07:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jan 2019 19:07:22 -0800
Message-Id: <20190105030722.7975-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] luajit: Disable for mips n64/n32 hosts
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
X-List-Received-Date: Sat, 05 Jan 2019 03:07:34 -0000
Content-Transfer-Encoding: 8bit

- mips64 port does not exist
- Also convert aarch64 compatible host case to an override

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
index 3052eb0484..f3a0f70ee2 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
@@ -90,5 +90,7 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
 "
 FILES_luajit-common = "${datadir}/${BPN}-${PV}"
 
-# Aarch64 is not supported in this release 
-COMPATIBLE_HOST = "^(?!aarch64).*"
+# Aarch64/mips64 is not supported in this release
+COMPATIBLE_HOST_aarch64 = "null"
+COMPATIBLE_HOST_mipsarchn32 = "null"
+COMPATIBLE_HOST_mipsarchn64 = "null"
-- 
2.20.1


