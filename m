Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3F16F6CD55
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:44:03 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so1811427eaj.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 02:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KztZg9lLwdWo22YpS2dAOoDPuavbPg9GWPrkcbSi4eg=;
	b=wHIsfmRSx5VpQT3ZMBe4/Qk7v6ZJzXtbLQHA00akpxN948W/QYJ5xv3jsPmYAnM34F
	T/CKrUhKDOpQE9XmVxehTMCzkC5wgOij8+SDmIBa4KuPv491QkNhNmJx7clmFiBJk6/t
	dNrBhbjDg/1AJHbmWw22fcffzH0breddGGM2W26VRC2RKXV9twHKvh7TKLEXI17fk/Yu
	jaDDxtJnXh/R2UOWwsq2f0iLdD44rL/FZhvQkN/mGE1q2t2faNwAhaOR9DO5tZ2Y0pCx
	DWWK8sIQ62aX5DWDE8sUfMqQD3s2NbeWZ0Il2zfT6Do17iXUuv1Jkf4ZkwUKGaeefC9z
	bHwQ==
X-Received: by 10.14.5.3 with SMTP id 3mr3078738eek.49.1382089444688;
	Fri, 18 Oct 2013 02:44:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm2152694eec.7.2013.10.18.02.44.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Oct 2013 02:44:04 -0700 (PDT)
Date: Fri, 18 Oct 2013 11:44:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131018094408.GA21192@jama>
References: <1382081248-6370-1-git-send-email-olof.johansson@axis.com>
	<5260F68B.6090403@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <5260F68B.6090403@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] rsyslog: fix dependency name (json-c => libjson)
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
X-List-Received-Date: Fri, 18 Oct 2013 09:44:03 -0000
X-Groupsio-MsgNum: 46803
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2013 at 09:51:23AM +0100, Jack Mitchell wrote:
> On 18/10/13 08:27, Olof Johansson wrote:
> > Signed-off-by: Olof Johansson <olof.johansson@axis.com>
> > ---
> >  meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-o=
e/recipes-extended/rsyslog/rsyslog_7.4.4.bb
> > index 0101004..238b484 100644
> > --- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
> > +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
> > @@ -1,5 +1,5 @@
> >  DESCRIPTION =3D "Rsyslog is an enhanced multi-threaded syslogd"
> > -DEPENDS =3D "zlib libestr json-c"
> > +DEPENDS =3D "zlib libestr libjson"
> >  DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd'=
, '', d)}"
> >  HOMEPAGE =3D "http://www.rsyslog.com/"
> >  LICENSE =3D "GPLv3"
> >=20
>=20
> Hi Olof,
>=20
> The rsyslogd patches shouldn't really have gone in yet... I've fired off
> a patch to oe-core to update libjson to the now named json-c, so if we
> could hold off for a few days that would be great. Otherwise, maybe
> temporarily revert the rsyslogd patches?

Sorry about that, I was testing them together with json-c patch, so I
haven't noticed, can we temporary take this patch and then revert it
when (and if) libjson is renamed in oe-core (assuming that newer rsyslog
works with older libjson-0.9.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJhAugACgkQN1Ujt2V2gBxn9ACghwlNY4RZC1Ct113zUG31kKaF
8loAn3NHjbAWu7WvSWEc3ALuGQznpuO1
=tC8Z
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
