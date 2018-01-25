Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 63C6F7852C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2018 18:57:18 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e76so6452600pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2018 10:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=VcSlVy6BqqPeKo3xRQpMsnDCmNqNf4Wrh6D1sNcWH+E=;
	b=pBevIp7puq8FAPgiqKr6Jw+QpvnyAZTxmqTp138DGTi4giLcugZXN23yqXXCzeqTOK
	cjQbfu7znMqbWSz6kayDnV0NY5qghOKg8OHttF1jAms+0kCRjpgb7NdrifFSD99e6oN3
	YctoPqkG6dvplkglL+kUKC4HvdhuSJ48hnigxoTOFm28VbKoLkJdGD51jIPyqms1uuqE
	/0LuiQ0LpVkkTtUu5rLwTifeODNjfOoBXlrWOuRv8Ejju3KSh3sy7OHICYpzW77QtO6d
	1b1fPdy26OpbAGH1AnoWzwimM3ic7m75f+3UhS83CVUp5sHZjLHXPaiariCojYG2el38
	GgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VcSlVy6BqqPeKo3xRQpMsnDCmNqNf4Wrh6D1sNcWH+E=;
	b=R0+wk6m9RmMfjHI+3ffsLzAhf0fc6Kvpq+ag+NaifKnRuW3UrAFR+HhUgL0s2Ucx/K
	DGCq/QJPIKRCEjc/a2y9SOKTxC8gAPCFD53ANfLRQF+annX+swUFU2ODnPhWcutyIaE6
	0NI/XWBfC05wJWHE699pHjetL6FG0PGV+J6pQoeEImpD2zZSUpKA0AGzixH/KxE0O2jd
	sMS8EEB5O+MjUjo8vob3JIoTx25XI555FyEPPZlLYWKjcSY1n0HDbbknT67R0jcF4Yz7
	LWKW0N98tF7qq7BBY9f08aVQfwaTgbAI0WVLnN1b09rjStbz/kEqLmFZZautgK97BRnq
	jYSA==
X-Gm-Message-State: AKwxytc6eUSAi9tYvGWQjdxuqELB2wXJYsJPx3ZiRGGRJ2YZHdv4c+Dw
	tWY3atxnpH+Tw+4JQMqGaHD5Epg8
X-Google-Smtp-Source: AH8x224+B8uWazeUxcufHPmH7fWsiTASIpGJ6pTW4DkpfncPzlcdBns02P3UTxePS8TvGOeDymXVug==
X-Received: by 10.99.116.88 with SMTP id e24mr13494116pgn.279.1516906640115;
	Thu, 25 Jan 2018 10:57:20 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:c139:8d30:e308:8c2a?
	([2601:646:8880:466c:c139:8d30:e308:8c2a])
	by smtp.gmail.com with ESMTPSA id
	t25sm18667183pfk.162.2018.01.25.10.57.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jan 2018 10:57:19 -0800 (PST)
To: Andre McCurdy <armccurdy@gmail.com>
References: <1516836390-25957-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1spuKcFGYY-VXcHVPHtAtKPj+YhXZBaHfh6CUyZyWmjLCg@mail.gmail.com>
	<CAJ86T=Vo7GSzckfuO1kGFL9zbAv4rqt+Fp00K7Rph0k44modBQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <15e240e5-fa8a-66fd-a5c9-5a7e80f3ab8e@gmail.com>
Date: Thu, 25 Jan 2018 10:57:18 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Vo7GSzckfuO1kGFL9zbAv4rqt+Fp00K7Rph0k44modBQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 25 Jan 2018 18:57:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/25/18 2:11 AM, Andre McCurdy wrote:
> On Wed, Jan 24, 2018 at 11:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Jan 24, 2018 at 3:26 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> Musl does not currently provide getcontext().
>>
>> perhaps its better to declare breakpad incompatible with musl instead
>> since if it builds it will raise the hopes of users to work well at runtime
>> which it wont.
> 
> I'm using a distro which unconditionally enables breakpad and it would
> take some surgery to disable it. Unfortunately the distro maintainers
> are generally slow and unresponsive to patches so there's a good
> chance I'd end up carrying the changes to disable breakpad in my own
> tree.

