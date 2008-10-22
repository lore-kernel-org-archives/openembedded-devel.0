Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1KsaGI-0005kq-Je
	for openembedded-devel@openembedded.org; Wed, 22 Oct 2008 11:44:18 +0200
Received: (qmail 27116 invoked by uid 813007); 22 Oct 2008 09:43:52 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Oct 2008 09:43:52 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Oct 2008 11:44:02 +0200
User-Agent: KMail/1.10.1 (Linux/2.6.27; KDE/4.1.2; x86_64; ; )
References: <gdmr6t$iq4$1@ger.gmane.org>
In-Reply-To: <gdmr6t$iq4$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200810221144.04476.openembedded@haerwu.biz>
Subject: Re: [RFC] Moving PACKAGE_EXTRA_ARCHS to include/tune-*
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
X-List-Received-Date: Wed, 22 Oct 2008 09:44:18 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Wednesday 22 of October 2008 11:19:25 Koen Kooi napisa=C5=82(a):

> Currently we set PACKAGE_EXTRA_ARCH in each machine, but nearly all
> entries could get moved to the tune-* files.
>
> So
>
> PACKAGE_EXTRA_ARCHS =3D "armv4 armv4t armv5te armv6 armv7 armv7a"
>
> Will move from beagleboard.conf to tune-cortexa8.conf but it will use
> '+=3D' instead of '=3D' so machines can still do PACKAGE_EXTRA_ARCHS =3D
> "someleetarch"

+1 from me as this should make it easier for people who adds new=20
machines.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://blog.haerwu.biz/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




