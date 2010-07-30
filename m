Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OexL3-0002xM-CD
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 23:41:59 +0200
Received: by ywe9 with SMTP id 9so829587ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 14:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=mj5M+aMIy42bebmGv+a4QlDPXnuXjhs68HKT4n85e3Q=;
	b=dst5vH07MlGIF5Roqo4cxjjtlhQxep6bm3EFMeNZtixEvA0kmMVwF5tvFpHhfm3nqT
	YgqUa+Y7QUMkXg4onbe5ptkmxC5yE1DhLdfwnaQ3/GdXb+pGs53XdoTPjUFa7eEQiBiI
	fZPTc56nswl689ZVLyyWhfx6r9xri6NbXN1Jg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=iEtDZ34F92KC7xquIEzmkwymDTrOqs0ddNbM6/7UvsVUD9SfIsOoFGLwGhcZMnTjVY
	0Ohtz7iI71m3al112ipK8jh1EtsSThGEJqK+bvXXCSuaWA8vrfXI8mblapJurN/h6KGn
	Fus1YzbzXy4OMd3vXa2mhkE0Yv6aJPBx+I7ec=
Received: by 10.150.48.32 with SMTP id v32mr4029331ybv.115.1280526090282; Fri, 
	30 Jul 2010 14:41:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.7.138 with HTTP; Fri, 30 Jul 2010 14:41:10 -0700 (PDT)
In-Reply-To: <113134CF306E8E4CACC27BE5937261B20931FB4CF0@AUSX7MCPS303.AMER.DELL.COM>
References: <AANLkTilMpRi2oaQWKO7BcgkhZeVojh7GA_-5_3SDG1A4@mail.gmail.com> 
	<113134CF306E8E4CACC27BE5937261B20931AA0A82@AUSX7MCPS303.AMER.DELL.COM>
	<AANLkTikN2OKgSvwW4vQ4h5tegaxdkDmYZpmMK7Fy+a1g@mail.gmail.com> 
	<113134CF306E8E4CACC27BE5937261B20931FB4CF0@AUSX7MCPS303.AMER.DELL.COM>
From: AJ ONeal <coolaj86@gmail.com>
Date: Fri, 30 Jul 2010 15:41:10 -0600
Message-ID: <AANLkTimN2subbRqO5B4CEDPAQy-gd00Z8Up7V+B-suB2@mail.gmail.com>
To: Sean_Hudson@dell.com, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Add a waf bitbake class. (Koen Kooi)
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
X-List-Received-Date: Fri, 30 Jul 2010 21:41:59 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Thanks for your help, I got it working.

http://blog.coolaj86.info/2010/07/26/WAF-on-OpenEmbedded

AJ ONeal

On Tue, Jul 27, 2010 at 10:44 AM, <Sean_Hudson@dell.com> wrote:

>  AJ,
>
>
>
>   Yes, by design, WAF is generally include with the source code.  (see
> this link<http://freehackers.org/~tnagy/wafbook/index.html#_installing_wa=
f_on_a_system>for reference) There is no specification to WAF to cross comp=
ile, rather, it
> will pick up the environment from the OE shell and act accordingly.  One
> additional thought, in order to get the example binary into the package
> correctly, don=92t forget to add a FILES_${PN} directive to your OE recip=
e.
>
>
>
>   Hope this helps!
>
>
>
>     -Sean
>
>
>
> *From:* AJ ONeal [mailto:coolaj86@gmail.com]
> *Sent:* Monday, July 26, 2010 11:12 PM
>
> *To:* Hudson, Sean
> *Subject:* Re: [oe] [PATCH] Add a waf bitbake class. (Koen Kooi)
>
>
>
> I'm trying to get a Hello World example together using bitbake and WAF
>
>
>
> http://blog.coolaj86.info/2010/07/26/WAF-on-OpenEmbedded
>
>
>
> Will you please help me complete this?
>
>
>
> Is WAF supposed to be packaged with the source code?
>
> How do we specify that WAF should cross compile rather than regular
> compile?
>
>
>
> Thanks,
>
>
>
> AJ ONeal
>
> On Thu, Jul 8, 2010 at 1:15 PM, <Sean_Hudson@dell.com> wrote:
>
> It's quite simple.  In the recipe, inherit from the waf class, and you're
> good to go.  One caveat, I didn't see this pulled into OE by one of the
> committers, so be aware that it is not available other than through the
> mailing list...
>
> Sample recipe using the waf class...
>        DESCRIPTION =3D "foo"
>        LICENSE =3D "GPL"
>        SRC_URI =3D ""
>        S =3D "${WORKDIR}/trunk"
>
>        inherit waf
>
> From: AJ ONeal [mailto:coolaj86@gmail.com]
> Sent: Thursday, July 08, 2010 12:42 AM
> To: Hudson, Sean
> Subject: Re: [oe] [PATCH] Add a waf bitbake class. (Koen Kooi)
>
>
> How would I use this patch with something like Node.js, which using waf f=
or
> compiling?
>
> Do you have any sample .bb files that show how this is done? Or any
> documentation?
>
> AJ ONeal
>
>
>

