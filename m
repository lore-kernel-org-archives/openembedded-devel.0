Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 14E067197E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 20:38:19 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b184so10618226wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 13:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vv+C4/vSi48AG71YTgRcauFxHm8OwmE+xoGvGcNUQsQ=;
	b=ACpYMpHZzckwqvmCON5cowIGYUJbkExr5qVeLzfcXXN5jVC1I9JxP/5gAPJcTCY//N
	iE6OIia9lPVL6WWNwHx1wQHDWRfrvF0LpKtQv2S+2O2MY11P9WYiwsCrqK3so0vKcs1A
	r/rOKOZqjGXY2iWQ3vudyarK5XtxOVLK7+L67MLaYpE0AyBk8EmJSuutKoQKp0KbkF7w
	/B2fPGGMO8xxZbM6Aqa2XX2ZmSRCcQ62s5d79LQyN+5gygDOaw+azOvEdgfHtGnG/Itx
	5JdsRfBD8pCaxz9Iofj5zuLIeZwkjTBo5O1NtlQxrF2k6Dl30+nc78iujh8Vgw4En4GQ
	VjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vv+C4/vSi48AG71YTgRcauFxHm8OwmE+xoGvGcNUQsQ=;
	b=ZrUkGS/9OgBh1Fxn/yM2WJ2ytMlJlTBiC3jI3WNIe8/YcgYoby446No11AzWUUoqX/
	zpYwYfRIjeMBHxHvDopN+4ibPJpzGrOYFINbQA6Wr/dnbLx//EKBXCDbk3Y9tT+r96Yu
	NL+QEmodCvpKDZm/oF9wzDzZ/Ep/ebzatOyOIkwj0IptRVdT3uIR+s+2TlzhsZ6DtwDu
	pDkI6Kq8trXhyKBj4Xu2F+4xVgbeS5kqWLresPVh7gluS2ry392wBGSXhLXQ3MUFxIyU
	OhL0RlLJavkk8NbKF1H+zJ44cetdUBfsvPqNQ3QI0vZYRZBJbXBdyVxOO+aw8ah6iKzI
	Tszg==
X-Gm-Message-State: AE9vXwMWl/adHJCHwcogO6pqBqAUf1tY/RbvGsvQdo5HCiWtKg2B1OTcQRuuSwbihb6w5w==
X-Received: by 10.28.196.14 with SMTP id u14mr5209089wmf.17.1474490300111;
	Wed, 21 Sep 2016 13:38:20 -0700 (PDT)
Received: from localhost.localdomain (p4FDF06F5.dip0.t-ipconnect.de.
	[79.223.6.245]) by smtp.googlemail.com with ESMTPSA id
	a1sm35260377wju.41.2016.09.21.13.38.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Sep 2016 13:38:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2016 22:38:03 +0200
Message-Id: <1474490283-1332-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474490283-1332-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474490283-1332-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] evince: add intltool-native to DEPENDS
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
X-List-Received-Date: Wed, 21 Sep 2016 20:38:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| WARNING: evince-3.18.2-r5 do_configure: Missing DEPENDS on intltool-native

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/evince/evince_3.18.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
index 5e6b30f..1164768 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Evince is a document viewer for document formats like pdf, ps, djvu"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
-DEPENDS = "gtk+3 libsecret gnome-desktop3 poppler gstreamer1.0-plugins-base orc adwaita-icon-theme"
+DEPENDS = "gtk+3 libsecret gnome-desktop3 poppler gstreamer1.0-plugins-base orc adwaita-icon-theme intltool-native"
 PR = "r5"
 
 inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection
-- 
2.5.5


