Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OrnzL-0008HA-0o
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Sep 2010 10:20:40 +0200
Received: by iwn2 with SMTP id 2so2236838iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Sep 2010 01:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=CwvEB7ZDjUNZU2SWIzG0Csa/qHN5IzmJ2v+rPp+9BOA=;
	b=VQcAQniEcwOvjbVXlyb/BGxHn9ow1OB2El1y4zqbqF9iDfCc0Apy7cqrKuBOPyOrjs
	4E1A16hiXtS2rnwdnU5gi5nUJATo6HakSRjQ9bMnOhMbaW7E70/UJ474fxX3r4mlGDmO
	kmLT2ys35YCHAp0egVV7ZMOkURgyPF/0y3e/8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=PhkFwYXy/tznqFQnLA2UO91fvBwW/n3cvT/v/gHAvFQCghYSzSasMTdwmAtwNRIlV3
	c0/A+dYb+BfhZSI/h3M1kVQmbytbwDNFr3AoAzPw+Ch8SZ7xYoJdD1IAwIipgqpzqH+h
	nsaCxBRDMjY+z6REawg2D5QtmcUxJ/YkNqVfI=
MIME-Version: 1.0
Received: by 10.231.30.75 with SMTP id t11mr2365511ibc.27.1283588403424; Sat,
	04 Sep 2010 01:20:03 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sat, 4 Sep 2010 01:20:03 -0700 (PDT)
In-Reply-To: <AANLkTim57opnM=fn47pQ-GeNsNbSyydHd3TKSWhdD5z5@mail.gmail.com>
References: <20100903111210.GA17702@game.jcrosoft.org>
	<1283570085-11968-1-git-send-email-plagnioj@jcrosoft.com>
	<AANLkTim57opnM=fn47pQ-GeNsNbSyydHd3TKSWhdD5z5@mail.gmail.com>
Date: Sat, 4 Sep 2010 10:20:03 +0200
Message-ID: <AANLkTikyFRQskds_P9AH+=_km46KEf1cPm-Vq1+MhdhC@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make it global
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
X-List-Received-Date: Sat, 04 Sep 2010 08:20:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/4 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/9/4 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>:
>> add global OVERRIDES ${TARGET_SOC_FAMILY} and ${TARGET_ARCH}_${TARGET_SOC_FAMILY}
>>
>
> What is the rationale for this?
> And why not fix the problem there is in base.bbclass as well.
>
> Frans.
>
Forgot about this, but a variable should go with documentation.
This already has been raised with the orginal patch, but was ignored
by the submitters.

Consider this a NAK.

Frans


