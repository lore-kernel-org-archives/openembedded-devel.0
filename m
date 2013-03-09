Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UEQBX-0004Ni-1P
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Mar 2013 21:16:06 +0100
Received: by mail-ee0-f45.google.com with SMTP id b57so1557363eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Mar 2013 11:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=8ooU1tUjX5evO1ccOU/swPrFx23+jRPhGDmLcl96PU8=;
	b=m+FyrOpVw3kLIlUFHq6F75FXDwn9/661mvWCbbsmG6RoZ5YVHYp6qm4Jw7CXcxfUbP
	TCpP3d9dvFZ6V9/88K9cSzoqphNLsbD6ezWeyA5b5DeGCi9pIRgGJam07FjuWuCG+aiR
	K0Qz31oELhjRal48CiTwic33rpwQQpZqP+3oQmrbun0jLT7sT5o2N2nbZUofsp58sDjM
	SmhW/LR48B8Whhn71XngQ+bkWuv3zyQkDEwnT9srXfuzMg4xeCoONocDx1KYeSkUycQB
	ZSOWsqodvIK3Lzz5TwPB+5JR3Bs5RipwlrYgIIevXi/1NzWn+gAn5crs3vfakKgd87QC
	OFaA==
X-Received: by 10.14.193.134 with SMTP id k6mr19056647een.37.1362859158706;
	Sat, 09 Mar 2013 11:59:18 -0800 (PST)
Received: from localhost.localdomain (p5B0A1B31.dip.t-dialin.net.
	[91.10.27.49])
	by mx.google.com with ESMTPS id m46sm14583955eeo.16.2013.03.09.11.59.17
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 09 Mar 2013 11:59:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Mar 2013 20:59:04 +0100
Message-Id: <1362859144-336-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1362859144-336-1-git-send-email-schnitzeltony@googlemail.com>
References: <1362859144-336-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe] gedit: fix compile
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
X-List-Received-Date: Sat, 09 Mar 2013 20:16:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0001-workaround-void-pointer-arithmetic.patch  |   57 ++++++++++++++++++++
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb     |    3 +-
 2 files changed, 59 insertions(+), 1 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-workaround-void-pointer-arithmetic.patch

diff --git a/meta-gnome/recipes-gnome/gedit/files/0001-workaround-void-pointer-arithmetic.patch b/meta-gnome/recipes-gnome/gedit/files/0001-workaround-void-pointer-arithmetic.patch
new file mode 100644
index 0000000..a28808b
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gedit/files/0001-workaround-void-pointer-arithmetic.patch
@@ -0,0 +1,57 @@
+From 8e0cbfac142d38320dd02416601e14c65585cd17 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sat, 9 Mar 2013 12:47:06 +0100
+Subject: [PATCH] workaround void pointer arithmetic
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+fixes errors like:
+error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ gedit/gedit-document-input-stream.c   |    4 ++--
+ gedit/gedit-smart-charset-converter.c |    2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gedit/gedit-document-input-stream.c b/gedit/gedit-document-input-stream.c
+index 5a1f961..38316e7 100644
+--- a/gedit/gedit-document-input-stream.c
++++ b/gedit/gedit-document-input-stream.c
+@@ -426,7 +426,7 @@ gedit_document_input_stream_read (GInputStream  *stream,
+ 
+ 	do
+ 	{
+-		n = read_line (dstream, buffer + read, space_left);
++		n = read_line (dstream, ((char*)buffer) + read, space_left);
+ 		read += n;
+ 		space_left -= n;
+ 	} while (space_left > 0 && n != 0 && dstream->priv->bytes_partial == 0);
+@@ -451,7 +451,7 @@ gedit_document_input_stream_read (GInputStream  *stream,
+ 
+ 			newline = get_new_line (dstream);
+ 
+-			memcpy (buffer + read, newline, newline_size);
++			memcpy (((char*)buffer) + read, newline, newline_size);
+ 
+ 			read += newline_size;
+ 			dstream->priv->newline_added = TRUE;
+diff --git a/gedit/gedit-smart-charset-converter.c b/gedit/gedit-smart-charset-converter.c
+index e32b0b1..6745ce3 100644
+--- a/gedit/gedit-smart-charset-converter.c
++++ b/gedit/gedit-smart-charset-converter.c
+@@ -153,7 +153,7 @@ try_convert (GCharsetConverter *converter,
+ 	do
+ 	{
+ 		res = g_converter_convert (G_CONVERTER (converter),
+-		                           inbuf + nread,
++		                           ((const char*)inbuf) + nread,
+ 		                           inbuf_size - nread,
+ 		                           out + nwritten,
+ 		                           out_size - nwritten,
+-- 
+1.7.4.4
+
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index 24ce245..11e0945 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -1,13 +1,14 @@
 DESCRIPTION = "GNOME editor"
 SECTION = "x11/gnome"
 LICENSE = "GPLv2+"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "gvfs enchant gconf gnome-doc-utils gnome-doc-utils-native glib-2.0 gtk+ gtksourceview2 iso-codes"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit gnome gettext pythonnative
+SRC_URI+= "file://0001-workaround-void-pointer-arithmetic.patch"
 SRC_URI[archive.md5sum] = "e1eecb0a92a1a363b3d375ec5ac0fb3b"
 SRC_URI[archive.sha256sum] = "a561fe3dd1d199baede1bd07c4ee65f06fc7c494dd4d3327117f04149a608e3c"
 
-- 
1.7.4.4



