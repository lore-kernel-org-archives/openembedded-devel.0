Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OWqFd-0004t9-Ar
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 14:30:59 +0200
Received: from [192.168.1.6] (business-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 00F5E584381
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jul 2010 14:26:03 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1081)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <1278396101-30522-2-git-send-email-GNUtoo@no-log.org>
Date: Thu, 8 Jul 2010 14:25:52 +0200
Message-Id: <2E582327-C544-47B8-8551-3BC95EE57A49@vanille-media.de>
References: <1278396101-30522-1-git-send-email-GNUtoo@no-log.org>
	<1278396101-30522-2-git-send-email-GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] htcdream.conf: use xf86-video-fbdev and xf86-video-tslib
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
X-List-Received-Date: Thu, 08 Jul 2010 12:30:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Acked-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>

Am 06.07.2010 um 08:01 schrieb Denis 'GNUtoo' Carikli:

>=20
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> ---
> conf/machine/htcdream.conf |   11 +++++++++++
> recipes/tasks/task-x11.bb  |    2 +-
> 2 files changed, 12 insertions(+), 1 deletions(-)
>=20
> diff --git a/conf/machine/htcdream.conf b/conf/machine/htcdream.conf
> index a10edb8..3cf1ebf 100644
> --- a/conf/machine/htcdream.conf
> +++ b/conf/machine/htcdream.conf
> @@ -19,3 +19,14 @@ MACHINE_EXTRA_RRECOMMENDS =3D "\
> "
>=20
> PREFERRED_PROVIDER_virtual/kernel =3D "linux-leviathan"
> +
> +XSERVER =3D " \
> +        xserver-xorg \
> +        xserver-xorg-extension-glx \
> +        xserver-xorg-extension-dri \
> +        xf86-input-tslib \
> +        xf86-input-evdev \
> +        xf86-input-mouse \
> +        xf86-input-keyboard \
> +        xf86-video-fbdev \
> +"
> diff --git a/recipes/tasks/task-x11.bb b/recipes/tasks/task-x11.bb
> index 5eeb8ba..77e281e 100644
> --- a/recipes/tasks/task-x11.bb
> +++ b/recipes/tasks/task-x11.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "The X Window System -- install this =
task to get a client/server b
> SECTION =3D "x11/server"
> LICENSE =3D "MIT"
> PV =3D "1.0"
> -PR =3D "r4"
> +PR =3D "r5"
>=20
> # WORK IN PROGRESS
>=20
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



