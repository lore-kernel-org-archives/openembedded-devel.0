Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S5iF3-0003oi-0Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 19:39:09 +0100
Received: by mail-ee0-f47.google.com with SMTP id c1so201290eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2012 10:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=sj6XqHkEkd+iiaA0m1KxmvDkru5Zb9Tt3XeP2Ny54NI=;
	b=i0cCW+ww3ExFeUB8voKBGjNtfb1SEBmhTSMZ0q27lhSVi88Az7ZImIh1haN48ohvYC
	FR6k9PSCjvxEukVp2LynEN5iqqhely04J30ng2Wd4bStiss7d1MT4gxYJ0n+7zo2n+Ju
	AOYWDnI/LUo+q73BvEvAkb7p59cI+LEu/oFjybz3NtRRM+v0A6k8pc3c1Gkv/TPEgmNp
	v04te+8XJ/ovXVsqZxQnFbIQjxY+euhxxpZJyXfBb2c6FcU4Bn3WIyZ5OblpWvv4sEFv
	OnRcZtZr7pmWt9loH5f+VfOf8Y4ThA1LZyM2ZqJwuPFAPh/idK9LR+sBst7aY58EdWe2
	FX0Q==
Received: by 10.213.26.15 with SMTP id b15mr715945ebc.167.1331231432905;
	Thu, 08 Mar 2012 10:30:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y11sm8917749eem.3.2012.03.08.10.30.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 10:30:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 19:30:04 +0100
Message-Id: <7f0ac66e7090f9bd61a587d4230e8bf3b6090a3e.1331231195.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <3e2b850aecf62479c580875c424f1eb66986f2b1.1331231195.git.Martin.Jansa@gmail.com>
References: <3e2b850aecf62479c580875c424f1eb66986f2b1.1331231195.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1331231195.git.Martin.Jansa@gmail.com>
References: <cover.1331231195.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 3/7] elementary: add poppler to DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Mar 2012 18:39:09 -0000

* poppler is autodetected and then transitive deps are not working as expected (it will remove tiff from sysroot to
  replace it with newer version while building something else against elementary)
  | /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/4.6.3/ld: warning: libtiff.so.3, needed by /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libelementary.so, not found (try using -rpath or -rpath-link)
  | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libpoppler.so: undefined reference to `TIFFSetField'
  | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libpoppler.so: undefined reference to `TIFFClose'
  | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libpoppler.so: undefined reference to `TIFFDefaultStripSize'
  | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libpoppler.so: undefined reference to `TIFFFdOpen'
  | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libpoppler.so: undefined reference to `TIFFWriteScanline'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index a0673ae..32f706f 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "EFL based widget set for mobile devices"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10a051c72424b80bc784a3903651b43b"
-DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb"
+DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb poppler"
 PV = "0.8.0+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl gettext
-- 
1.7.8.5



