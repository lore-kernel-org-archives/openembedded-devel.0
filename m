Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 60EBC6E766
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2014 13:06:40 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id im17so2578723vcb.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Feb 2014 05:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=UrhBcp6kiPZJyDjesJfpuXtd6+gOePesChVtt9SqO34=;
	b=nbvFA3z+lOHCwikx5IOiFPRmFaDiQVlLUdQutnv/dgVBN08fYOmnIdWGV1cntE0XbL
	RlLOLEdnBVFoGSmSR1moTNaikkMu3+KjPkGnlKBQS6e8BIyZgTnyl/X3D2bEfvfsMvz+
	lVqfXKFVXJtlH/66Iw+aCABT7ROZ4R4JWIVxxx1w6IJG/ZUuSkMrRQppjS6sbPMUbXd+
	RXVamFylIAAKv1jTDiUL/6iUa2Y0Dl3BuPSMq1isY7NNh/rnYciIQGQ8FgpzJwtw6GUA
	Y96LVzDbZT/20yyCbUvtUxlC1R5lQKswxOfdad17E38DGfsg6kBZvVV5sI9Dr7mayA/B
	ofmQ==
X-Received: by 10.58.168.142 with SMTP id zw14mr451004veb.33.1391778401053;
	Fri, 07 Feb 2014 05:06:41 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Fri, 7 Feb 2014 05:06:00 -0800 (PST)
In-Reply-To: <CANR6C56W7g63xx1D5WOA40YL8B_5j-q=uwt6VgFPW72eNZ=k7Q@mail.gmail.com>
References: <CANR6C54WmokZxiFHThuXkZ-kiocewgnGVg7AtbH=FHjr1AFHsg@mail.gmail.com>
	<CANR6C56W7g63xx1D5WOA40YL8B_5j-q=uwt6VgFPW72eNZ=k7Q@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 7 Feb 2014 13:06:00 +0000
X-Google-Sender-Auth: 6_mdSdOihkjMHXuytUP7TWGjzu4
Message-ID: <CANyK_8eseDidQWN6tfCFXF3dXy6pQMH0uSCSyGAHDJfE_zfwzw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 07 Feb 2014 13:06:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 7 February 2014 12:11, Nick D'Ademo <nickdademo@gmail.com> wrote:
> No progress on working this one out unfortunately...
> This is still a build show-stopper for me - anyone have any ideas?
>
> Thanks,
> Nick
>
>
> On Thu, Jan 30, 2014 at 10:57 PM, Nick D'Ademo <nickdademo@gmail.com> wrote:
>
>> I'm encountering a strange error at the install step with the tk 8.6.0
>> recipe (full log below). Does anyone have any ideas on this?
>> This recipe was compiling fine before (and has not been recently changed -
>> last change Dec 5 2013) so I'm not sure what has broken it...
>>
>> Thanks,
>> Nick
>>
>> ERROR: Function failed: do_install (log file is located at
>>> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/log.do_install.1831)
>>> ERROR: Logfile of failure stored in:
>>> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/log.do_install.1831
>>> Log data follows:
>>> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
>>> 'bit-64', 'x86_64-linux', 'common']
>>> | DEBUG: Executing shell function do_install
>>> |
>>> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/run.do_install.1831:
>>> line 269: oe_runmake: command not found
>>> | WARNING:
>>> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/run.do_install.1831:1
>>> exit 127 from
>>> |   oe_runmake
>>> 'DESTDIR=/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image'
>>> install
>>> | ERROR: Function failed: do_install (log file is located at
>>> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/log.do_install.1831)
>>> ERROR: Task 2098
>>> (/home/nick/poky/meta-openembedded/meta-oe/recipes-devtools/tcltk/
>>> tk_8.6.0.bb, do_install) failed with exit code '1'
>>> NOTE: Tasks Summary: Attempted 6752 tasks of which 6751 didn't need to be
>>> rerun and 1 failed.
>>> No currently running tasks (2879 of 6817)
>>>
>>> Summary: 1 task failed:
>>>   /home/nick/poky/meta-openembedded/meta-oe/recipes-devtools/tcltk/
>>> tk_8.6.0.bb, do_install
>>> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>>>
>>

Have you looked at the log and run files mentioned?

/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/run.do_install.1831
contains all the commands for the do_install stage and should define
oe_runmake.

/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/log.do_install.1831
contains the output from running those commands.

The number after the final '.' is the pid so will change each time
bitbake runs that step.

If you can't spot anything in these files, send them to the mailing
list, maybe someone else can.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

