Return-Path: <nickdademo@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id 689506E786
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2014 12:11:59 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id g12so4037082oah.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Feb 2014 04:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=8g+/GV8o6Rs3smNmgp+rTOXkukB/NZOsoZDqi5COcWE=;
	b=pyyOOt2zy/nojK+KV9eZq1Zkq/YkDPMgiACCROyPCBzCs5IjudT+hhwx1rQNU8eMIH
	apbZ8MjE3RRKyeuvZdoyZ9f3sSFse55sNWJgdi2T+Wq2DF9yatdoBY7AMJVg2CmTwgJD
	sg+IiAE/G2U2xVosGbqEwexhV1Gbb28m3aqjxtgcdLG9e1BMDgSV54oq8SBQjJm5EDw4
	d5AIJ7aCQkl41M1AKRDE4jl5Hd92c7/TFddwjnT05Pdj83krM0zkZ2QEF5wCllz/Gd8D
	2JId5ksOtwrtfR0LSWU2MAAwOC76Tc3pmN6tBlN2+PVUH9zunmpCz1hNDWSDPK9Q4Y7B
	g/3Q==
X-Received: by 10.182.219.167 with SMTP id pp7mr1235obc.85.1391775120147; Fri,
	07 Feb 2014 04:12:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.79.165 with HTTP; Fri, 7 Feb 2014 04:11:40 -0800 (PST)
In-Reply-To: <CANR6C54WmokZxiFHThuXkZ-kiocewgnGVg7AtbH=FHjr1AFHsg@mail.gmail.com>
References: <CANR6C54WmokZxiFHThuXkZ-kiocewgnGVg7AtbH=FHjr1AFHsg@mail.gmail.com>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Fri, 7 Feb 2014 23:11:40 +1100
Message-ID: <CANR6C56W7g63xx1D5WOA40YL8B_5j-q=uwt6VgFPW72eNZ=k7Q@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: tk 8.6.0: strange error: "oe_runmake: command not found"
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
X-List-Received-Date: Fri, 07 Feb 2014 12:12:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

No progress on working this one out unfortunately...
This is still a build show-stopper for me - anyone have any ideas?

Thanks,
Nick


On Thu, Jan 30, 2014 at 10:57 PM, Nick D'Ademo <nickdademo@gmail.com> wrote:

> I'm encountering a strange error at the install step with the tk 8.6.0
> recipe (full log below). Does anyone have any ideas on this?
> This recipe was compiling fine before (and has not been recently changed -
> last change Dec 5 2013) so I'm not sure what has broken it...
>
> Thanks,
> Nick
>
> ERROR: Function failed: do_install (log file is located at
>> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/log.do_install.1831)
>> ERROR: Logfile of failure stored in:
>> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/log.do_install.1831
>> Log data follows:
>> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
>> 'bit-64', 'x86_64-linux', 'common']
>> | DEBUG: Executing shell function do_install
>> |
>> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/run.do_install.1831:
>> line 269: oe_runmake: command not found
>> | WARNING:
>> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/run.do_install.1831:1
>> exit 127 from
>> |   oe_runmake
>> 'DESTDIR=/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image'
>> install
>> | ERROR: Function failed: do_install (log file is located at
>> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/log.do_install.1831)
>> ERROR: Task 2098
>> (/home/nick/poky/meta-openembedded/meta-oe/recipes-devtools/tcltk/
>> tk_8.6.0.bb, do_install) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 6752 tasks of which 6751 didn't need to be
>> rerun and 1 failed.
>> No currently running tasks (2879 of 6817)
>>
>> Summary: 1 task failed:
>>   /home/nick/poky/meta-openembedded/meta-oe/recipes-devtools/tcltk/
>> tk_8.6.0.bb, do_install
>> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>>
>
>
>

