Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>)
	id 1Pf7Eh-0000Eq-T3; Tue, 18 Jan 2011 09:48:19 +0100
Received: by wwi17 with SMTP id 17so5780631wwi.24
	for <multiple recipients>; Tue, 18 Jan 2011 00:47:41 -0800 (PST)
Received: by 10.216.55.145 with SMTP id k17mr832066wec.48.1295340460990;
	Tue, 18 Jan 2011 00:47:40 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n1sm2835954weq.31.2011.01.18.00.47.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 18 Jan 2011 00:47:39 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
Date: Tue, 18 Jan 2011 09:47:38 +0100
Message-Id: <BF933EAB-DA94-4C5F-BC91-EF2B45B1B657@dominion.thruhere.net>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
To: openembedded-members@lists.openembedded.org
X-Mailer: Apple Mail (2.1082)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Tue, 18 Jan 2011 08:48:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 jan 2011, om 09:05 heeft Otavio Salvador het volgende geschreven:

> On Tue, Jan 18, 2011 at 05:21, Graeme Gregory <dp@xora.org.uk> wrote:
>> On 17/01/2011 19:01, Frans Meulenbroeks wrote:
>>> - where possible stick to one recipe per package. This reduces the
>>> maintenance work and reduces the QA nightmare of lots of different
>>> permutations.
>>> I feel one recipe per package should be the common case for
>>> applications, and preferably also for libs (although I am well aware
>>> that especially in the latter case multiple versions cannot always =
be
>>> avoided).
>>=20
>> OE is not a distro so this is a non starter already, please don't bog
>> down this discussion by re-opening this again. Angstrom 2008, =
Angstrom
>> 2010, kaelios and slugos are all released distributions with =
different
>> versions of apps just as a starter and they arent even near the total
>> number of distros in OE.
>=20
> I disagree. I think having too many versions of a package just makes
> difficult to get things done:
>=20
> - it increases the amount of maintainence work;
> - has a bigger time to get bugs spoted;
>=20
> Users of old distros ought to use a specific repository and branch.
> Master ought to be kept clean for 'next distro release'.

I've been using yocto for a few months and I *&#(@$*$(*$($@#($@ hate =
their 1 version per recipe policy. Every monday I have a working image =
and every wednesday I have to rebuild from scratch and reevaluate =
because various things got removed and "upgraded". And since my distro =
pin file is in a layer, pinnings don't get noticed.
So instead of "building on top" of the metadata I need to resort to =
"fork" the metadata. And I'm not the only one seeing this problem, the =
yocto autobuilder is almost perputally red :(

Having 10 versions is too much, but having 3 (oldstable, stable, =
development) shouldn't be a problem, especially if they use a common =
.inc file.

Just look at glib-2.0 in yocto. There's only one version, and that's =
2.27.5, which is a development release (odd minor number). That's not =
what I want to use in a distro I need to support, especially looking at =
the huge API changes going into the 2.27 series.

Similar thing for QT, I don't want 4.6.x to suddenly disappear and be =
forced to use 4.7.x. I also don't want to move 4.6.x to a distro layer, =
since QT is way too huge to support on your own.

Or eglibc or gcc or binuils

regards,

Koen=


