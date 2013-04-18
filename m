Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USkjM-0003uH-Tv
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 11:02:20 +0200
Received: by mail-pa0-f53.google.com with SMTP id bh4so1444936pad.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 01:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=DOivN5qqayrVL6TfMfJulFjaLho1VXVzU98K7/TQEC8=;
	b=pHJvSp7M/veBRHsNd5bw2gYyiTFkUuyvDrRfo8rcOoEYrnYB2Uekaq6caPgUhMbTLl
	BNQBX/HDx81n4dHDkipIttu/p8z+LwSc/J2CG30NFzjZNDHytLlHyjECGMaD1B834r/W
	BAo/VzZ4maztR2Iv2CdinKca/MPV7HgloNjPEEpn0kr2iEAOfUAMv2g78sS0ZNnGFPYv
	bO15mCsy9lAKonplgU2LV40pfTCJeA2Pv98MKv7tQxqEkPrNDsY/L150NukPh+cLnw0c
	6WPgDnL9SqzI2lISbCU4w6r4SHIr4zMkP9XUMAlMtb+bWJJOOVQ4/Xv6WHP/JqQIIcF4
	4Mcw==
X-Received: by 10.69.0.200 with SMTP id ba8mr13144056pbd.4.1366274679333;
	Thu, 18 Apr 2013 01:44:39 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ba10sm9138462pbd.21.2013.04.18.01.44.36
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 01:44:38 -0700 (PDT)
Date: Thu, 18 Apr 2013 10:44:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130418084437.GM26007@jama>
References: <1366104524-13236-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1366104524-13236-1-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: Re: [meta-oe][PATCH] Hiawatha: update to 9.0, add systemd support
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
X-List-Received-Date: Thu, 18 Apr 2013 09:02:30 -0000
X-Groupsio-MsgNum: 44307
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aiCxlS1GuupXjEh3"
Content-Disposition: inline

--aiCxlS1GuupXjEh3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2013 at 10:28:44AM +0100, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>=20
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  .../recipes-httpd/hiawatha/files/hiawatha.service     | 16 +++++++++++++=
+++
>  .../hiawatha/{hiawatha_8.8.1.bb =3D> hiawatha_9.0.bb}   | 19 +++++++++++=
+++-----
>  2 files changed, 30 insertions(+), 5 deletions(-)
>  create mode 100644 meta-webserver/recipes-httpd/hiawatha/files/hiawatha.=
service
>  rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_8.8.1.bb =3D> hia=
watha_9.0.bb} (79%)
>=20
> diff --git a/meta-webserver/recipes-httpd/hiawatha/files/hiawatha.service=
 b/meta-webserver/recipes-httpd/hiawatha/files/hiawatha.service
> new file mode 100644
> index 0000000..26cb8d0
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/hiawatha/files/hiawatha.service
> @@ -0,0 +1,16 @@
> +[Unit]
> +Description=3DHiawatha Web Server
> +After=3Dnetwork.target remote-fs.target nss-lookup.target
> +
> +[Service]
> +Type=3Dsimple
> +SyslogIdentifier=3Dhiawatha
> +ExecStartPre=3D/usr/sbin/hiawatha -k ; /usr/sbin/wigwam
> +ExecStart=3D /usr/sbin/hiawatha -d
> +TimeoutSec=3D10
> +#(doesn't like this setting. Can't find files) PrivateTmp=3Dtrue
> +LimitNOFILE=3Dinfinity
> +CapabilityBoundingSet=3DCAP_NET_BIND_SERVICE CAP_CHOWN CAP_DAC_OVERRIDE =
CAP_FOWNER CAP_FSETID CAP_SETGID CAP_SETUID=20
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.8.1.bb b/me=
ta-webserver/recipes-httpd/hiawatha/hiawatha_9.0.bb
> similarity index 79%
> rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_8.8.1.bb
> rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_9.0.bb
> index 9e4f119..79fdc59 100644
> --- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.8.1.bb
> +++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.0.bb
> @@ -7,16 +7,19 @@ DEPENDS =3D "libxml2 libxslt"
>  SECTION =3D "net"
> =20
>  SRC_URI =3D "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
> -           file://hiawatha-init "
> +           file://hiawatha-init \
> +           file://hiawatha.service "
> =20
> -SRC_URI[md5sum] =3D "5def93779bbc10a021796abd3609caf7"
> -SRC_URI[sha256sum] =3D "2583d8e7f48ddc6cdedc27bb51d3e130679fc2f4411622ba=
e9ddce3ef965d063"
> -
> -inherit cmake update-rc.d
> +SRC_URI[md5sum] =3D "8abc4f85dbb9a76ed66e7f35de520064"
> +SRC_URI[sha256sum] =3D "e40119afb050b11737250c08d89ac7ba7472645738a48c06=
aa79979a19729fc"

Can you recheck checksums? It could be issue in jenkins download, but
yesterday it failed with:

WARNING: Checksum failure encountered with download of http://hiawatha-webs=
erver.org/files/hiawatha-9.0.tar.gz - will attempt other sources if availab=
le
ERROR: Fetcher failure for URL: 'http://hiawatha-webserver.org/files/hiawat=
ha-9.0.tar.gz'. Checksum mismatch!
File: '/home/jenkins/oe/shr-core-branches/shr-core/downloads/hiawatha-9.0.t=
ar.gz' has sha256 checksum 5e40119afb050b11737250c08d89ac7ba7472645738a48c0=
6aa79979a19729fc when e40119afb050b11737250c08d89ac7ba7472645738a48c06aa799=
79a19729fc was expected
If this change is expected (e.g. you have upgraded to a new version without=
 updating the checksums) then you can use these lines within the recipe:
SRC_URI[md5sum] =3D "8abc4f85dbb9a76ed66e7f35de520064"
SRC_URI[sha256sum] =3D "5e40119afb050b11737250c08d89ac7ba7472645738a48c06aa=
79979a19729fc"
Otherwise you should retry the download and/or check with upstream to deter=
mine if the file has become corrupted or otherwise unexpectedly modified.

So I guess the first '5' in sha256sum is missing in your recipe (one char s=
horter 256 is good hint :))

I'll fix it locally, no need to resend.
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aiCxlS1GuupXjEh3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFvsnUACgkQN1Ujt2V2gBxWdgCeKDUSgIEgCboxE+q5qPpg/qhK
lN0An3lMmWiMeH4UuSI9EWypA+rimVqV
=PBB1
-----END PGP SIGNATURE-----

--aiCxlS1GuupXjEh3--
