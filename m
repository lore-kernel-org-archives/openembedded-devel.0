Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id A6B1874732
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:31 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id f14so8053085wre.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=DC1PYN0xKv61paihtdpNCCHa7dZHa4y0D9pNgt41FUk=;
	b=QhWNmdpxTbRa13itI6dn7/FOj11jqxS2w1qE1RWqNvPqv7wwFsPIWT0bNc8V90qj2Z
	6/946hgYp1jp+kCkMtn+TmFvZqDBwoHzzXN+JVORBb0FmFwmLhqviQzXfEdpHwDIp6US
	rYk9uFuyzGh6QeFkqQAFyPIm2UlI9oxd12cmTmM/Nr2l+vWqfAjoqmc1Z5KVW8t8i2GS
	wSOtC9Ze3of6scePMM+T1v8VVMAMczNJ1k+sCV4gwkBzyaadOBO/O5a8+2LnY55t+oAq
	6Qkg5Wiu+PrTzRMQH0obNhnC8yo3hdXnda64X3neVVLdgQ4MNTvtS6f6rtT5jf+4ESks
	cmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DC1PYN0xKv61paihtdpNCCHa7dZHa4y0D9pNgt41FUk=;
	b=EEJm4enDUckZgC7t6ZC7MwPLKunV8ElM5Sc6MddIjdWYKxghSqy8edEEsB3LByHkzt
	PCT29df2W71k0izB/dCvFW2mYnFTlasUqGPDYuoFAjVFGBQi4Kf4eM2Yaby+kyKes+FM
	lJcussvfDi/6o1jCmENl7njoAMcvlpuEZLTo+uW8DljLnLWsgd6+WvjF9DtWtOG+8/C2
	FewDrfDjUwv6yy7heZjzNaW7nLEuiSHDcVPcIeF1rAgI8oD1Lz4lyTT9SLb8RUq00SIk
	GQCiBgPrGBHUFREAoDgky+L9+K3222Ea5i9OQKzk4NRC5gaTa7fl2xgpQe/HZZ1XlevP
	4goA==
X-Gm-Message-State: AElRT7FJULiG5n4/6Ogve7jJ59rbyvDpvSp4wHT3GxzTH27+U6kfjQcR
	P7BlH01ql8d7dLv3+krAC1aj1A==
X-Google-Smtp-Source: AIpwx48FsnVg4GgYMA6c07pwm055B+foevsEwiZ998r50h/YYyDXTxPhAf5MuxGp/f96aGIVj2KXzg==
X-Received: by 10.223.181.148 with SMTP id c20mr10144245wre.65.1522416752353; 
	Fri, 30 Mar 2018 06:32:32 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:40 +0200
Message-Id: <20180330133151.25882-29-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 28/39] gvfs: update 1.34.1 -> 1.36.0
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/{gvfs_1.34.1.bb => gvfs_1.36.0.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.34.1.bb => gvfs_1.36.0.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.34.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.34.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb
index 8d7865fd6..5f7391285 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.34.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb
@@ -8,8 +8,13 @@ DEPENDS += "libsecret glib-2.0 gconf intltool-native libgudev udisks2 polkit sha
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.md5sum] = "44012824aa75797a7d272cd60f07b488"
-SRC_URI[archive.sha256sum] = "7ef9b2aec234004271a575118a0e35b3c36ce3309e5f9da109635651843372b4"
+SRC_URI[archive.md5sum] = "216d461c5e96e2cea74253be407af6dc"
+SRC_URI[archive.sha256sum] = "9ec388afeb373a213f2cc489184f76a17ae273a000e8a4ec720c1995943256bb"
+
+do_configure_prepend() {
+    # make automake happy..
+    touch ${S}/ABOUT-NLS
+}
 
 EXTRA_OECONF = " \
     --disable-gdu \
-- 
2.14.3


