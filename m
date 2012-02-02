Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rt2OB-0005ex-Ur
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 20:32:12 +0100
Received: by eaal10 with SMTP id l10so512266eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2012 11:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=FaLJQy9bdHl3X6gUPYf59znZKmANRRceS4M3WaJclG8=;
	b=kOXY8I03HXdOPF9qFNqAaLZIf8JD1NsaBJwWScsjSy1leJ3KZCArITFcH0iXakSMt5
	51krEBxLm8iYAMdlcZ4HmqEuTETQ+1i7HG57JYYGKe+h7KuHjxzJV3cfF0g1Ia27C9Cd
	M8Cu+N+gN6WrOYNBFoYRZDx0kMEQdu/eTxXgc=
Received: by 10.213.7.217 with SMTP id e25mr1920547ebe.54.1328210655429;
	Thu, 02 Feb 2012 11:24:15 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id x4sm12473458eeb.4.2012.02.02.11.24.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Feb 2012 11:24:14 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Feb 2012 20:22:06 +0100
Message-Id: <1328210526-8694-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1328132338-15939-1-git-send-email-tworaz666@gmail.com>
References: <1328132338-15939-1-git-send-email-tworaz666@gmail.com>
Cc: Piotr Tworek <ptworek@opera.com>
Subject: [meta-oe][PATCH v2] tmux: Add initial recipe for vesion 1.6.
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
X-List-Received-Date: Thu, 02 Feb 2012 19:32:12 -0000

From: Piotr Tworek <ptworek@opera.com>

Run tested on netbook pro.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
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



