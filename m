Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IVjbU-0002hR-Kp
	for openembedded-devel@openembedded.org; Thu, 13 Sep 2007 09:59:12 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8D7trxW001613; Thu, 13 Sep 2007 09:55:53 +0200
Message-ID: <46E8ED0F.5000003@student.utwente.nl>
Date: Thu, 13 Sep 2007 09:55:59 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1189638097.6480.132.camel@localhost.localdomain>
In-Reply-To: <1189638097.6480.132.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Cc: Michael 'Mickey' Lauer <mickey@openmoko.org>
Subject: Re: The ongoing SRCREV saga
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
X-List-Received-Date: Thu, 13 Sep 2007 07:59:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> [This was meant for the OE list and autocomplete didn't quite do what
> I'd intended with the recipients originally, sorry :/]
> 
> There is a certain amount of friction in the community regarding the
> recent SRCREV additions of which I've received my share.
> 
> The concerns are really about how we're using SRCREV in OE rather than
> about the bitbake implementation itself which is an important
> distinction.
> 
> The basic problem is that people view the change as making parsing
> dependent on network access which was never the intent. If people added
> a revision to sane-srcrevs.inc every time they added a SRCREV based .bb
> file we wouldn't have a problem and parsing never would depend on
> network access. I'm living on another planet if I expect that to happen
> in reality though so this approach simply isn't going to work though.
> 
> I'm therefore proposing we change bitbake.conf to read:
> 
> SRCREV = "1"
> 
> This puts an end to network access when a SRCREV hasn't been set in
> sane-srcrevs.inc. Anyone wishing to default to svn head in these cases
> can add this to local.conf (or their distro):
> 
> SRCREV = "${AUTOREV}"

or 'require conf/distro/insane-srcrevs.inc'

> I propose keeping sane-srcrevs.inc for distros to include to have
> meaningful revisions for srcrev based packages.

Angstrom includes it now by default.

> If a distro like openmoko wants to make cutting edge development
> possible I suggest creating a .inc file which sets
> 
> SRCREV-pn-whatever = "${AUTOREV}"

'require conf/distro/include/moko-autorev.inc'

> for the packages they want to make floating.
> 
> I firmly believe that floating SRCREVs should be opt in and these
> changes allow that whilst still letting distros or users make use of
> floating versions. I'd also advise openmoko against making SRCREV =
> "${AUTOREV}" the default and to only make the packages they need
> floating but thats not my call to make :).
> 
> Are there any objections to the above? I'll probably commit this fairly
> quickly if the openmoko devs are agreeable.

Mickey OK'ed it on another list, so I added sane-srcrevs.inc to angstrom. (in)sane-srcrevs
and moko-autorev needs some tweaking, but 90% is there.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG6O0PMkyGM64RGpERAuaOAKCnIGW1yzZu0yh+Qd8vzvDP3LUhWwCdE48L
wR/Y3/kaYE9SPiuKNz0aqas=
=oeJo
-----END PGP SIGNATURE-----


