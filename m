Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <g.eismann@gmx.net>) id 1LvZQt-0007zs-06
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Apr 2009 17:59:51 +0200
Received: (qmail invoked by alias); 19 Apr 2009 15:55:35 -0000
Received: from 198.70.222.87.dynamic.jazztel.es (EHLO [192.168.1.101])
	[87.222.70.198]
	by mail.gmx.net (mp066) with SMTP; 19 Apr 2009 17:55:35 +0200
X-Authenticated: #21729387
X-Provags-ID: V01U2FsdGVkX19tc6spAn1tE/wlYvVVxzld2BrXBHovote59xCgcx
	9xJT5qRAvE1OJt
From: "G. Eismann" <g.eismann@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Apr 2009 17:55:32 +0200
User-Agent: KMail/1.9.10
References: <200904191354.08027.g.eismann@gmx.net>
	<200904191401.26942.mickey@vanille-media.de>
In-Reply-To: <200904191401.26942.mickey@vanille-media.de>
MIME-Version: 1.0
Message-Id: <200904191755.32769.g.eismann@gmx.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.54
Subject: Re: adding new kernel defconfig
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
X-List-Received-Date: Sun, 19 Apr 2009 15:59:51 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

El Sunday 19 April 2009 14:01:26 Michael 'Mickey' Lauer escribi=F3:
> On Sunday 19 April 2009 13:54:07 G. Eismann wrote:
> > Hi there,
> >
> > I am new with openembedded and I am trying to build a kernel for a new
> > machine.
> >
> > In my machine config file I have these lines:
> >
> > PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> > PREFERRED_VERSION_linux =3D "2.6.25"
> >
> > When I build the kernel, bitake downloads a 2.6.25 kernel: OK
> > But it takes the kernel config from recipes/linux/linux/defconfig
> >
> > I have added my own defconfig file in
> > recipes/linux/linux-2.6.25/mymachine/defconfig but I dont know how to s=
ay
> > bitbake to use it.
>
> If you have set MACHINE=3Dmymachine and are using a DISTRO configuration
> which includes a reasonable set of OVERRIDES; then $MACHINE is included in
> these OVERRIDES; which means, bitbake will copy $MACHINE/defconfig (if
> present) into $WORKDIR.
>

MACHINE is set in my local.conf file.
I've also added a line with DEFAULT_PREFERENCE_mymachine =3D "1" to=20
linux_2.6.25.bb although I am not sure if this is correct.

The DISTRO configuration had no OVERRIDES line. I have copied the OVERRIDES=
=20
line from minimal distro ($MACHINE is included in it), but bitbake is still=
=20
taken the defconfig from linux/defconfig

  - Eismann -
=20


