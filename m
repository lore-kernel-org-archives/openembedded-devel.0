Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OqCGg-0005Hw-Jp
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 23:51:56 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L7Z00EV1JD3QIH6@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	30 Aug 2010 16:51:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A89D114AF64; Mon,
	30 Aug 2010 17:51:03 -0400 (EDT)
Date: Mon, 30 Aug 2010 17:51:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <AANLkTi=9m7CTcpofRQjmqYGpBzy807qkD5k4AddLN5hX@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100830215103.GB14561@denix.org>
MIME-version: 1.0
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-8-git-send-email-raj.khem@gmail.com>
	<AANLkTi=9m7CTcpofRQjmqYGpBzy807qkD5k4AddLN5hX@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 07/23] task-arago-toolchain-target.bb: remove	libpng12-dev which is not provided and e2fsprogs-libs-dev is now	e2fsprogs-dev
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
X-List-Received-Date: Mon, 30 Aug 2010 21:51:56 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Sun, Aug 29, 2010 at 09:23:40AM +0200, Frans Meulenbroeks wrote:
> good catch, there are some more
>=20
> meta/foonas-packages.bb:=09e2fsprogs-libs \
> meta/openprotium-packages.bb:=09e2fsprogs-libs \
> meta/oplinux-packages.bb:=09e2fsprogs-libs
>=20
> maybe I overlooked things (still early here) but I didn't see an e2=
fsprogs-libs
> Guess those 3 should be fixed too
> (or moved to nonworking so someone can pick them up if they are not=
 working)

Actually, I had this recipe fixed in Arago by replacing e2fsprogs-lib=
s-dev=20
with util-linux-ng-dev for the tools in use...

Acked-by: Denys Dmytriyenko <denis@denix.org>

> For this one
> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>=20
> 2010/8/28 Khem Raj <raj.khem@gmail.com>:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > =A0recipes/tasks/task-arago-toolchain-target.bb | =A0 =A03 +--
> > =A01 files changed, 1 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes/tasks/task-arago-toolchain-target.bb b/recip=
es/tasks/task-arago-toolchain-target.bb
> > index aa592b6..496910e 100644
> > --- a/recipes/tasks/task-arago-toolchain-target.bb
> > +++ b/recipes/tasks/task-arago-toolchain-target.bb
> > @@ -14,14 +14,13 @@ RDEPENDS_${PN} =3D "\
> > =A0 =A0 alsa-lib-dev \
> > =A0 =A0 alsa-utils-dev \
> > =A0 =A0 curl-dev \
> > - =A0 =A0e2fsprogs-libs-dev \
> > + =A0 =A0e2fsprogs-dev \
> > =A0 =A0 i2c-tools-dev \
> > =A0 =A0 freetype-dev \
> > =A0 =A0 jpeg-dev \
> > =A0 =A0 lzo-dev \
> > =A0 =A0 libopkg-dev \
> > =A0 =A0 libpng-dev \
> > - =A0 =A0libpng12-dev \
> > =A0 =A0 readline-dev \
> > =A0 =A0 libts-dev \
> > =A0 =A0 libusb-compat-dev \
> > --
> > 1.7.1



