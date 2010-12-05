Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1PPPpx-0002zM-BU
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Dec 2010 02:25:53 +0100
Received: from [10.1.0.205] (unknown [202.111.50.2])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 525221B10C0E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Dec 2010 01:28:03 +0000 (UTC)
Message-ID: <4CFAE2EB.6080901@freyther.de>
Date: Sun, 05 Dec 2010 01:55:07 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimx+osQLb0Km1pXgQuPEwx3r1-ovhD9um_9p8GV@mail.gmail.com>	<1291133947.3599.16.camel@mattotaupa>	<AANLkTi=DUaiM6LhuWG6MVOntGBu7oikQm9QesD37zRj5@mail.gmail.com>	<4CF56767.3050007@freyther.de>	<AANLkTinp2NUm-WqGA+3n4sufPhMM0mB=dcH+Y-uMZ6Wf@mail.gmail.com>
	<AANLkTi=G2iFhxVK8kg5+rwLq82vVku3UD-CAUOBKrPEw@mail.gmail.com>
In-Reply-To: <AANLkTi=G2iFhxVK8kg5+rwLq82vVku3UD-CAUOBKrPEw@mail.gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DATE_IN_PAST_24_48
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: package request for Phonon-VLC backend
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
X-List-Received-Date: Mon, 06 Dec 2010 01:25:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 12/01/2010 02:57 PM, Sylvain Par=E9 wrote:
> Ok I made some progress!
> Automoc build now ( attached my recipe for it)
> but qt4-plugin-phonon-backend-vlc failed =3D>
> http://tinderbox.openembedded.org/packages/1159577/
>=20

# OE lacks some native qt4 tools, so we use the ones form the host :/

that is not true, the tools are just called a bit differently (a 4 is app=
ened
as there will be probably a Qt5 in the future). You can verify that by lo=
oking
at qt4-tools-native.inc.


This gives you two options... use qdbuscpp2xml4 or add a QMAKE_OE_DBUSCPP=
2XML
..XML2CPP to the config and define it like it is defined for the other va=
riables.

i hope this is helping
	z.


