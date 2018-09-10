Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 781257951E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 05:06:44 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id b11-v6so9837513pfo.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 22:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HFdKsVij6b3su3pPNYPrOOa4Bjzbj4lbL3p/mMNPOQ0=;
	b=e37WuuiGNX5JFMXJgS3NHDW0ZrF+jZpapvHkRhNxMrWLGjERhAuCywRLNrRPv/OKjR
	/SBfufA6DPNO5lj67BESOWzLmhTmkU5ZzxqumK+/HKom12FgU+1StL5Jcj1tGzY9WsGG
	gvI//18+R2BRnSvAvLavI8txQeDjtYt6AMSyKydHzCoZw+brHTdhuiKbigviZ/waCbS1
	oj2TVxOjifqIa5SOTuMF3ueCJxSB1NhZlv8CHaTHTFG2RVCyA36Ohr0DkR6DxEQpB356
	+RFzvo7kgZ1+dJ1nV4HW7YwAhvlULPLZroUvN+z2OKCciodHFUsW3kSk10too17WaRUT
	ni2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HFdKsVij6b3su3pPNYPrOOa4Bjzbj4lbL3p/mMNPOQ0=;
	b=I6gcEAHdN9nLp4/gIUJyH77yDrFxIihC3sDQUvWtJSGLsopWju00KOTC6B7zRPMROa
	stY37NuZG2VvUHtKnrg0wfOSmTF0arphub49M+30kg9yMLoFr2D7mcWB/ocP9i2Zf4JC
	zQSdrOAllzkmJCHv/OV9eCsbfsop+WdvtsCm7htH0XxMJEnaaYOmBEGnKQegBsn/l8/L
	A6rfrkc58GbKAeLaflRsE1xjc4sQSU84k8kxl+Mlg/QD8DH79Cgc01r1dncmFcWMOehQ
	z0wXFfMKF99vfE3/n/W0NN8AYWqVVoV04AxbgrNcsZ9nivWcOdIO1YQNrEpE1klxNAsx
	UhAw==
X-Gm-Message-State: APzg51C2UVUA/+odC+x7EmdnPLFua26y0o4H6aoRdo4BeHZ+H3A71Hb6
	Tny1RbcXCjyHh4QUQb9xwb4FT0eS
X-Google-Smtp-Source: ANB0VdZXh+RKFIzhc4nQiUyns9lL0aVyxkXD+vyGVu/Ln4aWnGcdc/7VoohAq53yQy9vAkAfQCIEoA==
X-Received: by 2002:a62:9e08:: with SMTP id
	s8-v6mr21724537pfd.23.1536556005120; 
	Sun, 09 Sep 2018 22:06:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	x24-v6sm18819188pfh.67.2018.09.09.22.06.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Sep 2018 22:06:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Sep 2018 22:06:27 -0700
Message-Id: <20180910050629.16170-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180910050629.16170-1-raj.khem@gmail.com>
References: <20180910050629.16170-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/10] breakpad: Pass correct type name to sizeof()
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
X-List-Received-Date: Mon, 10 Sep 2018 05:06:44 -0000

memset is clearing memory area address starting at contect.context but
it needs the correct size of type 'ucontext_t', currently its getting
size of 'ucontext_t*'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andre McCurdy <armccurdy@gmail.com>
---
 ...01-disable-calls-to-getcontext-with-musl.patch | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
index c762754ad1..bc79727edd 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
@@ -8,11 +8,11 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  src/client/linux/handler/exception_handler.cc | 17 +++++++++++++++++
  1 file changed, 17 insertions(+)
 
-diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
-index cca023f..f3e460c 100644
---- a/src/client/linux/handler/exception_handler.cc
-+++ b/src/client/linux/handler/exception_handler.cc
-@@ -495,7 +495,19 @@ bool ExceptionHandler::SimulateSignalDelivery(int sig) {
+Index: git/src/client/linux/handler/exception_handler.cc
+===================================================================
+--- git.orig/src/client/linux/handler/exception_handler.cc
++++ git/src/client/linux/handler/exception_handler.cc
+@@ -495,7 +495,19 @@ bool ExceptionHandler::SimulateSignalDel
    siginfo.si_code = SI_USER;
    siginfo.si_pid = getpid();
    ucontext_t context;
@@ -42,11 +42,8 @@ index cca023f..f3e460c 100644
      return false;
 +#else
 +  // Extreme hack - see comments above.
-+  memset (&context.context, 0, sizeof(&context.context));
++  memset (&context.context, 0, sizeof(context.context));
 +#endif
  
  #if defined(__i386__)
    // In CPUFillFromUContext in minidumpwriter.cc the stack pointer is retrieved
--- 
-1.9.1
-
-- 
2.18.0


