Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 90CF46B37C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:15 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b15so218791eae.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4dUZpPCZpzB45htG3AYJxL/RhsvLP8c856sn0NJ3YTE=;
	b=Up3XsIFDNztplfXHat4xnXu11uqdykTQItv3Jw/6wQHwjJiVdhGByu4pI7s+UCI9sX
	wc1D4e8KMc6p76yKVIWU0YYVWxFQmLzNkdBltYTg4zNyd2OxMfTRRCBdp1sTnP8QHHVG
	YkmPi2Ki+q9Fh6ZnhhRkQGlk9JcJcKY7DR3mWTGkTCubnpwPPum1Lp2Fu5XuH5NG12vM
	gds/kxWCX0IxGxYpsbytT6OX+sG5lfYeetDw7yETw0+yVFu5Hk0A8holyMohcYQHcIky
	cKm01AstizliKNK33DmQWb7LWl+ihf5ihCniWxsfdZYphM3avQbN+8q7Joo03UMtU1Gu
	QsGg==
X-Received: by 10.15.61.67 with SMTP id h43mr37343497eex.102.1374669676042;
	Wed, 24 Jul 2013 05:41:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r54sm65868065eev.8.2013.07.24.05.41.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:41:00 +0200
Message-Id: <68bf2d72e94ffffdc8744d76521759a00ab59337.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 16/29] usbmuxd: fix unpackaged files
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:16 -0000

* WARNING: QA Issue: usbmuxd: Files/directories were installed but not shipped
  /usr/lib64
  /usr/lib64/libusbmuxd.so.1.0.8
  /usr/lib64/libusbmuxd.so.2
  /usr/lib64/libusbmuxd.so
  /usr/lib64/.debug
  /usr/lib64/pkgconfig
  /usr/lib64/.debug/libusbmuxd.so.1.0.8
  /usr/lib64/pkgconfig/libusbmuxd.pc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
index 595582a..52bf811 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -17,5 +17,8 @@ S = "${WORKDIR}/git"
 
 FILES_${PN} += "${base_libdir}/udev/rules.d/"
 
+# fix usbmuxd installing files to /usr/lib64 on 64bit hosts:
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[plist] = "-DWANT_PLIST=1,-DWANT_PLIST=0,libplist"
-- 
1.8.3.2


