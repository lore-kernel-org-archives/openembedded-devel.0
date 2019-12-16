Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 56A5E7F7D8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 01:20:58 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id c9so5259952wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XBaVvMANME2p8bQAiiXDtyUsZy3gsWfGpx4wEb8fjqw=;
	b=ap5neLrkTsFktvFn6xRL5nkhkUMq1k2SliS0DqeQIXlkjmLfqRqaPxYO5dsCet3qu3
	cvoiJR3I4XeGZeUxXmi3v+4GG6tODHYtQpEop/ZIUFGiA/F0yJki6dNNNoSqeNba+ufj
	BkaFstvKO7AMU6zrTMLlNVgzn7wJ1U55PGV0LCZfvh/tw1VeOC3vCseqDXsZ+0o5Kbmt
	SkWwRIhImgfDo285De2ROmHNQAz+UMVkBs14E8/ZVOo1F1js15COqnzp2CwuT1HKouSc
	Tpcw5FEQeGURjMjWOjgMqywwrU0KhncHZYC8dQ3Mv5X22RwMIdA4x9wJ5z3+TQv9BKug
	m1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XBaVvMANME2p8bQAiiXDtyUsZy3gsWfGpx4wEb8fjqw=;
	b=tBQTBfDME9seKSvaZGvahUE4/5S9aXe8BJFaXnYgww5w+MzXcu2k1Ui/MPpY02qz30
	w4+RqUP5229zDsGViSHtgeU3CxBjs5DV53mQQuC7bFigag5jm6TM9jiTov8MtmjZ1dDv
	/1YqlqW+vjCBCdIMexuIYHZwHdxjjVe4pLnxU9jIbj6SZrRyU71ZwCOdGpa+0vCeCzEO
	dk6+EDy5lYhAuPmRKdcts0s+fuOtC16QHNHYvueqq1b8gKA7Fe8oDAkdzyFSXe3fTyFz
	jPxyiKnLgv9cIV4C4+BnBzT/f/wzeetczGF3l9qOpD5KSfSMqdULngUizGb+7MGe9FUB
	kPqg==
X-Gm-Message-State: APjAAAWUubIttvwj5efLbHTUHb8wZCBuEizPocKbJGDV3RtnDueEyGr9
	2yrw9fc3BvhNDSCwPYx9M1z44+Ou
X-Google-Smtp-Source: APXvYqz7QxZ8LFXADDNPuN93ZAf0UdjMQJUU3S+I2THr+zf7Y5IfPkQOpax6xSrBtwxsbXyVNNJKZA==
X-Received: by 2002:a5d:5708:: with SMTP id a8mr28271795wrv.79.1576459258453; 
	Sun, 15 Dec 2019 17:20:58 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F06A307CB3B21B8240595DD.dip0.t-ipconnect.de.
	[2003:f0:7f06:a307:cb3b:21b8:2405:95dd])
	by smtp.gmail.com with ESMTPSA id
	t190sm10877063wmt.44.2019.12.15.17.20.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 17:20:57 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Dec 2019 02:20:42 +0100
Message-Id: <20191216012047.17312-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/6] libxfce4ui: give up glade3 (=glade for gtk2) support
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
X-List-Received-Date: Mon, 16 Dec 2019 01:20:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb
index 053eb201b..348b685be 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb
@@ -17,7 +17,6 @@ SRC_URI[sha256sum] = "c449075eaeae4d1138d22eeed3d2ad7032b87fb8878eada9b770325bed
 EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[gladeui] = "--enable-gladeui,--disable-gladeui,glade3"
 PACKAGECONFIG[gladeui2] = "--enable-gladeui2,--disable-gladeui2,glade"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
 
@@ -28,9 +27,7 @@ FILES_${PN}-gtk3 += "${libdir}/libxfce4ui-2.so.* ${libdir}/libxfce4kbd-private-3
 PACKAGES += "${PN}-glade"
 FILES_${PN}-glade = " \
     ${libdir}/glade \
-    ${libdir}/glade3 \
     ${datadir}/glade \
-    ${datadir}/glade3 \
 "
 
 RDEPENDS_${PN}-gtk2 = "${PN}"
-- 
2.21.0


