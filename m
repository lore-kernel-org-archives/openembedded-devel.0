Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OqAPs-0001dd-GM
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 21:53:16 +0200
Received: by gxk2 with SMTP id 2so2263472gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 12:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=xomem8I2NyAhcbDlTlBe61kGMsTqSBo3Wu2mH5NJa6Y=;
	b=INbD+x9Hvc6IkbouvzFHSs2mGvOf4w+IJCl6Xgq1YtCfFahc6EMqsZixQeI/MM0JAe
	MmwNcjQwaC0AkDd6X2ffN3jOdki+chLpGR7AcxWiJU9P/xBV4MnIn/++RGBc96g/WhtI
	QRYsuyvtHj6xYYSpduWJQvKMrS2VUW+LLhM6U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=d0S6IV6t2H7erNeIz6Sj/P99y9h1c9i3TddplKGoujRo4EQvH8Ei06ElwRiCPp0w6R
	J5NBBDAmNgHV3oYu/DVBhDjP43UNm143mWKRcqtpF6batmmBiIlSf0wTGPIIoxmoP+73
	IGfDRLQnQPa6+0694udW74DRodK51hlLOPp+A=
MIME-Version: 1.0
Received: by 10.101.180.40 with SMTP id h40mr5331577anp.50.1283197962846; Mon,
	30 Aug 2010 12:52:42 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Mon, 30 Aug 2010 12:52:42 -0700 (PDT)
In-Reply-To: <4C7C0548.5030803@balister.org>
References: <AANLkTikcbgZQ8EkyCh3a7mby5VbXZ4Hp8bXRORPpZKsY@mail.gmail.com>
	<4C7BF64A.6080408@balister.org>
	<AANLkTikfDN6d8X+OgR0AYRyPM78GXwN_RqFAxp48e9d0@mail.gmail.com>
	<4C7BFB14.2010009@balister.org>
	<AANLkTi=OfvXtUvPcTjSvA=v=jXWWdjixgPQp9201jUpH@mail.gmail.com>
	<4C7C0548.5030803@balister.org>
Date: Mon, 30 Aug 2010 21:52:42 +0200
Message-ID: <AANLkTi=XX_mNEz7eo5BiDL7RoVCC-4q3-RsmA3j0WXfO@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-omap-psp-2.6.32 breaks iscsi-target
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
X-List-Received-Date: Mon, 30 Aug 2010 19:53:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/30 Philip Balister <philip@balister.org>:
> On 08/30/2010 02:49 PM, J. L. wrote:
>>
>> Why is it bad to expect all packages build for all the machine/distro
>> ? I would think that would be a more "ideal" situation especially if
>> its a supported machine and distro
>
> It is not bad. But we have a lot of packages and the people maintaining
> stuff have limited time. Hopefully the TI kernel guys can find a way to fix
> the issue Frans pointed out.
>
> Philip

I understand that people have limited time.

What happened is that I bumped into a problem, I analyzed it and I
reported my findings, and suggested a way to fix it.
I can develop a patch if needed, but before investing time in that, I
would like to learn if there are better/more desirable solutions, and
whether a patch has a fair chance on getting accepted.
(btw I can see some other options, .e.g. maybe a #define could be
added in the .h file, but that is probably less desirable. there are
probably more alternatives)

Frans


