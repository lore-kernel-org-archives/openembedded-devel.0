Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1P6gEr-000768-JB
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 11:06:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 0F7342C7E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 09:05:11 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id clMmqdIgzhaR
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 09:05:06 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 40C1D2C7D5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 09:05:06 +0000 (UTC)
Message-ID: <4CB81961.4050104@gmail.com>
Date: Fri, 15 Oct 2010 11:05:37 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201010151039.08619.marcin@juszkiewicz.com.pl>
In-Reply-To: <201010151039.08619.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: remove old kernels
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
X-List-Received-Date: Fri, 15 Oct 2010 09:06:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz ha scritto, Il 15/10/2010 10:39:
> Hi
>=20
> recipes/linux/ contains 235 recipes. I would like to propose cleaning:
>=20
> 1. drop 2.4 kernels - if someone still needs them then .oz354x and .sta=
ble
>    branches have them.
>=20

I agree.



> 2. Drop kernels older then 2.6.20 - it was over 3 years ago so if someo=
ne uses=20
>    older one then probably also uses 3 years old OE.=20
>=20
> This may affect (checked recipes):
>=20
> - ep93xx - machines with this cpu are mainline supported, patches from =
ts72xx
>   and sim.one works
> - chumby
> - compulab-pxa270
> - devkitidp-pxa255
> - fsg3
> - gumstix
> - amsdelta
> - bd-neon
> - colinux
> - epia
> - geodelx
> - h1940
> - h6300
> - ks8695
> - magicbox
> - mtx-3
> - neuros
> - sun4cdm
> - tornado-omap2
> - wrap-geode
> - x86
> - acern30
> - logicpd-pxa270
> - mainstone
> - mx21ads
> - netbook-pro
> - triton
> - blueangel
> - universal
>=20
> Some of those machines are not maintained anymore, many of them should =
work=20
> with current mainline kernels. If someone cares about anything on a lis=
t -=20
> raise your hand.

IMHO many of those machines are still a useful starting point for a lot
of people.
Moreover lots of PXA2x0 based board are unfortunately still using them.


I vote to keep them a bit longer.



Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com


