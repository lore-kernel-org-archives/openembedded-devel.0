Received: from 14.mo4.mail-out.ovh.net ([46.105.40.29]
	helo=mo4.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TcwJH-00008G-8c
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 11:53:07 +0100
Received: from mail413.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 286D21050061
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 11:38:56 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 26 Nov 2012 12:30:59 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 26 Nov 2012 12:30:57 +0200
Date: Mon, 26 Nov 2012 11:30:56 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.4 (mo4.mail-out.ovh.net)
Message-ID: <20121126113056.6385c072@eb-e6520>
In-Reply-To: <50B3440E.9080600@communistcode.co.uk>
References: <1353864310-20097-1-git-send-email-eric@eukrea.com>
	<1353864310-20097-7-git-send-email-eric@eukrea.com>
	<50B3440E.9080600@communistcode.co.uk>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.1 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 4963248264988306761
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehgedrvdehucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehhihgrfigrthhhrgdqfigvsghsvghrvhgvrhdrohhrghenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehgedrvdehucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehhihgrfigrthhhrgdqfigvsghsvghrvhgvrhdrohhrghenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
Subject: Re: [meta-webserver][PATCH 7/7] hiawatha: add CONFFILES and a php example
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
X-List-Received-Date: Mon, 26 Nov 2012 10:53:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Jack,

Le Mon, 26 Nov 2012 10:27:26 +0000,
Jack Mitchell <ml@communistcode.co.uk> a =E9crit :

> On 25/11/12 17:25, Eric B=E9nard wrote:
> > +    # configure php-fcgi to have a working configuration
> > +    # by default if php is installed
> > +    echo "Server =3D ${bindir}/php-cgi ; 2 ; 127.0.0.1:2005 ; nobody:n=
obody ; ${sysconfdir}/php/hiawatha-php5/php.ini" >> ${D}${sysconfdir}/hiawa=
tha/php-fcgi.conf
> >   }
>=20
> Looks good to me, thanks for the improvements Eric!
>=20
I still have to find a good way to provide a default=20
${sysconfdir}/php/hiawatha-php5/php.ini and launch php-fcgi in the init
script if php is enabled.
Do you think we could provide the file php.ini in the hiawatha recipe
(as hiawatha's doc recommends setting some options :
http://www.hiawatha-webserver.org/howto/php_configuration ) ?

Eric


