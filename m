Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id C63A1601B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 00:39:35 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id i129so114755812vkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 16:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=hbdnUNLWts2MP771hV9NYrpNWw6jZkocvQKrl1hnDG0=;
	b=whnTri/3evkNhrH/pGHIT3zlyBL6JDc7UtifAgiycckCJfVVfdaB8EodtmBFZho1Im
	LMa92GZYu9TPIYpZNLtu4uMn99B1xmwqiuQI4f3VBsw3+njHn989UYxgEwCFnrbacsNu
	gEVoHy02s1A9m7VHysCX9jDqFNtv0W6y9C+MCJoVu8CsCTOooFOuriTPJ0exdPFbO/EK
	e8od0mvNPQ+yFdBtc9xakFUrSjFZjv0CZo8mS/mUbtzUdckJVI3MX61to39gW3YA9pVv
	LwU0GZRFUlGhk7RbdfldY5pjwSMNgcVWIO3aViPJnWLjPTZFVSIIRyvgUSqvmQOZKSck
	dr+A==
X-Received: by 10.31.162.20 with SMTP id l20mr80158890vke.137.1452645575681;
	Tue, 12 Jan 2016 16:39:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Tue, 12 Jan 2016 16:39:16 -0800 (PST)
In-Reply-To: <90CBA3E6-A9A9-4485-ADAB-2D68D6E88E40@gmail.com>
References: <CADySD0EiW1oO_wezsLtEFX8h2V-ByykrgfSvOvGLJJLWyrm4uw@mail.gmail.com>
	<CAMKF1sqmg8gOj3_jjJTGebJQj+msh5tquKnOOV8zwShJtoHaUA@mail.gmail.com>
	<CADySD0Fx+VpoaPNgFSwvne6D1ENxH=F-v4cpSJmjRtc2rpkS2A@mail.gmail.com>
	<90CBA3E6-A9A9-4485-ADAB-2D68D6E88E40@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 13 Jan 2016 13:39:16 +1300
Message-ID: <CADySD0GQa+S1OY0R9KaQxJ_EFYB+TRJociEszuuFWW_7dO0JYA@mail.gmail.com>
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
X-List-Received-Date: Wed, 13 Jan 2016 00:39:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

sorry it took me a while to reply.

I am using gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.

I have preprocess
=E2=80=8B =E2=80=8B
=E2=80=8B=E2=80=8B
log but looks like pastebin is down. Ok to send the log as attachment ?

On Tue, Jan 12, 2016 at 9:16 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Jan 11, 2016, at 11:25 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> wrote:
> >
> > included stdint.h in qnetworkinfo_linux.cpp but still getting the same
> error
>
> what version of gcc are you using and can you preprocess the file under
> error with -E -dD and pastebin it ?
>
> >
> > On Mon, Jan 11, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> On Mon, Jan 11, 2016 at 10:37 AM, Ankur Tyagi <ankur.tyagi85@gmail.com=
>
> >> wrote:
> >>>
> >>
> /home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-to=
olchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
> >>> error: expected identifier before '*' token
> >>> |   return bt_get_unaligned((const uint64_t *) ptr);
> >>
> >> this means that stdint.h is missing from includes.
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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

