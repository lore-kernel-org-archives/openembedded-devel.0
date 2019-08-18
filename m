Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3FEF17F2B6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:06:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46BL4P49Zzz3y
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 17:06:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566140805;
	bh=oYiZwlUibZ2tuo4j/PObQ6q2/dOtOFKaFQqJkSAIWwM=;
	h=From:To:Subject:Date:From;
	b=D8CJja3WAh8Ly8P8Fh1pJqi6SlBYXw6AuGHM5dvXQmtMAF1Lt9YUXpTIVKHX67hT5
	IDwSt7gKkebph/8AMuhnDEabtxDnlZsbdCtkjG1dt8fxwVWWq2S/p9GGUhETDlAiar
	0ZZzk5gsny8/jsJTO5PnP7147Zu3ssET8CppjyikMyDaw8JojcSKgvpzuhlKxwzQhQ
	5vFKOvMh809/64gGX0oGU9xOd3OlgYOllm15IEQrsR0PiF1io9Ni5ROOXiHS80s59+
	RlwnUXqZzcjbZBTjmOcs8MBsyxT4vNy+Sh8fWOseqfR/lLxUJrSzrXL7iin0XZ0Nku
	YaHg3XXMFy6uzB3m0lrUHz+Tg5BwljB8/e20u2Hy7QTyoTnjyqlLKs+HMM7GP3WyYe
	nxva2GFdUrh7EcAOguHsmW2bxMhUgSqJekgOeVZoncDaNjxMgKQJNi5eSWHGs2ncd8
	d++qOoCHQUwLsuMXIYVjIkEXjBLlA5Z1vrn79PFTlfcVrCUBv729jFGxI/3MgBJvwY
	KziQp54xMRI2Dlr4dIlCJCRrSIDmP97auS4iog9nKzHoB3eUyYCWdBNAlUKxAUAaU2
	SX+z45sgAbawfXBjR6qSbaaYkicftD0fzh5lFjOetq5FnjDhE1Ftmdx/ZGG3qYRa02
	yOV9KpoKQ7UFeyw+NByfSN4g=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Aug 2019 18:06:44 +0300
Message-Id: <20190818150644.9378-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] networkmanager: musl now supports secure_getenv
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
X-List-Received-Date: Sun, 18 Aug 2019 15:06:45 -0000

It is no longer necessary to introduce a potential security
vulnerability for fixing the musl build.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../networkmanager/networkmanager_1.18.0.bb              | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
index 58968dfb0..9ce2d961d 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
@@ -51,17 +51,8 @@ EXTRA_OECONF = " \
 # stolen from https://github.com/void-linux/void-packages/blob/master/srcpkgs/NetworkManager/template
 # avoids:
 # | ../NetworkManager-1.16.0/libnm-core/nm-json.c:106:50: error: 'RTLD_DEEPBIND' undeclared (first use in this function); did you mean 'RTLD_DEFAULT'?
-#
-# and
-#
-# | In file included from ../NetworkManager-1.16.0/src/systemd/nm-sd-utils-core.c:25:
-# | ../NetworkManager-1.16.0/src/systemd/sd-adapt-core/nm-sd-adapt-core.h:68:6: error: #error neither secure_getenv nor __secure_getenv is available
-# |  #    error neither secure_getenv nor __secure_getenv is available
-# |       ^~~~~
 CFLAGS_append_libc-musl = " \
     -DRTLD_DEEPBIND=0 \
-    -DHAVE_SECURE_GETENV \
-    -Dsecure_getenv=getenv \
 "
 
 do_compile_prepend() {
-- 
2.17.1


