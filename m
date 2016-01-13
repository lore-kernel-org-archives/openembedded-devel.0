Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3A88F601A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 01:22:36 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id a123so223028384vkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 17:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=RmEUFBGAdW+TeWW4UUhGvezJOH7D3SSq5kAffgP7pko=;
	b=Ig4/wWcuODDsxl+VhhIhX/J0Py/FBypggY8Sm0LUdCllbGALQn7NyAjJYO0B3Jz7df
	eZNEvLgBW2QjGiTiEPTUgRRkh4xQDjdXydrt8Pyrx/S8BAVI44CvSh+LMCDwzP0ifYG5
	b/BfGp+zZDPLvRIVCckqJ82bE795yZvTsmKZu+y97Eg8pYea1m87L9eSWaXD0xTRpgGg
	G/jkm6yhypEU7lV/nUvkJH1yoLAb1Fxly8fxs6q4C1a2aAQQ5/DQuQp92CgQidKX8Y6O
	p7uwnr7I0e5T257zCMJX1zXwDtrl2QQhkHnYM6Jmt+Q3f5rm+FeG5zK6nJSg32yEcaF1
	PCzg==
X-Received: by 10.31.48.132 with SMTP id w126mr4855249vkw.5.1452648157180;
	Tue, 12 Jan 2016 17:22:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Tue, 12 Jan 2016 17:22:17 -0800 (PST)
In-Reply-To: <BFC78264-0398-49A7-8C37-DA2958AA5BD7@gmail.com>
References: <CADySD0EiW1oO_wezsLtEFX8h2V-ByykrgfSvOvGLJJLWyrm4uw@mail.gmail.com>
	<CAMKF1sqmg8gOj3_jjJTGebJQj+msh5tquKnOOV8zwShJtoHaUA@mail.gmail.com>
	<CADySD0Fx+VpoaPNgFSwvne6D1ENxH=F-v4cpSJmjRtc2rpkS2A@mail.gmail.com>
	<90CBA3E6-A9A9-4485-ADAB-2D68D6E88E40@gmail.com>
	<CADySD0GQa+S1OY0R9KaQxJ_EFYB+TRJociEszuuFWW_7dO0JYA@mail.gmail.com>
	<BFC78264-0398-49A7-8C37-DA2958AA5BD7@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 13 Jan 2016 14:22:17 +1300
Message-ID: <CADySD0GV+gsBBoU7vFVZwfNxiVUDawzrP5L3n=4ZXuUPhyr6yg@mail.gmail.com>
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
X-List-Received-Date: Wed, 13 Jan 2016 01:22:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

thanks

here it is.. https://gist.github.com/anonymous/a03e9fb2203e45a4b033

On Wed, Jan 13, 2016 at 1:44 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Jan 12, 2016, at 4:39 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> wrote:
> >
> > sorry it took me a while to reply.
> >
> > I am using gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.
> >
> > I have preprocess
> > =E2=80=8B =E2=80=8B
> > =E2=80=8B=E2=80=8B
> > log but looks like pastebin is down. Ok to send the log as attachment ?
>
> http://alternativeto.net/software/pastebin/
>
> >
> > On Tue, Jan 12, 2016 at 9:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >>
> >>> On Jan 11, 2016, at 11:25 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> wrote:
> >>>
> >>> included stdint.h in qnetworkinfo_linux.cpp but still getting the sam=
e
> >> error
> >>
> >> what version of gcc are you using and can you preprocess the file unde=
r
> >> error with -E -dD and pastebin it ?
> >>
> >>>
> >>> On Mon, Jan 11, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.com> wrote=
:
> >>>
> >>>> On Mon, Jan 11, 2016 at 10:37 AM, Ankur Tyagi <
> ankur.tyagi85@gmail.com>
> >>>> wrote:
> >>>>>
> >>>>
> >>
> /home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-to=
olchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
> >>>>> error: expected identifier before '*' token
> >>>>> |   return bt_get_unaligned((const uint64_t *) ptr);
> >>>>
> >>>> this means that stdint.h is missing from includes.
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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

