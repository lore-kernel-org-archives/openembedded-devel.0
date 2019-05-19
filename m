Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 226FC7C132
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2019 20:27:57 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m15so1252274ljg.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2019 13:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=doTD2Qr940fEasibZ29BO6JAkriSJVglYgwpqibF8+I=;
	b=KI/PhRDJytgE8XmM+IpZKjlJQ8/1Sb+v2GwmfT/6nGwkfvw+92SNgHyPc0K+yBWdnI
	qoFtkax1wYV2DRySjsNIYd9iIk9fiaRnK8qsVOhu1KHi/4ddCGHHzzK+p5OgT/KnEM5L
	WL+t/AKPND9qbFRK6oFKEGX9dCjuMD/Cd5R/nqNGTqhDYzHxOfDSHoGjSAmUFt0Ivt2C
	MuGjZPISgFjB9RCHiOg0ncaHSGse2FmUYWh3gjz4TCMf6jHc3zrEyM/0PwJQw5Za4dh1
	uNRPCwMwNHF7/FkdI4/8Ukdf+66tMKz8DqoM0zbXemXE5eUqOywQ73LTUBA1LPict8If
	l7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=doTD2Qr940fEasibZ29BO6JAkriSJVglYgwpqibF8+I=;
	b=JoFa2gF7rBxK+eT4vnBQFgbpjUHkf3eXPPqjsuQZNwpGj6peGWzQCSKHWK4+yN5Iwv
	JWnV2TmnXYLPHhzuva4k2Fqb3Q8zpabcAsB15/u/5gu0Rt1Yqe1SlBOu4rk0YfsyPTwH
	CxsRa3pTbifCEhKdAfXOYfpaVoLatOY5QrhqiASW4Nf5rmp7y51nHy2uAphGVSzSf4LB
	8mHvRGWSKZybFsD3d8DnazQUQ3IMcCJ6nQ32MJyfuq/QXD3QEVHVhKAa29WliJzMJ6ox
	v10oVHKYHpcpxgg7+VDq3WiOvPNPyylr6oInVsoxwSwEuxLbRVRF2JSdkQ38WLKvvCzz
	svhw==
X-Gm-Message-State: APjAAAUnuWyFEj1/Ijia/5hfJqIPsbA0+OrWLvdUyLWo0YBPtxRAsjJo
	oHpEKp0K6C2Cc4NGo98ZLAXvoMekpa4=
X-Google-Smtp-Source: APXvYqyZ9Ag3IPS4XFh8bLDcsEY41EUxS9WSkHyF62w4VEkGvXvOz1whYXJeRgjBUNlwCP6bXUEmkg==
X-Received: by 2002:a2e:2b58:: with SMTP id q85mr35434688lje.179.1558297678309;
	Sun, 19 May 2019 13:27:58 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	x29sm3473904lfg.58.2019.05.19.13.27.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 May 2019 13:27:57 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2019 22:27:53 +0200
Message-Id: <20190519202753.2575-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] rp-pppoe: update to 3.13
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
X-List-Received-Date: Sun, 19 May 2019 20:27:58 -0000

Removed patch was upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../0001-ppoe-Dont-include-linux-if_ether.h.patch          | 0
 .../0002-Enable-support-for-the-kernel-module.patch        | 0
 .../configure.in-Error-fix.patch                           | 0
 .../rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/configure.patch   | 0
 .../{rp-pppoe-3.12 => rp-pppoe}/configure_in_cross.patch   | 0
 .../discard-use-of-dnl-in-Makefile.am.patch                | 0
 .../{rp-pppoe-3.12 => rp-pppoe}/dont-swallow-errors.patch  | 0
 .../{rp-pppoe-3.12 => rp-pppoe}/pppoe-server.default       | 0
 .../rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/pppoe-server.init | 0
 .../{rp-pppoe-3.12 => rp-pppoe}/pppoe-server.service       | 0
 .../pppoe-src-restrictions.patch                           | 0
 .../{rp-pppoe-3.12 => rp-pppoe}/top-autoconf.patch         | 0
 .../{rp-pppoe-3.12 => rp-pppoe}/update-config.patch        | 0
 .../rp-pppoe/{rp-pppoe_3.12.bb => rp-pppoe_3.13.bb}        | 7 +++----
 14 files changed, 3 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/0001-ppoe-Dont-include-linux-if_ether.h.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/0002-Enable-support-for-the-kernel-module.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/configure.in-Error-fix.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/configure.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/configure_in_cross.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/discard-use-of-dnl-in-Makefile.am.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/dont-swallow-errors.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/pppoe-server.default (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/pppoe-server.init (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/pppoe-server.service (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/pppoe-src-restrictions.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/top-autoconf.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/update-config.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe_3.12.bb => rp-pppoe_3.13.bb} (91%)

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0001-ppoe-Dont-include-linux-if_ether.h.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0001-ppoe-Dont-include-linux-if_ether.h.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0001-ppoe-Dont-include-linux-if_ether.h.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0001-ppoe-Dont-include-linux-if_ether.h.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0002-Enable-support-for-the-kernel-module.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0002-Enable-support-for-the-kernel-module.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/0002-Enable-support-for-the-kernel-module.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0002-Enable-support-for-the-kernel-module.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.in-Error-fix.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.in-Error-fix.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure_in_cross.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure_in_cross.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/discard-use-of-dnl-in-Makefile.am.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/discard-use-of-dnl-in-Makefile.am.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/discard-use-of-dnl-in-Makefile.am.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/discard-use-of-dnl-in-Makefile.am.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/dont-swallow-errors.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/dont-swallow-errors.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/dont-swallow-errors.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/dont-swallow-errors.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.default b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/pppoe-server.default
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.default
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/pppoe-server.default
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.init b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/pppoe-server.init
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.init
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/pppoe-server.init
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.service b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/pppoe-server.service
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.service
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/pppoe-server.service
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-src-restrictions.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/pppoe-src-restrictions.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-src-restrictions.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/pppoe-src-restrictions.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/top-autoconf.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/top-autoconf.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/top-autoconf.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/top-autoconf.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/update-config.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/update-config.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/update-config.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/update-config.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
similarity index 91%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
index fbe015f5e..492ade5ae 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
 
 PR = "r10"
 
-SRC_URI = "http://www.roaringpenguin.com/files/download/${BP}.tar.gz \
+SRC_URI = "https://dianne.skoll.ca/projects/rp-pppoe/download/rp-pppoe-${PV}.tar.gz \
            file://top-autoconf.patch \
            file://configure_in_cross.patch \
-           file://pppoe-src-restrictions.patch \
            file://update-config.patch \
            file://dont-swallow-errors.patch \
            file://discard-use-of-dnl-in-Makefile.am.patch \
@@ -22,8 +21,8 @@ SRC_URI = "http://www.roaringpenguin.com/files/download/${BP}.tar.gz \
            file://0002-Enable-support-for-the-kernel-module.patch \
            "
 
-SRC_URI[md5sum] = "216eb52b69062b92a64ee37fd71f4b66"
-SRC_URI[sha256sum] = "00794e04031546b0e9b8cf286f2a6d1ccfc4a621b2a3abb2d7ef2a7ab7cc86c2"
+SRC_URI[md5sum] = "ec9dccd9a367a1f71f2dc81069796dd8"
+SRC_URI[sha256sum] = "8cd6bc71ba46bd5f6eb4daf60220ccdcd991a8525111dee466501b1b9717e676"
 
 inherit autotools-brokensep update-rc.d systemd
 
-- 
2.17.1


