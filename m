Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6D53E77D11
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 18:37:33 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w43so35897603wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Apr 2017 11:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=mLO9LDpQknaOL2RH2RbZntp9CYpr18oxSloT/ZcYorQ=;
	b=bpAP/XTKxK/s4Vc3QXXtO2ClP2jj6a3EahbGqQfcBHWkRCMAnM50kqxIgC55OW53TJ
	O4lRKDB7Ub9flqkdDg+r5mxWzVho2aEBC2i+Tm0fMVMfTRcUEPdwjfJkKCoVE6+sfDbU
	Hxl5FIVNQivJOM9NC9fjePhtrno2tLupVqx8Jv4wK+py2zjn/BHTmW4wR1XfLLZR4ufV
	DFBg/kuHeDUQD0dOhT3B/ZOIAjSGoW+o2b8vCsZ7X3UYQR1MC5afSn5cJQ1G4F+KDaMQ
	g+mg4ohsxqbkuzD9r9ZsmR2KfS28kOu4RLrS1c+bhqRtVB1GzolyP2zOqVe7BR3PcMuI
	IGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mLO9LDpQknaOL2RH2RbZntp9CYpr18oxSloT/ZcYorQ=;
	b=ca1i6OdxWiA0Y7i2DaFM5BSb5qyULrrvG5cK/PKShHnXEeeupygc1C4yFax9WHAh9w
	Ikpy0A9ZkwU2CcSKb2/Jxcv36f7dOWOdWyRCjKDdu/8V2p3wBxgRue5AlydnDyiALzVR
	gURush5KEg3cYNzX9iF6rXwjC37LhLw7oLq6KWOY9EIsNFCLM/iSqVjBVFcQ28+bZCC2
	JLCeFOPDd9LDMT3WSkdESI47MP1LhXaAKD46g7R6Mt583HOVJWods6RHW8u0k9h4UV+d
	lsFA8QWP8y3v7Vi5n2Eu7jSK/Jp5bMVItrdZkTV6KW6z5uKQc1brOyeDlYU6O1JC0LRs
	DBFw==
X-Gm-Message-State: AFeK/H0pd3wPyVBlgcBLNLE2jPCEal4pWlMiTe6U3Ey09+VDdYSnn10J2cQkG4P/UEoHFg==
X-Received: by 10.223.164.141 with SMTP id g13mr5804278wrb.82.1491244654927;
	Mon, 03 Apr 2017 11:37:34 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h65sm19212349wrh.32.2017.04.03.11.37.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Apr 2017 11:37:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Apr 2017 20:37:33 +0200
Message-Id: <20170403183737.14791-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [meta-oe][PATCH 1/5] flite-alsa: Blacklist as old and unmaintained
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
X-List-Received-Date: Mon, 03 Apr 2017 18:37:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/flite/flite-alsa_1.3.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-support/flite/flite-alsa_1.3.bb b/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
index 51012e673..ca9a99eeb 100644
--- a/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
+++ b/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
@@ -10,3 +10,12 @@ SRC_URI = "http://www.speech.cs.cmu.edu/flite/packed/flite-${PV}/flite-${PV}-rel
 
 SRC_URI[md5sum] = "ae0aca1cb7b4801f4372f3a75a9e52b5"
 SRC_URI[sha256sum] = "922225f7001e57a0fbace8833b0a48790a68f6c7b491f2d47c78ad537ab78a8b"
+
+# Looks like caused by flite-1.3-alsa_support-1.2.diff
+# flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libflite_cmu_us_kal16.so.1.3' [ldflags]
+# flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_cmu_us_kal.so.1.3' [ldflags]
+# flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libflite_cmu_us_kal16.so.1.3' [ldflags]
+# flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_cmu_us_kal.so.1.3' [ldflags]
+# flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libflite_cmu_us_kal16.so.1.3' [ldflags]
+# flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_cmu_us_kal.so.1.3' [ldflags]
+PNBLACKLIST[flite-alsa] ?= "OLD: wasn't updated in over 6 years, only navit was RSUGGESTing it and doesn't respect LDFLAGS"
-- 
2.12.2


