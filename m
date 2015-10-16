Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id E5DF1769A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 17:30:33 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so18502851wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 10:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=vv1OnllFJ15qz+qXNGlqSWH0J2khaNwxZdg7h1RHSTI=;
	b=YdRnaE3AGOwqXpHsicuJUXqUBrh69fnk/q9Y8OzRiQArPX0svI/0MZj23dzxSDwHHe
	FyelJOCYVtOr0vmFXAyEkRXOW2FeuqfJz5EYgpQm+lUhvFmAKhyqoIncWou963FStRyG
	OoKspK/oPfHtck6fZcEJp8lZueyrKQybKkAL+fy6BMYRuU+j5zqOBVtO51HCJMVhyQIg
	YpvoXtdtGOkLXs0wyfnEfacyU7QwHJ+ifOXPnBTLSZ29jDBqR8YMfb9V4OtWZtt9qacZ
	49iRvqHkAxip7Q0S5WJ+yQ4J/4gMK60z9H9C4P6mLl867GZ15Mplmd6Hxg9GYpnVTY7W
	Vr0w==
X-Received: by 10.180.106.10 with SMTP id gq10mr5885930wib.51.1445016633819;
	Fri, 16 Oct 2015 10:30:33 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	qq4sm23628014wjc.14.2015.10.16.10.30.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 16 Oct 2015 10:30:33 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <D018A0AA-C91B-4DFC-811F-52FEEE2DC6B5@gmail.com>
Date: Fri, 16 Oct 2015 19:30:32 +0200
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-java][PATCH 4/5] icedtea7: allow modern Linux being used, either
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
X-List-Received-Date: Fri, 16 Oct 2015 17:30:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Since Yocto Project has a reasonable definition of supported build =
hosts, we
shouldn't restrict to e.g. pre 4.x kernels as icedtea7 expects.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 recipes-core/icedtea/icedtea7-native.inc  | 1 +
 recipes-core/openjdk/openjdk-7-common.inc | 1 +
 2 files changed, 2 insertions(+)

diff --git a/recipes-core/icedtea/icedtea7-native.inc =
b/recipes-core/icedtea/icedtea7-native.inc
index 69dd0ae..43385e9 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -162,6 +162,7 @@ EXTRA_OEMAKE =3D ' \
                 OE_LDFLAGS=3D"${LDFLAGS}" \
                 ZIPEXE=3D"${STAGING_BINDIR_NATIVE}/zip" \
 		${OEMAKE_BUILD_HEADLESS_ONLY} \
+		DISABLE_HOTSPOT_OS_VERSION_CHECK=3Dok \
                '
=20
 do_compile() {
diff --git a/recipes-core/openjdk/openjdk-7-common.inc =
b/recipes-core/openjdk/openjdk-7-common.inc
index 74b93d9..6ff2a79 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -157,6 +157,7 @@ EXTRA_OEMAKE +=3D ' \
                 ZIPEXE=3D"${STAGING_BINDIR_NATIVE}/zip" \
 		CROSS_COMPILE_ARCH=3D"${JDK_ARCH}" \
 		REQUIRED_ALSA_VERSION=3D"" \
+		DISABLE_HOTSPOT_OS_VERSION_CHECK=3Dok \
                '
=20
 # Provides the target architecture to the configure script.
--=20
2.4.3

--=20
Jens Rehsack - rehsack@gmail.com


