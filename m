Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 019516FFF2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 10:00:14 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id a123so228227537vkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 02:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=w2CoIhgEjcvtkL9WQ7fdb1aYaTbTO55iVXOxWiniPSg=;
	b=RNzgyAv4pKimNBYvKgjMX+01j2FlHbJGfPXrgMtq2ayWklmSpIhk8DekMpINnx64cg
	hcbZspwevJC4TBCMXQLARMbicfp+zE10NyUjlXw6hHV4TOzWKuVCElWcS+Zb6s4blErA
	+80Nx+Pp33/YymW1xc+wjJ2RyT6m9UkZUbwW3GMNmXMlNKFpGaCT2pYNzhudwyMHCehb
	IvIef/HtdLxHKjQ9fi6zjLe2kHzU1lqJ8zz8oKBa0mIo3YAnpCFS/Y/JejuY1NLfR654
	waCzmNvViIvYNzXMOcmGudFaY3yvwOPH9KXQTrwWlixxKM99T2b+ic3KDrnXtS4lZY/2
	QCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=w2CoIhgEjcvtkL9WQ7fdb1aYaTbTO55iVXOxWiniPSg=;
	b=GEFnq55gwNzia90pAz9ivMlU+iWnrnbIFRG4flxaIXlhwwj8Bs837AvJAUdSrphYhj
	KUW3pjuZOZK0M8GVBmvG1FpaMU6iDbbFYdq4znIM13mTeRJBglQgvL/6rKXIr+Z6rJO1
	NuBtrSuxBvp1rxPeAZSHWImdeNLtT3tWFTf6zQ2TG+ObvZ2PcspYnhJ6ZOYhqx54nLvA
	7F5ziOHQUAXC6kr9l8Fwbitkrc/DXiowwy3JDbhFTz7JuQ1Okctn7O8qkzRfQbFrMF9l
	VAvP9y+N1r2Q4xTBYAdYts6EqS1DFwipwdbpfUw7N5PYZrGUnJQIxO3re0SiGKMGCWCE
	rLHA==
X-Gm-Message-State: ALoCoQkdSN3KV7DLJH4d8CW5jkiUoQ4Pjuv7cVGsv++ThEQeltbJ8SSYI+Se35drbhOqdr28equpMjXDwVhcIUjyXIhR3fJBOQ==
X-Received: by 10.31.162.20 with SMTP id l20mr81317608vke.137.1452679215005;
	Wed, 13 Jan 2016 02:00:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Wed, 13 Jan 2016 01:59:55 -0800 (PST)
In-Reply-To: <41A6B023-03C6-48E4-B3EC-E1BA1F073B70@gmail.com>
References: <CADySD0EiW1oO_wezsLtEFX8h2V-ByykrgfSvOvGLJJLWyrm4uw@mail.gmail.com>
	<CAMKF1sqmg8gOj3_jjJTGebJQj+msh5tquKnOOV8zwShJtoHaUA@mail.gmail.com>
	<CADySD0Fx+VpoaPNgFSwvne6D1ENxH=F-v4cpSJmjRtc2rpkS2A@mail.gmail.com>
	<90CBA3E6-A9A9-4485-ADAB-2D68D6E88E40@gmail.com>
	<CADySD0GQa+S1OY0R9KaQxJ_EFYB+TRJociEszuuFWW_7dO0JYA@mail.gmail.com>
	<BFC78264-0398-49A7-8C37-DA2958AA5BD7@gmail.com>
	<CADySD0GV+gsBBoU7vFVZwfNxiVUDawzrP5L3n=4ZXuUPhyr6yg@mail.gmail.com>
	<82CDD0BD-1D28-425B-9F1A-99AFFB42CFE5@gmail.com>
	<CADySD0G_vmN=SwZsVRrg5Ko+P_jM6Nvs2UTt0paaqiPcfcM0-Q@mail.gmail.com>
	<41A6B023-03C6-48E4-B3EC-E1BA1F073B70@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 13 Jan 2016 01:59:55 -0800
Message-ID: <CADySD0G13gzng3be=EH6ZBefENDYF8467F3ugj72=AtskY8_XA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: bitbake meta-toolchain-qt5 error
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
X-List-Received-Date: Wed, 13 Jan 2016 10:00:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