perhaps that surgery is better IMO. Since when it comes time to support
breakpad on musl someone will not just say "it works" which is far worse
then a build break

> 
> At least for me, it's better to have a breakpad which builds but
> doesn't work rather than not building at all.
> 



>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>  ...001-disable-calls-to-getcontext-with-musl.patch | 52 ++++++++++++++++++++++
>>>  meta-oe/recipes-devtools/breakpad/breakpad_git.bb  |  1 +
>>>  2 files changed, 53 insertions(+)
>>>  create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
>>>
>>> diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
>>> new file mode 100644
>>> index 0000000..c762754
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
>>> @@ -0,0 +1,52 @@
>>> +From 57ecf7205feedd23f901e1bb9d193787e559e433 Mon Sep 17 00:00:00 2001
>>> +From: Andre McCurdy <armccurdy@gmail.com>
>>> +Date: Tue, 23 Jan 2018 15:13:26 -0800
>>> +Subject: [PATCH] disable calls to getcontext() with musl
>>> +
>>> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> +---
>>> + src/client/linux/handler/exception_handler.cc | 17 +++++++++++++++++
>>> + 1 file changed, 17 insertions(+)
>>> +
>>> +diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
>>> +index cca023f..f3e460c 100644
>>> +--- a/src/client/linux/handler/exception_handler.cc
>>> ++++ b/src/client/linux/handler/exception_handler.cc
>>> +@@ -495,7 +495,19 @@ bool ExceptionHandler::SimulateSignalDelivery(int sig) {
>>> +   siginfo.si_code = SI_USER;
>>> +   siginfo.si_pid = getpid();
>>> +   ucontext_t context;
>>> ++#if defined(__GLIBC__)
>>> +   getcontext(&context);
>>> ++#else
>>> ++  // Extreme hack: Allow musl builds to compile - but don't expect them to work.
>>> ++  // Although musl provides a definition for getcontext() in ucontext.h (which
>>> ++  // enough to build libbreakpad_client) musl does not provide a corresponding
>>> ++  // getcontext() function, so builds will fail when attempting to link anything
>>> ++  // with libbreakpad_client. Disabling calls to getcontext() is a temporary
>>> ++  // hack. The real fix is probably to enable Breakpad's own implementation of
>>> ++  // getcontext() when building for musl (it's currently only enabled when
>>> ++  // building for Android).
>>> ++  memset (&context, 0, sizeof(context));
>>> ++#endif
>>> +   return HandleSignal(sig, &siginfo, &context);
>>> + }
>>> +
>>> +@@ -680,9 +692,14 @@ bool ExceptionHandler::WriteMinidump() {
>>> +   sys_prctl(PR_SET_DUMPABLE, 1, 0, 0, 0);
>>> +
>>> +   CrashContext context;
>>> ++#if defined(__GLIBC__)
>>> +   int getcontext_result = getcontext(&context.context);
>>> +   if (getcontext_result)
>>> +     return false;
>>> ++#else
>>> ++  // Extreme hack - see comments above.
>>> ++  memset (&context.context, 0, sizeof(&context.context));
>>> ++#endif
>>> +
>>> + #if defined(__i386__)
>>> +   // In CPUFillFromUContext in minidumpwriter.cc the stack pointer is retrieved
>>> +--
>>> +1.9.1
>>> +
>>> diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
>>> index 5f6d82c..d9773c9 100644
>>> --- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
>>> +++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
>>> @@ -41,6 +41,7 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad \
>>>             file://0005-md2core-Replace-basename.patch \
>>>             file://0002-Use-_fpstate-instead-of-_libc_fpstate-on-linux.patch \
>>>             file://mcontext.patch \
>>> +           file://0001-disable-calls-to-getcontext-with-musl.patch \
>>>             file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
>>>             file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
>>>  "
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


