Return-Path: <nickdademo@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 06A926E706
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2014 13:53:28 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id va2so4031057obc.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Feb 2014 05:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Hn8rkezERZzTurQcOp+XBlT72l0HILg3jVizR3CtxRI=;
	b=ZrKqfkjKaNfgEILsXJfDGwFhzkOgLBTcBBH68+qrW8xLaZQOjGyy11P8eSTDzJswva
	rE2A4a5z+/WH4kIdkEHEZr3hdPHVFQXYqG+9Ivfd0DgcmRaMWENbMNIU20y7mK7xqu86
	0iqWmmVb1OH3k0WlE7+sAX1BHnUNtqDoESdTxI4UYx1GDeh2N9bdi38tQfna4pHEXgfq
	rU4V3jFFRrXtWEka7IBsOwb7aTc2HjsNqaWY51tkBrwp0y5L8f0a3ZdfKmFfAFt2rroO
	G2JfvKuLXe9HlMzNK+e2E97i0W72QM5NWiINjsEvdzSksLEbC6RGa3sGWDG9vpuqQjyO
	TU/Q==
X-Received: by 10.182.16.33 with SMTP id c1mr12992920obd.4.1391781209588; Fri,
	07 Feb 2014 05:53:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.79.165 with HTTP; Fri, 7 Feb 2014 05:53:09 -0800 (PST)
In-Reply-To: <CANyK_8eseDidQWN6tfCFXF3dXy6pQMH0uSCSyGAHDJfE_zfwzw@mail.gmail.com>
References: <CANR6C54WmokZxiFHThuXkZ-kiocewgnGVg7AtbH=FHjr1AFHsg@mail.gmail.com>
	<CANR6C56W7g63xx1D5WOA40YL8B_5j-q=uwt6VgFPW72eNZ=k7Q@mail.gmail.com>
	<CANyK_8eseDidQWN6tfCFXF3dXy6pQMH0uSCSyGAHDJfE_zfwzw@mail.gmail.com>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Sat, 8 Feb 2014 00:53:09 +1100
Message-ID: <CANR6C55tvGxPN1DsJaupK53Z4HdWM=Zi5X8L7ZXM9k5FRH2LWQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	paul@paulbarker.me.uk
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
X-List-Received-Date: Fri, 07 Feb 2014 13:53:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks Paul.

The run log has *oe_runmake* called via:

autotools_do_install() {
>     *oe_runmake*'DESTDIR=/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image'
> install
>     # Info dir listing isn't interesting at this point so remove it if it
> exists.
>     if [ -e
> "/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/usr/share/info/dir"
> ]; then
>         rm -f
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/usr/share/info/dir
>     fi
>
> }
>

My base.bbclass (meta/classes) also has oe_runmake defined:

oe_runmake() {
>     bbnote ${MAKE} ${EXTRA_OEMAKE} "$@"
>     ${MAKE} ${EXTRA_OEMAKE} "$@" || die "oe_runmake failed"
> }
>

So I'm very puzzled as to why the recipe can't find oe_runmake...



On Sat, Feb 8, 2014 at 12:06 AM, Paul Barker <paul@paulbarker.me.uk> wrote:

> On 7 February 2014 12:11, Nick D'Ademo <nickdademo@gmail.com> wrote:
> > No progress on working this one out unfortunately...
> > This is still a build show-stopper for me - anyone have any ideas?
> >
> > Thanks,
> > Nick
> >
> >
> > On Thu, Jan 30, 2014 at 10:57 PM, Nick D'Ademo <nickdademo@gmail.com>
> wrote:
> >
> >> I'm encountering a strange error at the install step with the tk 8.6.0
> >> recipe (full log below). Does anyone have any ideas on this?
> >> This recipe was compiling fine before (and has not been recently
> changed -
> >> last change Dec 5 2013) so I'm not sure what has broken it...
> >>
> >> Thanks,
> >> Nick
> >>
> >> ERROR: Function failed: do_install (log file is located at
> >>>
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/log.do_install.1831)
> >>> ERROR: Logfile of failure stored in:
> >>>
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/log.do_install.1831
> >>> Log data follows:
> >>> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> >>> 'bit-64', 'x86_64-linux', 'common']
> >>> | DEBUG: Executing shell function do_install
> >>> |
> >>>
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/run.do_install.1831:
> >>> line 269: oe_runmake: command not found
> >>> | WARNING:
> >>>
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/run.do_install.1831:1
> >>> exit 127 from
> >>> |   oe_runmake
> >>>
> 'DESTDIR=/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image'
> >>> install
> >>> | ERROR: Function failed: do_install (log file is located at
> >>>
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/log.do_install.1831)
> >>> ERROR: Task 2098
> >>> (/home/nick/poky/meta-openembedded/meta-oe/recipes-devtools/tcltk/
> >>> tk_8.6.0.bb, do_install) failed with exit code '1'
> >>> NOTE: Tasks Summary: Attempted 6752 tasks of which 6751 didn't need to
> be
> >>> rerun and 1 failed.
> >>> No currently running tasks (2879 of 6817)
> >>>
> >>> Summary: 1 task failed:
> >>>   /home/nick/poky/meta-openembedded/meta-oe/recipes-devtools/tcltk/
> >>> tk_8.6.0.bb, do_install
> >>> Summary: There was 1 ERROR message shown, returning a non-zero exit
> code.
> >>>
> >>
>
> Have you looked at the log and run files mentioned?
>
>
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/run.do_install.1831
> contains all the commands for the do_install stage and should define
> oe_runmake.
>
>
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/log.do_install.1831
> contains the output from running those commands.
>
> The number after the final '.' is the pid so will change each time
> bitbake runs that step.
>
> If you can't spot anything in these files, send them to the mailing
> list, maybe someone else can.
>
> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

