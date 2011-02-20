Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pr5CQ-0008Kf-4r
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 10:03:26 +0100
Received: by fxm8 with SMTP id 8so616597fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 01:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=z7NyPvtRrrlb/4yK3X4Cv7DzDlp9xz7ztVkJnsddudo=;
	b=RD3o6YmJijtEolIhQPwdX0xmwbohC7X9DrQmsEsUeJ8v1QTMYPmVlwAauLViUvq3Ki
	4ahJJGhRpBvGIM90VBll/B7sU9BP552oPCyjxcH6CP2Mp71wBZ/rOdToh6qH/roXtIjU
	2+NKgCKksIGOae2oLr0l5OOmbwoZC3B+rrMls=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=jC5TI3G8uwQhLsmQJSh/ZoTsQZj2FL+9aBCUp1IIivGdmoTXgTRrXiLPwRzPh5Jp3v
	CRqXKKXQJhwGa7Vyr5D2GIo+CFk8tYgtoESQIKiHWZNrMQsEZ1Tc4hpPAw8LASOi0sne
	G53nPlrYTpoDSbJo//nI1wzDPxtWGbMVCmFdg=
Received: by 10.223.79.74 with SMTP id o10mr232150fak.63.1298192530091; Sun,
	20 Feb 2011 01:02:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Sun, 20 Feb 2011 01:01:50 -0800 (PST)
In-Reply-To: <4D60AC02.2070605@mwester.net>
References: <4D60AC02.2070605@mwester.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Feb 2011 01:01:50 -0800
Message-ID: <AANLkTinxjgtVKeZMj0t_E1JhiDT3iq1ohhHt56wf7JkQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Parsing stalls at libinih
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
X-List-Received-Date: Sun, 20 Feb 2011 09:03:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 19, 2011 at 9:52 PM, Mike Westerhof <mike@mwester.net> wrote:
> Parsing stalled. =C2=A0Debugging shows its stuck on parsing libinih:
>
> PV =3D "0.0+gitr${SRCPV}"
> PKGV =3D "${GITPKGVTAG}"
>
> I think we had decided some time ago that OE recipes were to be nailed
> down in some fashion such that one should be able to parse all the
> recipes, at least, without a network connection.
>
> Have I missed setting something for my distro so that the above lines
> don't have to go to the libinih git repo for every parse?

hmmm the problem seems to be because its using AUTOREV

there are few other recipes which are using autorev
recipes/libinih/libinih_git.bb:SRCREV =3D "${AUTOREV}"
recipes/linux/linux-jlime-ben-nanonote_2.6.36.bb:SRCREV =3D "${AUTOREV}"
recipes/linux/linux-jlime-jornada6xx_2.6.32.bb:SRCREV =3D "${AUTOREV}"
recipes/linux/linux-mini2440_2.6.30+git.bb:SRCREV =3D "${AUTOREV}"
recipes/nonworking/linux/linux-jlime-jornada6xx_2.6.25.bb:SRCREV =3D "${AUT=
OREV}"

I think if AUTOREV are not used in recipes directly
but instead collected in a conf file then this issue
may be avoided.

>
> For now, I've fixed it by masking out that recipe in my local.conf -- I
> have no need for it. =C2=A0Is that the correct solution for recipes that =
do this?
>
>
> Thanks,
> -Mike (mwester)
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


