Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKgbX-0000vL-7D
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 01:19:27 +0100
Received: by gxk2 with SMTP id 2so4823695gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 16:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=NvBrcHs8XC2AOBONEMoUvXBGYGkhOyzNXQVW7hw7llo=;
	b=fHCscRl8ADsuafZwCdOfVJfIXdPpQSze8ZYuaS9TTp3y61bLhnQRiccBDS96jB1+c6
	boz/PL7TWTCyG2goMPAb42OxZxm5phcZGQhyhn9KK7ZpaK27nBtZJlF3Z2UCp6lE+qPZ
	uYwmbCACB8l1kggZ7CIDuy6272hx3zre4s2kY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=P1z2xetj/IVp96iiyeLLjjR2+tEjLAumuBEAMjwVQKusNf5Fnlz40dcJ31bu3eiYRe
	kdaxLYjVpakqCIKCArdnum+zdx640kON3V71N27bVJw6VUSRD2UOHrHZoLjHSXGazLPx
	ParyGOpIiy21ZN8fSEJClcQlq2QmRf1S1hwdw=
Received: by 10.91.51.19 with SMTP id d19mr8173401agk.183.1290471494503; Mon,
	22 Nov 2010 16:18:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Mon, 22 Nov 2010 16:17:54 -0800 (PST)
In-Reply-To: <AANLkTikQLnSYpAF4YivEWQODjHpOdHowndLOkyh3LJAp@mail.gmail.com>
References: <AANLkTimt7_P96yJMtLVd5S8ZOgH-=6VgTny=CezhOJ7P@mail.gmail.com>
	<AANLkTikQLnSYpAF4YivEWQODjHpOdHowndLOkyh3LJAp@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Nov 2010 16:17:54 -0800
Message-ID: <AANLkTikyUr4Kf43w1Mt69BD3=OyuuKx+HuMWWw=do+jU@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: automake-1.11 vs. host $perl_threads
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
X-List-Received-Date: Tue, 23 Nov 2010 00:19:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> It comes from
>
>
> do_configure_prepend () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@['true', 'false'][bb.data.inherits_class=
('native', d)]}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export ac_cv_path_=
PERL=3D"${ac_cv_path_PERL=3D${bindir}/perl}"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> }
>
> test fails...
>

OK what happens if you get rid  of do_configure_prepend fully ?


