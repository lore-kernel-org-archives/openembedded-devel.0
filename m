Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TmlR3-0004bv-4O
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 14:17:47 +0100
Received: by mail-ee0-f41.google.com with SMTP id d41so3252236eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 05:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=K509TOCI13R0FT2hR4uYy0fFtl+z8jXy7/9zdGjL+AY=;
	b=p9kGkY/1OJ1sPTw5fDtc+3Iq4GSB/pWcIxBYEEUqggCx4EJNqRooEDx+Z5TCgXIPd1
	OcyXfLabp5ESk4QxVquIKUkOGSQAtTuUyf0NClkdX/6vrkFi8qFZU96Me8pELkYI4PUf
	LldtRYRlY9N+afp7FbgtX8U5rsMMdd+PnWI/ajUbyxLqywUaLuH418vjBZp5qPuHCiLx
	orcbb2jFlkNz6mVtEPY3W11d48Sur9X7kxoVW/OHXGPm5qk0Xf0iXl+lGObu7kTGVYRK
	SEA6vTWsbJxS4tsqU94zvFp2aQro1q3upcX8nEuo/rqmBovZ9JQ+Mo9ObJZgcKDI3cBU
	fHfg==
X-Received: by 10.14.202.3 with SMTP id c3mr48371055eeo.4.1356267776823;
	Sun, 23 Dec 2012 05:02:56 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip.t-dialin.net.
	[91.10.19.148])
	by mx.google.com with ESMTPS id f49sm34747114eep.12.2012.12.23.05.02.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 05:02:56 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 14:02:32 +0100
Message-Id: <1356267761-15152-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 03/12] openzone: Initial add 1.2.3
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
X-List-Received-Date: Sun, 23 Dec 2012 13:17:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-art/cursor-themes/openzone_1.2.3.bb    |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb

diff --git a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
new file mode 100644
index 0000000..2e19d89
--- /dev/null
+++ b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "X11 Mouse Theme"
+HOMEPAGE = "http://xfce-look.org/content/show.php/OpenZone?content=111343"
+SECTION = "x11/wm"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a2f562fb8fb1e138b810d69521c4bcd7"
+DEPENDS = "icon-slicer-native xcursorgen-native"
+
+inherit allarch
+
+SRC_URI = "http://xfce-look.org/CONTENT/content-files/111343-OpenZone-${PV}.tar.xz"
+SRC_URI[md5sum] = "4dae968cbd525072664ef7a4fc7c4154"
+SRC_URI[sha256sum] = "dc20f97a49e1ff1becf7853ef5f137ed30a4c27490540e755021d78d339efd92"
+
+S = "${WORKDIR}/OpenZone"
+
+do_install() {
+	install -d ${D}${datadir}/icons
+	for theme in `find -name '*.tar.xz'`; do
+		tar -Jxf ${theme} -C ${D}${datadir}/icons
+	done
+}
+
+python populate_packages_prepend () {
+    icondir = bb.data.expand('${datadir}/icons', d)
+    do_split_packages(d, icondir, '^(.*)', '%s', 'Open Zone cursors %s', allow_dirs=True)
+}
+
+PACKAGES_DYNAMIC += "^openzone-.*"
+ALLOW_EMPTY_${PN} = "1"
-- 
1.7.4.4