here is the full log file
https://gist.github.com/anonymous/d6db184bff49736e1121

In case log file above is truncated:
https://gist.githubusercontent.com/anonymous/d6db184bff49736e1121/raw/b6dd8=
7cf3745c91d958e253c3332cc22772a1f0a/qnetworkinfo_linux.cpp


On Tue, Jan 12, 2016 at 5:50 PM, Khem Raj <raj.khem@gmail.com> wrote:

> No. you need to use complete cmdline that is used while compiling it
> originally to produce the error
>
> > On Jan 12, 2016, at 5:37 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> wrote:
> >
> > I posted the complete log file.
> >
> > I tried with "arm-linux-gnueabihf-gcc -E -dD <filename>"
> > Maybe it is not enough. I'll try with complete command having include
> paths
> > and see if it improves anything.
> >
> > On Wed, Jan 13, 2016 at 2:29 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >>
> /home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-to=
olchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0=
577ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux_p.h:48:26:
> >> fatal error: qnetworkinfo.h: No such file or directory
> >>
> >>
> >> Please post complete file
> >>
> >>> On Jan 12, 2016, at 5:22 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> wrote:
> >>>
> >>> thanks
> >>>
> >>> here it is.. https://gist.github.com/anonymous/a03e9fb2203e45a4b033
> >>>
> >>> On Wed, Jan 13, 2016 at 1:44 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>>>
> >>>>> On Jan 12, 2016, at 4:39 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>>> wrote:
> >>>>>
> >>>>> sorry it took me a while to reply.
> >>>>>
> >>>>> I am using gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.
> >>>>>
> >>>>> I have preprocess
> >>>>> =E2=80=8B =E2=80=8B
> >>>>> =E2=80=8B=E2=80=8B
> >>>>> log but looks like pastebin is down. Ok to send the log as
> attachment ?
> >>>>
> >>>> http://alternativeto.net/software/pastebin/
> >>>>
> >>>>>
> >>>>> On Tue, Jan 12, 2016 at 9:16 AM, Khem Raj <raj.khem@gmail.com>
> wrote:
> >>>>>
> >>>>>>
> >>>>>>> On Jan 11, 2016, at 11:25 AM, Ankur Tyagi <ankur.tyagi85@gmail.co=
m
> >
> >>>>>> wrote:
> >>>>>>>
> >>>>>>> included stdint.h in qnetworkinfo_linux.cpp but still getting the
> >> same
> >>>>>> error
> >>>>>>
> >>>>>> what version of gcc are you using and can you preprocess the file
> >> under
> >>>>>> error with -E -dD and pastebin it ?
> >>>>>>
> >>>>>>>
> >>>>>>> On Mon, Jan 11, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.com>
> >> wrote:
> >>>>>>>
> >>>>>>>> On Mon, Jan 11, 2016 at 10:37 AM, Ankur Tyagi <
> >>>> ankur.tyagi85@gmail.com>
> >>>>>>>> wrote:
> >>>>>>>>>
> >>>>>>>>
> >>>>>>
> >>>>
> >>
> /home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-to=
olchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
> >>>>>>>>> error: expected identifier before '*' token
> >>>>>>>>> |   return bt_get_unaligned((const uint64_t *) ptr);
> >>>>>>>>
> >>>>>>>> this means that stdint.h is missing from includes.
> >>>>>>>> --
> >>>>>>>> _______________________________________________
> >>>>>>>> Openembedded-devel mailing list
> >>>>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-deve=
l
> >>>>>>>>
> >>>>>>> --
> >>>>>>> _______________________________________________
> >>>>>>> Openembedded-devel mailing list
> >>>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>>>
> >>>>>>
> >>>>>> --
> >>>>>> _______________________________________________
> >>>>>> Openembedded-devel mailing list
> >>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>>>
> >>>>>>
> >>>>> --
> >>>>> _______________________________________________
> >>>>> Openembedded-devel mailing list
> >>>>> Openembedded-devel@lists.openembedded.org
> >>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>
> >>>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

