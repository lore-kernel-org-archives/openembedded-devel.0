Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Rzbl5-0007xW-0u
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 23:30:59 +0100
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id D6C45A618D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 23:22:38 +0100 (CET)
Date: Mon, 20 Feb 2012 23:22:37 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120220232237.39546d3f@eb-e6520>
In-Reply-To: <4F429115.3070907@opendreambox.org>
References: <1329745909-21013-1-git-send-email-eric@eukrea.com>
	<4F429115.3070907@opendreambox.org>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [meta-oe] vsftpd: add new package
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
X-List-Received-Date: Mon, 20 Feb 2012 22:30:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

Le Mon, 20 Feb 2012 19:29:41 +0100,
Andreas Oberritter <obi@opendreambox.org> a =E9crit :
> On 20.02.2012 14:51, Eric B=E9nard wrote:
> > - imported 2.0.5 from oe-classic
> > - upgrade to 2.3.5 which is latest stable
> > - tested on ARMv5 with Angstrom
>=20
> I created a recipe for vsftpd, too. Here's my version for your=20
> reference. All patches were taken from the Debian or Ubuntu package.
>=20
> It differs from your recipe in these ways:
> - uses openssl
> - uses pam if available
> - uses xinetd

I'm not sure that depending on xinetd is a good point, I've no strong
opinion concerning the other points (except I don't need openssl, pam
& xinetd in my image in the project where I'm using vsftp).

> - allows to set custom default configuration options in bbappends

Isn't that also possible by simply providing a custom vsftpd.conf in
the project's layer ?

Eric
--=20
http://eukrea.com/en/news/104-2012


