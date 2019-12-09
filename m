Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 562367E6EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:09 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id p9so13546964wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=axl5s9h/WEQP8x+cIY1OeB0kxjwY2joxYdtuc9mDjMg=;
	b=sBik/BNBeJVpHKQb0+juHB9yqXFtBKDhZMIlg/yj00e97MulCAfyejQfce7Ol/xUpa
	1vxkB+SG1VXXfq3tUNNlHOl8HbSzhfReaaU1p682S74SnnZnV4kF/K2Ps8igqa9R9Snk
	Qio+iYKyryD0GpY7UsHwGWZHW4fpt4RDVEtGwgsrbIghtMHgIAmZ2m9798+xvDJElp41
	jK8wh/q71ns2xSFKfX5I8U72aht+t0eAo0IY5sjMvXptOGGEP5P/BDnWtT72MUdVQdKe
	evi2TBvZkc3BaN6EaSd0cdLC1YAxGahUyT1DDi6eq6VQI8b4P+OZXC/L+UeNVAInmOAp
	j9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=axl5s9h/WEQP8x+cIY1OeB0kxjwY2joxYdtuc9mDjMg=;
	b=CZ8WluzyDuWLdZEJUfeIw2Ukt0got+qh/kpjHOXQrS82sHqfGy/I+Js1/uldOuIV0I
	X4DEazm8gXg7+jP+Prlbrct50b6dRBfRxuLran2gbZt58xjMT5On/J+oe4wEUQ0OijsH
	8aZOUD1u56kjWXDUlytw3pmZq4nsxoQt+2sCcWq40MzQwu4W9E27FRb5ALpN0K/vl4xa
	RShnJtIorpSu2mlT2LsLIE7s1ap07ufwOc9UUasGA2UmBu3P3VknTtok/1PIJE6Fjdvb
	jDRoSEHxMx87Mgk9uCyKqvaK8Xxm7WzcFznku8gbAFe6QXEZFEu8C7hT34n6m/eW4pRc
	VOzg==
X-Gm-Message-State: APjAAAV+hCCeATxqguJ7KUm1CoSgJHPS+YZ45n9FTjgeHLW6mm6fUCnU
	DN1KgBuBjZJef5ZFDxIWm0QgJf92
X-Google-Smtp-Source: APXvYqxCMtqwRIU45RWJcBQPLxWpSgcpgdf2uvvGf08Tse83u6t7jnvK25Ms5AsZ5Qz5Bq8mP6egjQ==
X-Received: by 2002:a7b:cc6a:: with SMTP id n10mr22612066wmj.170.1575851949993;
	Sun, 08 Dec 2019 16:39:09 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:08 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:28 +0100
Message-Id: <20191209003840.3383-18-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 17/29] gnome-backgrounds: initial add 3.34.0
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-backgrounds_3.34.0.bb                 | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.34.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.34.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.34.0.bb
new file mode 100644
index 000000000..2350a7df3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.34.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "GNOME wallpapers"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
+
+SECTION = "x11/gnome"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase allarch gettext upstream-version-is-even allarch
+
+SRC_URI[archive.md5sum] = "f350804df16cdc9ef5306087157cf31b"
+SRC_URI[archive.sha256sum] = "c2b7fb6db98c05e205053daaa7f58c7f06ff91b45c4006052af17c578ae7b47f"
+
+FILES_${PN} += " \
+    ${datadir}/backgrounds \
+    ${datadir}/gnome-background-properties \
+"
-- 
2.21.0


