Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7C071A92
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 17:11:45 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u144so97698300wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 09:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hf5p8gYRvBmf8LAgSFc7WP8ygfFeiiRCyxsKqOy+0/g=;
	b=TTGmvbH8/56GYvqCq025sL/xj1xXLCwhAp5l98g/2Kwzhwb6APw+RIyqE/MQ9kbfBX
	H8A+UcyK/zqsv2P0RdeNY0mzppJha4vsu4cebVj716lUII3Z/sjY3PzLa0MmpfZrx6Nj
	RSLlDim7qWDjihwYRvKjpcFNgMxKmbw2cG7Rv8iG++Yb0o0Ev48rhJuBOZts897RJ1M3
	sRRZC6ca9gCFhRBnvjrdSoKwfAkzT8k5Xo+zHBMSj+A4HGaKTeDlyMD+LdfJUesL9SdE
	GruO146GU3cWsSmiPOM2fmgjBjCHq+VxcnekFsYiA0ddAwZEG5tDK7fBOGbHqGJ7BM6y
	+vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hf5p8gYRvBmf8LAgSFc7WP8ygfFeiiRCyxsKqOy+0/g=;
	b=aGwu+EpXf5wsN6bHTqxuOGql9HAi6nasd4ymABOKxxe4a7h/1tAXRYsD+KsIvRAnf5
	qA3hUX4bkE6IAFrRRf6+w8RGcxabLCId07mPrtnqH3IoIVJl5mToq2nctep5ZRxh5K1P
	/y5w5liZTDARbYNcKZewm0YBsIscKlPG+cglBB2ekWszEWLytgKEoOn6c+HSBff3CGl2
	j840Xn2xfCxZnlAwtAPlp5yiQHkbdMkqNrCwg0qjxLzYMJl694rNdLkShcu1N4eNlc62
	Zi1zaGDiwwN0Ij0ExEHoRhKf0UlAjpGJzmMdkTak2sRs6uYAMSssjt/LaYgFmZTsD6kI
	7bEQ==
X-Gm-Message-State: AIkVDXKRsdx/uPu6c0/6PFvwLmft7zXl4UmZP8yvqL34wtLz9zWcTEEfx/3CZwDc2HQ4Dg==
X-Received: by 10.28.234.66 with SMTP id i63mr2603897wmh.43.1483636305258;
	Thu, 05 Jan 2017 09:11:45 -0800 (PST)
Received: from localhost.localdomain (p579F79CC.dip0.t-ipconnect.de.
	[87.159.121.204]) by smtp.googlemail.com with ESMTPSA id
	81sm101153107wmw.7.2017.01.05.09.11.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jan 2017 09:11:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2017 18:11:22 +0100
Message-Id: <1483636284-6351-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1483636284-6351-1-git-send-email-schnitzeltony@googlemail.com>
References: <1483636284-6351-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] atkmm: update 2.22.7 -> 2.24.2
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
X-List-Received-Date: Thu, 05 Jan 2017 17:11:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-gnome/atk/{atkmm_2.22.7.bb => atkmm_2.24.2.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-gnome/atk/{atkmm_2.22.7.bb => atkmm_2.24.2.bb} (68%)

diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb b/meta-oe/recipes-gnome/atk/atkmm_2.24.2.bb
similarity index 68%
rename from meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb
rename to meta-oe/recipes-gnome/atk/atkmm_2.24.2.bb
index 6f51e34..30ac90a 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.24.2.bb
@@ -9,10 +9,8 @@ DEPENDS = "atk glibmm"
 
 inherit gnome autotools pkgconfig
 
-GNOME_COMPRESS_TYPE = "xz"
-
-SRC_URI[archive.md5sum] = "fec7db3fc47ba2e0c95d130ec865a236"
-SRC_URI[archive.sha256sum] = "bfbf846b409b4c5eb3a52fa32a13d86936021969406b3dcafd4dd05abd70f91b"
+SRC_URI[archive.md5sum] = "d53b60b0f1be597e86070954a49cf0c3"
+SRC_URI[archive.sha256sum] = "ff95385759e2af23828d4056356f25376cfabc41e690ac1df055371537e458bd"
 
 EXTRA_OECONF = " --disable-documentation "
 
-- 
2.5.5


