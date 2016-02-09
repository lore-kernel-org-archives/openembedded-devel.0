Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8526E73179
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2016 00:16:54 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id c3so60497931vkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2016 16:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=1hiOBro0R/Bsht0AH1RfjsEU6MXeWimBob0RpLSdM7g=;
	b=UlpZBQUOsezE7em0yKJIbbmmbSVY7MuuRcm17LFUJinHNW8sp+CtyISxh5H3bjFcjq
	60z4p2i9DikCmH1AwtM46wQIN+xu3sZlFAlJlRMEvi+NpYN42KsOGxolxP4JKWtRC8Z0
	fgbel30aCbQMlFRCQz7OifN5L1CL5P46G7f3N/aEY3ib0sGDcsgBKNgBh35jq+c5JI96
	j/si00RO1jyLp+3TYxGJj1vexBVpWX3+Mzm/JWQ51AnACFNWRj2R+wEatInBFQ+JA69U
	y+gi9NPRbL6IGgtysz9my9AFPjDrXDRrtaJHJJ7Dgug5JrEdgd5IbztZT+pSywEhiUpi
	wDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=1hiOBro0R/Bsht0AH1RfjsEU6MXeWimBob0RpLSdM7g=;
	b=erM6tpdQVaaTjU2SJIUb29KfQvnUMp2hYMzN9Prq66joNkNLS5DMdZb5lq8GKpWYd/
	LTB6eYaMKArnCBfF80MoDazez2I14vVseKdKtJPsu8q9+Jnv1ZW4jmjAuqXD4NSymEwe
	S1XAanu6NyhnqCZwQqjsL6sCGBVuvkJ5lkkFFqTbCHnFJmuxLXyuelKAzVBQPTaQUxhQ
	QC5OLH8GstzeSA7uKmE0Ek79HRW+4Bu8X7FDWXS4l1Z4QDdiYN5wv1CHDu6V3i/jOhpc
	/4ojYl/B+BSSpcSwKSDFiv7rGQLH3lGVCfHQJHanSCKo03GvPojYC1eKUVzJ6/Uew1sN
	VMcg==
X-Gm-Message-State: AG10YORpDyaeytx1t9zmgTmbwC2UHSNJ8VAL3jPpesdM1d2IC107TkJ99N+kvd//16hOJhP1cK0egtvDrMx6jQ==
X-Received: by 10.31.131.199 with SMTP id f190mr22551736vkd.90.1454977014843; 
	Mon, 08 Feb 2016 16:16:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.146.65 with HTTP; Mon, 8 Feb 2016 16:16:35 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 9 Feb 2016 13:16:35 +1300
Message-ID: <CADySD0HQZ-u3X4d5Jei6YKxQzocc5bPwjn2Huo+WxCQOSkUDtg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [PATCH] Fix bluetooth.h compilation error with strict C
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
X-List-Received-Date: Tue, 09 Feb 2016 00:16:54 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

This patch fixes bluetooth.h strict C compilation error when building
bluez4 in fido branch.

thanks
Ankur

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 .../strict-C-compilation-error-fix.patch           | 42
++++++++++++++++++++++
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644
meta/recipes-connectivity/bluez/bluez4-4.101/strict-C-compilation-error-fix.patch

diff --git
a/meta/recipes-connectivity/bluez/bluez4-4.101/strict-C-compilation-error-fix.patch
b/meta/recipes-connectivity/bluez/bluez4-4.101/strict-C-compilation-error-fix.patch
new file mode 100644
index 0000000..e8109a0
--- /dev/null
+++
b/meta/recipes-connectivity/bluez/bluez4-4.101/strict-C-compilation-error-fix.patch
@@ -0,0 +1,42 @@
+From d7fab1e161c2344875b1b0a2363f1f62efdd6cd4 Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi@gallagher.com>
+Date: Thu, 14 Jan 2016 18:12:23 +1300
+Subject: [PATCH 1/1] strict C compilation error fix
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
+Upstream-Status: Backported
+---
+ lib/bluetooth.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/lib/bluetooth.h b/lib/bluetooth.h
+index 0fc4508..449431d 100644
+--- a/lib/bluetooth.h
++++ b/lib/bluetooth.h
+@@ -138,18 +138,18 @@ enum {
+
+ /* Bluetooth unaligned access */
+ #define bt_get_unaligned(ptr) \
+-({ \
++__extension__ ({ \
+ struct __attribute__((packed)) { \
+- typeof(*(ptr)) __v; \
+- } *__p = (typeof(__p)) (ptr); \
++ __typeof__(*(ptr)) __v; \
++ } *__p = (__typeof__(__p)) (ptr); \
+ __p->__v; \
+ })
+
+ #define bt_put_unaligned(val, ptr) \
+ do { \
+ struct __attribute__((packed)) { \
+- typeof(*(ptr)) __v; \
+- } *__p = (typeof(__p)) (ptr); \
++ __typeof__(*(ptr)) __v; \
++ } *__p = (__typeof__(__p)) (ptr); \
+ __p->__v = (val); \
+ } while(0)
+
+--
+1.9.1
+
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index ccd230d..7944141 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://bluetooth.conf \
             file://network-fix-network-Connect-method-parameters.patch \
             file://install-test-script.patch \

 file://use-legacy-pygobject-instead-ofgobject-introspection.patch \
+            file://strict-C-compilation-error-fix.patch
 "

 SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
--

