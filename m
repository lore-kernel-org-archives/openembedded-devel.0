Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OdhtA-0004N2-Dn
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 13:00:02 +0200
Received: by bwz10 with SMTP id 10so3453573bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 03:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ks6tPn9TsWPHEghUM3OrFQicn79sosEFo9qx1DOdLr0=;
	b=KY2rFs+qcxZR5FcpsABZzln1N8YPufPVi2Qappkl8gQfH4ivJ5CJMKzVW1F+uL8J5x
	W58q5MSjZe/yq8sAtA+T7ICbu83pMFWID1YMb2QO99s3E0CQawSf8aa2fAYf+TfwJkxN
	GbuqZvaWjUwzr+6rjwvKg0+9wMeOU/kk0X7xM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DEv9idlpAL8UYwQlnYPvjpByGFC+2oXNpv/ZyKIMS2R222RNfumzWAzjO3Pzq3B/Jh
	qI3QQhOOuFB7XWudB9XMKsf0AzZH77EQSZJYbMrhhpNi/X7tXKkPY4yYfwhUToWHDzaa
	orvROXuWYo4TKRoNUHLhswvjjOu4nGpbrmwOY=
MIME-Version: 1.0
Received: by 10.204.154.66 with SMTP id n2mr6725803bkw.8.1280228385160; Tue, 
	27 Jul 2010 03:59:45 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 27 Jul 2010 03:59:45 -0700 (PDT)
In-Reply-To: <i2mcv4$5a2$1@dough.gmane.org>
References: <AANLkTim5aAnNi5VFs7=-gg1XaM=+KBeUs-G494SEbR+V@mail.gmail.com>
	<AANLkTiks5W-tPf=D=Qo5UZf77ZA2R10=fkw2MmdeWfHc@mail.gmail.com>
	<AANLkTinuoVzs556HmdOx-y1tMd6YB58NgPtoEhqma4HO@mail.gmail.com>
	<AANLkTim1Cps1vdmbxSQGdKvn0WNL3nUB_+9bEu1SpN9R@mail.gmail.com>
	<i2mcv4$5a2$1@dough.gmane.org>
Date: Tue, 27 Jul 2010 12:59:45 +0200
Message-ID: <AANLkTime_AUx8t=mDTSSBAQe9q8cHXt=kbKUasAoADWW@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] get rid of legacy staging
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
X-List-Received-Date: Tue, 27 Jul 2010 11:00:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/27 Koen Kooi <k.kooi@student.utwente.nl>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 27-07-10 12:19, Frans Meulenbroeks wrote:
>
> > Bringing the thread back to the topic:
> > I see no real interest into tackling removal of old style staging (or old
> > native recipes).
>
> It's hard to tackle that when OE is so broken you can't build anything,
> as it is now due to the cross dir changes.
>

Au contraire!
This is an opportunity!

actually I think one of the easy things is removing do_stage functions that
only do an autotools_stage_all.
This is one (if done with some care) that does not seem to need extensvie
testing.
There are 400+ of them, but I seem to recall someone already did a patch for
this.

Frans


> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMTrcjMkyGM64RGpERAqQyAJwLPNi6KtWSbPapnVOgwcZA4yz3lwCfb6l9
> vDgKnV1RO8s78ac4b4iFRFY=
> =GLFm
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

