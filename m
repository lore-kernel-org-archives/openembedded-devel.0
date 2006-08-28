Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GHddD-0002qX-Aa
	for openembedded-devel@openembedded.org; Mon, 28 Aug 2006 11:42:11 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k7S9eBtB010413 for <openembedded-devel@openembedded.org>;
	Mon, 28 Aug 2006 11:40:12 +0200
Message-ID: <44F2B9FC.6040404@dominion.kabel.utwente.nl>
Date: Mon, 28 Aug 2006 11:40:12 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.5 (Macintosh/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <1156715171.5536.60.camel@localhost.localdomain>
	<200608281131.31893.openembedded@hrw.one.pl>
In-Reply-To: <200608281131.31893.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.94.0.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	k7S9eBtB010413
Subject: Re: What is task-base?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Aug 2006 09:42:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
<snip>


> "wifi" feature need some work too. There are machines which does not ha=
ve=20
> Prism based wifi cards (so no need for hostap-utils) or do not support=20
> WPA (wpa-supplicant is not needed then). h4000 has internal wifi on=20
> ACX100 chipset (iirc) so it need only wireless-tools to have it working=
=20
> (chipset related packages should be listed in machine config).

Which leads to the question: "how should they be listed?". At the moment =
a lot of machines
just put those modules in BOOTSTRAP_*, which isn't going to work for thin=
gs that don't use
task-bootstrap (the =C3=85ngstr=C3=B6m distribution for example). A few w=
eeks ago I introduced the
'BOOT_MODULES' variable for that, should we add that to all machines, or =
is there a nicer
way to do that?

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFE8rn8MkyGM64RGpERAiGoAJ4iZXPJAznbdhOWyvfHrh2vIr01qACfdoWq
E8t878wEV+zh65WYkdNP7X0=3D
=3DYVbQ
-----END PGP SIGNATURE-----


