Received: from mail-qy0-f193.google.com ([209.85.221.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OGaW6-00087r-Sq
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 May 2010 18:28:39 +0200
Received: by qyk31 with SMTP id 31so6068999qyk.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 May 2010 09:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=wbEzOfITyGsmExBk/zPyWbbFwuT+whKeUd4cU7Bu6dk=;
	b=OBCGe5BH4LBegLL9JVrkUe3p+dDHWj9kP8N7RMYJUXJqCQBOSipgSQaZpexI6wGWCl
	4YWA7bBGD94joI+2bQ7yhHdVn/bg4YwymxPJ0xyyPiwLqdaksYpxieIn6TQIOINMA82K
	G2zZDZXTyfzzByj6bL5VL2NYCWZn/vBqBDjGE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wSnbN9GKqwD6TAI1nAb5k7Mm7Az6RsZvtIfk4VOjEGU6TpM+nr+v+91updUKP2c+xI
	D1bswdiYqzmezf8pLIOKWffGrgnmVcl+4z/sYZD0JFYUk3sj5G1GnKs84yjGel5hlhaa
	zkE/z9UGc+aUKcA0uxZIzKId5PEU75qixJwnE=
MIME-Version: 1.0
Received: by 10.224.86.156 with SMTP id s28mr3206780qal.73.1274718272334; Mon, 
	24 May 2010 09:24:32 -0700 (PDT)
Received: by 10.229.230.77 with HTTP; Mon, 24 May 2010 09:24:32 -0700 (PDT)
In-Reply-To: <20100524135551.GB9685@excalibur.local>
References: <1273758399-23601-1-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-2-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-3-git-send-email-aalonso00@gmail.com>
	<20100514122113.GH3507@excalibur.local>
	<AANLkTikMtgHDODuAzt-efsFrMyEOUsv6mnrK-14x5LxA@mail.gmail.com>
	<20100524135551.GB9685@excalibur.local>
Date: Mon, 24 May 2010 11:24:32 -0500
Message-ID: <AANLkTilbqiPIctx3KU5gTOBpuIXciedGpObKOCQFeDDe@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.193
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 3/5 v2] linux-xilinx-ml507: update kernel version
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
X-List-Received-Date: Mon, 24 May 2010 16:28:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On Mon, May 24, 2010 at 8:55 AM, Stefan Schmidt
<stefan@datenfreihafen.org>wrote:

> Hello.
>
> On Wed, 2010-05-19 at 09:53, Adrian Alonso wrote:
> >
> > I have been looking on how to reorder the patch,
> > but I'm still a git newbie :( and I don't quite well
> > understand how to regenerate my patch sets with
> > modifying the git log history, what I'm been doing
> > is to create a new branch fix my patchs and resend
> > them, thats clearly wrong.
>
> No, thats good. What I normally do when I prepare a change that will
> contain
> more then 2 patches is that I'm creating a branch for this. If I found a
> bug
> later or people point them out to me in a review I will rework the patches
> in
> this branch and resend.
>
> For the rework process you have a lot tools in git's toolbox, but I agree
> that
> they are are not the easiest ones. Still once I understood them I never
> want to
> miss them again. :)
>
> > Can you remove the patchs send on 2010-04-27 and
> > from the second patch set remove patch 3 and 4;
> > and use the path attached to make git bisec happy.
>
> I'm build testing this combination right now. One question that is still
> open is
> about the USE_VT in your first patch. Why did you comment it out? Something
> like
> this should be mentioned in the changelog.
>
> Yep I forgot to comment why i disable this option, it disables virtual
terminal, i think in
kernel options (not sure); disabling USE_VT I can have xserver running
otherwise fails
config files for machines that have by default graphical support don't
include this option
and i saw that only machines that doesn't have graphical support use this
option to
explicitly disable it.

Since we are in a dynamic architecture where display support can be included
or not
in the hardware model, i think that leaving the option in the config file is
a good idea
and just add some comments mentioning when this option is useful.

Thanks for your help.

regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

