Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Os9g4-0005ts-4G
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Sep 2010 09:30:13 +0200
Received: by iwn2 with SMTP id 2so3027515iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Sep 2010 00:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nCqliTeL++0cPoWEO47rkuPfqtx/s7tsgMj4CU41xbM=;
	b=LjpMDheWQotCdJYwwyW5vr69aMU5PlkNCEdNk2JlaBB2tm+nVGBpoS6dZN2/r2oy+m
	/+pwx/Z3Xwlx7MFRIEnFkdmroyTt+xq7o6oBPYbvcMC3QO3t6J8UM5oD2Duhgg9RJ4Xf
	JVeXUYxtunW8oVrCz9Pb/ij0U6kkIj9g0s+Pk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sF1F7jFUxMn4gL9X5grEpFfos3VGo5Wb7V8+Jl/VeJLDh1emHTxRrI9k2JRLMxfEcF
	AH/KF39ICdhlKrqXexNto9FY4wPGgu8hNFL2u0qZhFKsp8vLAggHBBMUlTFCY+vK2bpY
	H+LEMbKAOLZMar0H8sC4Vvwiph+YakOnicxc0=
MIME-Version: 1.0
Received: by 10.231.30.75 with SMTP id t11mr3902006ibc.27.1283671774873; Sun,
	05 Sep 2010 00:29:34 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sun, 5 Sep 2010 00:29:34 -0700 (PDT)
In-Reply-To: <AANLkTik9cPFigtKTfvG8pqA7mib0XT0kk6wDpiKX-7=o@mail.gmail.com>
References: <AANLkTinFXpPdAkd79h94z70m_8MbamLd48pzR4sLQs34@mail.gmail.com>
	<alpine.LNX.2.00.1008301851400.5745@asterix.crazy-teaparty.dyndns.org>
	<AANLkTimOpx8UcC3F0e+OVggMGSA6e_DK3GdM1g+nXo2=@mail.gmail.com>
	<AANLkTik9cPFigtKTfvG8pqA7mib0XT0kk6wDpiKX-7=o@mail.gmail.com>
Date: Sun, 5 Sep 2010 09:29:34 +0200
Message-ID: <AANLkTimDgaRskABo4j=KKGGEOryLkqB94z5Zs+AxrBQG@mail.gmail.com>
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
Subject: Re: [RFD] increased dependency checking
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
X-List-Received-Date: Sun, 05 Sep 2010 07:30:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/4 Chris Larson <clarson@kergoth.com>:
> On Mon, Aug 30, 2010 at 10:28 AM, C Michael Sundius <msundius@sundius.com=
>wrote:
>
>> I have been using a addition that I made to the stamp policy a while ago=
.
>> I sent it to the OE list and the bitbake list but I don't think that it =
was
>> ever adopted,
>> eventhough I *think* that I got one or two positive replies to it:
>>
>> http://article.gmane.org/gmane.comp.handhelds.openembedded/29858/
>>
>> I would love to see this patch added to bitbake so I don't have to keep =
it
>> around
>> in my repository.
>>
>> do any of you have any ferther comments?
>>
>
> Hmm, should it always be used, the way the patch does currently, or shoul=
d
> it be more the way the whitelist is done, where it only affects for
> fulldeptree? =A0I'm not opposed to this going into bitbake, personally.
>
I can't judge on the remarks from Chris on the implementation.
The patch from Michael does look sound to me, but I have never looked
at the whitelist code.
The only thing missing in Michaels patch is some documentation on
these nwe vars.

Frans


