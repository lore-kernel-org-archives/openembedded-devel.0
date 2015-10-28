Return-Path: <chmorgan@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 59EDE73695
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 07:32:34 +0000 (UTC)
Received: by igbhv6 with SMTP id hv6so1063165igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 00:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4DMiFPiIam0hwgRrMiqqHA9q5K44+4olnMFEKv1izzo=;
	b=ougUMyFR7dSpuWfmjw+IxA69lcthh3X9lS1NQUyM7AshVjBMV3Tm6+xH50e+OCkOg4
	vOeR1ltwYbhuqeEv5G7j6Dezvp5p7F7HKxbywr0wsF+8MbmvsS19xMDEsk4WInX2tK8Y
	Z8h6SFP65/4QB5oW3j+aWWBiPKBrRg2KLZW192ZijgUs0COtD1DBwL01BozL406NLIl2
	TI3mfD9hAQpDYg2rNep5YrClr9totre0SyR2LoCcBYDr/nVnsk728ZSSyaVaV3z9omfD
	v/9dc5FT3uwWnl56T71gg4iGC7kYGq2UKZCXEOYQsENozx++f3DBhom2FOBZJGFq69M+
	xMTw==
X-Received: by 10.50.124.6 with SMTP id me6mr1505376igb.20.1446017554211; Wed,
	28 Oct 2015 00:32:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.182.136 with HTTP; Wed, 28 Oct 2015 00:32:14 -0700 (PDT)
In-Reply-To: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
From: Chris Morgan <chmorgan@gmail.com>
Date: Wed, 28 Oct 2015 03:32:14 -0400
Message-ID: <CAAPegz397TCZgX_3AAdDKfBCSPX3x-b2kf29Q=43tYHTdCpWgQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>
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
X-List-Received-Date: Wed, 28 Oct 2015 07:32:35 -0000
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
> How long have you been using OE?  3 years_____
>
> How do you use OE/Yocto?
> [x] product development
> [  ] hobby/research/education/yocto core developer, etc
>
> What distro do you use?
> [ ] Poky
> [  ] Angstrom
> [ x ] nodistro or custom (based on poky)
>
> How do you organize multiple git repos?
> [x] Git submodules
> [  ] Repo
> [  ] Other
>
> What packaging system?
> [  ] OPKG
> [  ] RPM
> [x] Other (none, just a single output fs)
>
> What GUI toolkits?
> [ x ] Qt
> [  ] Gtk
> [  ] EFL
> [  ] HTML5/JS
> [  ] Other
>
> What init system?
> [ x ] systemd
> [  ] sysvinit
> [  ] busybox init
> [  ] Other
>
> What libc?
> [ x ] glibc (I think, we don't appear to override DISTRO_FEATURES_LIBC)
> [  ] uclibc
> [  ] musl
> [  ] Other
>
> How do you develop custom applications?
> [  ] application-SDK
> [  ] devshell
> [ x ] develop on PC, test on target
> [  ] Other
>
> What language do you primarily use for custom applications?
> [ x ] C
> [ x ] C++
> [  ] Python
> [  ] Javascript
> [  ] Lua
> [  ] Other
>
> What do you use for Continuous Integration?
> [ x ] Buildbot
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


Company name currently withheld. Yocto being used to build the
software image for a consumer hardware product.

Chris

