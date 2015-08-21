Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0E37F60557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 16:10:23 +0000 (UTC)
Received: by iodb91 with SMTP id b91so86461229iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 09:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=sfUxHHIvedZEW4M9r4Bz7H5D3XvG6cGCWT51XAYghYY=;
	b=cmfYqgjRstom41oVAEGfRhvZZFJBTJd+BP50FN5ZJl9q4IW6iBeapT7Gzn7My6XFVd
	h1bAtGbnjxJ/Sdz1zyYZtGfBqm0RyQQWp53Wi0mA6Oby1AtZtqG4nKOIRzw5ECoCkuma
	KF9G9SAfQ9jKZtl4U3laUBfLmD/bmohhNU/I7pUnuydibJYRH8ZrOspl//bQk52Xn5Qx
	C3TGL32EeQ/nFRrPNfWA8h/2MU0NxyR1SkenyN/2ubcFGA6ckPvpAC8ktdMlEnUtZYfP
	nEs1qbksHKURoA02lTWkos0YhgH94UpKZ8uvdhAtgM6EYF1DooPMwwloBx80OETrkozr
	n4ZA==
X-Received: by 10.107.168.214 with SMTP id e83mr7283961ioj.112.1440173423979; 
	Fri, 21 Aug 2015 09:10:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Fri, 21 Aug 2015 09:09:54 -0700 (PDT)
In-Reply-To: <55D6EC3A.8000007@windriver.com>
References: <cover.1440139197.git.yi.zhao@windriver.com>
	<cb06e085a8cd5f4a6251d8c0e4168c022fda564e.1440139197.git.yi.zhao@windriver.com>
	<CAMKF1sp4FKaBu33oYCLX9MZ6+URBtJL_UB_wALMHrO8xJ8USLQ@mail.gmail.com>
	<55D6EC3A.8000007@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Aug 2015 09:09:54 -0700
Message-ID: <CAMKF1srqejdVBwm_aiU3v9BpKaJn4-AC2G+R10tMez_tcYcarQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/8] tomoyo-tools: pass correct libdir to make
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
X-List-Received-Date: Fri, 21 Aug 2015 16:10:25 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 21, 2015 at 2:15 AM, Yi Zhao <yi.zhao@windriver.com> wrote:
>> why was CFLAGS append removed ?
>
>
> There is a redefined warning when compile like below:
>
> In file included from tomoyo-diffpolicy.c:23:0:
> tomoyotools.h:26:0: warning: "_GNU_SOURCE" redefined
>  #define _GNU_SOURCE
>  ^
> In file included from tomoyo-checkpolicy.c:23:0:
> tomoyotools.h:26:0: warning: "_GNU_SOURCE" redefined
>  #define _GNU_SOURCE
>  ^
> <command-line>:0:0: note: this is the location of the previous definition
> <command-line>:0:0: note: this is the location of the previous definition
> In file included from tomoyo-auditd.c:23:0:
> tomoyotools.h:26:0: warning: "_GNU_SOURCE" redefined
>  #define _GNU_SOURCE
>  ^
> <command-line>:0:0: note: this is the location of the previous definition
>
> The _GNU_SOURCE is ready defined in the source and there is not ifdef or
> ifndef for it in the source.

ok. Althogh the difference is that now it will be passed to files that
includes this header only. That may be the right thing

