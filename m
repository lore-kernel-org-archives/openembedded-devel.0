Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Ii5GX-0000I3-KY
	for openembedded-devel@openembedded.org; Wed, 17 Oct 2007 11:32:37 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9H96xUx001917 for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2007 11:07:00 +0200
Message-ID: <4715D0B4.7010401@student.utwente.nl>
Date: Wed, 17 Oct 2007 11:07:00 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <200710151419.07302.openembedded@haerwu.biz>	<1192464632.25543.58.camel@localhost.localdomain>	<4713AD5F.3040807@student.utwente.nl>
	<1192478818.25543.108.camel@localhost.localdomain>
In-Reply-To: <1192478818.25543.108.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] Handling of virtual/* namespace in packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2007 09:32:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Mon, 2007-10-15 at 20:11 +0200, Koen Kooi wrote:
>> Richard Purdie schreef:
>>> So perhaps we should just standardise the existing xserver behaviour
>>> into a dedicated namespace:
>>>
>>> DEPENDS = "virtual/xserver"
>>> RDEPENDS_xyz = "${VIRTUAL-RUNTIME_xserver}"
>>>
>>> and the machine.conf in this case would say
>>>
>>> PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
>>> VIRTUAL-RUNTIME_xserver = "xserver-kdrive-fbdev"
>> We have the ${XSERVER} var for runtime selecting it:
> 
> Indeed. So what should we use for update-alternatives,
> ${UPDATE-ALTERNATIVES} ? My point was that this is going to keep biting
> us and a dedicated namespace might make sense?

I'd say we copy the VIRTUAL-RUNTIME (note the OEDEM hyphen :) ) from poky for kdrive and
u-a. Any objections?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHFdCzMkyGM64RGpERAjzzAJ9NO/OysPMsAvQwoTShIhPawLm1sgCginm5
qL4BSJa9aw9FMgt7p3vzChk=
=pzAm
-----END PGP SIGNATURE-----


