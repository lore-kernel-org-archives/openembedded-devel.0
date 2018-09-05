Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 68F5C793FC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 21:02:37 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id b129-v6so4011834pga.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 14:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2C4OUwCJ/wGfFiiI+GP4tYCdz3nZ9wdPaiaTZVfuA+s=;
	b=Fbn2JK3Q7lJ700sK6e2OPdtv/5a6MFnLYFk1tQCh72A3JTAtyE5uqEhtglJlARWPJc
	lnOyKHcgE3rifASh2Pc2WsBo4exS0EhkJAcUgKIKTT645SAKJCTDVDT5/DWrT2U+FB9y
	gMc9DrEB+k0l7/Ar23JJJFQrNAgmNC/3K5J8vAavvcbH4CaXkra0lRe8V82AKOZfEHx3
	sKfBoPC20kl4zTTsluvK75Obh+cafR5jRcqr/YViidMT4GkADVbCubjfN5SyS1dl07bY
	pR8JLNvW4soLpDwdloHoseevPX/65eZ12g2ykRFwUbsx76g9i1FwXteyMjZDzUw0Mlo4
	7M/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2C4OUwCJ/wGfFiiI+GP4tYCdz3nZ9wdPaiaTZVfuA+s=;
	b=LYKpBEjycx4tQCO4BFdwMY2ZmJh6onEBCZSG+66DkCTxHCIvVT3VSs03BD8nZWWdiH
	dGHfegS/wrOXA9E64ZcwbOxHNoSJfEANQ/m/F6rwXuK9Mcf3fXS8oXTFnsZ5Y/ye1hJE
	zjn86QYR9LgVUm5CYRy5rIdo4gPI75rel7g0HzLNH2ddYHma+6S5leTDZdKr7ty6oQ9I
	zmMDfNGRx5J1SPti6KMyKQu3mCh4PfVWyvrMRseBsuEh/tVt4iFKQIF4heUfdKkZrdHM
	BlXLJzBuWFs8RIb5ynupvFXdeyRYzmZIDCiTCBhh7vD5K5B7J3wEM5llF2+vSOvRvHBP
	14mw==
X-Gm-Message-State: APzg51CN4cji9xr1CbdM+SdpE3D0aqaikBfLvU/fjSuHiUJMawqkCiIL
	AKEnBy7EknmS/2eztft2SPmjbeLP
X-Google-Smtp-Source: ANB0VdYChykTobq9zDpoxdDDNOP6UgOdiEcn4cSMn42IFaheRAXM4i14YV568N8PNSVdqhE+BnPdIQ==
X-Received: by 2002:a63:3741:: with SMTP id
	g1-v6mr15621531pgn.59.1536181358207; 
	Wed, 05 Sep 2018 14:02:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	e26-v6sm3689411pfi.70.2018.09.05.14.02.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 14:02:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 14:02:19 -0700
Message-Id: <20180905210224.21225-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905210224.21225-1-raj.khem@gmail.com>
References: <20180905210224.21225-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/12] libusbmuxd: Add recipe
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
X-List-Received-Date: Wed, 05 Sep 2018 21:02:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libimobiledevice/libusbmuxd_git.bb         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb

diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
new file mode 100644
index 0000000000..7ab4ce1ba5
--- /dev/null
+++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "This daemon is in charge of multiplexing connections over USB to an iPhone or iPod touch."
+LICENSE = "GPLv3 & GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=ebb5c50ab7cab4baeffba14977030c07 \
+                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LGPLv2.1;md5=6ab17b41640564434dda85c06b7124f7"
+
+DEPENDS = "udev libusb1 libplist"
+
+inherit autotools pkgconfig gitpkgv
+
+PKGV = "${GITPKGVTAG}"
+
+SRCREV = "78df9be5fc8222ed53846cb553de9b5d24c85c6c"
+SRC_URI = "git://github.com/libimobiledevice/libusbmuxd;protocol=https"
+
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${base_libdir}/udev/rules.d/"
-- 
2.18.0


