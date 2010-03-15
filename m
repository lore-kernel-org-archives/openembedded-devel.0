Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Nr4Fs-0006Jq-8w
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 07:58:24 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id EA06B14F21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 07:55:22 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AkIXAN52nUtT4zvyPGdsb2JhbAAHgwWXbAEBAQE3pwuPA4Eygl9qBA
X-IronPort-AV: E=Sophos;i="4.49,641,1262559600"; d="scan'208";a="50226083"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 15 Mar 2010 07:55:22 +0100
Message-ID: <4B9DD9D9.90909@atmel.com>
Date: Mon, 15 Mar 2010 07:55:21 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268609353-31224-1-git-send-email-ulf.samuelsson@atmel.com>
	<201003150733.48704.marcin@juszkiewicz.com.pl>
In-Reply-To: <201003150733.48704.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 62.127.194.20
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
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
X-List-Received-Date: Mon, 15 Mar 2010 06:58:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz skrev:
> Dnia poniedzia=C5=82ek, 15 marca 2010 o 00:29:13 Ulf Samuelsson napisa=C5=
=82(a):
>> Add ALSA configuration files for at91 boards
>=20
> Add bump PR of alsa-state and I will push such version.
>=20
> Regards,=20
OK.

Base on your comment on linux, I will change to have a common directory
as well, but is there a smarter way?

What I'd often like to do is to have one directory
for a group of machines.

So instead of:
++++++++++++++++++++++++++
FILES_XXX =3D " <Something> "

SRC_URI_at91sam92620ek =3D ${FILES_XXX}
SRC_URI_at91sam92621ek =3D ${FILES_XXX}
SRC_URI_at91sam92623ek =3D ${FILES_XXX}
------------------------
I'd like to do:
-----------------------------
SRC_URI_at91 =3D " <Something> "
+++++++++++++++++++++++++++++

--=20
Best Regards
Ulf Samuelsson



