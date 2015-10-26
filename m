Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6E43C60657
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 20:17:52 +0000 (UTC)
Received: by obbwb3 with SMTP id wb3so153597894obb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 13:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=vuJfucUg/d+obzHltzkSKAoKgT2k4zoMUi4tZw17518=;
	b=HTtgJLCYuRB1sALmTqNA/7AgjHpqn67b/foguW9h7LJZhou/IzenqB7oHCtMbYKB4/
	2NDhvapc7fFqg4WCaco1gRAlMrR2JqTt+F3xycj4++IImC9piKA1C44emNZTeo7VMR//
	VTpqaaqORAnbGxbGEeYvmutDT0We6cbTfO2UDf05d6/vpHm/QCe9nNGYpCB0+G7BEL/Q
	aHUCfonYDP3oNq6HsDHR369F3LzD/s1ObMdle8Y5/UkP9D/ouBeOaEwaX9m7vqVNWqJc
	5p2SetQmvctEE4gQ5zEgyGCZMWyz+/mXJcIgGCnnV/VmbbdNOL5UQZAEVZ4wlC2FAVGF
	rsiA==
MIME-Version: 1.0
X-Received: by 10.60.123.2 with SMTP id lw2mr27521653oeb.2.1445890672256; Mon,
	26 Oct 2015 13:17:52 -0700 (PDT)
Received: by 10.60.37.230 with HTTP; Mon, 26 Oct 2015 13:17:52 -0700 (PDT)
In-Reply-To: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
Date: Mon, 26 Oct 2015 16:17:52 -0400
Message-ID: <CAFZh4h9n_2MJPzswEscc9qpAcrUTK1c5=YwAj88SUM+ogQd50g@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE/Yocto developer survey
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
X-List-Received-Date: Mon, 26 Oct 2015 20:17:52 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 26, 2015 at 3:18 PM, Cliff Brake <cbrake@bec-systems.com> wrote:
> Hi,
>
> I'd like to get some feedback on the following questions -- feel free
> to respond to list, or directly to me, and I'll withhold your
> name/company from any results.
>
> I would like to collect feedback until 2015-11-02, and will summarize
> the results after that.
>
> My goal with this survey is to get a sense for best practices and what
> is most commonly used among Yocto/OE developers so I can better advise
> clients using Yocto/OE.  Hopefully this will also generate some
> interesting discussions.
>
> How long have you been using OE?  _____
>
> How do you use OE/Yocto?
> [x] product development
> [x] hobby/research/education/yocto core developer, etc
>
> What distro do you use?
> [x] Poky
> [x] Angstrom
> [  ] nodistro or custom
>
> How do you organize multiple git repos?
> [  ] Git submodules
> [  ] Repo
> [x] Other
>
> What packaging system?
> [x] OPKG
> [  ] RPM
> [  ] Other
>
> What GUI toolkits?
> [  ] Qt
> [  ] Gtk
> [  ] EFL
> [  ] HTML5/JS
> [x] Other - console image - no GUI
>
> What init system?
> [x] systemd
> [  ] sysvinit
> [  ] busybox init
> [  ] Other
>
> What libc?
> [x] glibc
> [  ] uclibc
> [  ] musl
> [  ] Other
>
> How do you develop custom applications?
> [  ] application-SDK
> [  ] devshell
> [  ] develop on PC, test on target
> [x] Other -c populate_sdk
>
> What language do you primarily use for custom applications?
> [x] C
> [x] C++
> [x] Python
> [  ] Javascript
> [  ] Lua
> [x] Other - bash scripts
>
> What do you use for Continuous Integration?
> [  ] Buildbot
> [x] Jenkins
> [  ] Other
>
> Do you use any any of the tooling projects
> (https://www.yoctoproject.org/tools-resources/projects) such as ADT,
> Hob, Toaster, etc?
Playing with Toaster but typically use command line to generate my
rootfs and a toolchain/sdk then application developers use
toolchain/sdk to develop app.


Regards,

Brian

Commscope Inc.
Forest, VA

>
> _______________________
>
> Reasons or explanations are appreciated, and please feel free to
> include additional choices/information you think are relevant.
>
> Thanks,
> Cliff
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

