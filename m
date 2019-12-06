Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 190DD7F8DB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:41 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id j42so5778772wrj.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=axl5s9h/WEQP8x+cIY1OeB0kxjwY2joxYdtuc9mDjMg=;
	b=sLakHE3MGrGqgqZzT2yqWxScsX3p6XNgbx9lQZfrf1NwvY3iLcV1fa9g1InqZs1wmT
	u/jVvNATy4z2NPgx7VhQBwfwnGAhY7PyKqCDA+mrXmgMONOKy7V32m8YtGxWj/3QKyqF
	vjsqcEo2+/tmB5vT4Id7957M8bLDybRAvCPb8eR6l7Qvhz64GDrNtNAHW6MllcfszsyD
	nVkc7Egv6btVBzEE4EkAvD3f/rDiVg62Lki91hw/UXrKPwNbivpf11V2URhcd8flKwwC
	uQBFOOBbE6dMX/p/qBuBr1FtK3pOKU5XukcQACAnCLge6kiJB1ASowHjFd+6fssDvxd8
	19Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=axl5s9h/WEQP8x+cIY1OeB0kxjwY2joxYdtuc9mDjMg=;
	b=pOACVNkffB7AmcqTpH6PsJQSbzhdnEMF3j6ATxYIlyW7nL82iGZ5WpK754VzRS05QY
	18NtEB6CCenGZBvV9QvnrsDdwAv8v3pHl5GqDxTWpjKbGcXOPaTFaoMUz8FRj2qAUjsi
	68nejkogwAdjU/nOz0mOKvGHpSJPVskaHkvBlsLitD+ZS74/yE9FWooOvds0eY2LJ1Cj
	IUWXvFYsQcd6k1TPP9SJzglGC2idpCLp4vgat3fHmp6X24F6pJz626NK88KTK4g6xKGl
	v6MJ24VokGIubN7DOt1Tvz3nnGtkJlNEuDboH7/l/mpd80lpbIJQShPXOT3hXxtifxcJ
	4byg==
X-Gm-Message-State: APjAAAW4/kltzJFg1R+DhFkqWmOb2TJRk4RHZHxI949azCGVTiOYKMV5
	5SPDi+PgP6guCkroRkVe6HDXGEBs
X-Google-Smtp-Source: APXvYqw2tda2X1YryPPU7J3VPHnALwlsqEuYXhDht7kCP+FOk8Bj9yedrJwpzPmdAJkMEADFV14IDA==
X-Received: by 2002:a05:6000:12:: with SMTP id
	h18mr11962062wrx.87.1575590981543; 
	Thu, 05 Dec 2019 16:09:41 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:40 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:09:08 +0100
Message-Id: <20191206000912.19841-18-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 17/21] gnome-backgrounds: initial add 3.34.0
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:41 -0000
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


