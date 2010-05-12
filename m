Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1OC95y-0004KH-St
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 12:23:19 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id A03CC68416
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 14:19:12 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 May 2010 14:19:19 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <201005111904.06230.khimov@altell.ru>
	<4BE9E2AB.5020106@mwester.net>
In-Reply-To: <4BE9E2AB.5020106@mwester.net>
MIME-Version: 1.0
Message-Id: <201005121419.19307.khimov@altell.ru>
X-Altell-MailScanner-ID: A03CC68416.C88E2
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] logrotate scripts policy
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
X-List-Received-Date: Wed, 12 May 2010 10:23:19 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 12 =D0=BC=D0=B0=D1=8F 2010 03:05:15 =D0=B0=
=D0=B2=D1=82=D0=BE=D1=80 Mike Westerhof =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=
=B0=D0=BB:
> Roman I Khimov wrote:
> > This way all *-logrotate packages will get installed by default, but not
> > the logrotate program. So, it will eat some little space in
> > /etc/logrotate.d for everyone by default (but you can get rid of those
> > packages if you really don't want them), but would allow to switch
> > rotation on/off easily with just one package included or not in the
> > image.
>=20
> The NSLU2 has a grand total of 8MB of flash space for bootloader,
> kernel, and the filesystem.  We don't have even a few KB left right now
> for those extra packages.  Keep in mind that even a 20-byte script will
> have a large footprint in the opkg database that's on the filesystem, so
> that space is in addition.
>=20
> It's really really difficult to build an image without a whole lot of
> extraneous stuff in it, and I suspect that extraneous stuff is all in
> there for the same reasoning, which goes along the lines of "It's only a
> little bit of space..." -- but it all adds up, and when your total
> rootfs can only be 5.5 MB or so...

OK, that's exactly the kind of feedback I've wanted to get. But as such=20
constraints are not common (or they are?), I still think that this should b=
e=20
(and easier to) implemented in opt-out fashion. So, I'll try to cook up a=20
patch today that does=20

RRECOMMENDS_${PN} +=3D "${PN}-logrotate"
RSUGGESTS_${PN}-logrotate +=3D "logrotate"

and then add some "PURGE_LOGROTATE" variable that will trigger *-logrotate=
=20
packages removal from image if there is a need to.


