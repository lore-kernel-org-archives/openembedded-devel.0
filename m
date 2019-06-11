Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 87AFD7E653
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 16:55:12 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v19so3687647wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 09:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JGBRJuxiJQXKWvV1ZBnSQJuv5dxLPV9p+MGDXhNMwwM=;
	b=G7XiGkIwbEwY3tR0/6mVagMuX2SJP/jOzcbxQ/K3G1BNqtc71VAQ8p4ZJoFBF6spXD
	xcpubU+OLLHnJVeVeAx7CNaD0YU32wFX0GCVJrP5nrEnALnjgYa8nXbOE5bGYxz37E8d
	KV1BloCTjXXJW8q+k9tBidKyTTx4zQJqETX6WS0stA9An0+8s90na3rnKpOEFofnP+Wl
	uJl1IfFaH2AHVL5Scu/AgyV4K/CbPtjGWhVeEFfAELaFEx4x6sxpxvFb1ppc5ugP3Zo0
	vQ0o7GIICYvPKLojG6v7zX2jOxL+tKNcgj74gfCj6lak99smuDHgIoGj3PHXu/rWMqrS
	YZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JGBRJuxiJQXKWvV1ZBnSQJuv5dxLPV9p+MGDXhNMwwM=;
	b=I6PUBZoA0Zu85KVXhwhMUIEfkANORNbIyX/qz+JalIPMcAqWbHB+MnygOFO4K7uJqh
	0s0oqGgTD8VY2gHyctMtZ9MLPFUaOWqkpkVNk7AZE7n2cVt5XKFiKhMD4nOElEVqt6BF
	OKCL9CkJhSNOMLebeHjbPO2kL60MHGASxZVu/H2y6D2EH5APlJ4cA6kSVRUyll87wfA6
	dx6+api/zDs7vJ04kbRzZGhCXZoM5EEzvZJpc4AYTF1/cxaJP6rNpMBjqGdE0Qrece77
	ovfP/iKbevAmHUGQ72KL9UIFSkltqBmpaSzABLnZ8Uz7Bu+6D2gy6ZGBT62TEfLgrcXl
	YzKw==
X-Gm-Message-State: APjAAAXiAYmF9JmO47SxF7WdxnvK6Sq4xTZg7sHhak0+eEuU0hBEAoDp
	KE87Ons+Ox7b1aba3fZsVnc8kF9Q
X-Google-Smtp-Source: APXvYqy2CMen6dRG8WyLTZfovrZjVVG0tbyfxiLVh4I5NPXMmRSrpHqyuoNP1rEZAe0ecOl0z8roXg==
X-Received: by 2002:a1c:228b:: with SMTP id
	i133mr18672401wmi.140.1560272113199; 
	Tue, 11 Jun 2019 09:55:13 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	b203sm4038454wmd.41.2019.06.11.09.55.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jun 2019 09:55:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2019 16:54:59 +0000
Message-Id: <20190611165504.23049-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190611165504.23049-1-Martin.Jansa@gmail.com>
References: <20190611165504.23049-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][warrior][PATCH 06/11] triggerhappy: fix issues
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
X-List-Received-Date: Tue, 11 Jun 2019 16:55:12 -0000

* using PN instead of BPN in S causes all tasks to fail:
  make: *** No targets specified and no makefile found.  Stop.
* using github archives is bad, because they are regenerated from time to time
  with different checksums
* set PV, because this isn't exactly 0.5.0, because of the debian changes
  mostly the systemd support
* fix indentation

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ggerhappy_0.5.0.bb => triggerhappy_git.bb} | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-extended/triggerhappy/{triggerhappy_0.5.0.bb => triggerhappy_git.bb} (73%)

diff --git a/meta-oe/recipes-extended/triggerhappy/triggerhappy_0.5.0.bb b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
similarity index 73%
rename from meta-oe/recipes-extended/triggerhappy/triggerhappy_0.5.0.bb
rename to meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
index 037ce063e1..24df750e01 100644
--- a/meta-oe/recipes-extended/triggerhappy/triggerhappy_0.5.0.bb
+++ b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "https://github.com/wertarbyte/triggerhappy"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://github.com/wertarbyte/triggerhappy/archive/debian/0.5.0-1.tar.gz"
+# matches debian/0.5.0-1 tag
+SRCREV = "44a173195986d0d853316cb02a58785ded66c12b"
+PV = "0.5.0+git${SRCPV}"
+SRC_URI = "git://github.com/wertarbyte/${BPN}.git;branch=debian"
 
-SRC_URI[md5sum] = "77f90a18c775e47c4c5e9e08987ca32f"
-SRC_URI[sha256sum] = "9150bafbf7f2de7d57e6cc154676c33da98dc11ac6442e1ca57e5dce82bd4292"
-
-S = "${WORKDIR}/${PN}-debian-${PV}-1"
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd
 
@@ -21,12 +21,12 @@ INITSCRIPT_PARAMS = "defaults"
 SYSTEMD_SERVICE_${PN} = "triggerhappy.service triggerhappy.socket"
 
 FILES_${PN} = "\
-${sbindir}/thd \
-${sbindir}/th-cmd \
-${sysconfdir}/triggerhappy/triggers.d \
-${nonarch_base_libdir}/udev/rules.d/80-triggerhappy.rules \
-${sysconfdir}/init.d/triggerhappy \
-${systemd_unitdir}/system \
+    ${sbindir}/thd \
+    ${sbindir}/th-cmd \
+    ${sysconfdir}/triggerhappy/triggers.d \
+    ${nonarch_base_libdir}/udev/rules.d/80-triggerhappy.rules \
+    ${sysconfdir}/init.d/triggerhappy \
+    ${systemd_unitdir}/system \
 "
 CONFFILES_${PN} = "${sysconfdir}/udev/rules.d/80-triggerhappy.rules"
 
-- 
2.17.1


