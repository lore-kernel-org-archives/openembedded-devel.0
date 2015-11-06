Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 23BCC7708E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:38:03 +0000 (UTC)
Received: by wikq8 with SMTP id q8so30425562wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 05:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ueYZoAJBaVRiflZOScQxUhpLVCrmMlmX875YKQci3vE=;
	b=eqprSDlkNvoVr2IaxgPZcHoXAC3fW+LiSYE1kTGGbEQFmgO1fqp3hGkiEsYDe8n8nW
	Y35Yt/ape1lxgUP6ufpe2l6/YZy7ajkRE8k9g7E/qSftDzECVnAaOCHapzYZAJ9p0Pwx
	18sdD+7aWym3DN+hCBy4LG1BnorNSsM0FgaRPTxkvTnY6QiJo6ndRY2fWlpOtqIyC3E9
	pWv9kLg48JdSd3qvOcA9rFtaQLkKINdzlXdMOeKyp5e6HUv4iEvF9EZyzyUlFE8L3N9w
	ke07r/M1P3XdWF3P1z7q5mfXQN0tIn6r/ZxlbWEr3N5qzGMMiUpHt06EX8Bk352fUPzy
	Fzog==
X-Received: by 10.194.6.232 with SMTP id e8mr16642834wja.151.1446817083578;
	Fri, 06 Nov 2015 05:38:03 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id c1sm201211wjf.19.2015.11.06.05.38.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 05:38:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Nov 2015 14:38:10 +0100
Message-Id: <1446817092-9386-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1446817092-9386-1-git-send-email-Martin.Jansa@gmail.com>
References: <1446817092-9386-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 5/7] qtwebengine: add dependency on yasm-native and use it
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
X-List-Received-Date: Fri, 06 Nov 2015 13:38:06 -0000

* latest chromium is failing to build yasm, because it's mixing native
  (x86_64) with target (x86 qemux86) libraries during the build:
  FAILED: /OE/build/oe-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/i586-oe-linux/i586-oe-linux-g++ -m32 -march=i586 --sysroot=/OE/build/oe-core/tmp-glibc/sysroots/qemux86 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,now -Wl,-z,relro -Wl,--fatal-warnings -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC -Wl,--disable-new-dtags -Wl,--gc-sections -o genstring -Wl,--start-group obj.host/src/3rdparty/chromium/third_party/yasm/source/patched-yasm/genstring.genstring.o -Wl,--end-group
  /OE/build/oe-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/i586-oe-linux/gcc/i586-oe-linux/5.2.0/ld: i386:x86-64 architecture of input file `obj.host/src/3rdparty/chromium/third_party/yasm/source/patched-yasm/genstring.genstring.o' is incompatible with i386 output
  /OE/build/oe-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/i586-oe-linux/gcc/i586-oe-linux/5.2.0/ld: obj.host/src/3rdparty/chromium/third_party/yasm/source/patched-yasm/genstring.genstring.o: file class ELFCLASS64 incompatible with ELFCLASS32
  /OE/build/oe-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/i586-oe-linux/gcc/i586-oe-linux/5.2.0/ld: final link failed: File in wrong format
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  Makefile.gyp_run:262: recipe for target 'invoke_ninja' failed
  make[3]: *** [invoke_ninja] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index f02c4d6..e4427c3 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -23,6 +23,9 @@ DEPENDS += " \
 # xscreensaver isn't covered in qtbase DEPENDS
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'libxscrnsaver', '', d)}"
 
+DEPENDS += "yasm-native"
+EXTRA_QMAKEVARS_PRE += "WEBENGINE_CONFIG+=use_system_yasm"
+
 COMPATIBLE_MACHINE = "(-)"
 COMPATIBLE_MACHINE_x86 = "(.*)"
 COMPATIBLE_MACHINE_x86-64 = "(.*)"
-- 
2.6.2


