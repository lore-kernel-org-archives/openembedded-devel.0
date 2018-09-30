Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id D7D8F748D5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Sep 2018 17:17:25 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n31-v6so7785146pgm.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Sep 2018 10:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OvI/0NOaJtkOu4JldA8IN5hr0TiBtG9SEpAWPLOQpdQ=;
	b=elig7x/egNWNhpmyZvsEEgnuBCTR9A1Qx+Z4gHtcYipmnauP/4y+9MUt2b8ZK/lX/d
	bcIai1sJSkerUR6Ea5FEaIngVoVK2yQCt4Tz0iZMwUbhNY+G4655xByqxv5PU0uXy6D3
	2eIyZ/wTXo/drZV5tk2mfXLgu4gyRDIQYPDeI1uoMZ6NR+Ou1mtm+bsH2iDYs4dtVASh
	sniFo2NVSXaRYQgsop/MoEbuXvG7CtB6mo0RTErSMe7gT9OM1QFdaQPJ2duVIsLLnqgP
	SgPu2sqWV/sAFHPi6dbfYIalu6YvF3bgrDrGTYm4hRiMLWFir6s93/d9Tb90D6V7qFJX
	mAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OvI/0NOaJtkOu4JldA8IN5hr0TiBtG9SEpAWPLOQpdQ=;
	b=NGW9D+C0l0myyQ60X1hLq2pmP/EiGHcg83CxvqcIwkN3IYGrVAxuKv7Br4XhLFGIEi
	u1V6J0z4gKqr4Q62wo0S1qXOFUKo1vMfLbGrRtPey9p3t9qs0pYb5zssXXFNQvsyVtJc
	WtSYE7hJU2gUiZNTdRB9yRtRnVG+sg+v2Sch+AAaKqO9irx9AYS+zTxBOUgvne4trjU2
	+nCLN2dpzbKKMkGizK9kamFvPcxbUKnvBehXXjW1rah/SMzxSgQYKihF9fSG11xpnHHb
	O5T8499NeuHl3LEunB4HMimxROzCjUsPavnjCw5+6/NnikrjQeASxTbDZn7KFZwq+CZP
	NMZg==
X-Gm-Message-State: ABuFfojQSNWNFNu/t6jy0vkcZ5lDE4wZQ6Jsv81n5CV37ddkwT0fVL7T
	M0wdB44c6HWaG09L8j5UZumDYsgQ
X-Google-Smtp-Source: ACcGV61vTFF7ecDqdqVo9xjEn0FA6GgLsoihQHMKsVs+5rvARzP+LE1px9pWtfWZoYID3gGFw+V0Rw==
X-Received: by 2002:a17:902:7009:: with SMTP id
	y9-v6mr7938250plk.328.1538327846420; 
	Sun, 30 Sep 2018 10:17:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	p17-v6sm11108203pfk.186.2018.09.30.10.17.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Sep 2018 10:17:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Sep 2018 10:17:18 -0700
Message-Id: <20180930171718.41078-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] yasm: Add recipe ( previously in oe-core )
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
X-List-Received-Date: Sun, 30 Sep 2018 17:17:25 -0000
Content-Transfer-Encoding: 8bit

Remove in OE-Core via

http://git.openembedded.org/openembedded-core/commit/?id=b7f3f7ecfdf26129c5df2d3ee14e73c4633ea5a3

while apps in OE-core have move to use nasm or other things yasm is
still needed by some apps in rest of OE universe e.g. firefox

switch to github URI since master has bunch of fixes over 1.3.0 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/yasm/yasm_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm_git.bb

diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
new file mode 100644
index 0000000000..b685b42412
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "x86 (SSE) assembler supporting NASM and GAS-syntaxes"
+LICENSE = "BSD"
+HOMEPAGE = "http://www.tortall.net/projects/yasm/"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a12d8903508fb6bfd49d8d82c6170dd9"
+
+PV = "1.3.0+git${SRCPV}"
+SRCREV = "35af9720e36df19382a57be26643b0d6bb48a363"
+SRC_URI = "git://github.com/yasm/yasm.git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools gettext
+
+export CCLD_FOR_BUILD = "${CC_FOR_BUILD}"
+
+BBCLASSEXTEND = "native"
-- 
2.19.0


