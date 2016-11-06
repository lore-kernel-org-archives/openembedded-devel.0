Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 13EAD71AA2
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 22:07:19 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a20so2687690wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 14:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KpbPgxp/cFzqBVa/tg1BB0B4F4trxvc8v7Cb+M2qsl4=;
	b=X8i3MQ9mHxCgh+dC5HVWfZJfwGMdDjQrg7b4n0KtqnscKWoFPnWaN9Bnhi4CiKUB++
	y84cpb1L6bIqxyWSBE2sdhXEw34kItkS9/wXE+dP9KM0T8Vv2akm1PYXvSFJRzpsq+Oq
	GzHESIQjev2YMO1M514Uti9+FyM7a2L2bnluBzJX5Cj9fWT6WwTbhIEIIzIRbheHJb0Q
	bp5qxuH0umu99dkNcvnmsRO6STAjx0bbfiHk0FCRVGhNNZNC/q64lQMHodG3LPVTOyNH
	1tc8jgs7ALEPUWYDQNysWywqGiO1oY0WhrWRy34YIIGYsHIdKX4Dc4PXBo51hR0C7SfA
	nkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KpbPgxp/cFzqBVa/tg1BB0B4F4trxvc8v7Cb+M2qsl4=;
	b=LXdGASv+ZodVuUsrQGPFtQyVqHiNdV0a0kIqnKHvnVW2te8C4RY8lAbbrY3F5OINHr
	+3ab2mdGyud5J4ysQpJlSV+Jf/A99pLXspkV2Hf0+pu65bIFXqF+UKRiaHso67tCA2Jj
	ZHfG9+TVLmMkIaFSq+tLANSJfAh5bs5v0oGj4YxU5HalrmYhcsT0N1QasgI6m9rFoiGP
	C2R2B4LNyYAI2nPGbLAFXtim7Hzq/xp0GEG+Na3RjvzVufsUY7CHsouY/36A8RdEK86j
	FdJfJqSG23GKj/Ts+T1JlBgFKOTDZIhOX8NOA/eyhmf4LzbMNHQbkgPtdk5ZiRQqxPkv
	nsmQ==
X-Gm-Message-State: ABUngvfgovEZeu7rLjl5cNz+950BW/bTEUstukksNUy8uavOxlzTzZR/S1I3ImFMeuDYGw==
X-Received: by 10.28.0.13 with SMTP id 13mr3788129wma.126.1478470040173;
	Sun, 06 Nov 2016 14:07:20 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D71.dip0.t-ipconnect.de.
	[79.223.29.113]) by smtp.googlemail.com with ESMTPSA id
	k2sm16044363wjv.11.2016.11.06.14.07.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 14:07:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:06:50 +0100
Message-Id: <1478470013-27247-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 12/15] gparted: update to 0.27.0
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
X-List-Received-Date: Sun, 06 Nov 2016 22:07:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gparted/{gparted_0.24.0.bb => gparted_0.27.0.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_0.24.0.bb => gparted_0.27.0.bb} (88%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.27.0.bb
similarity index 88%
rename from meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_0.27.0.bb
index 73a15db..0e296e5 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.27.0.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 inherit autotools pkgconfig gtk-icon-cache
 
 SRC_URI = " \
-    ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
+    ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://org.yoctoproject.pkexec.run-gparted.policy \
     file://gparted_polkit \
 "
-SRC_URI[md5sum] = "b8480274c68876acff5965d4346710e7"
-SRC_URI[sha256sum] = "02398ab33894a59b0bd8707e598c46d8bb56f1413cd54de48eed61e2920ecd60"
+SRC_URI[md5sum] = "726f539f774b442670028af656f270bd"
+SRC_URI[sha256sum] = "208cf60c061b86bee4f658d568a3b5d843dce3ab9847f66b452298268799e7bd"
 
 DEPENDS = "glib-2.0 gtkmm parted gnome-doc-utils intltool-native"
 
-- 
2.5.5


