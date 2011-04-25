Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QEQdz-0003ME-VI
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 20:36:24 +0200
Received: by wwb17 with SMTP id 17so2085937wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:33:53 -0700 (PDT)
Received: by 10.227.140.32 with SMTP id g32mr4145196wbu.83.1303756433203;
	Mon, 25 Apr 2011 11:33:53 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	b20sm3403086wbb.16.2011.04.25.11.33.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:33:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1303756273-22385-4-git-send-email-tom_rini@mentor.com>
Date: Mon, 25 Apr 2011 20:33:50 +0200
Message-Id: <4039BDDE-2B27-4432-81CC-27208B4B6518@dominion.thruhere.net>
References: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>
	<1303756273-22385-4-git-send-email-tom_rini@mentor.com>
To: Tom Rini <tom_rini@mentor.com>
X-Mailer: Apple Mail (2.1084)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3] bluez4: Add 4.91 and make it default for Angstrom
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
X-List-Received-Date: Mon, 25 Apr 2011 18:36:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 apr 2011, om 20:31 heeft Tom Rini het volgende geschreven:

> Signed-off-by: Tom Rini <tom_rini@mentor.com>

I ran into Marcel at ELC, which reminded me to make a recipe, but hadn't =
pushed it yet. Let's use your version. So:

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
> recipes/bluez/bluez4_4.91.bb |   18 ++++++++++++++++++
> 1 files changed, 18 insertions(+), 0 deletions(-)
> create mode 100644 recipes/bluez/bluez4_4.91.bb
>=20
> diff --git a/recipes/bluez/bluez4_4.91.bb =
b/recipes/bluez/bluez4_4.91.bb
> new file mode 100644
> index 0000000..16f06d5
> --- /dev/null
> +++ b/recipes/bluez/bluez4_4.91.bb
> @@ -0,0 +1,18 @@
> +require bluez4.inc
> +
> +SRC_URI[md5sum] =3D "3059b7ef5168c84cd0c6a67034ce79f9"
> +SRC_URI[sha256sum] =3D =
"11e9279e2669db996afd464b96d2c68f41f157f6eb9b8842a0bbcad8a4eac18d"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +DEFAULT_PREFERENCE_angstrom =3D "1"
> +
> +DEPENDS +=3D "libsndfile1"
> +
> +PR =3D "${INC_PR}.0"
> +
> +# Not all distros have a recent enough udev
> +BTUDEV =3D " --disable-udevrules"
> +BTUDEV_angstrom =3D " --enable-udevrules"
> +BTUDEV_shr =3D " --enable-udevrules"
> +
> +EXTRA_OECONF +=3D "${BTUDEV}"
> --=20
> 1.7.0.4
>=20



