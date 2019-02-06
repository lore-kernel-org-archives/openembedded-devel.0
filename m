Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 89C686D4C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Feb 2019 00:45:54 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id b5so2317215plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2019 16:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EkTl6oxCbcxsgI14zQAXFqIfyQMthotIa0zdsAsjnf8=;
	b=Dqvni+0FCIUha6e8c9okspGEXAC3c7CkRiKlKFzIWqhN61y7GGXD2Xg/3X5508moca
	Q57oBSjQwgEE62B2H7zHLDyEgdZYQO9K9Shv85yHHjiq933OSUOfN/pTIVL7W43ZvorU
	mmXn5CremPQyNLxssx3w7ErLWCjeBFL1mJ373sIEML0Ayjx0v79ddcZPQVpvsc7JaIbm
	PWmn/hHROFx7X+qrpz+9VPdpgMZ5axXmNI9YzoQzROJi9BpEsvH+0GfsgsLjhzNf87Ow
	xEPWP09eiUhsJUu3H73FMtuHyc7c1Or3+/WvRS46cVsE/AODZaHzClN/JCgSX5yoxOCG
	6eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EkTl6oxCbcxsgI14zQAXFqIfyQMthotIa0zdsAsjnf8=;
	b=mDwDxriUitiesJGdFssx3KxLVUPObjsy2rXG3G1wW85CrvBABJXrmz42t6yUSIYrni
	D/PobI5EfCLNFpQ6AFhgI29Klb8y1CFZeKSLGrsBsKF034tSeJ5NFvn+KxZv/Rgrkqy1
	J7VZMTyNj6guQx1W2jsFjb6B2pqohAoMru8ylMS0ZwntbAWUUw/H2I3HOPT4MFk19UdA
	VNd+2JdxuWZRdyx7rtH/IirfdBZZietFPaMnlchbxa7uGVmwrRLhCFwfvQ0n0H9VzXX/
	6cghwTy7LTpyYfxhb9OJ/qfkIasEQdTqsavn3/+J0+fcnzKCNZmWGNE4eeJuRJzlPfuc
	CzrQ==
X-Gm-Message-State: AHQUAubwgzKQnaFXbVIG4Y8oWEwXD1/wWUU70YlD+Mh0kT57y6lRp1I6
	yUQROIeCmi2Z1p/wJzmy0g5QEpb+
X-Google-Smtp-Source: AHgI3IaYUHk1x8cpzc02eUXCuyJDwLhc3jkTfWacOJCzaz4+EPMwxZ1w4nk0fn4lYI4kyQLKDhTazQ==
X-Received: by 2002:a17:902:14b:: with SMTP id
	69mr7710158plb.120.1549413955143; 
	Tue, 05 Feb 2019 16:45:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id
	l74sm7684098pfb.145.2019.02.05.16.45.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Feb 2019 16:45:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2019 16:45:43 -0800
Message-Id: <20190206004547.32351-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206004547.32351-1-raj.khem@gmail.com>
References: <20190206004547.32351-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/6] graphviz: Fix cross-build failures with clang
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
X-List-Received-Date: Wed, 06 Feb 2019 00:45:54 -0000
Content-Transfer-Encoding: 8bit

It is detecting cross compile badness for -lexpat since
the check finds it on build host, so aide the build ssytem
to find it in staging sysroot

Disable internal ltdl, use libtool provided one

Define defines to indicate that platform has ssize_t and long_double

Disable java,r,c-sharp, as it is unused

Arrange source URIs before checksums

gtk-doc is not needed, morever it ends up in unknown configure options

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../graphviz/graphviz_2.40.1.bb                | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
index 96f1efc60a..a9efffaca2 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
@@ -17,7 +17,7 @@ DEPENDS = " \
 "
 DEPENDS_append_class-target = " ${BPN}-native"
 
-inherit autotools-brokensep pkgconfig gtk-doc gettext
+inherit autotools-brokensep pkgconfig gettext
 
 # The source tarball suggested at
 # https://graphviz.gitlab.io/_pages/Download/Download_source.html has no
@@ -25,14 +25,24 @@ inherit autotools-brokensep pkgconfig gtk-doc gettext
 # get checksum errors. Fedora people seem to expect same so they use a versioned
 # source - see https://src.fedoraproject.org/cgit/rpms/graphviz.git/tree/graphviz.spec
 
-SRC_URI = "https://gitlab.com/graphviz/graphviz/-/archive/stable_release_${PV}/graphviz-stable_release_${PV}.tar.gz"
-SRC_URI[md5sum] = "2acf30ca8e6cc8b001b0334db65fd072"
-SRC_URI[sha256sum] = "e6c3f8dbfde1c4523055403927bef29f97f9fc12715c1042b5dcf648a2c1c62a"
+SRC_URI = "https://gitlab.com/graphviz/graphviz/-/archive/stable_release_${PV}/graphviz-stable_release_${PV}.tar.gz \
+"
 # Use native mkdefs
 SRC_URI_append_class-target = " file://0001-Use-native-mkdefs.patch"
+SRC_URI[md5sum] = "2acf30ca8e6cc8b001b0334db65fd072"
+SRC_URI[sha256sum] = "e6c3f8dbfde1c4523055403927bef29f97f9fc12715c1042b5dcf648a2c1c62a"
 
 S = "${WORKDIR}/${BPN}-stable_release_${PV}"
 
+EXTRA_OECONF_class-target = "\
+                --with-expatincludedir=${STAGING_INCDIR} \
+                --with-expatlibdir=${STAGING_LIBDIR} \
+                --without-included-ltdl \
+                --disable-java \
+                --disable-r \
+                --disable-sharp \
+                "
+CFLAGS_append_class-target = " -D_typ_ssize_t=1 -D_long_double=1"
 do_configure_prepend() {
     cd ${S}
     # create version.m4 and ignore libtoolize errors
-- 
2.20.1


