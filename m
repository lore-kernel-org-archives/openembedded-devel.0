Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M8Xa9-0006Xn-44
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 12:39:03 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M8XSA-0000Vw-7g
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 11:30:48 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fce2a370905250254p4c51b706q399b14d9b0bb20e5@mail.gmail.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243189985-19060-2-git-send-email-ihar.hrachyshka@gmail.com>
	<200905251125.45665.marcin@juszkiewicz.com.pl>
	<fce2a370905250254p4c51b706q399b14d9b0bb20e5@mail.gmail.com>
Date: Mon, 25 May 2009 11:30:26 +0100
Message-Id: <1243247426.4869.23.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH 2/2] udev: moved udevadm to the main udev package
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
X-List-Received-Date: Mon, 25 May 2009 10:39:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 2009-05-25 at 12:54 +0300, Ihar Hrachyshka wrote:
> On Mon, May 25, 2009 at 12:25 PM, Marcin Juszkiewicz
> <marcin@juszkiewicz.com.pl> wrote:
> > Dnia niedziela, 24 maja 2009 o 20:33:05 Ihar Hrachyshka napisa=C5=82(a)=
:
> >> The reason for the move is that udevadm binary is executed from udev
> >> init.d script.
> >
> > NACK, NACK, NACK - udevadm is also udevinfo and is used by HAL. Your
> > patch will make my mdev images not working properly because I would nee=
d
> > to install mdev and udev to get HAL working and then find a way to not
> > run udev at boot time (even after package upgrades).
>=20
> I tried to understand your complain (really) but don't get it. What do
> you mean when saying "udevadm is also udevinfo and is used by HAL"?
> And also please provide your solution for the problem of broken images
> with unfuctional udev subsystem.

I think he's saying that udevadm is needed by HAL for correct operation,
even if you're using mdev instead of udev itself.

It looks like udev used to Depend on udev-utils due to the existence
of /sbin/udevsettle in version 124.  But, in version 141, that symlink
has gone away and hence the dependency is no longer created.  The right
fix is probably to add an explicit RDEPENDS_${PN} +=3D "udev-utils" or
some such.

p.




