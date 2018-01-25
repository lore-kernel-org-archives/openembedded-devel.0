Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5AB9460745
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2018 10:11:20 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id t16so7018619wrc.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2018 02:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IahHHtOmjIIsRsor1sw7w7UfYZnll8rcoWzHs8vRZo8=;
	b=QUQkFldBVEIztPKVrHHjgHYWSIGGfj83n3n2vaQ0WNzYnhNUCdspYN9JEL2xT/+S2f
	6eidPbogj0+xxyeAngQcX0jQ1Qv0Es5CjfRJSI6jRr4oz/QCGan3VtuQWteRu3Z2t2pE
	0uPRdWajKpZZZyO1cJyfOTZO5EDCjuPmLUrFQGZrguJaNK3jZXIHal5jpS7XWdw1QamY
	nllBPZQnc+hjI2ozrfBHUFr+0O/keSjiftLL13pmWkG1mkyg99aF40MSi4vG/QDFrZBt
	yK3yH7MP42yVt8mei0G9FZ8M6dw9WSxk12qZSy40ZVyVpbLnRVWtV7L23zSMEUMNHRMU
	DBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IahHHtOmjIIsRsor1sw7w7UfYZnll8rcoWzHs8vRZo8=;
	b=LHUvLkh7WWdcGj4F7nHb70CAKeNfr2OvyJuQzjrfkPZMV+S2kmMN3qbxVwG5rnOMg+
	p/gDvV8w78pRt3QmdcJMDZnuZb75Tx6kdrxVVtG3D/XEYsgVj3P/dISU7nTwkFsAR1+g
	K6njy4hTaVdAsvSsmS2JBy72XP6IpW6hqQ/yifWLSm3WUBA09shrf5eZnjSTQ4VgGe2V
	RfZoUe60SwAeJVynT5EIvp7JK+BAn4ewfBUvSrD2jBXmvaZLS270pceLgkwEe/4OqRl0
	35Rnf0F2nRc957jmA7BfOBhQcjvJaDCJaP8KsLfJrDggRz72Xn3aI6cSPqFPNPlNaS4z
	Hdew==
X-Gm-Message-State: AKwxytdHbA2VVUI96dJ1sfLFtui/BjTbJR8xpz4X2zV58z1dIfyzB2Ze
	ls34dhKd2MP2WldJh/G73rtqEypYNU43OQW9SJo=
X-Google-Smtp-Source: AH8x224r2pj0l2xw7CIz7mwTyGTffNRqCBZH143SdzL4Y0pByygtRs45gPlScAZt8obLmlnDR7UIsAOFMm1fLMpfEAE=
X-Received: by 10.223.195.49 with SMTP id n46mr2075886wrf.191.1516875081415;
	Thu, 25 Jan 2018 02:11:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.144.129 with HTTP; Thu, 25 Jan 2018 02:11:20 -0800 (PST)
In-Reply-To: <CAMKF1spuKcFGYY-VXcHVPHtAtKPj+YhXZBaHfh6CUyZyWmjLCg@mail.gmail.com>
References: <1516836390-25957-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1spuKcFGYY-VXcHVPHtAtKPj+YhXZBaHfh6CUyZyWmjLCg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 25 Jan 2018 02:11:20 -0800
Message-ID: <CAJ86T=Vo7GSzckfuO1kGFL9zbAv4rqt+Fp00K7Rph0k44modBQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 25 Jan 2018 10:11:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 24, 2018 at 11:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Jan 24, 2018 at 3:26 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Musl does not currently provide getcontext().
>
> perhaps its better to declare breakpad incompatible with musl instead
> since if it builds it will raise the hopes of users to work well at runtime
> which it wont.

I'm using a distro which unconditionally enables breakpad and it would
take some surgery to disable it. Unfortunately the distro maintainers
are generally slow and unresponsive to patches so there's a good
chance I'd end up carrying the changes to disable breakpad in my own
tree.

At least for me, it's better to have a breakpad which builds but
doesn't work rather than not building at all.

>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  ...001-disable-calls-to-getcontext-with-musl.patch | 52 ++++++++++++++++++++++
>>  meta-oe/recipes-devtools/breakpad/breakpad_git.bb  |  1 +
>>  2 files changed, 53 insertions(+)
>>  create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
>>
>> diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
>> new file mode 100644
>> index 0000000..c762754
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
>> @@ -0,0 +1,52 @@
>> +From 57ecf7205feedd23f901e1bb9d193787e559e433 Mon Sep 17 00:00:00 2001
>> +From: Andre McCurdy <armccurdy@gmail.com>
>> +Date: Tue, 23 Jan 2018 15:13:26 -0800
>> +Subject: [PATCH] disable calls to getcontext() with musl
>> +
>> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> +---
>> + src/client/linux/handler/exception_handler.cc | 17 +++++++++++++++++
>> + 1 file changed, 17 insertions(+)
>> +
>> +diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
>> +index cca023f..f3e460c 100644
>> +--- a/src/client/linux/handler/exception_handler.cc
>> ++++ b/src/client/linux/handler/exception_handler.cc
>> +@@ -495,7 +495,19 @@ bool ExceptionHandler::SimulateSignalDelivery(int sig) {
>> +   siginfo.si_code = SI_USER;
>> +   siginfo.si_pid = getpid();
>> +   ucontext_t context;
>> ++#if defined(__GLIBC__)
>> +   getcontext(&context);
>> ++#else
>> ++  // Extreme hack: Allow musl builds to compile - but don't expect them to work.
>> ++  // Although musl provides a definition for getcontext() in ucontext.h (which
>> ++  // enough to build libbreakpad_client) musl does not provide a corresponding
>> ++  // getcontext() function, so builds will fail when attempting to link anything
>> ++  // with libbreakpad_client. Disabling calls to getcontext() is a temporary
>> ++  // hack. The real fix is probably to enable Breakpad's own implementation of
>> ++  // getcontext() when building for musl (it's currently only enabled when
>> ++  // building for Android).
>> ++  memset (&context, 0, sizeof(context));
>> ++#endif
>> +   return HandleSignal(sig, &siginfo, &context);
>> + }
>> +
>> +@@ -680,9 +692,14 @@ bool ExceptionHandler::WriteMinidump() {
>> +   sys_prctl(PR_SET_DUMPABLE, 1, 0, 0, 0);
>> +
>> +   CrashContext context;
>> ++#if defined(__GLIBC__)
>> +   int getcontext_result = getcontext(&context.context);
>> +   if (getcontext_result)
>> +     return false;
>> ++#else
>> ++  // Extreme hack - see comments above.
>> ++  memset (&context.context, 0, sizeof(&context.context));
>> ++#endif
>> +
>> + #if defined(__i386__)
>> +   // In CPUFillFromUContext in minidumpwriter.cc the stack pointer is retrieved
>> +--
>> +1.9.1
>> +
>> diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
>> index 5f6d82c..d9773c9 100644
>> --- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
>> +++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
>> @@ -41,6 +41,7 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad \
>>             file://0005-md2core-Replace-basename.patch \
>>             file://0002-Use-_fpstate-instead-of-_libc_fpstate-on-linux.patch \
>>             file://mcontext.patch \
>> +           file://0001-disable-calls-to-getcontext-with-musl.patch \
>>             file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
>>             file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
>>  "
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

