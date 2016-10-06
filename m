Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id EAA6E60761
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 16:39:41 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id qn10so1334979pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Oct 2016 09:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=ob/Gtr6HUZneKWbfkBQcqfo2WMxgFa44m2CfB2b0nLo=;
	b=MN6n/mcbKr75BKby5bju9QdBr4mk/dWZspoCrWtaKN0CWuK57qNhbaObCxb0IiGuJu
	/55H+IQ2gLwmnAQD0QVnXKZn1ofnPVG4Kx4Y1PFB5otaqhxqfNmlJCbTRoqYx87p22ja
	9p7i5P2PEh3MOramJALq/iUe6XMLcNWvXCN54rr+uSNmBjV2qrsCd0+2QsBKsTp5io4U
	C3A+1FCYM20ML9fsGjtrPZKI3jjWjjImmZA6RQJDWnAxU4a/oeSTA4MJFwpvAkcD3eEX
	qM5Hkrq75cIdrw02mXS9KOGqVciGiwKV60CDeC/p3sSGMA2d2wKlSly+AjMZZngwvgBk
	yy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ob/Gtr6HUZneKWbfkBQcqfo2WMxgFa44m2CfB2b0nLo=;
	b=fdtoy8zLz9gqd81LKOrtfQXMSpF9kxTFityQl1oSrmt69nTqKa/7YCEPY2Wkhi3T7t
	ueYgIdrbNDyidzDr+oMO1sW0lG39b21FUpxqeHIKfzdd4uIeIqRU+sCu1Ls2Im/ZZO5s
	0+xVHDFw7r1b+cfokUi9/odaUcqpY2AUvc6ebdOwDUz8tyztfkoJjji8jHVgdlcQVMPA
	RYebrAonsqohAHU7VIemvr8hmLl5oPBxW6byHTpujAcVJijPdYLrCG3PJw3PSYKE0b8X
	hnU4vFwGxAvMvZ2nJun+AmdoYzg3rxD32RTM/rjs2W1lnkeMPbnr3Pv8f7zdi07Td/Xs
	Kb7Q==
X-Gm-Message-State: AA6/9RkaO+onj70sJ+X8O8yPv4j6JK4kCIuoALuJNjqQB6Du4rIrTwYb3/2IcAHqc72pLQ==
X-Received: by 10.66.222.68 with SMTP id qk4mr13380209pac.53.1475771983077;
	Thu, 06 Oct 2016 09:39:43 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:c925:6dc:3d3:a815])
	by smtp.gmail.com with ESMTPSA id y9sm7065951pfk.2.2016.10.06.09.39.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Oct 2016 09:39:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Thu,  6 Oct 2016 09:39:39 -0700
Message-Id: <1475771979-17364-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-gnome][PATCH] gvfs: fix fetch error
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
X-List-Received-Date: Thu, 06 Oct 2016 16:39:43 -0000

ERROR: gvfs-1.28.3-r0 do_fetch: Function failed: Fetcher failure for URL: 'http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.28/gvfs-1.28.3.tar.xz;name=archive'. Unable to fetch URL from any source.

change SRC_URI

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb
index fde57c1..746d73c 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb
@@ -6,6 +6,8 @@ inherit gnome bash-completion
 
 DEPENDS += "libsecret glib-2.0 gconf intltool-native libgudev udisks2"
 
+SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
+
 SRC_URI[archive.md5sum] = "d2399a1a217dd5030e8830c7e7c813c2"
 SRC_URI[archive.sha256sum] = "458c4cb68570f6ef4a9e152995c62d0057c3e0a07ed64d84c7200cdd22f0bd17"
 
-- 
2.3.5


