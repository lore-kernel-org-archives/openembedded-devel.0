Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATWn-0003Au-Gh
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 22:57:09 +0100
Received: by wibhj13 with SMTP id hj13so1845682wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=HAo1+dJguWBOBIZ347olDwGXBggvW2yxm04KpK775ps=;
	b=YQsRrjoPoHFQkBEZvejCjVUJyRGSt+IlDNATI9oOL7GOcLy/ktnZ4lCbgk78VFZyVK
	ubuAe9qeKDRHYqW+wnTyQXyca+srOiCIBahMwp2aKKVwg3FneOjWQ+fWr9Z2IBumJrF2
	hgeg0cqU/pC/3z/uBZKKy0q5iNmmKGrozcBNuGWNsXngdQdsJGpsghidQbDgoo6IQxlV
	j9hOaOFf1vLp/cPB3fy05jJI+Vs7CzBOdxb2aZ/zQvn4wl+WxD/w8FtkvV/wxyDr8HQW
	skHtRs6Xzl4E4HV9oPU/Ee6chnt82M0K10x6S6bO5EiD2ni3w5CTcreWR1l9M87OHcM8
	ktzg==
Received: by 10.216.133.151 with SMTP id q23mr3283393wei.14.1332366495587;
	Wed, 21 Mar 2012 14:48:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 17sm228250wis.0.2012.03.21.14.48.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:48:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:48:06 +0100
Message-Id: <cover.1332366214.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [meta-oe][PATCH 0/4] Move some .bbappends with just native BBCLASSEXTENDs to oe-core
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
X-List-Received-Date: Wed, 21 Mar 2012 21:57:09 -0000

This patchset depends on
[oe-core][PATCH 00/13] Merge native BBCLASSEXTENDs and SDK, PACKAGECONFIG fix

The following changes since commit 986de01251408605161e0f8343866a0e7ffe7910:

  qmake2: remove (2012-03-21 13:50:44 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (4):
  gtk+: drop bbappend for gtk+-native, moved to oe-core
  librsvg, cairo, pixman, tiff, libgpg-error: remove native support,
    was moved to oe-core
  libusb*: remove native support, was moved to oe-core
  pango: native support and --disable-introspection moved to oe-core
    pango.inc

 meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend |    3 ---
 .../recipes-gnome/librsvg/librsvg_2.32.1.bbappend  |    2 --
 .../recipes-graphics/cairo/cairo_1.10.2.bbappend   |    2 --
 meta-oe/recipes-graphics/pango/pango_1.29.4.bb     |    5 -----
 .../xorg-lib/pixman_0.25.2.bbappend                |    5 +----
 .../recipes-multimedia/libtiff/tiff_4.0.1.bbappend |    1 -
 .../libgpg-error/libgpg-error_1.10.bbappend        |    2 --
 .../libusb/libusb-compat_0.1.3.bbappend            |    6 ------
 .../recipes-support/libusb/libusb1_1.0.8.bbappend  |    1 -
 9 files changed, 1 insertions(+), 26 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend
 delete mode 100644 meta-gnome/recipes-gnome/librsvg/librsvg_2.32.1.bbappend
 delete mode 100644 meta-oe/recipes-graphics/cairo/cairo_1.10.2.bbappend
 delete mode 100644 meta-oe/recipes-multimedia/libtiff/tiff_4.0.1.bbappend
 delete mode 100644 meta-oe/recipes-support/libgpg-error/libgpg-error_1.10.bbappend
 delete mode 100644 meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend
 delete mode 100644 meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend

-- 
1.7.8.5



