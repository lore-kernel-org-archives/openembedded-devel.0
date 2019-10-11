Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id EE6C07F597
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 17:28:31 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id v4so6482847pff.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 10:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9xeljCLVxYEb4AFnFs99OimjqGZqEBTNAdJm1wmMo3Q=;
	b=SJIf6M8mZxsGP9zbFAUHaANUb1mdbSF0yAjbgXLe8g0VC/pgm+YP7SHBAJh+hWA2mj
	6XvWDnWekfE0n8xdHyYep9aS6eS05ATyrefAe4jZjFcDLksDpau/CqM+U8iBBfoC5Bb5
	HPrUjYzC8XEjTWWJGGnD88NKFYoXy0Xawd0bh6sg1sWwdSAypvD6E9cgyksVFYo+SmS4
	yAmIEmFpyY+l01jtCpclm7bYdVoY1WM+FxPsPPouCQkNGYR9eBSlGAcs+0uraZnBPvQg
	fRyHijHszi/cWqmPKP58n7eA9BQ0M90vX4pbcPBUb9FEzu/3aeK+5tz9LNemwMjvaJv9
	dpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9xeljCLVxYEb4AFnFs99OimjqGZqEBTNAdJm1wmMo3Q=;
	b=VKEBW4Lwz38P/aNGRdyzZuKWppkLs9T+exzXhRlgg6SUvYaesJDKkOp35CWsCUL5na
	9E3nwV2T3vAgA47SlqEp1Ik3YA4JU07CuA04J+U/AN6v+bOwj557YzXXyq7MWYs1ifIc
	7D/EaYYKfwczqRzWTjfUQVIifF2VPfsupfPhfkVgVhtR3+JdD8yjyilVPrVniu0gRCN7
	MBbEO99mLip0iZ+7stccy638Br27XgrAW+Zs6fMg0/NWtpaLM3zYrdgtVVsV39ut3aBr
	AEbI3KY9JWREoxcd11zDlfMK7kIvRG7aQOxtZEf+gOPcAzRpmJAdjoFPZDvTnAkp3ayb
	BuPg==
X-Gm-Message-State: APjAAAX+YXCE6tF+obluJE+UuRuHQUtbTLwt1UZ8eaB6bbxHEk6grZos
	aX1FB0pbAAw4HqB4SHQVfNMnkllg3Sw=
X-Google-Smtp-Source: APXvYqyLGknynpYgb/isi7lDu+IwJyGzkGG7DqeQOSmI4tVUXT1fnga3Etq24yBsbz8J89zLPlIXMQ==
X-Received: by 2002:a17:90a:a383:: with SMTP id
	x3mr18864583pjp.104.1570814912251; 
	Fri, 11 Oct 2019 10:28:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	c64sm12759178pfc.19.2019.10.11.10.28.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 10:28:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2019 10:28:18 -0700
Message-Id: <20191011172818.718226-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] wvstreams: Disable calls to makecontext on musl
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
X-List-Received-Date: Fri, 11 Oct 2019 17:28:32 -0000
Content-Transfer-Encoding: 8bit

makecontext API is deprecated and not implemented in musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nt-use-ucontext-on-non-glibc-systems.patch | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvtask-Dont-use-ucontext-on-non-glibc-systems.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvtask-Dont-use-ucontext-on-non-glibc-systems.patch
index 232db9e63b..ac4dd81ce8 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvtask-Dont-use-ucontext-on-non-glibc-systems.patch
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvtask-Dont-use-ucontext-on-non-glibc-systems.patch
@@ -8,8 +8,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  utils/wvtask.cc | 24 ++++++++++++++++++++++++
  1 file changed, 24 insertions(+)
 
-diff --git a/utils/wvtask.cc b/utils/wvtask.cc
-index cdcd544..c0bff7d 100644
 --- a/utils/wvtask.cc
 +++ b/utils/wvtask.cc
 @@ -199,7 +199,9 @@ WvTaskMan::WvTaskMan()
@@ -22,7 +20,7 @@ index cdcd544..c0bff7d 100644
      if (context_return == 0)
      {
  	// initial setup - start the stackmaster() task (never returns!)
-@@ -265,13 +267,17 @@ int WvTaskMan::run(WvTask &task, int val)
+@@ -265,13 +267,17 @@ int WvTaskMan::run(WvTask &task, int val
  	state = &old_task->mystate;
      
      context_return = 0;
@@ -68,7 +66,7 @@ index cdcd544..c0bff7d 100644
      if (context_return == 0)
      {
  	assert(magic_number == -WVTASK_MAGIC);
-@@ -371,7 +383,9 @@ void WvTaskMan::get_stack(WvTask &task, size_t size)
+@@ -371,7 +383,9 @@ void WvTaskMan::get_stack(WvTask &task,
  	// initial setup
  	stack_target = &task;
  	context_return = size/1024 + (size%1024 > 0);
@@ -108,7 +106,7 @@ index cdcd544..c0bff7d 100644
      if (context_return == 0)
      {
  	// done the setjmp; that means the target task now has
-@@ -510,7 +530,9 @@ void WvTaskMan::do_task()
+@@ -510,20 +530,25 @@ void WvTaskMan::do_task()
                  }
                  else
                  {
@@ -118,9 +116,14 @@ index cdcd544..c0bff7d 100644
                      task->func_call.uc_stack.ss_size = task->stacksize;
                      task->func_call.uc_stack.ss_sp = task->stack;
                      task->func_call.uc_stack.ss_flags = 0;
-@@ -521,9 +543,11 @@ void WvTaskMan::do_task()
+                     task->func_call.uc_link = &task->func_return;
++#ifdef __GLIBC__
+                     Dprintf("WvTaskMan: makecontext #%d (%s)\n",
+                             task->tid, (const char *)task->name);
+                     makecontext(&task->func_call,
                              (void (*)(void))call_func, 1, task);
- 
+-
++#endif
                      context_return = 0;
 +#ifdef __GLIBC__
                      assert(getcontext(&task->func_return) == 0);
@@ -130,6 +133,3 @@ index cdcd544..c0bff7d 100644
                  }
  		
  		// the task's function terminated.
--- 
-2.13.3
-
-- 
2.23.0


