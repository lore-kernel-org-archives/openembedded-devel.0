Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbESx-0006WX-HD
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 18:52:03 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so4059589eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2012 09:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lXb1nTR2V4pEKEb5YXXTASTTDemXoG81YxGY0qF/9do=;
	b=v5njfR7CJEJ3U4xFgCEmzB7tJNMhCpTX+oNGB73+EhXgFR8cthT+YgwX2Q75DujcEA
	fCZpEHpsPc7rTSDr9PbmtHWYfvG/JB9Nca/QfmhKGfsFpCOJvNxzpCD17+A736JoTmWI
	zWa1dYZUDy1jyVfgz4CeitxsHebw2SnAcSi6FJy98BR22EeOx+bTYbAEfXeEarL3uvCp
	fBfRgo/QZmWmRjnlTVFX0tCGHMITPKJ/KtZUHy6G/f5noa7G1rediYiOTHUsTao4gTtR
	LO9yEfZ3tmApZILCfElh75MARpFWdAiOIb8SWP72BiSN5ysNwxunQC8Xi5abYmnC22Ud
	PHgQ==
Received: by 10.14.216.193 with SMTP id g41mr47970720eep.37.1353519478493;
	Wed, 21 Nov 2012 09:37:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 42sm1497799eee.0.2012.11.21.09.37.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 09:37:57 -0800 (PST)
Date: Wed, 21 Nov 2012 18:37:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121121173754.GN12637@jama.jama.net>
References: <cover.1353518890.git.paul.eggleton@linux.intel.com>
	<1eef087d214b6c6ff27b60dff5511acfc2a3925e.1353518890.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1eef087d214b6c6ff27b60dff5511acfc2a3925e.1353518890.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH 2/2] ntp: make servers configurable and default to none configured
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
X-List-Received-Date: Wed, 21 Nov 2012 17:52:04 -0000
X-Groupsio-MsgNum: 41612
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6o78gXsyQHm68LY/"
Content-Disposition: inline

--6o78gXsyQHm68LY/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2012 at 05:29:30PM +0000, Paul Eggleton wrote:
> People can't blindly use pool.ntp.org, especially if they are building
> for a product or something that could be used in a product, so at least
> try to get people to do the right thing and not use pool.ntp.org by
> default.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta-networking/recipes-support/ntp/ntp.inc |   12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networkin=
g/recipes-support/ntp/ntp.inc
> index d20bc2e..b54608a 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -33,12 +33,22 @@ PACKAGECONFIG[openssl] =3D "--with-openssl-libdir=3D$=
{STAGING_LIBDIR} \
>                            --without-openssl --without-crypto, \
>                            openssl"
> =20
> +# This should be set in the distro configuration
> +NTP_SERVERS ??=3D ""
> +
> +python __anonymous() {
> +    if not d.getVar("NTP_SERVERS", True):
> +        raise bb.parse.SkipPackage("Please set NTP_SERVERS in order to b=
uild ntp - see http://www.openembedded.org/wiki/NTP for details")
> +}

Cannot we move this logic to target?

I mean ntpdate can be usefull for end-user even without this cron job.

We can add something like
/etc/default/ntp
NTP_SERVERS=3D""

And change cron job as well as that systemd .service file we talked
about before to show
"Please set correct NPT_SERVERS in /etc/default/ntp"
instead of failing (in systemd .service file case) or not being able to
build ntpdate package unless you have distro with own ntp pool.

On other hand distro with own ntp pool can provide own value in
/etc/default/ntp with .bbappend, so their users won't ever see this on
target.

Cheers,

> +
>  do_install_append() {
>  	install -d ${D}/${sysconfdir}/init.d
>  	install -m 644 ${WORKDIR}/ntp.conf ${D}/${sysconfdir}
>  	install -m 755 ${WORKDIR}/ntpd ${D}/${sysconfdir}/init.d
>  	install -d ${D}/${sysconfdir}/network/if-up.d
>  	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
> +
> +	sed -i "s/pool.ntp.org/${NTP_SERVERS}/g" ${D}/${sysconfdir}/ntp.conf ${=
D}/${sysconfdir}/network/if-up.d/ntpdate
>  }
> =20
>  PACKAGES +=3D "ntpdate ${PN}-bin ${PN}-tickadj ${PN}-utils"
> @@ -71,7 +81,7 @@ else
>          if ! grep -q -s ntpdate /var/spool/cron/root; then
>                  echo "adding crontab"
>                  test -d /var/spool/cron || mkdir -p /var/spool/cron
> -                echo "30 * * * *    /usr/bin/ntpdate -b -s -u pool.ntp.o=
rg" >> /var/spool/cron/root
> +                echo "30 * * * *    /usr/bin/ntpdate -b -s -u ${NTP_SERV=
ERS}" >> /var/spool/cron/root
>          fi
>  fi
>  }
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6o78gXsyQHm68LY/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCtEXIACgkQN1Ujt2V2gBzYyACgkx4pQqmBwqHA2oeskysBIp+c
NoIAn0Ab8EyE3M2UhOyLJXgkv8Z0kSSx
=lzIm
-----END PGP SIGNATURE-----

--6o78gXsyQHm68LY/--
