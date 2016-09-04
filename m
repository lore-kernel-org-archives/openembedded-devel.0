Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8027B77245
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Sep 2016 20:15:37 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c133so10457836wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Sep 2016 13:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=SvhrzcrkdjP59sKC2Nf4YawkeryroMIBwbHYWFfVuEo=;
	b=FK7ivafLDiHY3bGhV9YkXKDRNZQHrUx6bwAXVTFQPl7ouq/SNSVEt6MrnuedKsTtjM
	NGSD/AIOaY11qezFP9UNKlTlh7QkRxzeV/V6RA4YStoBqQvUe8wSQKDOvemapkVtDSKT
	LNKIjDRVa2sH6vMtx/0AG/ZiqKQJXmeKv97Bt87Oac646HfSXIv6UgWuUIqyMXnbe+jp
	W/HgYkud+xaio4Jm9Ktigc8wi41DXMAeBNQheyLaeX+oR8l46l8eMlkesdUKbOASI6T8
	kTM55SzQ+0xab9rKSmoVrd75hEFFBMs+UhDHo30Kvo47C8T00DKCBIo44zmIMneDAn0f
	Qryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SvhrzcrkdjP59sKC2Nf4YawkeryroMIBwbHYWFfVuEo=;
	b=KIrMmwblXYf5aFuxluhdGz+Yl5Wesn8AQPxKuY/RtkXXAoSb7l2R18khyIht8qf6Ky
	Y5QqJZ7p7i132GWaEpQ/QUg2wQZtYHQkL7h2om5skVoAgFC5X9SBM4NDRKCZXd7RXy/I
	ZCabie+wwhqwcnjb/jf12pMH5pU1TcXYVIjZ31oZqS1ZUUDbXvDPDpJ+48iXZPQbhcCd
	CLYwdxvo+Qf57GOk6tKbM4gdVb8RXhHLgvzCO0lsBvJEU27IKx5wDNN/2ytoYiy4N0Cn
	hbPMEMm9UZxQz86zeMA+LvlIPLdcn1UL6YWk8OeSkcP+LwHlbvySPjzfPh5ubrOKSbPq
	fSag==
X-Gm-Message-State: AE9vXwOBVOpdXfhyHCEkKuGqpP7kK2v5Eub9GYg07YqVRpL9iVN9W8doarUcljjBE5LE4w==
X-Received: by 10.28.169.209 with SMTP id s200mr7290846wme.87.1473020137382;
	Sun, 04 Sep 2016 13:15:37 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3967.dip0.t-ipconnect.de.
	[91.10.57.103]) by smtp.googlemail.com with ESMTPSA id
	v137sm10708151wmf.3.2016.09.04.13.15.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Sep 2016 13:15:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Sep 2016 22:15:10 +0200
Message-Id: <1473020112-25797-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1473020112-25797-1-git-send-email-schnitzeltony@googlemail.com>
References: <1473020112-25797-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] libgnome: add intltool-native to DEPENDS
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
X-List-Received-Date: Sun, 04 Sep 2016 20:15:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
index 27b8b9a..40caa7b 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
@@ -12,7 +12,7 @@ SRC_URI[archive.sha256sum] = "b2c63916866485793b87398266dd7778548c1734923c272a94
 SRC_URI += "file://0001-libgnome-Makefile.am-allow-deprecated-symbols.patch"
 GNOME_COMPRESS_TYPE="bz2"
 
-DEPENDS += "libcanberra gconf-native gnome-vfs libbonobo esound"
+DEPENDS += "libcanberra gconf-native gnome-vfs libbonobo esound intltool-native"
 
 EXTRA_OECONF += "--disable-gtk-doc"
 
-- 
2.5.5


