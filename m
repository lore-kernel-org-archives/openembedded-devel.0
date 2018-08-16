Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id E24EF79265
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:28:04 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l2-v6so16263683wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5rzAe4lPDoJJg3BZmvldzk02sBICqw7W8tYxKJ91Tbg=;
	b=SXE+cpO1g0asr6W0fEaKTTMLvrNJpAfI107nDaxD/lEk9JCXd/FNZ2eD8ruGTWSrQt
	3DLT/ocGfbCNVVj7FKrBKGBG73ng/rRmjYbRe6WM4LBDJpDM4pR+LbHMNUsgPI5yISdG
	TyVopLFEb5JbrVDgDs0cqzbQIfSU1cjqZBGERWLrzE3d9lY5fJQTU7W3KRZsi29M/6Jj
	nuhOKwv79zvhPUI0cxoSt6J7/O9chaMgAQLJGiEw7zIE1EDQPoNH19Kx/nDbn0kkI+zm
	AgQneqAruc1ZeWXc8OjnpEjznCMLdt8707QIsJsXl2vN1KpRSI2/2dqDRNZKAiNLteHY
	IcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5rzAe4lPDoJJg3BZmvldzk02sBICqw7W8tYxKJ91Tbg=;
	b=IXe+smc0teMbTTlZcKe7ceQ0f8jFORuSu428rMlpmTCJv7ecFU0wUEUGu+/KAHh+R1
	XWUzWou+9p4zlkLnvmhTpZuMKmVf/JalhDrFpvex7exNAatZwGFdUitmIoP8cZy0jfdr
	0nZemWMnh6zeoUZ0B9aSk64iK1KZgqwNLpZHu3E1vnSO5lYTWDfgd06aSuKx0ksqDGXb
	inxYlBl7EM2ORNQLTCARnvp8FHF06yUG9J01FsR3iYPyj6kGAo5WdxCdV6kNVd5d/g3i
	kGqdzXsm5aZ8SqfOPDTEBcHLOmWnyNi2L07dPgXjiC0Cd8TMAn5AKYe7zt1+eMQtxtfQ
	iN+Q==
X-Gm-Message-State: AOUpUlEhf2NIW+3uyVzfrEJsBZ8IoJlxCGCFqyFqB/BjQbBssKcztAGm
	YcBMVvPmDnXSvQmQqvBnrCUnTS4h
X-Google-Smtp-Source: AA+uWPwt8bISgpXzgNn9ENbuvfWe7fPHaRlqa7nFIu3PFaPok6xaoeu6StTmrz4clY8HCx0fqsXwng==
X-Received: by 2002:a1c:a703:: with SMTP id
	q3-v6mr17115700wme.28.1534444085443; 
	Thu, 16 Aug 2018 11:28:05 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.28.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:28:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:41 +0200
Message-Id: <20180816182748.2400-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/16] dconf: prettify
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
X-List-Received-Date: Thu, 16 Aug 2018 18:28:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* GNOME_COMPRESS_TYPE = "xz" is defaul for ages
* FILES_${PN}-dbg: are packed correctly

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb
index edda1cc08..99292a88c 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb
@@ -1,21 +1,18 @@
 SUMMARY = "configuation database system"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-
 SECTION = "x11/gnome"
 
-GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gsettings bash-completion
 SRC_URI[archive.md5sum] = "81faa8e68e5ea71ff0ee75050fc0759c"
 SRC_URI[archive.sha256sum] = "61d3b3865ef58b729c3b39aa0979f886c014aa8362f93dcfc74bf5648ed9c742"
-GNOME_COMPRESS_TYPE = "xz"
 
 DEPENDS = "dbus glib-2.0 intltool-native"
 
-inherit vala
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gsettings bash-completion vala
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${libdir}/gio/modules/*.so \
 "
-FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/libdconfsettings.so"
-- 
2.14.4


