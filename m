Return-Path: <mario.goulart@gmail.com>
Received: from mail-qe0-f48.google.com (mail-qe0-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id CB72660EA3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 17:04:18 +0000 (UTC)
Received: by mail-qe0-f48.google.com with SMTP id nd7so3201564qeb.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=zW8/4+JYqVPe0RENRrrBoYI+JQ4h3mk7yqLPkvtBUcw=;
	b=E4uXXs1qDaFYlSgrSVfDwh9NOrUD7cvXOQvtvHG9S2p1lsAnd6pcnWWkkGmEE9fPVl
	lA4jn4+Hze3xEaenXC7oY+VBIFc1c4u+BvBXmKVnIRovEXVp29jO2PFbwsbjDrhtJ43O
	msXy22DGozbbhuFBUSmLBXv9txmueMzFsiEpdT1S+nzZgPTBa5WrrdK5AVubjtCcIKVx
	OSZjpmoDBWn02IUUygr0EofshFCQAcT/oD6wiOvlqhO6KF3RTZqzvWo06sTCCDVX0WIW
	mG6hgX5OykGpM6BMIineKnu3W7F1ZCEzZsHAdZo4N8Zi1VNxGBlOdvrPkPElTwAdEoCK
	hYZA==
X-Received: by 10.49.24.74 with SMTP id s10mr19664765qef.24.1380906260010;
	Fri, 04 Oct 2013 10:04:20 -0700 (PDT)
Received: from parenteses.gmail.com (email.parenteses.org. [198.199.72.94])
	by mx.google.com with ESMTPSA id a7sm26013150qew.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 04 Oct 2013 10:04:19 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1380026637-6511-1-git-send-email-mario@ossystems.com.br>
	<CAP9ODKpxHF4NUurt-U9HakdAWJ6LAz6HaNoHnuuf5fpEh0h-ow@mail.gmail.com>
	<20131004141938.GI6240@jama>
	<CAP9ODKqLRgh2jO4dDDPwkFd5RLM+hZjaFVVg=VXuTy0C_ukTkg@mail.gmail.com>
Date: Fri, 04 Oct 2013 17:04:14 +0000
In-Reply-To: <CAP9ODKqLRgh2jO4dDDPwkFd5RLM+hZjaFVVg=VXuTy0C_ukTkg@mail.gmail.com>
	(Otavio Salvador's message of "Fri, 4 Oct 2013 11:27:46 -0300")
Message-ID: <877gdtufw1.fsf@parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3.50 (gnu/linux)
MIME-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 04 Oct 2013 17:04:20 -0000
Content-Type: text/plain

Hi,

On Fri, 4 Oct 2013 11:27:46 -0300 Otavio Salvador <otavio@ossystems.com.br> wrote:

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
>>> > | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
>>> > | common-linux', 'common-glibc', 'arm-linux',
>>> > | arm-linux-gnueabi', 'common']
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
>>> > | ERROR: Function failed: do_compile (log file is located at
>>> > | .../tmp/work/armv7a-vfp-neon-oel-linux-gnueabi/wvstreams/4.6.1-r0/temp/log.do_compile.19302)
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

Thanks for spotting that, Martin.  I've submitted a v2 with a change
that will hopefully fix that issue.

As agreed with Otavio on a private discussion, we decided to disable
valgrind by passing --without-valgrind to configure.

Best wishes.
Mario
-- 
http://www.ossystems.com.br

