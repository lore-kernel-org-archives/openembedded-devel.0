Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6675F6B206
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 15:25:04 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id s7so503509lbd.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 07:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=NKvfoZI9ofFjfBgPzXHWS5+1m2JqDlFB86eAIdMuniQ=;
	b=ky4De6XKsX9Sdk410UlHcwXvKsfB9GVyzekWU69l+wLuLAUvCYKOvTzOLdpboKEuKg
	IhR7V0Me4ACzuJylkm4N9MR1WHRB6BACnOveGE1vou6wkfOKrr76NYpp9xDG6YPUHmUn
	BXM9kr4ymCxIfZQ0JcwzoI1XFW9vWsWr+7NUSZtiIyNLKAc3gjmkpfz/uTFLU5OrN+1M
	HWnCy334whD+SXBflxo8xzMeTimwApcuHk+tnbXfs0olrSRcKFdXwuLVIa5XS/ra06ng
	xXCMn8jtnFjMZMlgsNqxWJoRAWTyJmdWkUfTY3+SBJKHG2sB5FGYdzx3mJY1Zj/idjHl
	z3Ng==
MIME-Version: 1.0
X-Received: by 10.152.43.130 with SMTP id w2mr327716lal.18.1393341904987; Tue,
	25 Feb 2014 07:25:04 -0800 (PST)
Received: by 10.114.75.130 with HTTP; Tue, 25 Feb 2014 07:25:04 -0800 (PST)
In-Reply-To: <CAMCfZKHDXE+fswg1oFuBqaxHgdAJSuO7-OVX8y_nLwNc7A_Y0Q@mail.gmail.com>
References: <1393310437-18094-1-git-send-email-ticotimo@gmail.com>
	<CAMCfZKHDXE+fswg1oFuBqaxHgdAJSuO7-OVX8y_nLwNc7A_Y0Q@mail.gmail.com>
Date: Tue, 25 Feb 2014 07:25:04 -0800
Message-ID: <CANx9H-B3NW+tUXckkYPLZMFs2G5+P61hMEmTPrbVuGe1fY_W6Q@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH] xbmc: disable rxsx (euphoria)
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
X-List-Received-Date: Tue, 25 Feb 2014 15:25:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Correct. This is a workaround for the euphoria issue (which for me was a
problem with linking, rather than compiling).

Others have been working on a newer upstream branch (Frodo, 12.x).

--Tim


On Tue, Feb 25, 2014 at 3:44 AM, Diego Sueiro <diego.sueiro@gmail.com>wrote:

> Tim,
> On Tue, Feb 25, 2014 at 3:40 AM, Tim Orling <ticotimo@gmail.com> wrote:
>
> > From: Tim Orling <TicoTimo@gmail.com>
> >
> > Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > ---
> >  meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git
> a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bbb/meta-multimedia/recipes-mediacentre/xbmc/
> > xbmc_git.bb
> > index f438a2d..b72a0d5 100644
> > --- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> > +++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> > @@ -35,6 +35,7 @@ PACKAGECONFIG[opengl] =
> "--enable-gl,--enable-gles,glew"
> >  PACKAGECONFIG[openglesv2] = "--enable-gles,--enable-gl,"
> >
> >  EXTRA_OECONF = " \
> > +    --disable-rxsx \
> >      --disable-rpath \
> >      --enable-libusb \
> >      --enable-airplay \
> >
>
>
> Is this a workaround for this issue?
>
> https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg33876.html
>
> Did you tried to fix the euphoria compile error?
>
> Regards,
>
> --
> *dS
> Diego Sueiro
>
> Administrador do Embarcados
> www.embarcados.com.br<
> http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego
> >
>
> /*long live rock 'n roll*/
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

