Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <g.eismann@gmx.net>) id 1MDuqm-0003TR-Tj
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jun 2009 08:30:25 +0200
Received: (qmail invoked by alias); 09 Jun 2009 06:20:49 -0000
Received: from 97.70.222.87.dynamic.jazztel.es (EHLO inferno.localnet)
	[87.222.70.97]
	by mail.gmx.net (mp060) with SMTP; 09 Jun 2009 08:20:49 +0200
X-Authenticated: #21729387
X-Provags-ID: V01U2FsdGVkX1+6oxVq1Fy6A1EEr3lnguIjxshwl4jPKAl1mjniAS
	4jNgZM4ZhCHgKK
From: "G. Eismann" <g.eismann@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 9 Jun 2009 08:20:43 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.28-11-generic; KDE/4.2.4; i686; ; )
References: <loom.20090609T035246-124@post.gmane.org>
In-Reply-To: <loom.20090609T035246-124@post.gmane.org>
MIME-Version: 1.0
Message-Id: <200906090820.43460.g.eismann@gmx.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.59
Subject: Re: BitBake error: "python-native_2.6.1.bb failed"
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
X-List-Received-Date: Tue, 09 Jun 2009 06:30:27 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Martes 09 Junio 2009 06:01:44 Nikolas escribi=F3:
> Hello all,
>
> Just started with OE, trying to build first Angstrom distro. After 470
> tasks completed, bitbake fails as follows:


> Compiling /home/nicolae/overo-oe/tmp/work/i686-linux/python-native-2.6.1-
> ml3.1/temp-staging/home/nicolae/overo-oe/tmp/staging/i686-
> linux//usr/lib/python2.6/zipfile.py ...
> make: *** [libinstall] Error 1
> FATAL: oe_runmake failed
>
> Can anybody help, please.

I dont know about the error, but you can use your native python installed i=
n=20
your system adding this line to build/conf/local.conf:
ASSUME_PROVIDED +=3D "python-native"


=2D-=20
  - Eismann -


