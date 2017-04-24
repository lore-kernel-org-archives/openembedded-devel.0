Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1161571D8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:31 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id z67so13856685itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S9hSQdjnPRIJgpCWpDY+8VOI+cny9mNRq1m6k/f7LTE=;
	b=d4B2W9pqgzXVHYrpdMlnk96U1ZNfufmLnRrewLc9rF1ACUKSmVQoC7bOg4bJYpwVHi
	9MvPVrvMgZKIFiNTulhcbqa5fmdkCPQpC1X8gNnjZ0kauobA9ljJDkwBgAVTtSoXIWH6
	Vy23Ab1bmnfKWP6oXdmCIOgjZFhdnTp7Vp5qiBUmAwW1Z68KxjRTKyZzOIy3PRdTYlv0
	BeiprT8Y+ychK7lWw0AxjmI521xIGI69tyWjeFt/ss+Q+Cinrvmh9imgArbBZYN444OH
	1yX9ucahR+IpwozVN4E2S9GUZdQvbkOqeOj/98p8WsvUsYRsVwKIF3b/nHy5SpFTAHjC
	ryFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S9hSQdjnPRIJgpCWpDY+8VOI+cny9mNRq1m6k/f7LTE=;
	b=dhtZEItfnzjBn9wQhgBpFJsobkldPJ6LRfgeKyAIupwL7O5lPRpzMOD8v805qJcyFG
	8q/kzI7CzYjahYgW+TixSggRzM7MzPUQ1iB7uAFOhwLGP8OL0ODmfh7ClN7laIO5J4vv
	4tJg0iKY7LhvvUDXdva/QpE2eMWKGm2SLXGFo3YT3MKM0K/HHxf4Fh+N97do1+vApGTv
	iTMOCfZFpA9N6afJgLhF63FC+z6N2hXMJ0V9U2uIwdqHq9Mbd1WzF2R0Zd/ffO2s+oCO
	yVWODgC4Ar36ZXG+oUE+bsBUqKCqmfvnDox/6eC6DsFwYxJZHhAu2T+O8XR1RxGLrKXn
	JQTw==
X-Gm-Message-State: AN3rC/7+FZD/PDntg5innDbBv0anGxOvdICa31If56F5a38UOlcJBYF8
	uLi8usDoH/8yyg==
X-Received: by 10.84.230.131 with SMTP id e3mr31130069plk.100.1493011293025;
	Sun, 23 Apr 2017 22:21:33 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:54 -0700
Message-Id: <20170424052058.4952-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 13/17] glcompbench: Fix build with gcc7
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-waf-Disable-errors-due-to-Wdeprecated.patch | 31 ++++++++++++++++++++++
 .../glcompbench/glcompbench_2012.08.bb             |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/glcompbench/glcompbench/0001-waf-Disable-errors-due-to-Wdeprecated.patch

diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/0001-waf-Disable-errors-due-to-Wdeprecated.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/0001-waf-Disable-errors-due-to-Wdeprecated.patch
new file mode 100644
index 000000000..deb60161c
--- /dev/null
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench/0001-waf-Disable-errors-due-to-Wdeprecated.patch
@@ -0,0 +1,31 @@
+From 49297e2fbe0420a255cbe67989d0ec539125412c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 23 Apr 2017 10:38:24 -0700
+Subject: [PATCH] waf: Disable errors due to -Wdeprecated
+
+throw() has been deprecated in c++11 and removed
+from c++17, gcc7 is more pedandic about this warning
+we therefore add a workaround to ignore this warning
+for now.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ wscript | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wscript b/wscript
+index 485a9fb..7f59761 100644
+--- a/wscript
++++ b/wscript
+@@ -79,7 +79,7 @@ def configure(ctx):
+             ctx.check_cfg(package = pkg, uselib_store = uselib, args = '--cflags --libs',
+                           mandatory = True)
+ 
+-    ctx.env.append_unique('CXXFLAGS', '-Wall -Werror -std=c++11 -Wextra'.split(' '))
++    ctx.env.append_unique('CXXFLAGS', '-Wall -Werror -std=c++11 -Wextra -Wno-error=deprecated'.split(' '))
+ 
+     # Prepend -O# and -g flags so that they can be overriden by the CFLAGS environment variable
+     if Options.options.opt:
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
index 7cf9692f6..e8465855d 100755
--- a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
@@ -11,7 +11,8 @@ SRC_URI = "https://launchpad.net/glcompbench/trunk/${PV}/+download/${BPN}-${PV}.
            file://Fix_space_issues.patch \
            file://Fix_auto_ptr_deprecated.patch \
            file://0001-build-Specify-std-c-11-on-cmdline.patch \
-"
+           file://0001-waf-Disable-errors-due-to-Wdeprecated.patch \
+           "
 
 SRC_URI[md5sum] = "c939d9156fe940960098f38707fea827"
 SRC_URI[sha256sum] = "b04b738cec06c6786ceafa86e4735fd8b971c078265754854ef356b0379542ee"
-- 
2.12.2


