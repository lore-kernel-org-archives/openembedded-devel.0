Received: from mail-wg0-f54.google.com ([74.125.82.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5JcT-0008Pm-F3
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Feb 2013 18:26:13 +0100
Received: by mail-wg0-f54.google.com with SMTP id fm10so237807wgb.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2013 09:10:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=GH4c+pJn962L2Q3DhR+ItYw4vXz/VA4Stb3ySRJezho=;
	b=fP3W+jEF/O54Orsuku/QGnw603Hj+q+TowssmmKs07cuZF3CIIPHD+vqZnpZlgpwnI
	ZD9qwGZhQH5WQnEL7cODbGM3RI9pDt7M0nS4xO0mLNIbKZrhkoMYJnG0HSHM4QWHyDHR
	TiTFP0b/ErSHK/lkQ3gzu5VIjqWddNQhy8bjOD6pRJaaGgE/FGtWiJG3+TPqYF0ogEBz
	ZTSWnQVE/wSdSTbbIckOg7npXpPfRQ0yUWo7KzQwcWZUlgcfrJeeJSknytfa/wWiHA/q
	L3zNoL+yGKJD71ANIPaEeNmll34cqAcRUP+MndEVd8yiQBaQ1CvD9piyo2tpJTUjWkuZ
	oyVQ==
X-Received: by 10.194.57.231 with SMTP id l7mr32707026wjq.9.1360689013654;
	Tue, 12 Feb 2013 09:10:13 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fx5sm40937404wib.11.2013.02.12.09.10.12
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 09:10:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Feb 2013 17:07:59 +0000
Message-Id: <1360688879-25107-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkIBGUaulQskrG31dHJWvDjmmCnh1Y6yc+hjbR6N0gawdN843DYSi5/98Upa2GBzZvKcngn
Subject: [PATCH] gtkhtml2: add, from oe-core
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
X-List-Received-Date: Tue, 12 Feb 2013 17:26:13 -0000

Nothing in oe-core uses this anymore, but claws-mail in meta-oe does.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb |   38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb

diff --git a/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb b/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
new file mode 100644
index 0000000..2fafcec
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
@@ -0,0 +1,38 @@
+SECTION = "libs"
+DEPENDS = "gtk+ glib-2.0 libxml2"
+DESCRIPTION = "A GTK+ HTML rendering library."
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+SRCREV = "1161"
+PV = "2.11.0+svnr${SRCPV}"
+PR = "r4"
+
+SRC_URI = "svn://svn.gnome.org/svn/gtkhtml2/;module=trunk;protocol=http \
+           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/css-stylesheet-user.patch;striplevel=0;name=patch2 \
+           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/css-media.patch;striplevel=0;name=patch3 \
+           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/add-end-element-signal.patch;striplevel=0;name=patch4 \
+           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/add-dom-functions.patch;striplevel=0;name=patch5 \
+           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/iain-mem-leak.patch;striplevel=0;name=patch6 \
+          "
+
+SRC_URI[patch2.md5sum] = "05fc3627ca364095702dc804f41c8391"
+SRC_URI[patch2.sha256sum] = "df5cca50a8f95333505d7920929fea251daea3be25be6834a1c50a742d9eb674"
+
+SRC_URI[patch3.md5sum] = "d3fe4cda3545f3e4718f1acc186608ab"
+SRC_URI[patch3.sha256sum] = "3aefaa17ffa38143bf5df1161c51ab402d35bfbee41ab4643c313edf569165d5"
+
+SRC_URI[patch4.md5sum] = "651b1601d8a1b21c8a3040fadb729043"
+SRC_URI[patch4.sha256sum] = "d067e8331bf9c6851f1c6067d991a7f54327f532900b405ebdf8e149c071f381"
+
+SRC_URI[patch5.md5sum] = "041be9711a16e629d01487664ba97152"
+SRC_URI[patch5.sha256sum] = "42956fb41341cf82ae8bce18b4cf96a7e2aa631b1b60657afb6d7e9be7cd138c"
+
+SRC_URI[patch6.md5sum] = "4e11dc7899d68f2be2e06ccee01d296d"
+SRC_URI[patch6.sha256sum] = "1e2cc080e654c1839c5cb4b4adf4c62a23e7da208427f3ba0b16cfed9e5cfa98"
+
+S = "${WORKDIR}/trunk"
+
+inherit pkgconfig autotools
+
+EXTRA_OECONF = " --disable-accessibility"
-- 
1.7.10.4



