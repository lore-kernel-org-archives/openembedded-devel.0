Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id EE2847F2A1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:15:15 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id z3so25042583wru.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yPzTkodCQxzXs/PTJf6JBMdOko3/ublaI+bQ+PdRTmg=;
	b=mFDCJSihKsxOEYxS1sgxhGn44KivN5eqsQPIRTxCmxjqlkPsLMRf1v2b5MCB8k4smI
	Hzbzn2V4vw0nOakCSz2A4KIMB9D9HwSDOV7ynVZs7RWGtVXuvRuEMAbrzEBFjassseaM
	c0hyLcVB6vvgNa+4HwiOGB+c0HbtkxhWNfdUGKEYpTNo+ScfmI7+XkxklmR8N04DqyOq
	XzO4+lJ9g/X60wE7zjm6b0T9g1hzH72k9HM4IJNA2/R6BlTDz0fdgTdQTJBb2EjSi7mM
	5a2NiXx+UDsh5336mxTnVx+0GyvqPN1OzWtYb0ahlVsIWK0nkIgiCWG8pOt3Anz0bFKt
	FP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yPzTkodCQxzXs/PTJf6JBMdOko3/ublaI+bQ+PdRTmg=;
	b=hcU+X/jPr21IfnKYIp3ggH3rtGy8zCCMhMIzH4YNlO1wavxt5eyoImIQozrR3UChlN
	q4IKlpS3eTvam4ySN8tDISAE5bIUqJeI+PdzCLrezldAwUBLwcUUGicNerRkgI5qi3dt
	T+UUnjHxMRwtmJ6sAnFjVo6z4urCGXNaGpSJeW9Ltp8fJApcrPY3ftyvUe0jr/r2pqkQ
	wb/GS0oTT7kuVQQRiWnjDUjvUKq/Mg3CKqbixn5atMyiblyncGvc+YxSZrg/1eRhaFJ5
	FeQ4lmXpr1Kq9VL/8PRklFSI4gQyAyR6fJuMC867TQPI8lGrf4HLRJPQHy3Vxy5Y3G4U
	bb8g==
X-Gm-Message-State: APjAAAWSD/c8U1+fdsWR/PJRxhNNGVH7ob07Qs6Gh82bRJWD+4NNo5zq
	PftcjH59OwdMDEy3OLcXL8Po6uAE
X-Google-Smtp-Source: APXvYqwb970hw5F4W4Fd6nD85I3RzU6t+P4Lbyq8sJp+hjd7sV9VmBHGP7/jbQjQ2ro18/3lMOrmxQ==
X-Received: by 2002:adf:f103:: with SMTP id r3mr7914691wro.295.1579346116429; 
	Sat, 18 Jan 2020 03:15:16 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id a9sm2719870wmm.15.2020.01.18.03.15.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:15:15 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 11:15:13 +0000
Message-Id: <20200118111513.110709-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-filesystems][PATCH] fatcat: Add recipe
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
X-List-Received-Date: Sat, 18 Jan 2020 11:15:16 -0000

fatcat is a tool designed to manipulate FAT filesystems, in order to
explore, extract, repair, recover and forensic them. It currently
supports FAT12, FAT16 and FAT32.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../recipes-utils/fatcat/fatcat_1.1.0.bb         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb

diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb
new file mode 100644
index 000000000000..f78d5d594a21
--- /dev/null
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "FAT filesystems explore, extract, repair, and forensic tool"
+DESCRIPTION = "This tool is designed to manipulate FAT filesystems, in order to \
+explore, extract, repair, recover and forensic them. It currently supports \
+FAT12, FAT16 and FAT32."
+HOMEPAGE = "https://github.com/Gregwar/fatcat"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=57fbbfebd0dd1d6ff21b8cecb552a03f"
+
+SRC_URI = "git://github.com/Gregwar/fatcat.git"
+
+SRCREV = "b923172d97c578297964c062e3a92799e2a9eca4"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
-- 
2.17.1


