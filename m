Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 000FC724DF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 10:23:44 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so9623904wib.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2014 02:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=n6zYBVizBkEnRwWsT3B+kxgzHNpzqx6b9CJT3MYEfpE=;
	b=zmY/1NhA6bCcPnbf4kfK/Iy+he/ZhnPfsckAEOxvjUNZofNtftD5bV4GwrQHYGRVIC
	B0yrgU2WmgFmj8ZSmYW9Qgh7IRdoLr1C0npF0VGR3ad4UZbukU65VaMEnE85Ubk/oR57
	uOgThjQhn742pEIupLe3eAVFZysRJZbLo5jBqt9AwLvDCtED9O/py/sA0gqPgEbvgSJJ
	DhKeW55MFQ+cB0/OJsjdpxF1+F3M6JmAtsYUimyS+UWuGawsY29r7pLM9pGeZH6NU1N6
	IAowF8m9naGxLHmi1yy153toPd5hRgOZPrNaphf1MeEygPtD6UbhzANAvSgN4lrpQ/S0
	M65A==
X-Received: by 10.180.93.102 with SMTP id ct6mr30419295wib.75.1418120624322;
	Tue, 09 Dec 2014 02:23:44 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a14sm13192356wib.22.2014.12.09.02.23.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 02:23:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 9 Dec 2014 11:23:44 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141209102344.GD2470@jama>
References: <1417489126-18914-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417489126-18914-1-git-send-email-qianl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] logcheck: Add new recipe
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
X-List-Received-Date: Tue, 09 Dec 2014 10:23:56 -0000
X-Groupsio-MsgNum: 53231
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jCrbxBqMcLqd4mOl"
Content-Disposition: inline

--jCrbxBqMcLqd4mOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 02, 2014 at 10:58:46AM +0800, Qian Lei wrote:
> Logcheck is a simple utility which is designed to allow a system administ=
rator
> to view the log-files which are produced upon hosts under their control.

Causes new QA warning:
logcheck-1.3.17: logcheck requires /usr/bin/perl, but no providers in
its RDEPENDS [file-rdeps]

>=20
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  .../recipes-extended/logcheck/logcheck_1.3.17.bb   | 38 ++++++++++++++++=
++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb
>=20
> diff --git a/meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb b/meta-=
oe/recipes-extended/logcheck/logcheck_1.3.17.bb
> new file mode 100644
> index 0000000..c1cb069
> --- /dev/null
> +++ b/meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb
> @@ -0,0 +1,38 @@
> +SUMMARY =3D "Analyzes log files and sends noticeable events as email"
> +DESCRIPTION =3D "\
> +Logcheck is a simple utility which is designed to allow a system adminis=
trator \
> +to view the log-files which are produced upon hosts under their control.=
 \
> +It does this by mailing summaries of the log-files to them, after first \
> +filtering out "normal" entries. \
> +Normal entries are entries which match one of the many included regular \
> +expression files contain in the database."
> +SECTION =3D "Applications/System"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc93c0550bd3173f4504b2cbd8991e=
50b"
> +
> +SRC_URI =3D "git://git.debian.org/git/logcheck/logcheck.git"
> +SRCREV =3D "2429e67ad875fee8a0234c64d504277b038c89cd"
> +
> +S =3D "${WORKDIR}/git"
> +
> +FILES_${PN} +=3D "${datadir}/logtail"
> +
> +do_install() {
> +    # Fix QA Issue
> +    sed -i '/install -d $(DESTDIR)\/var\/lock\/logcheck/s/^/#/' Makefile
> +
> +    # "make install" do not install the manpage. Install them manually.
> +    install -m 755 -d ${D}${mandir}/man1
> +    install -m 755 -d ${D}${mandir}/man8
> +    install -m 644 docs/logcheck-test.1 ${D}${mandir}/man1/
> +    install -m 644 docs/logtail.8 ${D}${mandir}/man8/
> +    install -m 644 docs/logtail2.8 ${D}${mandir}/man8/
> +
> +    sed -i "s/syslog/messages/" etc/logcheck.logfiles
> +    sed -i "s/auth\.log/secure/" etc/logcheck.logfiles
> +    install -m 755 -d ${D}${sysconfdir}/cron.d
> +    install -m 644 debian/logcheck.cron.d ${D}${sysconfdir}/cron.d/logch=
eck
> +    install -m 755 -d ${D}/var/lib/logcheck
> +
> +    oe_runmake install DESTDIR=3D${D}
> +}
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jCrbxBqMcLqd4mOl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSGzbAACgkQN1Ujt2V2gBxMewCfcOFdxK9VgDTmGrMLpTBiWoQZ
zKAAoJoI+G9bX9g8CFUnaCSLHliuOisZ
=ZaYp
-----END PGP SIGNATURE-----

--jCrbxBqMcLqd4mOl--
