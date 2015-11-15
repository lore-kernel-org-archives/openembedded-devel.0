Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4B05C773A4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 19:25:37 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so147462101wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 11:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jVoLrGH8xPZWwjXpnl3DUZdjvmd4K+dtGj6hGKfHYXo=;
	b=pqKfFQ4uosocEaI/dHj+D/0qL5eWXbqVj9BfpIz4yhUDG8CQRD/v28cUbsh07hiz29
	+tZhtf8IOvSMI1U0bKsvHW/qyrRdOSy/GY+ybcNqNrJjtGx09kVAv7GCJf/7ZaZ496lI
	E0XiE3WuMjdtHRQBVnZefkpK5475NKZcE9yL0g2UGkELBUzc81dLPFXI+4h4UGTiq6W/
	PB3Tcx1wkUyrcWsn4k+dv1rBDEDTUyk/cb5wuQFyDIakhigHaVxKdYP8FCl5w1Po+LN+
	+zQ0XA08b+zYo/zk2swhI9UZPoc6Bddky07cgD6iIcivRKnCIR5/kymH/8JgEABTLKGj
	ym8g==
X-Received: by 10.194.23.33 with SMTP id j1mr37914725wjf.4.1447615537742;
	Sun, 15 Nov 2015 11:25:37 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m135sm20133513wmb.0.2015.11.15.11.25.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Nov 2015 11:25:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 15 Nov 2015 20:25:42 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151115192542.GA2554@jama>
References: <1447604260-5460-1-git-send-email-Martin.Jansa@gmail.com>
	<1447604260-5460-7-git-send-email-Martin.Jansa@gmail.com>
	<CALbNGRR7EUtEYLHuZwFZzAP2f6UHvwFTCSrz5ceBj2_4dJEqTA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRR7EUtEYLHuZwFZzAP2f6UHvwFTCSrz5ceBj2_4dJEqTA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe 7/8] gvfs: don't depend on samba by default
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
X-List-Received-Date: Sun, 15 Nov 2015 19:25:38 -0000
X-Groupsio-MsgNum: 58654
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2015 at 05:43:25PM +0100, Andreas M=FCller wrote:
> On Sun, Nov 15, 2015 at 5:17 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > * we don't want to introduce dependency on meta-networking just because=
 of this
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb b/meta-gnome/=
recipes-gnome/gvfs/gvfs_1.10.1.bb
> > index 166e5d2..fb5185f 100644
> > --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
> > +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
> > @@ -22,7 +22,7 @@ FILES_gvfsd-trash =3D "${libexecdir}/gvfsd-trash ${da=
tadir}/gvfs/mounts/trash.moun
> >  RDEPENDS_${PN} =3D "gvfs-gdu-volume-monitor"
> >  RRECOMMENDS_gvfsd-ftp +=3D "openssh-sftp openssh-ssh"
> >
> > -PACKAGECONFIG ?=3D "libgphoto2 ${@base_contains('INCOMPATIBLE_LICENSE'=
, 'GPLv3', '', 'samba', d)}"
> > +PACKAGECONFIG ?=3D "libgphoto2"
> >
> >  PACKAGECONFIG[libgphoto2] =3D "--enable-gphoto2, --disable-gphoto2, li=
bgphoto2"
> >  PACKAGECONFIG[samba] =3D "--enable-samba --with-samba-includes=3D${STA=
GING_INCDIR} \
> > --
> > 2.6.3
> >
> Yet another PACKAGECONFIG I have to watch for to keep my images
> working as I want them to. As it turns out that I loose overview of
> all these packageconfigs around: Is there a possibility to set all
> packageconfigs globally?

I'm sorry about that, but I don't think it's possible.

It was discussed few weeks ago, when the QA check for invalid PACKAGECONFIG=
 was added.

Before it was possible to globally append something. What we can do is
to introduce DISTRO_FEATURE which will enable samba everywhere or even
check for meta-networking layer and enable it by default when
meta-networking is in bblayers.

>=20
> Andreas
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZI3BkACgkQN1Ujt2V2gBy+PgCfRMtVd1USZSQ2yf4h3QrAUoKH
r04An0WZn+uhsb/PRUvhMvvjgQlEQ8c6
=klci
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
