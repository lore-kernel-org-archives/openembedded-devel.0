Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id E0A1A70A7A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 21:38:40 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so2567648wiv.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 14:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=D23eWFL7BuyRuIcZRGLt/gMMmftzMZAtSx55rfSLg0A=;
	b=cbFPJa3EX1v3erV3Blh70UR8yA7UENp3PeHlyh3evuu7W4N8FNCfnwM/gRR6KZpN1b
	OkBh8dQ3oXYjDkXSCoOSG2eOVW7rE4uymOML9SEuBts3ZhN4qVlTVyOU4FoocEgKNZyr
	iOHU8R5Bo6VpOOzZXoNSnKPQS9OfB2ebJN8EFx3YdLWvYoNBmZHpv1Io/WctsLuzJt4B
	o2OAUKSWQwkTYXMseEugAx7TgXPaxvnJCOP9WkpDkbFxmRYF/oWbcBLOVbfa7+7gKt6L
	ETWRqZUk6X1KmYs+1AixONnL97P7Dx/jnLoiwXExbVOttJRON5KGoGznVlFFONh2b/Tr
	3wIw==
X-Received: by 10.195.13.34 with SMTP id ev2mr21052795wjd.55.1407620321430;
	Sat, 09 Aug 2014 14:38:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e3sm27309559wjp.4.2014.08.09.14.38.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 14:38:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 23:39:10 +0200
Message-Id: <1407620350-7644-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407620350-7644-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407620350-7644-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-browser][PATCH 2/2] chromium-35*: use BFD when building for x86-64
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
X-List-Received-Date: Sat, 09 Aug 2014 21:38:45 -0000

* this doesn't fix it completely, but allows it a bit further and then
  it fails in the same spot as when building for qemux86 (or 37* version
  with gold)

  sysroots/x86_64-linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld.gold:
    warning: hidden symbol 'sqlite3_temp_directory' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/amalgamation/sqlite.sqlite3.o)
    is referenced by DSO
    sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
  sysroots/x86_64-linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld.gold:
    error: treating warnings as errors
  collect2: error: ld returned 1 exit status

  and few more symbols like this, libsoftokn3.so is provided by system
  nss, using system sqlite3 has some issues too:
  https://code.google.com/p/chromium/issues/detail?id=22208

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-browser/chromium/chromium_35.0.1916.114.bb | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/recipes-browser/chromium/chromium_35.0.1916.114.bb b/recipes-browser/chromium/chromium_35.0.1916.114.bb
index c1021c0..3df1716 100644
--- a/recipes-browser/chromium/chromium_35.0.1916.114.bb
+++ b/recipes-browser/chromium/chromium_35.0.1916.114.bb
@@ -30,9 +30,17 @@ inherit gettext
 # automatically and silently fall back to GLX
 PACKAGECONFIG[use-egl] = ",,virtual/egl virtual/libgles2"
 
+# when building with gold for qemux86-64 it fails with:
+# FAILED: x86_64-oe-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse --sysroot=/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,now -Wl,-z,relro -Wl,--fatal-warnings -pthread -Wl,-z,noexecstack -fPIC -B/home/jenkins/oe/world/shr-core/tmp-eglibc/work/core2-64-oe-linux/chromium/35.0.1916.114-r0/chromium-35.0.1916.114/third_party/gold -m64 -Wl,--icf=none -Wl,--gc-sections -o chrome_sandbox -Wl,--start-group obj/sandbox/linux/suid/chrome_sandbox.linux_util.o obj/sandbox/linux/suid/chrome_sandbox.process_util_linux.o obj/sandbox/linux/suid/chrome_sandbox.sandbox.o  -Wl,--end-group
+# chromium/35.0.1916.114-r0/chromium-35.0.1916.114/third_party/gold/gold64: -plugin: unknown option
+# chromium/35.0.1916.114-r0/chromium-35.0.1916.114/third_party/gold/gold64: use the --help option for usage information
+# collect2: error: ld returned 1 exit status
+# ninja: build stopped: subcommand failed.
+EXTRA_OEGYP_GOLD_x86-64 = "-Dlinux_use_gold_binary=0 -Dlinux_use_gold_flags=0"
+EXTRA_OEGYP_GOLD = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0 -Dlinux_use_gold_flags=0', d)}"
+
 EXTRA_OEGYP =	" \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0', d)} \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
+	${EXTRA_OEGYP_GOLD} \
 	-I ${WORKDIR}/oe-defaults.gypi \
 	-I ${WORKDIR}/include.gypi \
 	${@bb.utils.contains('PACKAGECONFIG', 'component-build', '-I ${WORKDIR}/component-build.gypi', '', d)} \
-- 
2.0.4


