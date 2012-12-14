Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjQys-0002sV-Lr
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 09:50:54 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so2029588pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 00:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=SNBQw3swtW393BqvWN1u0e7f7GrB/aFfsILKXF3jx00=;
	b=uh0HC2ac7mkLctzt0SaSYP3LtkP9T2RfG0rIquP9Ui7Z3GBVtKbydzUbjyKYCKV9mR
	F4IZoMj69cT0R7sNLsc63FDjXFq138suj+SDVNDa6tvSLAsxCwuuBKozUhj4rM2QrN96
	fuc/npFajkqDmQxFhYxwD0WfHJMPW0cveV93J3hyQ3lhXtiD/k8oWrYqmZ7ADm3SMYAU
	SSP0YXwyaymx6Em7MIqQNM/EIlCF14XTZOCXVSyHgeyMynjTXX4yrIpkZhjzxBc+pg05
	rAvKeE9fBZxq1Pei1XpLQThQcBWlv7Nizo0+g5DtkO7ykR4eSxow87vXmCONbBSrysJt
	EYOQ==
Received: by 10.68.237.167 with SMTP id vd7mr13574252pbc.161.1355474177929;
	Fri, 14 Dec 2012 00:36:17 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id vx2sm2570018pbc.33.2012.12.14.00.36.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 00:36:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Dec 2012 09:36:27 +0100
Message-Id: <7210880fb3baf98739bf61f9ab55764d6e76f423.1355474146.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <438ebe8cfe643f3d82f3a825651693c4c90edb6f.1355438402.git.Martin.Jansa@gmail.com>
References: <438ebe8cfe643f3d82f3a825651693c4c90edb6f.1355438402.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355474146.git.Martin.Jansa@gmail.com>
References: <cover.1355474146.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2 09/11] glade3: disable help, fails to build
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
X-List-Received-Date: Fri, 14 Dec 2012 08:50:54 -0000

* fixes:
| http://www.oasis-open.org/docbook/xml/4.1.2/ent/iso-grk1.ent:1: validity error : All markup of the conditional section is not in the same entity
| HTTP/1.1 200 OK
|    ^
| http://www.oasis-open.org/docbook/xml/4.1.2/ent/iso-grk1.ent:1: parser error : Content error in the external subset
| HTTP/1.1 200 OK
|       ^
| unable to parse sl/glade3.xml
| make[2]: *** [glade3-sl.omf] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory `/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/glade3/3.8.2-r0/glade3-3.8.2/help'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/glade/glade3_3.8.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
index 8cd6a0e..733b8ed 100644
--- a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
                     file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7"
 DEPENDS = "gtk+ gnome-doc-utils-native"
 
+PR = "r1"
+
 inherit autotools pkgconfig pythonnative
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${PV}.tar.xz \
@@ -14,6 +16,10 @@ SRC_URI[sha256sum] = "f180a5018eee6e3fe574854cb025af897dd9962b01d17d5752e626876d
 
 EXTRA_OECONF += "--disable-scrollkeeper"
 
+do_configure_prepend() {
+	sed -i '/^if HAVE_GNOME_DOC_UTILS/,/^endif/d' ${S}/Makefile.am
+}
+
 FILES_${PN} += "${datadir}/icons"
 FILES_${PN}-dbg += "${libdir}/glade3/modules/.debug"
 FILES_${PN}-dev += "${libdir}/glade3/modules/*.la"
-- 
1.8.0.2



