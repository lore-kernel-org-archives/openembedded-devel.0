Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7399060667
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2016 17:05:34 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n184so16387696wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2016 10:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bosSUZb460GZQPqjIeZo+G0BJan/m3+CSiFB7soIW10=;
	b=Ve658UH+s7DX8hZNODVLY6LY4w8meTkhbwn6OIg75SW5cqRhyhf7mCUJhXsTzxz4rE
	Dr8nAFzbuE1GHjEPBTmUYUFiBPRQNGeB3vSnqiB+WCHn1IMPrRUlWMc8OnRl0WhlkdCC
	Pl43veUJjeLuBwe2fpBwnbGJnZJfI2jAXg6GJ0o+iO5zbghh+ZJN/Bz1D9r/bUr43diS
	F7GfjQXUmcC1nVpU8Gep6z0cir4qhnBGJ7dvSMH2GNvaLnefDSgWM8qxoyPjnF/bGBBu
	lIqXtTJOCne+YLZzM7WN1qVesZrpUP7JOtWglueE86TYBMF/tHd5hmnb2aXIJMZHzr+x
	/fAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bosSUZb460GZQPqjIeZo+G0BJan/m3+CSiFB7soIW10=;
	b=eZ8z6HZwbOsAW75dyJ74zS7MCZWMfNV6zo+iD03Il39v+ejY2hpwU5TE43qbvLL1en
	BZMjod74vbOvmBhSFxn+wtzMkDMzZiX/A0i0QTQ4e2+BINk9tQhlmHGPHTA35PiXR/Es
	uRdrWTaORe+4QOvBPlTXbKCvowW0rfnzYYO6qHW9nil5izr53zFVoowr8CCP8yn6Hye2
	5AtF+HfQWMmoa/D434SCIfbVcv0A2QiWhl2Sy9vZ7Iac09hxinfDMhE926gsSzkVJdjT
	ZGPcXzVpLyUyFTO1M0EevXpcgcfw9yjbtVsuvUdtlgN2DEoqAmsLGAsdsFbHduHn9OoK
	5BaA==
X-Gm-Message-State: ALyK8tIYPNcOq3C4HkdYzIKjM9HgefUPusRRqN9N2fcINXaCh4aWo4Zbe6JoYQGWh4Hd/g==
X-Received: by 10.194.75.196 with SMTP id e4mr2083601wjw.44.1465837534548;
	Mon, 13 Jun 2016 10:05:34 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	o203sm15275364wmg.22.2016.06.13.10.05.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Jun 2016 10:05:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jun 2016 19:05:43 +0200
Message-Id: <20160613170543.20673-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.4
Subject: [meta-ruby][PATCH] ruby.bbclass: Fix usage with python3
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
X-List-Received-Date: Mon, 13 Jun 2016 17:05:35 -0000

* otherwise every recipe inheriting ruby fails with:
  WARNING: Exception during build_dependencies for GEM_HOME
  WARNING: Error during finalise of /home/jenkins/oe/world/shr-core/meta-openembedded/meta-ruby/recipes-devtools/ruby/bundler_git.bb
  ERROR: Failure expanding variable RUBY_GEM_VERSION, expression was ${@get_rubygemsversion("/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin")} which triggered exception TypeError: can't use a string pattern on a bytes-like object
  ERROR: Task 22219 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-ruby/recipes-devtools/ruby/bundler_git.bb, do_fetch) failed with exit code '1'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-ruby/classes/ruby.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ruby/classes/ruby.bbclass b/meta-ruby/classes/ruby.bbclass
index ef844f2..1acf2e0 100644
--- a/meta-ruby/classes/ruby.bbclass
+++ b/meta-ruby/classes/ruby.bbclass
@@ -18,7 +18,7 @@ def get_rubyversion(p):
     if not isfile(cmd):
        return found_version
 
-    version = subprocess.Popen([cmd, "--version"], stdout=subprocess.PIPE).communicate()[0]
+    version = subprocess.Popen([cmd, "--version"], stdout=subprocess.PIPE).communicate()[0].decode("utf-8")
     
     r = re.compile("ruby ([0-9]+\.[0-9]+\.[0-9]+)*")
     m = r.match(version)
@@ -38,7 +38,7 @@ def get_rubygemslocation(p):
     if not isfile(cmd):
        return found_loc
 
-    loc = subprocess.Popen([cmd, "env"], stdout=subprocess.PIPE).communicate()[0]
+    loc = subprocess.Popen([cmd, "env"], stdout=subprocess.PIPE).communicate()[0].decode("utf-8")
 
     r = re.compile(".*\- (/usr.*/ruby/gems/.*)")
     for line in loc.split('\n'):
@@ -60,7 +60,7 @@ def get_rubygemsversion(p):
     if not isfile(cmd):
        return found_version
 
-    version = subprocess.Popen([cmd, "env", "gemdir"], stdout=subprocess.PIPE).communicate()[0]
+    version = subprocess.Popen([cmd, "env", "gemdir"], stdout=subprocess.PIPE).communicate()[0].decode("utf-8")
     
     r = re.compile(".*([0-9]+\.[0-9]+\.[0-9]+)$")
     m = r.match(version)
-- 
2.8.4


