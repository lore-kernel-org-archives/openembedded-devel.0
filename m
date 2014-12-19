Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id DCFF472AA4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 19:18:11 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id bs8so2884226wib.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sNo8nOQfQ3sPB89NxmkG2Ty64vC9YZmNPzbFjB8drH8=;
	b=noPlxcyUQTffW9Xs260/ay02IGsDI8OkQwDFoPuIEUx2TZdJJWoi6RyoKWiDf2QYjn
	nbUcvCNEYZcDaeP+EAhEE6FeRKnxaus2rv/4r6mxCNtXLIQ1Kr8qZhlF3VJfZB+jChlV
	1mR/3qOAbNxoHHknv/hJiSlzIVBF867pgqeFUYacPsB4ZFxuTg6cy8OBhf6DbtaJpFS8
	IcQQPj38sm1Ry8KxjZGApg5TQvjXHITrehjA1yCdKGSoHKwW0mNG7RzOMOwOjdeQ8TmN
	IBacKXK2dzNLIZcEzI/U4ByW+/AsbbKq9qeAX9/5exY4rKh0Eb7pplHtysNjy90ICr60
	qIlw==
X-Received: by 10.180.98.138 with SMTP id ei10mr8763787wib.32.1419016690568;
	Fri, 19 Dec 2014 11:18:10 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	kn5sm13737194wjb.48.2014.12.19.11.18.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Dec 2014 11:18:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 19 Dec 2014 20:18:16 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141219191816.GC2461@jama>
References: <1418984204-9524-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1418984204-9524-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] dstat: add new recipe
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
X-List-Received-Date: Fri, 19 Dec 2014 19:18:12 -0000
X-Groupsio-MsgNum: 53404
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p2kqVDKq5asng8Dg"
Content-Disposition: inline

--p2kqVDKq5asng8Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2014 at 06:16:43PM +0800, Li xin wrote:
> Dstat is a versatile replacement for vmstat, iostat, netstat and ifstat.
> Dstat overcomes some of their limitations and adds some extra features,
> more counters and flexibility.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/dstat/dstat_0.7.2.bb | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-support/dstat/dstat_0.7.2.bb
>=20
> diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.2.bb b/meta-oe/recip=
es-support/dstat/dstat_0.7.2.bb
> new file mode 100644
> index 0000000..190f940
> --- /dev/null
> +++ b/meta-oe/recipes-support/dstat/dstat_0.7.2.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "versatile resource statics tool"=20
> +DESCRIPTION =3D "Dstat is a versatile replacement for vmstat, iostat, ne=
tstat and ifstat. \
> +Dstat overcomes some of their limitations and adds some extra features, =
more counters \
> +and flexibility. Dstat is handy for monitoring systems during performanc=
e tuning tests, \
> +benchmarks or troubleshooting."
> +HOMEPAGE =3D "http://dag.wiee.rs/home-made/dstat"=20
> +LICENSE =3D "GPLv2"=20
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"=20
> +SRC_URI =3D "git://github.com/dagwieers/dstat.git"=20
> +SRC_URI[md5sum] =3D "798e050e2e024f08a272dd4b0e1eba41"=20
> +SRC_URI[sha256sum] =3D "96d1e6ea2434e477fa97322d92778f68458d7e57bc55bc4f=
72e29467a52cffd1"=20
> +

many lines have trailing whitespace, can you please removed them before
sending next time?

OE @ ~/meta-openembedded $ pwam 85255
2014-12-19 20:17:04 URL:http://patchwork.openembedded.org/patch/85255/mbox/=
 [2003] -> "pw-am-85255.patch" [1]
Applying: dstat: add new recipe
/OE/meta-openembedded/.git/rebase-apply/patch:12: trailing whitespace.
SUMMARY =3D "versatile resource statics tool"
/OE/meta-openembedded/.git/rebase-apply/patch:17: trailing whitespace.
HOMEPAGE =3D "http://dag.wiee.rs/home-made/dstat"
/OE/meta-openembedded/.git/rebase-apply/patch:18: trailing whitespace.
LICENSE =3D "GPLv2"
/OE/meta-openembedded/.git/rebase-apply/patch:19: trailing whitespace.
LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
/OE/meta-openembedded/.git/rebase-apply/patch:20: trailing whitespace.
SRC_URI =3D "git://github.com/dagwieers/dstat.git"
warning: squelched 4 whitespace errors
warning: 9 lines add whitespace errors.




> +SRCREV =3D "5251397eb8d3b284a90bfdfaec0c8e1210146e3f"=20
> +
> +S =3D "${WORKDIR}/git"=20
> +
> +do_compile_prepend() {
> +    #undo the step "make docs"
> +    sed -i -e 's/$(MAKE) -C docs docs/# $(MAKE) -C docs docs/;' ${S}/Mak=
efile
> +}
> +do_install() {
> +    oe_runmake 'DESTDIR=3D${D}' install
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

--p2kqVDKq5asng8Dg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSUefgACgkQN1Ujt2V2gBw8dACfaJLvIVY6HFGqpLGkkgyL7BJf
/QMAoInTQZU5OzyK/ISCq2HEDRsPDLS6
=OPFq
-----END PGP SIGNATURE-----

--p2kqVDKq5asng8Dg--
