Received: from [66.39.3.87] (helo=wbm9.pair.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bluelightning@bluelightning.org>) id 1MPECQ-0005zH-A6
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jul 2009 13:23:31 +0200
Received: by wbm9.pair.net (Postfix, from userid 65534)
	id DAB5A88877; Fri, 10 Jul 2009 07:10:38 -0400 (EDT)
Received: from 78.86.188.127 ([78.86.188.127])
	(SquirrelMail authenticated user blueligh@bluelightning.org)
	by webmail9.pair.com with HTTP; Fri, 10 Jul 2009 12:10:38 +0100 (BST)
Message-ID: <3083.78.86.188.127.1247224238.squirrel@webmail9.pair.com>
In-Reply-To: <4A56FEE3.3040604@hlfslinux.hu>
References: <4A49FFF8.6020008@hlfslinux.hu>	<044601c9f9a6$6ef9ecd0$4cedc670$@Willis@Distant-earth.com>	<4A4A7A4C.2000409@hlfslinux.hu>	<200906302319.31632.bluelightning@bluelightning.org>
	<4A56E022.9090705@hlfslinux.hu> <4A56FEE3.3040604@hlfslinux.hu>
Date: Fri, 10 Jul 2009 12:10:38 +0100 (BST)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: angstrom-distro-devel@linuxtogo.org
User-Agent: SquirrelMail/1.4.5
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] Opie image compiles
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
X-List-Received-Date: Fri, 10 Jul 2009 11:23:36 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Zimler Attila Tam=E1s wrote:
> I masked out all bluez4 recipe and it turned out that
> DISTRO_BLUETOOTH_MANAGER is the source for the problem. When I changed
> it from bluez4 to bluez-utils, opie-image compiles correctly. But this
> change is in opposite direction as Koen changed it on 2009. march 31.
> How should we solve this correctly?
>
> I see two possible solution:
> 1) The best would be to migrate opie-image to bluez4, for this I don't
> know if softwares in opie-image are ready for bluez4.
> 2) If the above is impossible then conditionally replace the
> DISTRO_BLUETOOTH_MANAGER in opie-image to bluez-utils. But in this case
> the possibility of forgetting old bluez-utils in opie-image after
> softwares are ready for bluez4 still exists.

I am not yet clear on whether there are issues with using bluez4 together
with Opie, I have not yet tested it (I imagine there probably are problem=
s
- help here would be very welcome). However I will state categorically
that from what I have found checking through the recipes, nothing in Opie
specifically requests bluez3 - it only depends on bluez-libs and
bluez-utils. If bluez4 does not provide both of these then it needs to be
fixed, or at least we should work out the changes to the Opie recipes tha=
t
are needed such that it correctly follows the version selected in the
configuration.

Allow me to rant for a second: this is not the first time that a change
has been introduced into OE that causes severe breakage for other users,
where the person(s) responsible for the change have shown little interest
in sorting out the problems that they have caused. I would hope that
everyone agrees that we should try to minimise (or at the very least
explain clearly) the impact of such changes in the future.

Kind regards,
Paul


