Received: from mail-bk0-f51.google.com ([209.85.214.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UNUPw-0006BK-Gb
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 22:36:24 +0200
Received: by mail-bk0-f51.google.com with SMTP id y8so1070258bkt.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 13:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=R//OCkFG3p00TmC0HS3vKH1ASntLE+YreyHXKLbE+Ws=;
	b=RN+OZeqr4AQoJ7d+8AyVnaQolfdk8rpCjbpGiWhq5cZHmGY1CRcCMDNQQ6Qiq6ZvYK
	crydsV+UK8OLh2oyV/PhnQN3u5bx460/NOy3rWML4mNoPeCuncCvGQd2ZeN1q046tCIE
	IJD8M3LjbWfcyj10vLaZG7zl126tSP3qG73PJVjNXDeIJpygCT8x9OUaA+wtjGwavuX4
	fGRab2LsSHi8zBx9/Bldm6PZoOQVN5y5mcad2SMsA3oQwR7z4/FxG3yZzZepEwY4Bal0
	GBrkJLotYhFnAtdtKOFVz6UszZWJb73mxViRx4ytmXXg1pnyCgHTiMcoKOtw/4K7/APl
	PSdQ==
X-Received: by 10.204.183.8 with SMTP id ce8mr2378123bkb.21.1365020352821;
	Wed, 03 Apr 2013 13:19:12 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id gu14sm3966228bkc.1.2013.04.03.13.19.11
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 13:19:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <515C8C04.3040904@balister.org>
Date: Wed, 3 Apr 2013 22:19:10 +0200
Message-Id: <4A3AFD82-E315-40D4-B21E-4E3005CBE86D@dominion.thruhere.net>
References: <515C5DE6.6040702@pseudoterminal.org> <kjhsve$nqm$1@ger.gmane.org>
	<515C8459.3080005@balister.org>
	<FF0E3122-75E0-47DF-978E-CF9982B94B64@dominion.thruhere.net>
	<515C8C04.3040904@balister.org>
To: Philip Balister <philip@balister.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmiAmVK8x05A3oparTPYElVwf2W3u5qK8G5lciuJhvkc3NTNaUDbU+7wmuD82lujmQsaU5Y
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: New meta-cubox layer
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
X-List-Received-Date: Wed, 03 Apr 2013 20:36:24 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 3 apr. 2013, om 22:07 heeft Philip Balister <philip@balister.org> het =
volgende geschreven:

> On 04/03/2013 03:57 PM, Koen Kooi wrote:
>>=20
>>=20
>> Op 3 apr. 2013 om 21:34 heeft Philip Balister <philip@balister.org> =
het volgende geschreven:
>>=20
>>> On 04/03/2013 02:38 PM, Koen Kooi wrote:
>>>> Op 03-04-13 18:50, Carlos Rafael Giani schreef:
>>>>=20
>>>> Just like https://github.com/naguirre/meta-cubox you're mixing
>>>> DISTRO policy in the machine files by setting the tuning to
>>>> hardfloat. Don't do that. If you want hardfloat, set that in your
>>>> distro config, not in your machine config.
>>>=20
>>> This keeps coming up, but I do not see an answer that works for =
people
>>> creating BSP's that work with just oe-core and a BSP layer.
>>>=20
>>> How are we supposed to set TUNE parameters for this case? And yes,
>>> this case *must* produce useful output.
>>=20
>> Local.conf
>=20
> Fail. This means BSP providers are depending on users to do the right =
thing.

"The right thing"? Is forcing RPM package management "the right thing"? =
Is moving DEPLOY_DIR "the right thing"?

> The BSP should be able to say what it wants

For MACHINE settings yes, for DISTRO settings, no

> and a distro layer needs to
> override the BSP choice for distributions providing binaries for
> multiple machines.

DISTRO settings in a BSP violates the Yocto Compatible rules as well as =
the established OE rules, I don't see why that should get changed.

In this specific case, a BSP can set COMPATIBLE_HOST on the recipes that =
need to be hardfloat.

In OE classic we had an ABI flag to set this globally, in OE-core the =
powers that be force us to set a tune per machine in the DISTRO config. =
The price of progress I guess.


>=20
> Philip
>=20
>=20
>>=20
>>=20
>>=20
>>>=20
>>> Philip
>>>=20
>>>=20
>>>>=20
>>>>=20
>>>> _______________________________________________ Openembedded-devel
>>>> mailing list Openembedded-devel@lists.openembedded.org=20
>>>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>=20
>>>>=20
>>>>=20
>>=20
>>=20



