Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.10505.1619087631840291241
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 03:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: kory.maincent@bootlin.com)
Received: from kmaincent-XPS-13-7390 (pop.92-184-110-227.mobile.abo.orange.fr [92.184.110.227])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 76FD710000B;
	Thu, 22 Apr 2021 10:33:49 +0000 (UTC)
Date: Thu, 22 Apr 2021 12:33:48 +0200
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH v3 3/4] nodejs: Use qemu usermode to run target binaries during build
Message-ID: <20210422123348.4e15c17f@kmaincent-XPS-13-7390>
In-Reply-To: <20210419210440.2446040-4-raj.khem@gmail.com>
References: <20210419210440.2446040-1-raj.khem@gmail.com>
	<20210419210440.2446040-4-raj.khem@gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Apr 2021 14:04:39 -0700
"Khem Raj" <raj.khem@gmail.com> wrote:

> So far, we have been trying to build nodejs-native and use the native
> host binaries from there, which has worked out ok but always changes
> when major upgrade is done, since more binaries or places are required
> to be captured. This patch changes this approach to use qemu-user to run
> these binaries under during cross build. This lets them run closer to
> upstream build process and also removes dependency on nodejs-native
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../nodejs/0002-Using-native-binaries.patch   | 93 +++++++++----------
>  .../recipes-devtools/nodejs/nodejs_14.16.1.bb | 34 ++++++-
>  2 files changed, 74 insertions(+), 53 deletions(-)
>=20

You can remove the "--without-snapshot" configuration parameter, now useles=
s.

With that fixed:
Tested-by: Kory Maincent <kory.maincent@bootlin.com>

Thanks,=20
K=C3=B6ry
