Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Nr4Sg-0000hI-TM
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 08:11:43 +0100
Received: from [10.213.1.226] (tmo-098-162.customers.d1-online.com
	[80.187.98.162])
	by drlauer-research.com (Postfix) with ESMTP id A964D584166
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 08:09:44 +0100 (CET)
References: <1268609353-31224-1-git-send-email-ulf.samuelsson@atmel.com>
	<201003150733.48704.marcin@juszkiewicz.com.pl>
	<4B9DD9D9.90909@atmel.com>
Message-Id: <EC8EBEF5-F51C-42B7-8752-074F2D3620CE@vanille-media.de>
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <4B9DD9D9.90909@atmel.com>
X-Mailer: iPhone Mail (7D11)
Mime-Version: 1.0 (iPhone Mail 7D11)
Date: Mon, 15 Mar 2010 08:09:35 +0100
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_BL_SPAMCOP_NET autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/1] alsa-state: Add support for at91 boards
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
X-List-Received-Date: Mon, 15 Mar 2010 07:11:43 -0000
Content-Type: text/plain;
	charset=utf-8;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: quoted-printable

Some distros - e.g. Minimal - use the concept of a MACHINE_CLASS which =20=

You define in the machine conf (take a look at htc-msm7.inc or ezx-=20
base) and that can then be used as OVERRIDE.

Cheers,

:M:

Am 15.03.2010 um 07:55 schrieb Ulf Samuelsson =20
<ulf.samuelsson@atmel.com>:

> Marcin Juszkiewicz skrev:
>> Dnia poniedzia=C5=82ek, 15 marca 2010 o 00:29:13 Ulf Samuelsson =
napisa=C5=82=20
>> (a):
>>> Add ALSA configuration files for at91 boards
>>
>> Add bump PR of alsa-state and I will push such version.
>>
>> Regards,
> OK.
>
> Base on your comment on linux, I will change to have a common =20
> directory
> as well, but is there a smarter way?
>
> What I'd often like to do is to have one directory
> for a group of machines.
>
> So instead of:
> ++++++++++++++++++++++++++
> FILES_XXX =3D " <Something> "
>
> SRC_URI_at91sam92620ek =3D ${FILES_XXX}
> SRC_URI_at91sam92621ek =3D ${FILES_XXX}
> SRC_URI_at91sam92623ek =3D ${FILES_XXX}
> ------------------------
> I'd like to do:
> -----------------------------
> SRC_URI_at91 =3D " <Something> "
> +++++++++++++++++++++++++++++
>
> --=20
> Best Regards
> Ulf Samuelsson
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


