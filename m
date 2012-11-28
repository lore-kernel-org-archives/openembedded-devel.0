Received: from mo3.mail-out.ovh.net ([178.32.228.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Tdptf-0006R5-7j
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 23:14:23 +0100
Received: from mail632.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 00456FFA4C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2012 19:35:06 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 28 Nov 2012 20:23:46 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 28 Nov 2012 20:23:45 +0200
Date: Wed, 28 Nov 2012 19:23:44 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.3 (mo3.mail-out.ovh.net)
Message-ID: <20121128192344.2ddd9f92@eb-e6520>
In-Reply-To: <50B61D47.7030904@communistcode.co.uk>
References: <1354033003-31657-1-git-send-email-eric@eukrea.com>
	<50B61D47.7030904@communistcode.co.uk>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.1 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 6246774159300734281
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehiedrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehiedrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
Subject: Re: [meta-oe][PATCH 1/3] php: upgrade to 5.3.19
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
X-List-Received-Date: Wed, 28 Nov 2012 22:14:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Wed, 28 Nov 2012 14:18:47 +0000,
Jack Mitchell <ml@communistcode.co.uk> a =E9crit :

> On 27/11/12 16:16, Eric B=E9nard wrote:
> > [snip]
>=20
> Was there a patch to bring this over to meta-webserver too?
>=20
that's WIP based on a previous work by Marcin, I expect to be able to
test that by the begining of next week.

PHP can be used as php-cli so not in a webserver context so maybe the
best way to handle that would be to have php in meta-oe to generate
php-cli and a bbappend in meta-webserver to general php-cgi, php-fpm
and modphp when meta-webserver is enabled.

Eric


