Return-Path: <mario.goulart@gmail.com>
Received: from mail-qe0-f51.google.com (mail-qe0-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id EF0CA60F77
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 14:57:47 +0000 (UTC)
Received: by mail-qe0-f51.google.com with SMTP id ne12so5347304qeb.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=J/gaaS+TCTiL8coPRb6c7lGaoCWR7eLhAGDJFGIpwxw=;
	b=LAO053fK/m5HGL36hF9YxeHqn3XZZ5SrNVapLYBeMOWEi6aLlY73wHSbSCxf+ZpIeb
	gthleqUxAjZtihaLNZfeMKHaGWwY1of3SmGEz0nPJ4KeuCV60ZPxWvUw6wVxDb12bfrw
	sSzLn8y8tAe/QT7UT2Le8Yn0OyRgExKoYTac0XsF0kD+FkxPnKZHHdMmRzE1mASGm7MI
	sz78zHehLraBvgGkBzPNP20sOuJdFgLXz0B8Q2t2f5NCNq0e+Lt9owxlUBc4nB8lUtZh
	ie/Lh1ML1Ot74Wm9WFy3CfV6BNrT70bn1a84MsKnRZkgdLbKEdde4r6VosQDfpvKmoDg
	x20Q==
X-Received: by 10.229.192.6 with SMTP id do6mr36872104qcb.3.1381157869316;
	Mon, 07 Oct 2013 07:57:49 -0700 (PDT)
Received: from parenteses.gmail.com (email.parenteses.org. [198.199.72.94])
	by mx.google.com with ESMTPSA id fx6sm54432292qeb.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 07:57:48 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
References: <1380026637-6511-1-git-send-email-mario@ossystems.com.br>
	<CAP9ODKpxHF4NUurt-U9HakdAWJ6LAz6HaNoHnuuf5fpEh0h-ow@mail.gmail.com>
	<20131004141938.GI6240@jama>
	<CAP9ODKqLRgh2jO4dDDPwkFd5RLM+hZjaFVVg=VXuTy0C_ukTkg@mail.gmail.com>
	<CAMKF1spqdOMP3YTawqtXtGQ3UUcGki91GJN56iT7wirmLSrrKA@mail.gmail.com>
Date: Mon, 07 Oct 2013 14:57:45 +0000
In-Reply-To: <CAMKF1spqdOMP3YTawqtXtGQ3UUcGki91GJN56iT7wirmLSrrKA@mail.gmail.com>
	(Khem Raj's message of "Sun, 6 Oct 2013 22:45:56 -0700")
Message-ID: <8738odt9g6.fsf@parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3.50 (gnu/linux)
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] wvstreams: add recipe for version 4.6.1
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
X-List-Received-Date: Mon, 07 Oct 2013 14:57:48 -0000
Content-Type: text/plain

Hi Khem

On Sun, 6 Oct 2013 22:45:56 -0700 Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Oct 4, 2013 at 7:27 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> On Fri, Oct 4, 2013 at 11:19 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> On Tue, Sep 24, 2013 at 11:42:21AM -0300, Otavio Salvador wrote:
>>>> On Tue, Sep 24, 2013 at 9:43 AM, Mario Domenech Goulart
>>>> <mario@ossystems.com.br> wrote:
>>>> > Recipe based on OE classic's recipe for version 4.4.1, as of
>>>> > 0585ccfa49f71a81652c7f63885202e952ebd0e9.
>>>> >
>>>> > Summary of changes against OE classic's recipe:
>>>> >
>>>> > * Apply some Debian patches from
>>>> >   http://patch-tracker.debian.org/package/wvstreams/4.6.1-6
>>>> >
>>>> > * Minor adjustments for the current build system (add
>>>> >   LIC_FILES_CHKSUM, md5 and sha256 sums for SRC_URI, fix LICENSE, remove
>>>> >   PR)
>>>> >
>>>> > * Disable parallel make, since it was causing errors like
>>>> >
>>>> > Log data follows:
>>>> > | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
>>>> > | common-linux', 'common-glibc', 'arm-linux',
>>>> > | arm-linux-gnueabi', 'common']
>>>> > | DEBUG: Executing shell function do_compile
>>>> > | NOTE: make -j 8
>>>> > | ./CXX -c utils/wvbuffer
>>>> > | ./CXX -c utils/wvbufferstore
>>>> > | ./CXX -c utils/wvcont
>>>> > | /bin/bash: ./CXX: No such file or directory
>>>> > | /bin/bash: ./CXX: No such file or directory
>>>> > | /bin/bash: ./CXX: No such file or directory
>>>> > | * Generating CC using c
>>>> > | make: * Generating CXX using cc
>>>> > | *** [utils/wvbuffer.o] Error 127
>>>> > | make: *** Waiting for unfinished jobs....
>>>> > | make: *** [utils/wvbufferstore.o] Error 127
>>>> > | make: *** [utils/wvcont.o] Error 127
>>>> > | ERROR: oe_runmake failed
>>>> > | WARNING: .../tmp/work/armv7a-vfp-neon-oel-linux-gnueabi/wvstreams/4.6.1-r0/temp/run.do_compile.19302:1 exit 1 from
>>>> > |   exit 1
>>>> > | ERROR: Function failed: do_compile (log file is located at
>>>> > | .../tmp/work/armv7a-vfp-neon-oel-linux-gnueabi/wvstreams/4.6.1-r0/temp/log.do_compile.19302)
>>>> >
>>>> > Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
>>>>
>>>> Just for reference, Mario and I discussed about the path for including
>>>> this recipe.
>>>>
>>>> We agreed it to be placed at wvdial subdir as it will only be used by it.
>>>>
>>>> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>>>
>>> Sorry for huge delay caused by monster build running on jenkins for 11
>>> days.. but this needs small fix for new QA issue:
>>>
>>> wvstreams-4.6.1: wvstreams: Files/directories were installed but not
>>> shipped
>>>   /usr/lib/valgrind
>>>   /usr/lib/valgrind/wvstreams.supp
>>
>> Sure; Mario, can you split this into a ${PN}-valgrind package?
>
> May be they should go into ${PN}-dev package and IMHO don't disable
> it. since its a good
> thing we want to make sure the tools like valgrind can be tried easily
> out of box if possible.

Good point.  I'll submit a new patch to replace --without-valigrind with
--with-valgrind (it doesn't require valgrind as a build dependency).

Since .supp files are only useful if you have valgrind installed, I
think we should add valgrind to RDEPENDS_${PN}-<?>.

Now we need to decide on -<?>.  Maybe -valgrind is cleaner in the sense
that those who need the -dev files but don't need valgrind won't get
valgrind as a runtime dependency.  Adding valgrind to
RDEPENDS_${PN}-valgrind sounds ok to me (those who install it will be
clearly stating that they do want valgrind stuff).

What do you think?

Best wishes.
Mario
-- 
http://www.ossystems.com.br

