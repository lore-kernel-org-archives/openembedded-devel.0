Return-Path: <asselsm@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1CF60232
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 16:08:44 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id u62so209170ywe.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 09:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc;
	bh=2lbq1i52VsdOkWp29kVZLoC/ILlkNl9KzLUGEGJkRYQ=;
	b=IahfGMOUKgmE3fXV9dq0rHOamck71Ggl5SgsSqDq+w756hGw40Ptp+8Q5+y2KMzrBc
	U6cE2q/yJqUEi3USzboRv7CN2Ou/yCXWezb5hr7Ki2fEq9JWMZ7/rthkjaG4JjF/Gwyd
	2h/EPR4vJb4tTHqVjU5U7e1y+GTM65LoCx8EQvpvCnAwj36YEa9zeRDChmWVlVioj1b6
	AlI41rq5kVfF0huKrs4DQZyClOceAs8SWQIcDdYu1WxS/zxSHnUDP5/11D6FOU0ovLEG
	pT4rkUWQ0mztCKC1pD0Pbklg1B0YhfOWMATg/7FQC5e1Trf8Yxxl8R8faniJ0r5g82qK
	S1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:cc;
	bh=2lbq1i52VsdOkWp29kVZLoC/ILlkNl9KzLUGEGJkRYQ=;
	b=FP2B1T9YATMO0C/a1QbbER+mp2Nt+E6DlVVQtwEUsiM6sJdenrdyFrYgkiW+bFePMO
	zjWqX0pwqJY+MMHP8Re/Eil01fWCJ7EUswJ63IrAdS+DlugU8ZiAvoeNGnKy9m1FzVKQ
	UasGq1fSZSCp7ZggMFNRDoJoUXq6J9apKTiDvLjoS4EhEcstbC7V8V1ewghrh8wVXeE/
	TwxB3t6sIDklhNLFgPy9oba4B8lDCJWNlBHEaAzu3KvoZMl8rSrpx6Z+vN2HAJRkqdMP
	+0fKEfA64ww5w9Y3AI+1ZS7co7rpOpaKKSzrQSBE05WgE7s39qLnJ3lRfcELAeYsGX1k
	rmQA==
X-Gm-Message-State: AOPr4FU10TUPSWl066mol6iIcf1QXyEq5c+2+cfRa5Jek4i+/evmYE5KAm8gCI0mpXO2x94WKG4tYfmkYDtFQw==
MIME-Version: 1.0
X-Received: by 10.159.37.181 with SMTP id 50mr4632418uaf.146.1461770131736;
	Wed, 27 Apr 2016 08:15:31 -0700 (PDT)
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.176.2.172 with HTTP; Wed, 27 Apr 2016 08:15:31 -0700 (PDT)
In-Reply-To: <CAJTo0LYyrrO+5277fe2q3wZ8Z_JEsxU=0OqyXu5b7CK9hsh_GQ@mail.gmail.com>
References: <1461697722-20378-1-git-send-email-mark.asselstine@windriver.com>
	<CAJTo0LYyrrO+5277fe2q3wZ8Z_JEsxU=0OqyXu5b7CK9hsh_GQ@mail.gmail.com>
Date: Wed, 27 Apr 2016 11:15:31 -0400
X-Google-Sender-Auth: xY_K3l5_mww0yj40NBwhX85Nq1E
Message-ID: <CAPuovELikTayU6Q6xCSgR8tMHKjEyDE_zvCrcH_XUg68bJGr+Q@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] mozjs: fix configure host contamination
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
X-List-Received-Date: Wed, 27 Apr 2016 16:08:45 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 26, 2016 at 5:36 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 26 April 2016 at 20:08, Mark Asselstine <mark.asselstine@windriver.com>
> wrote:
>
>> | Traceback (most recent call last):
>> |   File "./config.status", line 9, in <module>
>> |     from ConfigStatus import config_status
>> |   File
>> "/build/bitbake_build/tmp/work/corei7-64-wrs-linux/mozjs/17.0.0-r0/mozjs17.0.0/js/src/build/ConfigStatus.py",
>> line 11, in <module>
>> |     import sys, re, os, posixpath, ntpath
>> |   File "/usr/lib/python2.7/ntpath.py", line 15, in <module>
>> |     from genericpath import _unicode
>> | ImportError: cannot import name _unicode
>> | WARNING: exit code 1 from a shell command.
>> | ERROR: Function failed: do_configure (log file is located at
>> /build//bitbake_build/tmp/work/corei7-64-wrs-linux/mozjs/17.0.0-r0/temp/do_configure/log.do_configure.1056
>>
>
> I'm not sure using pythonnative is the right fix here.  Executing python
> using the host python should just work, so why does importing ntpath fail
> using your host python?

Correct. Host python should and does work but configure is executing
sysroot python and using host libraries.

>
> What happens if you run the host python in a terminal and do "import
> ntpath"? Does your host's python have a crippled class library or is broken
> in some way?

Again, host python does work, it is a matter of sysroot python being
executed and using host libs. So agreed there are two solutions, fix
things to use host python or the fix I have proposed.

Mark

>
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

