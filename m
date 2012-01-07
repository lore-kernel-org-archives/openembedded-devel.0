Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RjZUw-0005uh-6R
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 17:52:02 +0100
Received: by lami14 with SMTP id i14so810676lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jan 2012 08:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Lv1ooz59XdFn4Y4209Bp5puL+yJ4JkNPxeDulPFht5k=;
	b=H1JCmQx3uYV0+1Wl2NdoEXEyLCWimMID5H2RW8LLg9xTLnun3o2nDn+SURHRYQseDf
	OIcLE960a69fvbnbSiLVXagaLa4aas/XHoCxfDJUF3IBTJoFfCzdxAEnjH8P3EOYdcO5
	iYT8sjOEUTkJyHAT2pqK0z4IxKByMCsZoNZAc=
MIME-Version: 1.0
Received: by 10.112.103.131 with SMTP id fw3mr1923692lbb.78.1325954676759;
	Sat, 07 Jan 2012 08:44:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.48.69 with HTTP; Sat, 7 Jan 2012 08:44:36 -0800 (PST)
In-Reply-To: <CAAQYJAvAypCLck2mpJzoZ3ZF=yMh4gEzcDNnh+W8MbndZguLcg@mail.gmail.com>
References: <1325894128-26110-1-git-send-email-andrea.adami@gmail.com>
	<je8ucj$vub$1@dough.gmane.org>
	<CAP9ODKqFPd2GX6bw1_a0Fi2U+q5=_pcd4=OoHvYjVvPSLNf7RQ@mail.gmail.com>
	<20120107104945.GB3938@jama.jama.net>
	<CAAQYJAtoD4Hzpt2gPMEpw8ii=KT9rHxM0chU-Ag2R+-3MdkrKA@mail.gmail.com>
	<20120107134210.GC3938@jama.jama.net>
	<CAAQYJAvAypCLck2mpJzoZ3ZF=yMh4gEzcDNnh+W8MbndZguLcg@mail.gmail.com>
Date: Sat, 7 Jan 2012 14:44:36 -0200
X-Google-Sender-Auth: 4-M_hc5HsMi-dKwi-U_s-MVPqzo
Message-ID: <CAP9ODKragat4u1TT_Ku8_O-YA2V-QSyGUeuX6h-TH3PtTuOd1A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe] [PATCH] xserver-common: remove extraneous BSP customizations
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Jan 2012 16:52:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jan 7, 2012 at 14:37, Andrea Adami <andrea.adami@gmail.com> wrote:

> > I've already explained to you to use VIRTUAL_RUNTIME vars.
>
> Sorry but this is not enough in order to obtain a core-image-sato with
> working xserver on first run.
> The meta-oe layer is 'toxic' in that regard.


Agreed; that's why I said you could fix x11-common and make it work so we
can drop xserver-common from meta-oe.


> >> 4) xserver-common is an old recipe coming from the oe-classic times,
> >> designed to work with gpe environments and targeting mostly kdrive.
> >> Thius recipe contains alot of BSP code.
> >
> > Yes and those patches you've removed are not making it worse, upstream
> > script contains a lot of BSP code already and those patches are just
> > making it more complete (think about it as patch which should be applied
> > upstream not in BSP layer).
> >
>
> Those patches ought to be sent upstream long agoi...
> I'm sure Florian will apply almost immediately once aware.
>
>
> >> 5) today, if one builds core-image-sato distroless for zaurus qvga
> >> using meta-oe the xserver won't start because of the bad settings
> >> provided by the recipe.
> >
> > see A3).
> >
> >> So, I already sent a msg in that regard before (
> >>
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035564.html
> >> ) and now I'm trying to help cleaning both sides.
> >> The patch for x11-common was taken in oe-core but this one for meta-oe
> >> is unexpectedly under discussion.
> >> BE sure my intentions are not to increase maintenance burden, on the
> >> opposite I'd like neutral/sane defaults and patches to override those
> >> in the BSP layers.
> >
> > burden is to force people to fix recipe which should be removed instead.
> >
>
> This is my last reply to this thread.
> Again I'm sorry to force maintainers of external layers to react and
> make hanges but there is anything wrong with this.
> We did agree the policy of meta-oe is the same of oe-core, thus no BSP
> code is allowed. Stop.
> I'd expect the maintainer agrees.
>

I think you missunderstood it. We are not saying it shouldn't be removed
but we're saying we ought to do that in another way.

This will be removed all together with xserver-common in the move to
x11-common but for this, x11-common need to have the improvements done on
xserver-common merged.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

