Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id C76E865E1A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jul 2014 12:08:27 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id s18so1118162lam.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jul 2014 05:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=myiapLLZu8fmJQF/C/X8yRfIoTOeoJGS5JAKVOTAWCM=;
	b=SGaKpjUiaFm31+2jWNXiH/eIRar0dEE0KDyf2Y3xm/ngpjOJBrfWRRfrSlw/Me263I
	MHw+3uL7P0s5/V3Hco47B7GVIbMGVlf2PmnTSd2ryp4H9TW17Pr1O+ms0ebJQ4l+DDLv
	3HkKq0h2Rq4wkUvcXYVdOGeR8Isdv5ZN4ByiLHqME8f7soKtWeVawGGZPFliaKozk6q4
	2HAMtrheRLJiRgx6mUes+dv8kfSZ9LyWjyuX3uuwk1fPlo3pgN1+5zb1jIfObCIj82q1
	0c4capIB65I7C68hDQw7Bd4oEPrtJOSq427i8+ru7ZG02vKMbbw/wu9cNeH8z8I9mvQP
	UWUQ==
MIME-Version: 1.0
X-Received: by 10.152.244.162 with SMTP id xh2mr8244459lac.30.1404475708434;
	Fri, 04 Jul 2014 05:08:28 -0700 (PDT)
Received: by 10.112.129.6 with HTTP; Fri, 4 Jul 2014 05:08:28 -0700 (PDT)
In-Reply-To: <53B68266.4020503@communistcode.co.uk>
References: <53B676FE.50809@communistcode.co.uk>
	<53B67E8D.6060702@windriver.com>
	<53B68266.4020503@communistcode.co.uk>
Date: Fri, 4 Jul 2014 14:08:28 +0200
Message-ID: <CAAQYJAu3Yk09d3vORC=zxMnQ066uiL7x05ceF+u+H09+G-ujyQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: tcpdump: bitbake throws autoconf errors, error message confusing
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
X-List-Received-Date: Fri, 04 Jul 2014 12:08:29 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 4, 2014 at 12:31 PM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> Hi Robert,
>
> After further investigation that is also what I found, and why it's so
> confusing. The different tcpdump is because I uprevved to the latest
> version locally to see if it fixed the issue ;)
>
> I'll see if I can figure out why the class if flagging it as bad when it
> shouldn't.
>
> On 04/07/14 11:14, Robert Yang wrote:
>>
>> The error message comes from meta/classes/insane.bbclass:
>>
>> grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation'
>>
>> The log you showed didn't contain the words, so that it should not error,
>> maybe you have to debug in meta/classes/insane.bbclass.
>>
>> Btw., the meta-oe's tcpdump is 4.3.0, yours is 4.5.1, maybe there are
>> other differences, for example you have used another insane.bbclass ?
>> (Just a guess)
>>
>> // Robert
>>
>> On 07/04/2014 05:42 PM, Jack Mitchell wrote:
>>> So tcpdump is failing to build in my latest uprev to all things HEAD.
>>> The error message is a touch cryptic:
>>>
>>> ERROR: This autoconf log indicates errors, it looked at host include
>>> and/or library paths while determining system capabilities.
>>> Rerun configure task after fixing this. The path was
>>> '/home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/core2-32-oe-linux/tcpdump/4.5.1-r0/build'
>>>
>>> ERROR: Function failed: do_qa_configure
>>>
>>> log: http://ix.io/dg9
>>>
>>> Looking at the log I can't see where that specific path is used... can
>>> anyone shed any light?
>>>

Just gave a quick glimpse. Maybe it complains about this ?

  --exec_prefix=/usr

autoreconf: configure.in: not using Automake
autoreconf: running: gnu-configize
autoreconf: Leaving directory `.'
NOTE: Running /home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/core2-32-oe-linux/tcpdump/4.5.1-r0/tcpdump-4.5.1/configure
 --build=x86_64-linux  --host=i586-oe-linux  --target=i586-oe-linux
--prefix=/usr  --exec_prefix=/usr  --bindir=/usr/bin
--sbindir=/usr/sbin  --libexecdir=/usr/lib/tcpdump
--datadir=/usr/share  --sysconfdir=/etc  --sharedstatedir=/com
--localstatedir=/var  --libdir=/usr/lib  --includedir=/usr/include
--oldincludedir=/usr/include  --infodir=/usr/share/info
--mandir=/usr/share/man  --disable-silent-rules
--disable-dependency-tracking
--with-libtool-sysroot=/home/jack/Work/oe-core.git/test-build/tmp-eglibc/sysroots/cbnlcomexpress
--without-crypto         --enable-ipv6
configure: WARNING: unrecognized options: --disable-silent-rules,
--disable-dependency-tracking, --with-libtool-sysroot

Cheers

Andrea


>>> Cheers,
>>>
>
>
> --
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   Cambridgeshire, UK
>   http://www.embed.me.uk
> --
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

