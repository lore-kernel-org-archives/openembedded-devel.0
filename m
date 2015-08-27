Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E870873217
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 00:55:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7R0tFv7022019
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Aug 2015 17:55:15 -0700 (PDT)
Received: from co-op.corp.ad.wrs.com (128.224.56.221) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 26 Aug 2015 17:55:14 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Aug 2015 20:55:10 -0400
Message-ID: <1440636910-25925-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.4.4
MIME-Version: 1.0
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] gnome: revector some older versions of pkgs back to bz2 compression
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Aug 2015 00:55:18 -0000
Content-Type: text/plain

In commit 429985c1f6e50baec6ba03f35f323a4e8c7f72dd and/or
OE-Core rev: 0f9ea90dde8f63aace19531e066580e41bf3d7cc
("classes/gnomebase: change tarball compression to xz")

the default changed, and some pkgs were kept back on bz2 where
the xz did not exist.  However it seems some were missed, and
I found the fetcher gets 404s on the ones in this commit.

Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[Apologies if you've seen this 2x -- Ross kindly pointed out that I should
 have sent it to openembedded-devel and not to openembedded-core list.]

 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb | 1 +
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb           | 1 +
 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb        | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index 2c526c8edefd..4f95066ec51e 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -10,6 +10,7 @@ PR = "r4"
 inherit gnomebase gtk-icon-cache
 SRC_URI[archive.md5sum] = "f0366c8baebca0404d190b2d78f3582d"
 SRC_URI[archive.sha256sum] = "03e461b6bda7f773f8018d25fa3213d3073d4dc83a76e6b39d962652f4de6a98"
+GNOME_COMPRESS_TYPE="bz2"
 
 SRC_URI += "\
     file://disable-scrollkeeper.patch \
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
index 860851d98379..1bbfb17d9f05 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -24,6 +24,7 @@ EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-
 
 SRC_URI[archive.md5sum] = "9a8aa74e03361676f29d6e73155786fc"
 SRC_URI[archive.sha256sum] = "31fecec1430a97f59a6159a5a2ea8d6a1b44287f1e9e595b3594df46bf7f18f9"
+GNOME_COMPRESS_TYPE="bz2"
 
 FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr \
                 ${base_libdir}/security/*${SOLIBSDEV} \
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
index 43379bdca2e5..e24188232774 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
@@ -17,3 +17,4 @@ DEPENDS = "dbus libgcrypt glib-2.0 intltool-native"
 
 SRC_URI[archive.md5sum] = "c42b2ca66204835d901d3dbfc1fa5ae6"
 SRC_URI[archive.sha256sum] = "56388c0d81ddfdb57d30e4963c83ecc1c18498aab99395420e0fff69929a0f0c"
+GNOME_COMPRESS_TYPE="bz2"
-- 
2.4.4


