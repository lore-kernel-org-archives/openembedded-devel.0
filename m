Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBlo7-0007Fg-11
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 12:35:51 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3317704fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 03:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=1sJ7VwOGxfn3/j7lt6C2XgV7ZwGSBPa+wPdh4klPYmg=;
	b=f2gdHZ+EloIC2XC2UO2Ff2jD3V7y91WQehCxKh5dpLOzsNE7dj+vTzH/XuV8y+i8Kt
	UmUWb/Ab0yYkklF35t9j3oDeL6arE2aCkzAyYRYRdHDl4T60HV4Yko3qeFiG0YeO9DH+
	r0NDIYGKwxsk4aPhdqkzTzRip3GbOu9n5jcho=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KhBKUigcckn4q7oo/SJfxF4NExrvINWFQVpFiVfQ4T7hxN5wbo/ICUx6nfH6+zM0iH
	EAOqg2K8ush8fjzYRnRTZrWBogB/1/en66g930q/d7heuqNOOIlEyoeWulT9zeuIH9kk
	zlrbhMfcHUNx/Fs01xMXHiLQh/x/S8k1uc6dg=
Received: by 10.223.66.69 with SMTP id m5mr4762816fai.14.1303122806519;
	Mon, 18 Apr 2011 03:33:26 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c24sm1623012fak.31.2011.04.18.03.33.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 03:33:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 12:33:25 +0200
Message-Id: <51d39ef1ca98bb871d10811ccdc6019a6f8d7878.1303122650.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303122650.git.Martin.Jansa@gmail.com>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/13] renderproto: it was upgraded in oe-core, keep only .bbappend with BBCLASSEXTEND
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
X-List-Received-Date: Mon, 18 Apr 2011 10:35:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-proto/renderproto_0.11.1.bb               |   15 ---------------
 .../xorg-proto/renderproto_0.11.1.bbappend         |    1 +
 2 files changed, 1 insertions(+), 15 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bbappend

diff --git a/meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bb b/meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
deleted file mode 100644
index 7e38448..0000000
--- a/meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-proto-common.inc
-
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f826d99765196352e6122a406cf0d024 \
-                    file://renderproto.h;beginline=4;endline=24;md5=3e5e2851dad240b0a3a27c4776b4fd1f"
-
-CONFLICTS = "renderext"
-PR = "r0"
-PE = "1"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "a914ccc1de66ddeb4b611c6b0686e274"
-SRC_URI[sha256sum] = "06735a5b92b20759204e4751ecd6064a2ad8a6246bb65b3078b862a00def2537"
-
diff --git a/meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bbappend b/meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bbappend
new file mode 100644
index 0000000..608377e
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.5.rc1



