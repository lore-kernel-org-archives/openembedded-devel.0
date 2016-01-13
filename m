Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id C116673176
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 01:37:32 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id i129so115326550vkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 17:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=7n79KGW93DmQZbQfEN7B7jRpu2whYa1Wr5L+rQ+duJA=;
	b=nOrvszJZnRiGgc0h/1ud8KBFW7zrCRmKnYV0E9gseIiXsYJk0C1GACNCdYy36c/06P
	8HyqbkfokYvYj5GT9KxLqnEWvQwD8qricgtwTQ1aSVfi1o/OgbG/NHnOsabFtxQqKsdA
	Wzk06EJT1ud4pwVfQhocVNz82pLPJ3vdUjROa+uksSeppU/6Jnt+7k3O1uwS/YvXb9EW
	KFkgPKxxbLl/VJIj0nez/fW36ofoA4+yEUsHttO6O6bTK/zVmpnNmzxdB4XFJdi7nkxw
	S0eaeelkbKnzqwLLnNlXpx2o2gWnx3MlhBhA0GaE7QS65yFWWb3piuhiaYG9ckMxVoY6
	iH8A==
X-Received: by 10.31.151.75 with SMTP id z72mr11030323vkd.104.1452649053523;
	Tue, 12 Jan 2016 17:37:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Tue, 12 Jan 2016 17:37:14 -0800 (PST)
In-Reply-To: <82CDD0BD-1D28-425B-9F1A-99AFFB42CFE5@gmail.com>
References: <CADySD0EiW1oO_wezsLtEFX8h2V-ByykrgfSvOvGLJJLWyrm4uw@mail.gmail.com>
	<CAMKF1sqmg8gOj3_jjJTGebJQj+msh5tquKnOOV8zwShJtoHaUA@mail.gmail.com>
	<CADySD0Fx+VpoaPNgFSwvne6D1ENxH=F-v4cpSJmjRtc2rpkS2A@mail.gmail.com>
	<90CBA3E6-A9A9-4485-ADAB-2D68D6E88E40@gmail.com>
	<CADySD0GQa+S1OY0R9KaQxJ_EFYB+TRJociEszuuFWW_7dO0JYA@mail.gmail.com>
	<BFC78264-0398-49A7-8C37-DA2958AA5BD7@gmail.com>
	<CADySD0GV+gsBBoU7vFVZwfNxiVUDawzrP5L3n=4ZXuUPhyr6yg@mail.gmail.com>
	<82CDD0BD-1D28-425B-9F1A-99AFFB42CFE5@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 13 Jan 2016 14:37:14 +1300
Message-ID: <CADySD0G_vmN=SwZsVRrg5Ko+P_jM6Nvs2UTt0paaqiPcfcM0-Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 13 Jan 2016 01:37:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I posted the complete log file.

I tried with "arm-linux-gnueabihf-gcc -E -dD <filename>"
Maybe it is not enough. I'll try with complete command having include paths
and see if it improves anything.

On Wed, Jan 13, 2016 at 2:29 PM, Khem Raj <raj.khem@gmail.com> wrote:

> /home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-to=
olchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0=
577ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux_p.h:48:26:
> fatal error: qnetworkinfo.h: No such file or directory
>
>
> Please post complete file
>
> > On Jan 12, 2016, at 5:22 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> wrote:
> >
> > thanks
> >
> > here it is.. https://gist.github.com/anonymous/a03e9fb2203e45a4b033
> >
> > On Wed, Jan 13, 2016 at 1:44 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >>
> >>> On Jan 12, 2016, at 4:39 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> wrote:
> >>>
> >>> sorry it took me a while to reply.
> >>>
> >>> I am using gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.
> >>>
> >>> I have preprocess
> >>> =E2=80=8B =E2=80=8B
> >>> =E2=80=8B=E2=80=8B
> >>> log but looks like pastebin is down. Ok to send the log as attachment=
 ?
> >>
> >> http://alternativeto.net/software/pastebin/
> >>
> >>>
> >>> On Tue, Jan 12, 2016 at 9:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>>>
> >>>>> On Jan 11, 2016, at 11:25 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>>> wrote:
> >>>>>
> >>>>> included stdint.h in qnetworkinfo_linux.cpp but still getting the
> same
> >>>> error
> >>>>
> >>>> what version of gcc are you using and can you preprocess the file
> under
> >>>> error with -E -dD and pastebin it ?
> >>>>
> >>>>>
> >>>>> On Mon, Jan 11, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.com>
> wrote:
> >>>>>
> >>>>>> On Mon, Jan 11, 2016 at 10:37 AM, Ankur Tyagi <
> >> ankur.tyagi85@gmail.com>
> >>>>>> wrote:
> >>>>>>>
> >>>>>>
> >>>>
> >>
> /home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-to=
olchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
> >>>>>>> error: expected identifier before '*' token
> >>>>>>> |   return bt_get_unaligned((const uint64_t *) ptr);
> >>>>>>
> >>>>>> this means that stdint.h is missing from includes.
> >>>>>> --
> >>>>>> _______________________________________________
> >>>>>> Openembedded-devel mailing list
> >>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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

