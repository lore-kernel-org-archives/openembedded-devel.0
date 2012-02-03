Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RtSQW-0003N2-VO
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 00:20:21 +0100
Received: by eekd41 with SMTP id d41so1140983eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2012 15:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=XtMj6Ciw390hvOAM9TQLe33YAJQSHVjClmaRaVZTG24=;
	b=lg3GNYwQBrzC0K4wkhcIXkgG1cJam/NF7WuGoGDl2NyX0unxodNibZArgty/kXDKQ5
	rZ6IVzapWPXX17NirhIXZ504ylqm92CZqujvm1DWPzJAIGIcqv2objsGdq7dKVkfVGSX
	Qs9hkqAIDB+gWp5+x0Nd8RYdKTbukgrbU1xnk=
Received: by 10.14.96.65 with SMTP id q41mr2760048eef.99.1328310742069;
	Fri, 03 Feb 2012 15:12:22 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id o49sm27346202eeb.7.2012.02.03.15.12.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 15:12:21 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Feb 2012 00:10:12 +0100
Message-Id: <1328310612-2098-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1328132338-15939-1-git-send-email-tworaz666@gmail.com>
References: <1328132338-15939-1-git-send-email-tworaz666@gmail.com>
Subject: [meta-oe][PATCH v3] tmux: Add initial recipe for version 1.6.
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
X-List-Received-Date: Fri, 03 Feb 2012 23:20:21 -0000

Run tested on netbook pro.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 meta-oe/recipes-extended/tmux/tmux_1.6.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/tmux/tmux_1.6.bb

diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
new file mode 100644
index 0000000..fa58065
--- /dev/null
+++ b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Terminal multiplexer"
+HOMEPAGE = "http://tmux.sourceforge.net"
+SECTION = "console/utils"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://tmux.c;startline=3;endline=17;md5=f36d9c9e6c1c24996a88891fdf783d04"
+
+DEPENDS = "ncurses libevent sed-native"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/tmux/${P}.tar.gz"
+SRC_URI[md5sum] = "3e37db24aa596bf108a0442a81c845b3"
+SRC_URI[sha256sum] = "faee08ba1bd8c22537cd5b7458881d1bdb4985df88ed6bc5967c56881a7efbd6"
+
+inherit autotools
+
+do_configure_prepend () {
+	sed -i -e 's:-I/usr/local/include::' Makefile.am || bb_fatal "sed failed"
+}
-- 
1.7.3.4



