Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB377867C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:46 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i75so10703432wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=q4jiJsxHloFZNcIqa4sxrn3KKUTG++RRIbhU1t0/CLw=;
	b=ugXdin6bxvxxZK/Lu37+yARz0CDT7O9kJAuQbW7Ig89tRevGehpT9ffdPTtlgWxK1C
	7A8vB7XiyjGH/BS+mKmbdwtb05gZUIXoO1RTUtXNj76N8iPKAkOIs9aXY9NitojfNSHo
	sCiHrSYf8G25Avs8Kgu560ehdFjDdS919xUIak7ryiKs9ZhxE+O7FArvDeU4UeDbNyFF
	gNuUu3KGIu/bxpxpIr1E6XTBOsi79yAT24b+6GjKNzEk6BiOQswMkBx3m+ySG8dj1KKT
	TpdDsR3BsJNdNfN2YJMgEeyysqv40DsbpMU/WR9LNgT1eykT4O/mvKsYBthom2xVIB71
	KRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=q4jiJsxHloFZNcIqa4sxrn3KKUTG++RRIbhU1t0/CLw=;
	b=UCF+QSdy92/FjQgIibFmnMsRzzflFSZZywevsLh+wdBxI2Q/DYdKODK+he9tEswSz1
	+bDxCK/5ZOnzetFCy7prahjXRSBIX8AW5r+WnGB+EgUcGYzUkI29nm/1Dd8hnQxxpPmJ
	InBmQdaZPjQOFre8pEE1/e69Fad0LslczzOol7ugoo9CEpbaTEZUb3N25tdyPxKRaXMP
	7vOlTpEFf4Qlmb5vDkzNgsMff3yyh2KVW4mvyTbjr2v3Vcz6EXR9PD8z0M/zF2fDvCcn
	5MLXx8DSEHFKbKmFiEnphHi4cp6Mmh3J64zXTee+0i4FWqKeQ1Wg+anPGNORNjcuAlKY
	YcLA==
X-Gm-Message-State: AElRT7F9xa1VTB0pRZjYGlPa7PiFE1jfc0WQyjkyF02SVW/f3lMEnsSC
	RcPto/6dIHsNv7aBdsgxbsXFsw==
X-Google-Smtp-Source: AG47ELu6RVqLLgLSm8cTuQouf8dF6SkqWh6vRFdb50Fai4Vwz+kmxFB/AOcNrJUu9msxqMS8TTd+0w==
X-Received: by 10.28.132.141 with SMTP id g135mr13011641wmd.112.1521981347609; 
	Sun, 25 Mar 2018 05:35:47 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:17 +0200
Message-Id: <20180325123520.16452-18-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 17/20] mm-common: update 0.9.10 -> 0.9.11
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

remove GNOME_COMPRESS_TYPE="xz" - xz is default

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb | 12 ------------
 meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb |  9 +++++++++
 2 files changed, 9 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb
 create mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb

diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb
deleted file mode 100644
index 899eb8a9b..000000000
--- a/meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-inherit gnomebase
-
-GNOME_COMPRESS_TYPE="xz"
-
-SRC_URI[archive.md5sum] = "49dc47af8c89ce5b3c768306b9a0f922"
-SRC_URI[archive.sha256sum] = "16c0e2bc196b67fbc145edaecb5dbe5818386504fe5703de27002d77140fa217"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-BBCLASSEXTEND = "native"
-
diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb
new file mode 100644
index 000000000..591caa75d
--- /dev/null
+++ b/meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb
@@ -0,0 +1,9 @@
+inherit gnomebase
+
+SRC_URI[archive.md5sum] = "d6f2a43589480d2315672da0b5839b56"
+SRC_URI[archive.sha256sum] = "20d1e7466ca4c83c92e29f9e8dfcc8e5721fdf1337f53157bed97be3b73b32a8"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+BBCLASSEXTEND = "native"
-- 
2.14.3


