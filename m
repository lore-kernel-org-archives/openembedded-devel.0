Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OOQXo-0001l1-Ik
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 09:26:49 +0200
Received: by bwz14 with SMTP id 14so2696670bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jun 2010 00:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=e0sajYb50CCwLqVSF4Ue88EIqkRZkwbB4kjWrVvFXMA=;
	b=MQxj+eUcmyR03ZpgejAsuXO4JyXAWJ4juzu59kaEgTUbjLv70Uov3cUbN5gt/FzyKb
	e0T9hujrEFP+TAoxfwLtyqK4H/U+S4Rc903gISdK/Dx+M8ghxHqP+meXip1i6yAP97XK
	J6qqndDBvAV4+2TIAEeIIU+++bKLEe8olKUm8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=JF1E4aOm9FqxkDg98GH2HJLfkpMe/XloNE9iaU35kguZTip9HvjGq5Of5STrwjgJRk
	jFgt/rb6nWDVzumJrbq2lGvDXGPYQBPA+h+QBl0RUhgsyRoY0Wz1vCtwB9pYVqMX7YAV
	i1W64vQm+jXRq6rK14+ZrkhJI/NtIPdGoJTkY=
MIME-Version: 1.0
Received: by 10.204.39.208 with SMTP id h16mr5074971bke.170.1276586542640; 
	Tue, 15 Jun 2010 00:22:22 -0700 (PDT)
Received: by 10.204.119.12 with HTTP; Tue, 15 Jun 2010 00:22:22 -0700 (PDT)
In-Reply-To: <201006150815.32214.superaorta@gmail.com>
References: <201006150815.32214.superaorta@gmail.com>
Date: Tue, 15 Jun 2010 09:22:22 +0200
Message-ID: <AANLkTimDzDDrBFuMU3HmMSBPblt5bK0HmCOnDbGruvPc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: comedi / angstrom
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
X-List-Received-Date: Tue, 15 Jun 2010 07:26:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/6/15  <superaorta@gmail.com>:
>
> I would like to build comedi (www.comedi.org) for my beagle board. From the
> instructions for comedi, "you will need to havea correctly configured Linux
> kernel source tree".
>
> I have built comedi on many platforms without trouble but I'm completely lost
> in Angstrom - I have the kernel source (2.6.29 from kernel.org) but I don't

If you are lost in Angstrom better mail to the angstrom mailing list :-)

> know where to find the config files. I have done this on and x86 host:
> http://www.angstrom-distribution.org/building-angstrom
>
> I don't fancy building comedi using bitbake because I have not the slightest

if you do not want to use bitbake the openembedded mailing list does
not seem to be the proper place to ask questions, as all of oe uses
bitbake.

> idea how to adapt it to this purpose. The easiest thing seems to me is to
> find the correctly configures kernel source and config files and install them
> on the beagleboard then build comedi locally.

bitbake virtual/kernel will build a kernel for you, you might be lucky
copying over that kernel.
>
> Any advice? overwhelmed and stuck here.
>
> Cheers,
>
> SA
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


