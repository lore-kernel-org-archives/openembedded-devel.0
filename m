Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9A7D57FA68
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 14:03:04 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id i1so6896365wro.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 07:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=X9/eg2ogLkOefuSucsgrGHOe4jK5r8vG/wEFxW/0xqc=;
	b=behLxctpdd0p1a8KCqVrwGmdl338qA9x+y406cDM6FTVMa3v1gw/NQMKvo7bH98g7N
	Ozqo4/PXhyiF7I1iDm8lZeDtqqcEC6eRus5bNZ8TxFtK64WMC++8Yuqz/6heyfldspmh
	TK7FUCAUl35VIYENTOxNTheDOIYwCHMPfD7pyLMBw6KNRiEXbty8Dmw5LfpHVEIqv0+k
	VQVqgvUnlhcTNYKZX/rRoUx9r2Ke68OEbZo+4NC9mUTcQ3wHcnHtkb4TBJv3UHP2e0nQ
	Bfm+vW/BwClp29F6LA4CNwngVmmJhotf54dGG8OiLkcGSha9s0E7u4uG2Wnds5Ku35Mu
	BSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=X9/eg2ogLkOefuSucsgrGHOe4jK5r8vG/wEFxW/0xqc=;
	b=RFIRrqDoBxZz+NP8t+eoSMipT5kDR5FBtr3znehPDVr+mR9eiQ8BzLbYqpKYAgp19u
	SZl1hbzwL55y9Mtge2h/sQNFoo/3ExTG5ZuuTsnUUKiOHtix34jj52i3dhkNGzgtoIZ3
	QOX03m5UvgkfvWmTT03/CUm9n/sthO7mmdpbSqG2jEPbtQ+nVgI1/jOSGNrqLmCy5rCh
	hmrtu2gjH+Je/xq0lZW0SvD7XAcNpn4I2A6sY+PUnX7ptwObpZ4x4FS5wz1wqpjvJw36
	VOUfSU0PbVprT9W4v6rfXy9gfkruqFyvEGeVdu8XEocV8C4gn7O330JKumrW834gP9rN
	J1qg==
X-Gm-Message-State: APjAAAWy3yL54I1eQyGuRszupe2D4ZZ7AQMkdGDcutrb/kCpu21OnETE
	MUKnMDv+hfDykGzL/GSBdrQd/Bjffbw=
X-Google-Smtp-Source: APXvYqz9Ivt94GI7+0SZD+4drIV+pMM+2II0uTpIBFdemTlqeQ3KqPBPy2OhZxvCu03KVY0n+hrBQQ==
X-Received: by 2002:adf:e605:: with SMTP id p5mr11907866wrm.105.1568988184822; 
	Fri, 20 Sep 2019 07:03:04 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.215.101.3])
	by smtp.gmail.com with ESMTPSA id
	f186sm2338132wmg.21.2019.09.20.07.03.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Sep 2019 07:03:04 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
X-Google-Original-From: Vincent Prince
	<vincent.prince.external@saftbatteries.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Fri, 20 Sep 2019 16:02:42 +0200
Message-Id: <1568988163-30013-4-git-send-email-vincent.prince.external@saftbatteries.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568988163-30013-1-git-send-email-vincent.prince.external@saftbatteries.com>
References: <1568805952-19822-1-git-send-email-vincent.prince.external@saftbatteries.com>
	<1568988163-30013-1-git-send-email-vincent.prince.external@saftbatteries.com>
Cc: Vincent Prince <vincent.prince.external@saftbatteries.com>
Subject: [meta-oe] [PATCH v2 3/4] python3-regex: add recipe
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
X-List-Received-Date: Fri, 20 Sep 2019 14:03:05 -0000

Signed-off-by: Vincent Prince <vincent.prince.external@saftbatteries.com>
---
 .../recipes-devtools/python/python3-regex_2019.08.19.bb      | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100755 meta-python/recipes-devtools/python/python3-regex_2019.08.19.bb

diff --git a/meta-python/recipes-devtools/python/python3-regex_2019.08.19.bb b/meta-python/recipes-devtools/python/python3-regex_2019.08.19.bb
new file mode 100755
index 0000000..80194d6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-regex_2019.08.19.bb
@@ -0,0 +1,12 @@
+SUMMARY = ""
+HOMEPAGE = "http://pythonhosted.org/regex"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=51cb124129fa4d157b4aebb77df73629"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "d31ec392ab75b894404d8db76dacd191"
+SRC_URI[sha256sum] = "587b62d48ca359d2d4f02d486f1f0aa9a20fbaf23a9d4198c4bed72ab2f6c849"
+
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


