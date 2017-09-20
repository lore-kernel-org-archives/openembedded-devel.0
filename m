Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5F78877E87
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 22:32:31 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id h4so1717168pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 15:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KjPxcPkdnrGHqo7b17X1SD58/pfCw57Lmo61MSGV+HQ=;
	b=gFPsb8dgPw1V4+YtOUohgJcqnlL/C/rue8pnA5oh7mhP8pxFIGnIQVl+Wr0cRBrrQR
	7RMU/x7Y7GpSZTohV/I2W7cyA26C1Mtv8mkCPoQHkYDiviFkBn7cx9JxnntempkePKSM
	4Y6GCIHgDLKF/7Ts6f3zvronXnEITfJPZXfzL4iqqOQHRBrxxzmQL2fEZd/JAR5ZyIPJ
	f4ncbma5cQPaWgvbg2Fiv8rDuxRNmcpZI2U/AMoJBG/ZL5yDHgcM+xFYn/Miiy/WMRxJ
	7g6WE/TXuES924UiqVhxJ/n0dWHCi69klw7CvvXCj7oytLVCAmJFwstMs6nhx5N+I7Ik
	Ecew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KjPxcPkdnrGHqo7b17X1SD58/pfCw57Lmo61MSGV+HQ=;
	b=MjfmeAJQDuERuG3/5Q7yKZJSLIvou/kp4rSavKYV3mCpl458g0/+hpJD7OvMCkeSfr
	Rm5He/MRAbs7uKtRJ0Ok4AtgL7UDmd1/GPJ8ar1NZZ7kV9E0G843creeDXowKYeb0GTW
	g5u3YMar31qgEQL88VYJr6HOf9O1szoif0KhdJZokw9pXzxii9xkYvuEKjP9yJ5H6qtI
	NeX+arBSPnLVhimrQ1SW/5InCp/sHeBAtP9Gzuf26ie3+Z9SppOYsp26TvEONE2oHc1t
	KNnbIc5BFPSESBxKGMZFthARw6K5XAtd7wZNm+pU+lvSPnj/Hu1YbwoX9suOfMOo7Zvv
	qcOw==
X-Gm-Message-State: AHPjjUjZHpO2VpQ5//dLYyMv0TE7cgKzdNKfCmi2KgPk/6rw2p2RL1Ma
	pikoNo88trVmcBkGDTSzuYpyLQ==
X-Google-Smtp-Source: AOwi7QAqcqyOxgBlD4Ho3HukmIQUYXrYZVqbBNS0eFLVKUgU/rqfvnZP0bIvqq3CRf4g9IqrfYTylA==
X-Received: by 10.98.87.11 with SMTP id l11mr3672129pfb.134.1505946753229;
	Wed, 20 Sep 2017 15:32:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	d4sm9031277pfb.185.2017.09.20.15.32.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 15:32:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Sep 2017 15:32:22 -0700
Message-Id: <20170920223222.26924-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170920223222.26924-1-raj.khem@gmail.com>
References: <20170920223222.26924-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] networkmanager: Disable gobject-introspection on musl
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
X-List-Received-Date: Wed, 20 Sep 2017 22:32:32 -0000

It segfaults qemu like below, until this is root caused we disable it

|
| (process:16378): GLib-CRITICAL **: g_hash_table_lookup: assertion 'hash_table != NULL' failed
| **
| GLib-GObject:ERROR:../../glib-2.52.3/gobject/gtype.c:2743:g_type_register_static: assertion failed: (static_quark_type_flags)
| /mnt/a/oe/build/tmp/work/aarch64-bec-linux-musl/networkmanager/1.4.4-r0/recipe-sysroot/usr/bin/g-ir-scanner-qemuwrapper: line 6: 16378 Aborted                 (core dumped) PSEUDO_UNLOAD=1 qemu-aarch64 -r 3.14 -L /mnt/a/oe/build/tmp/work/aarch64-bec-linux-musl/networkmanager/1.4.4-r0/recipe-sysroot -E LD_LIBRARY_PATH=$GIR_EXTRA_LIBS_PATH:.libs:/mnt/a/oe/build/tmp/work/aarch64-bec-linux-musl/networkmanager/1.4.4-r0/recipe-sysroot//usr/lib:/mnt/a/oe/build/tmp/work/aarch64-bec-linux-musl/networkmanager/1.4.4-r0/recipe-sysroot//lib "$@"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.4.4.bb         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
index 8e7fe9feb..bfd2aada7 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
@@ -24,6 +24,8 @@ DEPENDS = " \
 
 inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introspection
 
+GI_DATA_ENABLED_libc-musl = "False"
+
 SRC_URI = "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
            file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
            file://0002-Fix-nm-version-macro-includes.patch \
-- 
2.14.1


