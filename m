Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1Jf682-0003cy-BN
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 05:23:46 +0100
Received: (qmail 7262 invoked by uid 813007); 28 Mar 2008 04:23:45 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 28 Mar 2008 04:23:45 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Mar 2008 05:23:48 +0100
User-Agent: KMail/1.9.9
References: <1206638249.4514.57.camel@dax.rpnet.com>
	<47EC2661.90702@bolloretelecom.eu>
	<20080327230928.GD11881@smtp.west.cox.net>
In-Reply-To: <20080327230928.GD11881@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200803280523.49244.openembedded@haerwu.biz>
Subject: Re: ipkg/opkg offical response
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
X-List-Received-Date: Fri, 28 Mar 2008 04:23:46 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Friday 28 of March 2008, Tom Rini napisa=B3:
> > I changed the DEPENDS to u-boot-mkimage-openmoko-native in
> > kernel.bbclass and removed the DEPENDS from linux.inc. The assumption
> > here is that u-boot-mkimage-openmoko-native is a strict superset of
> > u-boot-mkimage-native.
>
> I'll ask the silly qustion. =A0Given that mkimage hasn't changed in I
> don't know how long, why are both providing it? =A0Just to save on
> sources downloaded? =A0Did OM really change mkimage?

It was other way. We had u-boot recipes (target ones) which staged=20
mkimage. This was wrong as it mixed target and host in one run. Then=20
Openmoko guys started to use u-boot and one day someone created recipe=20
just for mkimage from their overpatched version.

u-boot-mkimage-native was created by me in Poky few days ago to get rid of=
=20
overpatched Openmoko version. I used 1.3.2 (latest upstream) version as a=20
base. Now I see that u-boot-tools-native (1.2.0) is in OE and do the=20
same.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

          Monday is a hard way to spend one-seventh of your life.




