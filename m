Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5AABD605BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:18:06 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id k3-v6so7196845pgq.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sO0TdRVSObMZ38COMpuLx80u9+hyqbz6ECbjZjCmtfA=;
	b=Ah7WkdZjzOmonlhn9gRhM5pfmMio7VZkAqK6ZdO5umM3isAD3VjTmx2UjhOz48+YMW
	aA7Jv/4yhWh15uWswDVFndu6sj0IdqzeQ9JN4D+Rmke3WgWYfVMKqfQYRLR+ay63EwXw
	pqchwcmir3Pwd+xYm5SU1BBSpyyfGdg04n0+LoWQd6O/Xnv/zOYrnvc1d1MmN/6MoKrt
	KffUjkmSqAJfCLDCLBxo/9WStXPrMCfx3f4QDviwxO4rVtkVZ2747K3IU/otIzD9Kt5c
	540/fI+xDLHEZybjNVV0TH5uDpZJrb3kO1t3IifbFNZwnOb8WnMebdfe8GbJxnGGIfB/
	d/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sO0TdRVSObMZ38COMpuLx80u9+hyqbz6ECbjZjCmtfA=;
	b=r6hdI4dKQSM0Snpb0kJ1Ot6S8aNIXYdptAjTSoLspJTq4TvYwJjlSYdN8L13htX8Di
	vz3JrcoLKuDycDA+N47EXVTItGu+Hqo7WCRiWVxeY/acxawJHlXdkv+sKHlfwcDpBwCm
	uHTzRmMyx2yei4CtXVu/KmliraEOxxQrQrYFXxx8TVmAOThcg8H1rBK4I4VGllFfA4/5
	ZewYIhu8j88rXQbAirbtwLytJB5lm84hvc6uevwAR3XFdL0CmAWZEFXndwmYughLMNtY
	iS4EuxuQvbut6mmspQ76waWB1QfqoFRCSuaKI7FgXcopD/0/RVhR5+MQ9Yqwq9+vl3J5
	dqkg==
X-Gm-Message-State: AOUpUlH2+LUjrjT81HPWs4D7R1GCyw9KRdqGUPWc2pchpOLi96cauTte
	2y39lyQkdBbI/uYucTkaJkf0pCGp
X-Google-Smtp-Source: AA+uWPyWIiOi4BGFJEqnBipiiT1+ODHqXADOeCfFTS8JBDg9iapJzUOOdRJO94hC1X23qGOrk3ux+A==
X-Received: by 2002:a62:cd3:: with SMTP id
	80-v6mr18171320pfm.184.1534148287129; 
	Mon, 13 Aug 2018 01:18:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.18.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:18:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:34 -0700
Message-Id: <20180813081742.6961-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 13/21] usermode: Fix build with glibc 2.28+
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
X-List-Received-Date: Mon, 13 Aug 2018 08:18:06 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lude-sys-sysmacros.h-for-major-minor.patch | 25 +++++++++++++++++++
 .../usermode/usermode_1.112.bb                |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-gnome/recipes-support/usermode/usermode/0001-Include-sys-sysmacros.h-for-major-minor.patch

diff --git a/meta-gnome/recipes-support/usermode/usermode/0001-Include-sys-sysmacros.h-for-major-minor.patch b/meta-gnome/recipes-support/usermode/usermode/0001-Include-sys-sysmacros.h-for-major-minor.patch
new file mode 100644
index 0000000000..277f6e21b0
--- /dev/null
+++ b/meta-gnome/recipes-support/usermode/usermode/0001-Include-sys-sysmacros.h-for-major-minor.patch
@@ -0,0 +1,25 @@
+From 75539659396b18110d5a52a8a32845254b4d8eca Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 Aug 2018 18:25:47 -0700
+Subject: [PATCH] Include sys/sysmacros.h for major/minor
+
+usermount.c:238: undefined reference to `major'
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usermount.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/usermount.c b/usermount.c
+index 4107027..21ef77f 100644
+--- a/usermount.c
++++ b/usermount.c
+@@ -40,6 +40,7 @@
+ #include <sys/stat.h>
+ #include <sys/time.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <errno.h>
+ #include <glob.h>
+ #include <libintl.h>
diff --git a/meta-gnome/recipes-support/usermode/usermode_1.112.bb b/meta-gnome/recipes-support/usermode/usermode_1.112.bb
index 51f81a1fac..82ccf3eda7 100644
--- a/meta-gnome/recipes-support/usermode/usermode_1.112.bb
+++ b/meta-gnome/recipes-support/usermode/usermode_1.112.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://releases.pagure.org/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-fix-compile-failure-against-musl-C-library.patch \
            file://0001-Makefile.am-Link-with-libm-for-powl-API.patch \
            file://0001-Missing-n-in-translated-string.patch \
+           file://0001-Include-sys-sysmacros.h-for-major-minor.patch \
            "
 SRC_URI[md5sum] = "a766a9f7600f573fb6de4655d4162196"
 SRC_URI[sha256sum] = "37c4d667209da14082c08df6e48fe955d1532efebd5322f13f94683c6cc10370"
-- 
2.18.0


