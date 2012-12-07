Received: from 19.mo3.mail-out.ovh.net ([178.32.98.231]
	helo=mo3.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Th3IP-00077m-Ns
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Dec 2012 20:09:13 +0100
Received: from mail91.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 3D591FF97FC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Dec 2012 19:27:04 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 7 Dec 2012 20:15:19 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 7 Dec 2012 20:15:17 +0200
Date: Fri, 7 Dec 2012 19:15:16 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.3 (mo3.mail-out.ovh.net)
Message-ID: <20121207191516.072c6bf1@eb-e6520>
In-Reply-To: <50C228F8.6060805@mlbassoc.com>
References: <50C228F8.6060805@mlbassoc.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 3617797877395139913
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehiedrtdejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehiedrudeiucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
Subject: Re: modphp
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
X-List-Received-Date: Fri, 07 Dec 2012 19:09:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Le Fri, 07 Dec 2012 10:35:52 -0700,
Gary Thomas <gary@mlbassoc.com> a =E9crit :

> I just tried to build modphp_5.3.19.bb for my ARM target.
>=20
> It seems that the make is using the wrong tools (or libraries),
> as it fails with this error:
>    | /usr/lib/libbz2.so: could not read symbols: File in wrong format
>    | collect2: error: ld returned 1 exit status
>    | make: *** [libphp5.la] Error 1
>=20
> Any ideas how to make this work?  Has it ever been built/tested
> for a cross target?  I can see that the cross paths for libz and libbz2
> are being passed to the configure step, but they don't seem to be reflect=
ed
> in the actual link step when making the modphp.so library.
>=20
it was build and run tested here on an ARM target before sending the
patches.

Eric


