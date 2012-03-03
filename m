Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S3nsO-0003xu-Ss
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Mar 2012 13:15:52 +0100
Received: by eekc1 with SMTP id c1so746810eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Mar 2012 04:07:20 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.213.6.207 as permitted sender)
	client-ip=10.213.6.207; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.213.6.207 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.213.6.207])
	by 10.213.6.207 with SMTP id a15mr315741eba.179.1330776440956 (num_hops
	= 1); Sat, 03 Mar 2012 04:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=zoeN5gf2d2suU2lJAsMsxnIu2Io0xdDEQ9+2Es+ql/8=;
	b=Kl+u1dfJRNUeLfAMuzHtm7Zp6g11+SoOgu1CgtcyRV0jKWiSwmZc5ye2lXgxWLHUjz
	ppQgIdTAPx6fD4ZPgR7A6xmoRRM5ZH31M8PrOrlf4i1puOQX49jhfBuFKdNyLFDC5rGc
	qRyl99emKtzQOPnOK1L5m+eAVYPqbsywrc/uyH7kdTOQlkKeGVUMK6BU2LVUJ0wvuGyx
	4JnQIUUMJAsGpW0k95bJEC6ygAHNVRLoFqeFyu6kELXqIuBL/yfv19P+ytJEZJs9HW9V
	xAI4VauDoHXQPq99mWDQxBGA2NiEOALd+jy19rvp3hl/2mqOVclylfhFbhUiTQPAYUcl
	1X0w==
Received: by 10.213.6.207 with SMTP id a15mr242409eba.179.1330776440508;
	Sat, 03 Mar 2012 04:07:20 -0800 (PST)
Received: from localhost.localdomain (p4FDF1A4D.dip.t-dialin.net.
	[79.223.26.77])
	by mx.google.com with ESMTPS id i10sm33195646eea.8.2012.03.03.04.07.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Mar 2012 04:07:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Mar 2012 13:10:53 +0100
Message-Id: <1330776654-2913-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1330776654-2913-1-git-send-email-schnitzeltony@googlemail.com>
References: <1330776654-2913-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 2/3] xfce4-session: update to 4.8.3 / fix QA warnings static libs in dev package
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
X-List-Received-Date: Sat, 03 Mar 2012 12:15:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

run-tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ce4-session_4.8.2.bb => xfce4-session_4.8.3.bb} |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.8.2.bb => xfce4-session_4.8.3.bb} (79%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.2.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.3.bb
similarity index 79%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.2.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.3.bb
index 6c23c68..2db465b 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.3.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf xfce4-panel gconf gnome-keyring"
 RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth"
 
-PR = "r1"
-
 inherit xfce
 
 # protect from frightening message that xfce might not work correctly
@@ -21,7 +19,7 @@ FILES_${PN} += "${libdir}/xfce4/*/*/*.so \
 
 FILES_${PN}-dbg += "${libdir}/xfce4/*/*/.debug"
 
-FILES_${PN}-dev += "${libdir}/xfce4/*/*/*.*a"
+FILES_${PN}-staticdev += "${libdir}/xfce4/*/*/*.*a"
 
-SRC_URI[md5sum] = "48780cbcf784ab64debc9312f17765f2"
-SRC_URI[sha256sum] = "31bca2a559e05a8a859f150394a901517e5842414ef171a85c5da234e344c0d0"
+SRC_URI[md5sum] = "461cc38bbd37cab881adbdf943f9a402"
+SRC_URI[sha256sum] = "f0801b8c0ffa7e5d41b29b8df281ac127adf467bf50e8ded8aebe5a02bd99338"
-- 
1.7.4.4



