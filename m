Return-Path: <cliff.brake@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9E65060DF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 15:26:55 +0000 (UTC)
Received: by lbbkw15 with SMTP id kw15so26533493lbb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 07:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=4Ccw0l2z9wphGwd5MH1zwGcS04q06E9rZLchZ07Q7IU=;
	b=FyAzMLc+SplNBkX3fR8QkE76GkrBuBPwA8/so0Age1VNsH5+mFbJJYHZp6MaN6pQ2/
	5TPrlLY12KXPYAtidfrhhBykC0A4FDrRi4kRfZ1t9JJ4sHk/7yhKMDs/zogrUgSytxoS
	PjhSm86fdFOquOGwFwG6X4cBB+UyFIt/BAGO6V9byDGi3z/d6ndOYAxjQQ3UcT2SIL4x
	dy66il07UkjpKHFv6FL+jLsqtyrsB/XrXLPZKAKrlmcBqt/EbPq8hqxo+kSwFyAM4Oik
	tiJSwA43YOQOUMbwxELkKtmbORMM5r5PKrUPMk0zXQW8NPynuZ80jjD6Vhuchz5oI4Eg
	bUIQ==
MIME-Version: 1.0
X-Received: by 10.112.170.194 with SMTP id ao2mr958574lbc.142.1447860416051;
	Wed, 18 Nov 2015 07:26:56 -0800 (PST)
Sender: cliff.brake@gmail.com
Received: by 10.112.52.102 with HTTP; Wed, 18 Nov 2015 07:26:55 -0800 (PST)
In-Reply-To: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
Date: Wed, 18 Nov 2015 10:26:55 -0500
X-Google-Sender-Auth: 4SvyqvT-aW-_E3h4ssnBxzHt13U
Message-ID: <CAOd_LFzJoGAqP2dfzLPL=p695hsDN0CSeeFpV6iHXuOvNDn4vg@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: OE/Yocto developer survey
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
X-List-Received-Date: Wed, 18 Nov 2015 15:27:00 -0000
Content-Type: text/plain; charset=UTF-8

Still formatting the results, but should reply with the usage I've
seen.  Below is a profile of 5 customers who are actively using OE in
products:

#1: 6yrs, Angstrom, git subm, OPKG, GTK, systemd, glibc, C++, Jenkins, no tools
#2: 2yrs, Angstrom, git subm, OPKG, HTML/JS, systemd, glibc, C++/JS,
no CI, no tools
#3: 2yrs, nodistro/custom, git subm, OPKG, no GUI, sysvinit, musl,
Lua/C, no CI, no tools
#4: 3yrs, Angstrom, git subm, OPKG, no GUI, systemd, glibc, C++/TCL,
no CI, no tools
#5: 5yrs, Angstrom & custom, git subm, OPKG, Qt, sysvinit, gllibc,
C++, no CI, no tools

All customers primarily develop apps on PC/test on target.  One is
using OE generated SDK's.

Most new projects I do will be moving from Angstrom to nodisto/custom distro.

musl has been working great on one project, so expect to use that more
in the future.

Thanks,
Cliff

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
> [  ] product development
> [  ] hobby/research/education/yocto core developer, etc
>
> What distro do you use?
> [  ] Poky
> [  ] Angstrom
> [  ] nodistro or custom
>
> How do you organize multiple git repos?
> [  ] Git submodules
> [  ] Repo
> [  ] Other
>
> What packaging system?
> [  ] OPKG
> [  ] RPM
> [  ] Other
>
> What GUI toolkits?
> [  ] Qt
> [  ] Gtk
> [  ] EFL
> [  ] HTML5/JS
> [  ] Other
>
> What init system?
> [  ] systemd
> [  ] sysvinit
> [  ] busybox init
> [  ] Other
>
> What libc?
> [  ] glibc
> [  ] uclibc
> [  ] musl
> [  ] Other
>
> How do you develop custom applications?
> [  ] application-SDK
> [  ] devshell
> [  ] develop on PC, test on target
> [  ] Other
>
> What language do you primarily use for custom applications?
> [  ] C
> [  ] C++
> [  ] Python
> [  ] Javascript
> [  ] Lua
> [  ] Other
>
> What do you use for Continuous Integration?
> [  ] Buildbot
> [  ] Jenkins
> [  ] Other
>
> Do you use any any of the tooling projects
> (https://www.yoctoproject.org/tools-resources/projects) such as ADT,
> Hob, Toaster, etc?
>
> _______________________
>
> Reasons or explanations are appreciated, and please feel free to
> include additional choices/information you think are relevant.
>
> Thanks,
> Cliff

