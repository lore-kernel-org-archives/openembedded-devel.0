Return-Path: <mickey.happygolucky@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4C55970018
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 00:59:31 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id p68so1334327ywg.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Aug 2017 17:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yTalCsvVWyvdZPcMENIk+lY0L1vryroIE/d162Z9kvs=;
	b=vLN+5d9uab+Ko0XLinGOE78Zg5GVnq1tC2VsMM1mVBjF/0EHnWJWN3EWdHVjdR8Oyj
	KvKhhCDli0GnTXoUJnhllY/+5K9vdMuxsvgSxWbL25cZqkm+akXyzqByxe93D3Anzfv7
	FwHMSvAmrfpzuF4jCVZAUBKpeOmoKtIeLL+r1ORDZlMkOGpuCgTzLW6TMeP4bp5HeyW3
	PYvTEapBu7rrsl9t7UWBBxxzmkuybN4BY9ezwwFhakc+0J6zdBQN1qCdM8NRRqSfAsSj
	C5APbT+NakPBMG/g07X9yCx/nqsPmk4pe85v0wyB8cvv30S8GOVIMDe/bIIyh0FRCrWX
	elEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yTalCsvVWyvdZPcMENIk+lY0L1vryroIE/d162Z9kvs=;
	b=lFNljKegylHfHTRBmYP3/+vBCLP+KjNwq0ISoO/GdGbu53mlbERvhbTGyV+lZZpiTQ
	aEKrKX34NyIc+fRHs6kwUpGDdWPgh+X4DQTHu4wzL4V0XtXC9ZTQzAKhiCwLfoDjoPfw
	79MJujYo5Pk4QHSelnnBG2MFElt9DuuTPkJ58/9AsWWeE/VCMhpi0IS9o4UtNnB3NOhZ
	slO4rbtGKMeT5ivN7ANTeHatSCoDNnSZ7QBHemmUjD2pcfG/s3msVkOIEEoO82vCDJ2Y
	UiRXt21Q0GqJD9q3aB5VPEOlAiOLrQ9JPRnJlyzJZMpG6TWEh3XjLh0t+6/cyfKzyTWx
	33OA==
X-Gm-Message-State: AHYfb5jQGwppIcOywQQkPfjVB660AAGSiIU7FMEbFV/dFuKe8ly+7l1Z
	TXv4Zn01c3fBKWdA7DQ=
X-Received: by 10.84.232.6 with SMTP id h6mr2700078plk.173.1502153972162;
	Mon, 07 Aug 2017 17:59:32 -0700 (PDT)
Received: from localhost.localdomain
	([2400:2411:21c1:9d00:b8cb:4f3b:9c01:c505])
	by smtp.gmail.com with ESMTPSA id x25sm89484pfk.80.2017.08.07.17.59.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Aug 2017 17:59:31 -0700 (PDT)
From: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 09:59:09 +0900
Message-Id: <1502153954-2796-2-git-send-email-mickey.happygolucky@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
References: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
Subject: [PATCH 1/6] anthy: Added libanthy-dev to PROVIDES_class-terget uim: Added libanthy-dev to DEPENDS_class-target
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
X-List-Received-Date: Tue, 08 Aug 2017 00:59:31 -0000

anthy.h could not found at confiugre of uim.
Dependency broke since it began to use recipes-sysroot.

Signed-off-by: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
---
 meta-oe/recipes-support/anthy/anthy_9100h.bb | 1 +
 meta-oe/recipes-support/uim/uim_1.8.6.bb     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb b/meta-oe/recipes-support/anthy/anthy_9100h.bb
index a65d324..c507ad7 100644
--- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
+++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
@@ -18,6 +18,7 @@ SRC_URI[sha256sum] = "d256f075f018b4a3cb0d165ed6151fda4ba7db1621727e0eb54569b6e2
 
 DEPENDS_class-target = "anthy-native"
 RDEPENDS_${PN}_class-target = "libanthy0"
+PROVIDES_class-target = "libanthy-dev"
 
 inherit autotools pkgconfig
 
diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index ed846b9..4cb7b62 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -14,7 +14,7 @@ SRC_URI[md5sum] = "ecea4c597bab1fd4ba98ea84edcece59"
 SRC_URI[sha256sum] = "7b1ea803c73f3478917166f04f67cce6e45ad7ea5ab6df99b948c17eb1cb235f"
 
 DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
-DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native takao-fonts"
+DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native takao-fonts libanthy-dev"
 
 RDEPENDS_uim = "libuim0 libedit"
 RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0"
-- 
2.7.4


