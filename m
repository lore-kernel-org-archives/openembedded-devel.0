Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzAtN-0002RM-Cf
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 15:03:53 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2048762fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 06:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=gy9laAPkEn8x3rr8rTkdI/JgBwldnW6sIEZeYOMIQXE=;
	b=QMA92ygjlASkhCjaJlmaMeARiojJznkhmidcQdpteX3HBaOFSXlafTV5EtXPaZ778p
	aXq0PY9WdILwwzeQrCBOCRy0qrccF0jZ64d7ifSBUSsV6jEMMYqjH00bY9oHoSXapYF1
	ckXXUmaM2UuvKIKD2G+G8Zb8lZPpu3wQc2CLg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HlrIpVFSQUljjwgDy9sr4MqoFW9DqzQBAX5n/tJHr8QrA3vy5TbG2zHZ9xFgSkilGz
	B6tY31uV73UuQ2qlRdF7GvaYIvQ3MYiQs+hkJIIhYWFWpqOZ2KUltpANlsHSOQ6stRsM
	B52jHIFa0YnvktyIHIduTSBw6UFOQo23Ollxc=
Received: by 10.180.246.2 with SMTP id t2mr1724065bkh.161.1226237358968;
	Sun, 09 Nov 2008 05:29:18 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.29.16
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:29:17 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:12 +0300
Message-Id: <1226237296-11012-12-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1226237296-11012-11-git-send-email-dbaryshkov@gmail.com>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-3-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-4-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-5-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-6-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-7-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-8-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-9-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-10-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-11-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] libsvg-cairo: fix building with current libtool/autoconf
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
X-List-Received-Date: Sun, 09 Nov 2008 14:03:53 -0000

Current autoconf/libtool prohibit using of macros/variables that start
with LT_. Workaround that by s/LT_/LV_/ on libsvg-cairo's configure.in

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 .../cairo/libsvg-cairo/libsvg-cairo-libtool.diff   |   27 ++++++++++++++++++++
 packages/cairo/libsvg-cairo_20050601.bb            |    3 +-
 2 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 packages/cairo/libsvg-cairo/libsvg-cairo-libtool.diff

diff --git a/packages/cairo/libsvg-cairo/libsvg-cairo-libtool.diff b/packages/cairo/libsvg-cairo/libsvg-cairo-libtool.diff
new file mode 100644
index 0000000..90448dc
--- /dev/null
+++ b/packages/cairo/libsvg-cairo/libsvg-cairo-libtool.diff
@@ -0,0 +1,27 @@
+Index: libsvg-cairo/configure.in
+===================================================================
+--- libsvg-cairo.orig/configure.in	2008-11-04 13:38:51.795236755 +0300
++++ libsvg-cairo/configure.in	2008-11-04 13:40:44.503218844 +0300
+@@ -8,18 +8,18 @@ LIBSVG_CAIRO_VERSION=0.1.5-head
+ # libtool shared library version
+
+ # Increment if the interface has additions, changes, removals.
+-LT_CURRENT=1
++LV_CURRENT=1
+
+ # Increment any time the source changes; set to
+ # 0 if you increment CURRENT
+-LT_REVISION=1
++LV_REVISION=1
+
+ # Increment if any interfaces have been added; set to 0
+ # if any interfaces have been removed. removal has
+ # precedence over adding, so set to 0 if both happened.
+-LT_AGE=0
++LV_AGE=0
+
+-VERSION_INFO="$LT_CURRENT:$LT_REVISION:$LT_AGE"
++VERSION_INFO="$LV_CURRENT:$LV_REVISION:$LV_AGE"
+ AC_SUBST(VERSION_INFO)
+
+ dnl ===========================================================================
diff --git a/packages/cairo/libsvg-cairo_20050601.bb b/packages/cairo/libsvg-cairo_20050601.bb
index 55e439a..9cc7c5b 100644
--- a/packages/cairo/libsvg-cairo_20050601.bb
+++ b/packages/cairo/libsvg-cairo_20050601.bb
@@ -7,7 +7,8 @@ PRIORITY = "optional"
 DEPENDS = "libsvg cairo"
 DESCRIPTION = "SVG rendering library"
 DEFAULT_PREFERENCE = "1"
-SRC_URI = "cvs://anoncvs:anoncvs@cvs.cairographics.org/cvs/cairo;module=libsvg-cairo;date=${FIXEDSRCDATE}"
+SRC_URI = "cvs://anoncvs:anoncvs@cvs.cairographics.org/cvs/cairo;module=libsvg-cairo;date=${FIXEDSRCDATE} \
+	   file://libsvg-cairo-libtool.diff;patch=1"
 S = "${WORKDIR}/libsvg-cairo"
 
 inherit autotools pkgconfig
-- 
1.5.6.5



