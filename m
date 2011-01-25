Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PhlJZ-0006PF-Uv
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 17:00:18 +0100
Received: by wyb40 with SMTP id 40so5731496wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 07:59:31 -0800 (PST)
Received: by 10.227.146.144 with SMTP id h16mr6034948wbv.221.1295971168740;
	Tue, 25 Jan 2011 07:59:28 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id u9sm128135wbg.0.2011.01.25.07.59.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 Jan 2011 07:59:26 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1295970665-14658-1-git-send-email-vjaquez@igalia.com>
Date: Tue, 25 Jan 2011 16:59:25 +0100
Message-Id: <44B46FD7-B8AF-4FD7-9964-A6FDE847BE46@dominion.thruhere.net>
References: <1295970665-14658-1-git-send-email-vjaquez@igalia.com>
To: =?iso-8859-1?Q?V=EDctor_Manuel_J=E1quez_Leal?= <vjaquez@igalia.com>
X-Mailer: Apple Mail (2.1082)
Cc: Koen Kooi <koen@openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] python-scons_1.3.0: add missing dependencies
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
X-List-Received-Date: Tue, 25 Jan 2011 16:00:18 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Some small nitpicks, see below

Op 25 jan 2011, om 16:51 heeft V=EDctor Manuel J=E1quez Leal het =
volgende geschreven:

> In order to launch scons in a board it depends on a couple python =
packages
> which were not managed by the recipe.
>=20
> This patch adds them.
>=20
> Signed-off-by: V=EDctor Manuel J=E1quez Leal <vjaquez@igalia.com>
> ---
> recipes/python/python-scons_1.3.0.bb |    8 ++++++++
> 1 files changed, 8 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes/python/python-scons_1.3.0.bb =
b/recipes/python/python-scons_1.3.0.bb
> index 792e3a5..0dc3236 100644
> --- a/recipes/python/python-scons_1.3.0.bb
> +++ b/recipes/python/python-scons_1.3.0.bb
> @@ -1,8 +1,16 @@
> DESCRIPTION =3D "A Software Construction Tool"
> SECTION =3D "devel/python"
> PRIORITY =3D "optional"
> +RDEPENDS_${PN} =3D "python-shell \
> +	       python-stringold \
> +	       python-lang \
> +	       python-io \
> +	       python-fcntl \
> +	       python-pickle \
> +	       python-crypt"

We generally put variables in the order OE uses them, so RDEPENDS should =
go next to do_package/FILES/etc. Historically it was on top, but that =
stopped making sense after switching to RDEPENDS_${PN}

> LICENSE =3D "GPL"

Could you fix that while you're at it? It would be  nice to know if it's =
GPLv2 or GPLv2+.

Other than that, the patch looks OK to me[1].

regards,

Koen

[1] Sconstructs still make my eyes bleed, but that's not the point=


