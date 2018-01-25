Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 29560784F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2018 07:49:35 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id w17so4566526pgv.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 23:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bKMJKavmHxa9BahD24hltexhXeUkM53RDRFj8889eHg=;
	b=EmoERg6W2PwnMj28dQynBqnIJ4gbs8HZu2Y/2NHqL6cY24kVX3F6HljjkQgTKt+YOC
	QUQf25MWErxSm5npL109oIRS8ycsnCZhYCqql0eoBY5dF2dyYmK3B5ad3QPSxsA1rY++
	DO88gWkr1qL0Fv6kiYxWpE/n2n4n6Hl8c9zWwa9lLUDNqZZnvtaEE4R5G4pOHLxz46q8
	DWrjrBTxTmerp4nOj+MDzgFjcTwfNWb2JWgMsRFwnfdebMkGP32acspNgVGYVO5LXDCq
	Fr/s/NaClpXsWsoR3pK/BVnVWnRmZO0qJedDKlCaJ8W7iDgW6DqAVITHv0+T4Q8UiOuD
	gVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bKMJKavmHxa9BahD24hltexhXeUkM53RDRFj8889eHg=;
	b=IFv79MwtWx+s06iqG0jaW4DMwX6CB34luLl4ia73zRULtr8rdgADzbv0nvTgkQXdFE
	1Z702GpNRMPByeMD59pMXtM6cOOPPKhjFtDOf1U8NXihbY+B/7+mrjlgjVempgoRLAmg
	oOL14Gk0vBFcUQUIU5Je6p5Xs97YnZhVpzvBGX92+s+j/IFxpTyGuxor+FnohvJk8ifk
	rdLk30OO3R3EYowfBGtVCA5k+xW78QRgUBcA/PWqzXb8fzwzm9NB9Dyq4uHjsb5KnAf7
	klpjy0d8UKTJ1Dv28vXYQmxwIdVE+gGxK+2jwltr6sD2tZfMrI2tN0TQiitAlzuFJim3
	u+pQ==
X-Gm-Message-State: AKwxytdb/WA91M3xXIWHeUJkr6EA20dS+1gPfGet+Cdx2fkF9KPY7XYv
	3rPeFPzKxq1SikB3Fzw/KY7wRQVO+wTGRRThsXQ=
X-Google-Smtp-Source: AH8x2258UNBPsX9JanO5ZWC22uHVxGLvQIR8yI7V31MSHLQQIcnPEWlCJX5TY2CdZgnTgQCwvUK2FbL8xvleygo2cwM=
X-Received: by 2002:a17:902:7148:: with SMTP id
	u8-v6mr10474857plm.255.1516866576949; 
	Wed, 24 Jan 2018 23:49:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Wed, 24 Jan 2018 23:49:06 -0800 (PST)
In-Reply-To: <1516836390-25957-1-git-send-email-armccurdy@gmail.com>
References: <1516836390-25957-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Jan 2018 23:49:06 -0800
Message-ID: <CAMKF1spuKcFGYY-VXcHVPHtAtKPj+YhXZBaHfh6CUyZyWmjLCg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] breakpad: disable calls to getcontext() with musl
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
X-List-Received-Date: Thu, 25 Jan 2018 07:49:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 24, 2018 at 3:26 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Musl does not currently provide getcontext().
>

perhaps its better to declare breakpad incompatible with musl instead
since if it builds it will raise the hopes of users to work well at runtime
which it wont.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  ...001-disable-calls-to-getcontext-with-musl.patch | 52 ++++++++++++++++++++++
>  meta-oe/recipes-devtools/breakpad/breakpad_git.bb  |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
>
> diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
> new file mode 100644
> index 0000000..c762754
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
> @@ -0,0 +1,52 @@
> +From 57ecf7205feedd23f901e1bb9d193787e559e433 Mon Sep 17 00:00:00 2001
> +From: Andre McCurdy <armccurdy@gmail.com>
> +Date: Tue, 23 Jan 2018 15:13:26 -0800
> +Subject: [PATCH] disable calls to getcontext() with musl
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +---
> + src/client/linux/handler/exception_handler.cc | 17 +++++++++++++++++
> + 1 file changed, 17 insertions(+)
> +
> +diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
> +index cca023f..f3e460c 100644
> +--- a/src/client/linux/handler/exception_handler.cc
> ++++ b/src/client/linux/handler/exception_handler.cc
> +@@ -495,7 +495,19 @@ bool ExceptionHandler::SimulateSignalDelivery(int sig) {
> +   siginfo.si_code = SI_USER;
> +   siginfo.si_pid = getpid();
> +   ucontext_t context;
> ++#if defined(__GLIBC__)
> +   getcontext(&context);
> ++#else
> ++  // Extreme hack: Allow musl builds to compile - but don't expect them to work.
> ++  // Although musl provides a definition for getcontext() in ucontext.h (which
> ++  // enough to build libbreakpad_client) musl does not provide a corresponding
> ++  // getcontext() function, so builds will fail when attempting to link anything
> ++  // with libbreakpad_client. Disabling calls to getcontext() is a temporary
> ++  // hack. The real fix is probably to enable Breakpad's own implementation of
> ++  // getcontext() when building for musl (it's currently only enabled when
> ++  // building for Android).
> ++  memset (&context, 0, sizeof(context));
> ++#endif
> +   return HandleSignal(sig, &siginfo, &context);
> + }
> +
> +@@ -680,9 +692,14 @@ bool ExceptionHandler::WriteMinidump() {
> +   sys_prctl(PR_SET_DUMPABLE, 1, 0, 0, 0);
> +
> +   CrashContext context;
> ++#if defined(__GLIBC__)
> +   int getcontext_result = getcontext(&context.context);
> +   if (getcontext_result)
> +     return false;
> ++#else
> ++  // Extreme hack - see comments above.
> ++  memset (&context.context, 0, sizeof(&context.context));
> ++#endif
> +
> + #if defined(__i386__)
> +   // In CPUFillFromUContext in minidumpwriter.cc the stack pointer is retrieved
> +--
> +1.9.1
> +
> diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
> index 5f6d82c..d9773c9 100644
> --- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
> +++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
> @@ -41,6 +41,7 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad \
>             file://0005-md2core-Replace-basename.patch \
>             file://0002-Use-_fpstate-instead-of-_libc_fpstate-on-linux.patch \
>             file://mcontext.patch \
> +           file://0001-disable-calls-to-getcontext-with-musl.patch \
>             file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
>             file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
>  "
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

