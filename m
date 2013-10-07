Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7569C612D1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 05:46:25 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id at1so14441644iec.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Oct 2013 22:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YtxLjEABEfntx52yTjA4/MwSYpEp5FUtoZaX1bvjVdA=;
	b=tLtEpAEH3L+FZ4BO1Is4cCWCTRVIjMMbcLPeeleoap0oO8vGW4QK/5XkB/c/bli2X1
	RmHo4w8rEHO4tPMFN61YYbPWuIwih+0WF3w7oKjKwqW+Nz91Nxkwd5mYEXHxXl43Lk6z
	qrJe3Oervj9g/ADi+YeLIv6e9MbpCB03u+cfLF5XW3DTbhTc1c1aK2FPBX7FIFLJHMLz
	tjVSpchPYx/cedUmpOHbbYXwivuq14u/uBzqdfsV86dGEVvc71C/h7NtYdgPU0CYRUcZ
	4NeM8DM2e4FkfY3vcUsxg/CT6EUSx92VVyg8HxJhqg1wOQ24UcfATRUtxER+bVWrE9yj
	9bMw==
X-Received: by 10.50.61.179 with SMTP id q19mr15546611igr.33.1381124786506;
	Sun, 06 Oct 2013 22:46:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.5.225 with HTTP; Sun, 6 Oct 2013 22:45:56 -0700 (PDT)
In-Reply-To: <CAP9ODKqLRgh2jO4dDDPwkFd5RLM+hZjaFVVg=VXuTy0C_ukTkg@mail.gmail.com>
References: <1380026637-6511-1-git-send-email-mario@ossystems.com.br>
	<CAP9ODKpxHF4NUurt-U9HakdAWJ6LAz6HaNoHnuuf5fpEh0h-ow@mail.gmail.com>
	<20131004141938.GI6240@jama>
	<CAP9ODKqLRgh2jO4dDDPwkFd5RLM+hZjaFVVg=VXuTy0C_ukTkg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 6 Oct 2013 22:45:56 -0700
Message-ID: <CAMKF1spqdOMP3YTawqtXtGQ3UUcGki91GJN56iT7wirmLSrrKA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
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
X-List-Received-Date: Mon, 07 Oct 2013 05:46:26 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 4, 2013 at 7:27 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Fri, Oct 4, 2013 at 11:19 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Tue, Sep 24, 2013 at 11:42:21AM -0300, Otavio Salvador wrote:
>>> On Tue, Sep 24, 2013 at 9:43 AM, Mario Domenech Goulart
>>> <mario@ossystems.com.br> wrote:
>>> > Recipe based on OE classic's recipe for version 4.4.1, as of
>>> > 0585ccfa49f71a81652c7f63885202e952ebd0e9.
>>> >
>>> > Summary of changes against OE classic's recipe:
>>> >
>>> > * Apply some Debian patches from
>>> >   http://patch-tracker.debian.org/package/wvstreams/4.6.1-6
>>> >
>>> > * Minor adjustments for the current build system (add
>>> >   LIC_FILES_CHKSUM, md5 and sha256 sums for SRC_URI, fix LICENSE, remove
>>> >   PR)
>>> >
>>> > * Disable parallel make, since it was causing errors like
>>> >
>>> > Log data follows:
>>> > | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
>>> > | DEBUG: Executing shell function do_compile
>>> > | NOTE: make -j 8
>>> > | ./CXX -c utils/wvbuffer
>>> > | ./CXX -c utils/wvbufferstore
>>> > | ./CXX -c utils/wvcont
>>> > | /bin/bash: ./CXX: No such file or directory
>>> > | /bin/bash: ./CXX: No such file or directory
>>> > | /bin/bash: ./CXX: No such file or directory
>>> > | * Generating CC using c
>>> > | make: * Generating CXX using cc
>>> > | *** [utils/wvbuffer.o] Error 127
>>> > | make: *** Waiting for unfinished jobs....
>>> > | make: *** [utils/wvbufferstore.o] Error 127
>>> > | make: *** [utils/wvcont.o] Error 127
>>> > | ERROR: oe_runmake failed
>>> > | WARNING: .../tmp/work/armv7a-vfp-neon-oel-linux-gnueabi/wvstreams/4.6.1-r0/temp/run.do_compile.19302:1 exit 1 from
>>> > |   exit 1
>>> > | ERROR: Function failed: do_compile (log file is located at .../tmp/work/armv7a-vfp-neon-oel-linux-gnueabi/wvstreams/4.6.1-r0/temp/log.do_compile.19302)
>>> >
>>> > Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
>>>
>>> Just for reference, Mario and I discussed about the path for including
>>> this recipe.
>>>
>>> We agreed it to be placed at wvdial subdir as it will only be used by it.
>>>
>>> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>> Sorry for huge delay caused by monster build running on jenkins for 11
>> days.. but this needs small fix for new QA issue:
>>
>> wvstreams-4.6.1: wvstreams: Files/directories were installed but not
>> shipped
>>   /usr/lib/valgrind
>>   /usr/lib/valgrind/wvstreams.supp
>
> Sure; Mario, can you split this into a ${PN}-valgrind package?

May be they should go into ${PN}-dev package and IMHO don't disable
it. since its a good
thing we want to make sure the tools like valgrind can be tried easily
out of box if possible.

