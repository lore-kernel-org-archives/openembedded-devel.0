Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id C26E771A9D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 07:57:23 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id w69so7078607pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 May 2017 00:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=M/yzeWRT5MYspjwR/E/EGhd5UGf4DPdtwBccmLYFcbw=;
	b=gLLfrEtmADCzpC4O577IlisItONAu8Manft1c5Jn8mmZ0a1BO1K+f7CWt87RrKGYng
	mxvz2qHgTwBji9URVYqgw+kvZWB6p3OFvcnfq7h8Y/yeXoZtR6ZycCf6+Udcx28OuoA+
	cyVyjZK8KR/BbrYTFHePEQUmxKZDTy8fHGNaWkMj1aeJ7CgM/P5hKmpyHf/fsL9QiZMC
	0SObP5ldmLtccX1DlH7Q6TNMJyxInSbkHJ0rhprKHp8GjOh0/ECv8pe9ukqeNkuqLX7J
	SdlEHJiZe+L+vJkH39gXF776zfL+THkHUSXteqsdwcLpGXrcj3mm/HD7FULRO+6/6hBZ
	54mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=M/yzeWRT5MYspjwR/E/EGhd5UGf4DPdtwBccmLYFcbw=;
	b=XG1Y67BDOB7ikc3OMY1Ms6N775vUpIc4gnplpqHfcuNCq7+19PgsLqIz2CplnFDh5c
	q4EIe5lkTdJSMFYbAPfHiJNRc+9ByWnftuRP4lEizKAznfR32S06rAxgQ8/8LXDml3dN
	ZvG2ruoPg1sBWGfd7ma9ksV7gv46X5WwqcXzqtVoa28p5jSTYkFVxw70luilQf37to1R
	fjlLDLuEDtV8OTTesWos9FjGrlN8PaIjoIFzYjcf2KLQe4hBvxopPSmoRbtxqoFsWmXA
	oLH5tGYHROqaEiI95iKGN+lYy27+fi/KiJlwawTXj3zEDRGBRjBGJl6oFjH1IpFZq2do
	URiw==
X-Gm-Message-State: AN3rC/7k+zM0GIdoXe+T5zN3rOeE0Q3Y4MtrGbxocKOUc8MadwkIu20a
	5QHD5mmfWsSy0w==
X-Received: by 10.84.237.1 with SMTP id s1mr91008582plk.157.1494316645118;
	Tue, 09 May 2017 00:57:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id
	i67sm20250916pfk.87.2017.05.09.00.57.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 00:57:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 May 2017 00:57:06 -0700
Message-Id: <20170509075711.1575-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170509075711.1575-1-raj.khem@gmail.com>
References: <20170509075711.1575-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 4/9] gssdp: Upgrade to 1.0.2
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
X-List-Received-Date: Tue, 09 May 2017 07:57:23 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gssdp_0.14.8.bb | 9 ---------
 meta-multimedia/recipes-connectivity/gupnp/gssdp_1.0.2.bb  | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_0.14.8.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_1.0.2.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.14.8.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.14.8.bb
deleted file mode 100644
index 9457abc5c..000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.14.8.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require gssdp.inc
-
-inherit gtk-doc
-
-PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+3"
-
-SRC_URI = "${GNOME_MIRROR}/${BPN}/0.14/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "b8658e480d047caf2d92baa4a51b9ae7"
-SRC_URI[sha256sum] = "4c3ffa01435e84dc31c954e669e1ca0749b962f76a333e74f5c2cb0de5803a13"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.0.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.0.2.bb
new file mode 100644
index 000000000..b60d1ea44
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.0.2.bb
@@ -0,0 +1,9 @@
+require gssdp.inc
+
+inherit gtk-doc
+
+PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+3"
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/1.0/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "b30c9a406853c6a3a012d151d6e7ad2c"
+SRC_URI[sha256sum] = "a1e17c09c7e1a185b0bd84fd6ff3794045a3cd729b707c23e422ff66471535dc"
-- 
2.12.2


