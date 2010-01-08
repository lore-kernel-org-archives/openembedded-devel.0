Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NTCuj-0004PS-Bc
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 12:22:00 +0100
Received: (qmail 13774 invoked by uid 813007); 8 Jan 2010 11:19:52 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 8 Jan 2010 11:19:52 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 8 Jan 2010 12:19:09 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc2-00268-g45d28b0; KDE/4.3.4; x86_64; ;
	)
References: <hi5b61$f7h$1@ger.gmane.org>
	<1262896003.2553.266.camel@lenovo.internal.reciva.com>
	<4B46FC81.10006@gefanuc.com>
In-Reply-To: <4B46FC81.10006@gefanuc.com>
MIME-Version: 1.0
Message-Id: <201001081219.09856.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Bump default version for gtk+ to 2.18.3
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
X-List-Received-Date: Fri, 08 Jan 2010 11:22:00 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 8 stycznia 2010 o 10:36:01 Martyn Welch napisa=C5=82(a):

> I've recently had a small problem related to this. All of the kernel
> packages seem to have DEFAULT_PREFERENCE=3D-1, for popular targets this
> isn't a problem, but for less popular ones it was picking the latest
> kernel at D_P=3D-1. Oddly this failed to build for "x86".
=20
> I'd suggest it would be sensible to remove all (or most)
> "DEFAULT_PREFERENCE=3D-1" instances and only use
> "DEFAULT_PREFERENCE-<target>=3Dx" it to increase the preference for
> specific targets, or leave it entirely up to the distributions.

=46or kernels I would ack it. If device is supported by one version then it=
 has=20
D_P_machinename =3D "1" set usually. Some of targets are fine with newer=20
versions out-of-box.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




