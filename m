Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9E76D720C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 14:35:32 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id ex7so5556892wid.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 06:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sNvmDVipCloCsTvdqU9UyaWCj9U8uH7Qv77JgSSWyUA=;
	b=wuCzmEP0Rr5xCuiwI2jL/U0cxHpGOGURrxKeTSadCX70Frfe80AKYcsI7c6V93oUU1
	ER7F2aF23YIkjwD5RNjLS5cf0kTYA85PCgYFZv3H2hgYQzR6dXvoYenGvAhogxKLkVUK
	Iq+5+Tp1Goz66uRXcBjYEFxycwKGjKh+LK55KX2RkMZyJWzsclQMbYxUfibrdh5CbQyS
	HxzyOj96ECTS00x8SSjHyk5SsUMjlA0xAu7ISc8Pu4JPzSbdxwBVBbsMkGCODUSATBM/
	re1S3QJ88tm65U+wOmwrb5oeyJAfoJbDztvgYXrQFJzDN9MNoWJzR4VjyALbYGmvnSfG
	5NNg==
X-Received: by 10.194.178.231 with SMTP id db7mr57195001wjc.112.1416407732638; 
	Wed, 19 Nov 2014 06:35:32 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	nc11sm2508757wic.0.2014.11.19.06.35.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 06:35:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 15:35:32 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141119143532.GG3315@jama>
References: <A8FC939F80655644A89BB21CCD3741E87C5B6F@G08CNEXMBPEKD02.g08.fujitsu.local>
	<1416289969-11515-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1416289969-11515-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH v2] nicstat : add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Nov 2014 14:35:32 -0000
X-Groupsio-MsgNum: 52932
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BzCohdixPhurzSK4"
Content-Disposition: inline

--BzCohdixPhurzSK4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2014 at 01:52:49PM +0800, Li xin wrote:
> nicstat is a tool that prints out network statistics for all network
> interface cards (NICs), including packets, kilobytes per second,
> average packet sizes and more.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-extended/nicstat/nicstat_1.95.bb | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
>=20
> diff --git a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb b/meta-oe/r=
ecipes-extended/nicstat/nicstat_1.95.bb
> new file mode 100644
> index 0000000..142c164
> --- /dev/null
> +++ b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "nicstat is a Solaris and Linux command-line that prints=
 out network \
> +statistics for all network interface cards (NICs), including packets, ki=
lobytes \
> +per second, average packet sizes and more."
> +HOMEPAGE =3D "http://nicstat.sourceforge.net"
> +LICENSE =3D "Artistic-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db4a94da2a1f918b217ef51566=
34fc9e0"
> +SRC_URI =3D "http://softlayer-sng.dl.sourceforge.net/project/nicstat/${P=
N}-${PV}.tar.gz"

nicstat -> ${BPN}
${PN}-${PV} -> ${BP}

> +SRC_URI[md5sum] =3D "9a0b87bbc670c1e738e5b40c7afd184d"
> +SRC_URI[sha256sum] =3D "c4cc33f8838f4523f27c3d7584eedbe59f4c587f0821612f=
5ac2201adc18b367"
> +
> +do_compile() {
> +	${CC} ${CFLAGS} ${LDFLAGS} -o nicstat nicstat.c
> +}
> +do_install() {
> +     	install -d ${D}/${bindir}/
> +	install -d ${D}/${mandir}/
> +     	install -m 0755 ${S}/nicstat ${D}${bindir}/
> +	install -m 0644 ${S}/nicstat.1 ${D}/${mandir}/

use 4 spaces for indentation, no tabs and definitely no mix of tabs and
spaces

I've fixed this when cherry-picking to master-next

> +}
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BzCohdixPhurzSK4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRsqrQACgkQN1Ujt2V2gBxkngCgpRIUpP0GTc2CAO/axyGmZhIL
hgUAnj48UiB3Rg2ZPZlUweYzlTyVLLMi
=+wsb
-----END PGP SIGNATURE-----

--BzCohdixPhurzSK4--
