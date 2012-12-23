Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TmlR0-0004bq-G0
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 14:17:47 +0100
Received: by mail-ea0-f173.google.com with SMTP id i13so2518442eaa.18
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 05:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=50YLlxAMmWQu9sckoJH+7Jid8m22wNmfSBU8hEqCEW8=;
	b=I5hQIdh/zErvkTVWU1hBhvJcA6TpnI3VeMqwPaIECV9j8btWNg/3pAxqmIjh2wI5g5
	KfpBPJDFKxS9+Gc+C7upUR/1tZJiiYHifrUb6KjNo2RZpYL5Fxign/2JCsLmwLmWr0R4
	nyIa7BTXt98aZwQC8cuWQ0wrQROqQsJKYfs5Np00vzOdUt47cyoJUkgscU0SR1AevXfa
	MT9XI0sstYqtGxLPJXJk5tSh4JAvkS3fzuD9bcDneHFfMWic+v81IRBjSx4IHEHsIjfG
	zIDjuxNvuiBlHp3RhOx7OYkrO6aejgitdmlhDmEoldG7hk9k4KNtAYYCVIlHyjgwUvpf
	iJJw==
X-Received: by 10.14.1.195 with SMTP id 43mr48205204eed.31.1356267774041;
	Sun, 23 Dec 2012 05:02:54 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip.t-dialin.net.
	[91.10.19.148])
	by mx.google.com with ESMTPS id f49sm34747114eep.12.2012.12.23.05.02.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 05:02:53 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 14:02:30 +0100
Message-Id: <1356267761-15152-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 01/12] icon-slicer: initial add 0.3
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
 .../files/0001-Makefile.am-no-examples.patch       |   27 ++++++++++++++++++++
 .../icon-slicer/icon-slicer_0.3.bb                 |   13 +++++++++
 2 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/icon-slicer/files/0001-Makefile.am-no-examples.patch
 create mode 100644 meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb

diff --git a/meta-oe/recipes-devtools/icon-slicer/files/0001-Makefile.am-no-examples.patch b/meta-oe/recipes-devtools/icon-slicer/files/0001-Makefile.am-no-examples.patch
new file mode 100644
index 0000000..5d83818
--- /dev/null
+++ b/meta-oe/recipes-devtools/icon-slicer/files/0001-Makefile.am-no-examples.patch
@@ -0,0 +1,27 @@
+From e6d53086524a94d27920614e38966020e0b2b3ef Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 5 Nov 2012 11:25:02 +0100
+Subject: [PATCH] Makefile.am: no examples
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
+---
+ Makefile.am |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 28ee7eb..af437a6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1 +1 @@
+-SUBDIRS = src examples
+\ No newline at end of file
++SUBDIRS = src
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
new file mode 100644
index 0000000..b9a2909
--- /dev/null
+++ b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
@@ -0,0 +1,13 @@
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "gtk+ popt"
+
+SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BPN}-${PV}.tar.gz \
+           file://0001-Makefile.am-no-examples.patch"
+SRC_URI[md5sum] = "5c5374d4f265b0abe4daef1d03f87104"
+SRC_URI[sha256sum] = "05f0216dd0c25a17859de66357f64da5033375b6fbf5f31ca54867311160b64d"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
-- 
1.7.4.4



