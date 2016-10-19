Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF8F71C62
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:38:52 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 128so1429623pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UzhVC/kLZuD5icuw9tUoBUN+lnneNpUck783+Rpq/1I=;
	b=JN4vW1Ducxsak5pX2D0Y+m/USzlnQAhof8ikQ7yzPrTs94+VKv6G+tfXj7B/qtp6pX
	UKMJQ9plikQBXkoavDtH1HX9YfLBuNUjPoZJGhBdVDETTMv0xw7FDu6vgP53OtSwEh7w
	odyDeMFio5E9cuTZWl/l11FFFYprKdkapmwjzu8amBaivpwtFyr3WbQKaDWn3qjCh1zx
	9bea/Up+KrWI3yROzOngKLfmn+0uNxI9gavANoJOgfuY5CHT6m2pd4srzzV17NMUDfOs
	EsWizQ8CqLXHPmDdfsXcetDDQ91LAodziXgoXBzWJAgUthZKeBxzM1aa63P4uNB0mHDn
	GuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UzhVC/kLZuD5icuw9tUoBUN+lnneNpUck783+Rpq/1I=;
	b=cgTfW6AhOzGfZsxwpzS6FibTJzBBkw53po/DSxXFzKvtrBgXnTJ2QXvdX3ZLPTpNoa
	NDA0A1e8hwnfcseok/7Gy9XPL0T0jf+seaxfm+EkJt5eEYifIdpwunH4+erc5qEmhT2R
	Yyo/R/Fy9gbLAAt9Y3u1nS/HCfuoJYl2onFP0x4jqXNB6MEbXIW4GhQ4qnuP/LAZ5adF
	Q/9D2025yZnrj4ZpeEJE7ftkRP3qZ0EjPEJ1jmHIC5gPkXNaeEsZ/MGAbK/iKodST5hp
	hYMwxMUw3YkwbwXj3lj+uE56V6Eu878df2CgrvpcE7Cb91LwOPNXQgZAbI0jgF8h95Cm
	08Hw==
X-Gm-Message-State: AA6/9Rnjkm7VK+esEzhX3BszkQg/nmw+52FWz2yzvtgwh1AcKGBfavoSCRus5JkFk9j7nQ==
X-Received: by 10.98.159.130 with SMTP id v2mr7912282pfk.48.1476855533803;
	Tue, 18 Oct 2016 22:38:53 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qd12sm60099564pab.22.2016.10.18.22.38.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 22:38:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 22:38:33 -0700
Message-Id: <20161019053834.11523-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 15/16] libmnl, nftables: Update versions
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
X-List-Received-Date: Wed, 19 Oct 2016 05:38:52 -0000

libmnl -> 1.0.4
nftables -> 0.6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-filter/libmnl/{libmnl_1.0.3.bb => libmnl_1.0.4.bb}       | 4 ++--
 .../recipes-filter/nftables/{nftables_0.5.bb => nftables_0.6.bb}     | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-filter/libmnl/{libmnl_1.0.3.bb => libmnl_1.0.4.bb} (78%)
 rename meta-networking/recipes-filter/nftables/{nftables_0.5.bb => nftables_0.6.bb} (74%)

diff --git a/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb b/meta-networking/recipes-filter/libmnl/libmnl_1.0.4.bb
similarity index 78%
rename from meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb
rename to meta-networking/recipes-filter/libmnl/libmnl_1.0.4.bb
index b3a5f2e..b458799 100644
--- a/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb
+++ b/meta-networking/recipes-filter/libmnl/libmnl_1.0.4.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "http://www.netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2;name=tar"
-SRC_URI[tar.md5sum] = "7d95fc3bea3365bc03c48e484224f65f"
-SRC_URI[tar.sha256sum] = "6f14336e9acdbc62c2dc71bbb59ce162e54e9af5c80153e92476c5443fe784de"
+SRC_URI[tar.md5sum] = "be9b4b5328c6da1bda565ac5dffadb2d"
+SRC_URI[tar.sha256sum] = "171f89699f286a5854b72b91d06e8f8e3683064c5901fb09d954a9ab6f551f81"
 
 inherit autotools pkgconfig
diff --git a/meta-networking/recipes-filter/nftables/nftables_0.5.bb b/meta-networking/recipes-filter/nftables/nftables_0.6.bb
similarity index 74%
rename from meta-networking/recipes-filter/nftables/nftables_0.5.bb
rename to meta-networking/recipes-filter/nftables/nftables_0.6.bb
index 11b5e5a..5dd9362 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.5.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.6.bb
@@ -10,8 +10,7 @@ RRECOMMENDS_${PN} += "kernel-module-nf-tables \
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
            file://fix-to-generate-ntf.8.patch \
           "
-
-SRC_URI[md5sum] = "94bfe1c54bcb9f6ed974835f2fca8069"
-SRC_URI[sha256sum] = "1fb6dff333d8a4fc347cbbe273bf905a2634b27a8c39df0d3a45d5a3fde10ad6"
+SRC_URI[md5sum] = "fd320e35fdf14b7be795492189b13dae"
+SRC_URI[sha256sum] = "dede62655f1c56f2bc9f9be12d103d930dcef6d5f9e0855854ad9c6f93cd6c2d"
 
 inherit autotools pkgconfig
-- 
2.10.0


