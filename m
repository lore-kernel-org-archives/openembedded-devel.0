Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rsi33-0007ZJ-H5
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 22:49:01 +0100
Received: by eaal10 with SMTP id l10so177108eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 13:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Rc+rHCKkEzkHl3ly0QFR6ZRGKwgg85m6d9BsUSEWq9A=;
	b=xwpOCn8brr5Tjm+471mEQMw6B7LmEczqXSo10o33HhC/NHy8duE7PcmTtlP4aO9j5Q
	T9+PL0eonnmVaoKUwudcgBtwovMssWwgyafQ72xj3Dhop1dy1EESYcM0UbPUbw0vYUtc
	P/EmVKynLvABDIwKm1vnfIetsEJeqC/Kg/4t0=
Received: by 10.213.23.20 with SMTP id p20mr1305351ebb.68.1328132465797;
	Wed, 01 Feb 2012 13:41:05 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id b49sm1050205eec.9.2012.02.01.13.41.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 13:41:05 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Feb 2012 22:38:58 +0100
Message-Id: <1328132338-15939-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][PATCH] tmux: Add initial recipe for vesion 1.6.
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
X-List-Received-Date: Wed, 01 Feb 2012 21:49:01 -0000

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta-oe/recipes-extended/tmux/tmux_1.6.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/tmux/tmux_1.6.bb

diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
new file mode 100644
index 0000000..eb6f7df
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
+DEPENDS = "ncurses libevent"
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



