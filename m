Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id D9EB27264D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:39 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id rd3so14735554pab.35
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=4vyoFXE6C26WvOXW9zSwdeslEY2qBkZNeaYIhn7Izww=;
	b=Eja4Vt5GcZuo3ck6vjcdTMX8SIhDNTkkbpmmbcNn9ancn7Bwa2SP+vI3ZTYlC4ExjB
	57Dm0WKV2f1tRsnw6eka6uoRggFVeUXGA4x7UIJuaEsMSQxZeAqjTFBkvuzvlv9ucN0n
	dO89x9ysiMWL9OnqgR5rzBWp0wDdnqZudNywqBp/152sjA4Hh8JPdJhsjIGUHVX3NCMo
	jVHhBsog22ME3iJFZepGR5Nx7r5qf3OaJFuvOf+HlQ0xRmyHUFqLGvvJk/wiVrn24/78
	ORauVpxOTsLFi726OIusIZcma+xK9s7pCRb4gDQHvBpAYsDQAZ6S+UfE3JXIB1Jard1A
	bS7Q==
X-Received: by 10.66.156.38 with SMTP id wb6mr59506344pab.139.1419700959981;
	Sat, 27 Dec 2014 09:22:39 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:22:01 -0800
Message-Id: <988092c0c21b8a016932a6f787b1ac966645c344.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 14/27] xserver-common: disable TCP connections
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Dec 2014 17:22:40 -0000

From: Javier Viguera <javier.viguera@digi.com>

For security reasons disable TCP connections to the xserver.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...15-xserver-common-disable-TCP-connections.patch | 24 ++++++++++++++++++++++
 .../xserver-common/xserver-common_1.34.bb          |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch
new file mode 100644
index 0000000..06df261
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch
@@ -0,0 +1,24 @@
+From: Javier Viguera <javier.viguera@digi.com>
+Date: Wed, 26 Nov 2014 09:24:44 +0100
+Subject: [PATCH] xserver-common: disable TCP connections
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Javier Viguera <javier.viguera@digi.com>
+---
+ X11/xserver-common | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/X11/xserver-common b/X11/xserver-common
+index 017e5aee1ab0..4dc48c412741 100644
+--- a/X11/xserver-common
++++ b/X11/xserver-common
+@@ -44,7 +44,7 @@ SCREEN_SIZE=`fallback_screen_arg`
+ export USER=root
+ export XSERVER_DEFAULT_ORIENTATION=normal
+ 
+-ARGS="-br -pn $INPUT_EXTRA_ARGS"
++ARGS="-br -pn -nolisten tcp $INPUT_EXTRA_ARGS"
+ DPI="100"
+ MOUSE=""
+ KDRIVEARGS=""
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index 12fff9a..f5b1984 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -24,6 +24,7 @@ SRC_URI_append = " \
     file://0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch \
     file://0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch \
     file://0014-Xserver-Start-Xsession-like-x11-common-does.patch \
+    file://0015-xserver-common-disable-TCP-connections.patch \
 "
 
 do_install_append() {
-- 
1.9.1


