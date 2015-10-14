Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id A037176E3F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:53:20 +0000 (UTC)
Received: by wijp11 with SMTP id p11so7411177wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 11:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=Es0aNcOLaF3KZ4rf3xwkjuNaQ2usPRBYzQIrcKeikGQ=;
	b=eBLiDpkhiNghMSy0trAOaVhetu/h8XWKM2/gJ/S5Vg8bKvGHK3RZoBj4f2s0U8zn1i
	ydmYagS6hiYSCZKWw3xAkfgdp/kGBFEvO1uxFZpEES1AWfSRTIWCKUMCHo2StcOy9xXC
	m1ZWZ5czyWDNmu+AcHsFpJmWG3cnyyyhaNSaYeBp7/MvIaLvpw2r+EvBdnXyaR1LTK7i
	+IWImDU7Op3iW2D0Wlgb0Q2zTWRROloWkggN6IZvGSljh4tNgu57Hpz5V6JmQcBYReHi
	ZuvB9oG2MoU9ySYE4sDASvD0cKFii28PCvRGWn+b4dqtbLnx2TLvAW/uf7F33iHsqPPb
	2ylw==
X-Received: by 10.194.116.197 with SMTP id jy5mr6041674wjb.86.1444848800621;
	Wed, 14 Oct 2015 11:53:20 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id mu9sm8228885wib.6.2015.10.14.11.53.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Oct 2015 11:53:20 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <227DF7DF-2A0C-465B-B35B-E7F9682AF242@gmail.com>
Date: Wed, 14 Oct 2015 20:53:18 +0200
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-networking][PATCH 5/6] libnftnl: update from 1.0.3 to 1.0.5
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
X-List-Received-Date: Wed, 14 Oct 2015 18:53:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Update libnftnl from 1.0.3 to 1.0.5 (for Changelog see
http://git.netfilter.org/libnftnl/log/)

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../recipes-filter/libnftnl/{libnftnl_1.0.3.bb =3D> libnftnl_1.0.5.bb}  =
| 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.0.3.bb =3D> =
libnftnl_1.0.5.bb} (70%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.0.3.bb =
b/meta-networking/recipes-filter/libnftnl/libnftnl_1.0.5.bb
similarity index 70%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.0.3.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.0.5.bb
index 112af08..6171151 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.0.3.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.0.5.bb
@@ -7,7 +7,7 @@ DEPENDS =3D "libmnl"
 SRC_URI =3D "http://netfilter.org/projects/libnftnl/files/${BP}.tar.bz2 =
 \
           "
=20
-SRC_URI[md5sum] =3D "203701a73cc3c51ca751d7cb2e176250"
-SRC_URI[sha256sum] =3D =
"cf0ae7eab6a6866192a1fbd6b370a8a2cbe2066fe3975ab44939fd50747c27f7"
+SRC_URI[md5sum] =3D "af0c62ce6bbd7a7d39def0996c1c17c9"
+SRC_URI[sha256sum] =3D =
"f6d4f5a702e38bc7987f2363f9fcd65930e8b702595c221a497e2f3a359be497"
=20
 inherit autotools pkgconfig
--=20
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


