Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmSvi-0006Er-6S
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Dec 2012 18:32:10 +0100
Received: by mail-ee0-f49.google.com with SMTP id c4so2900482eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2012 09:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=95b9rPVW2bHPCvLmoc7VcuCw+OWi0FDh35NpcQDY9m0=;
	b=tbhHIuVQXGw+LjIKaQ3ezsFZE9zTdBW7OYxza2hryxarRJf+l+oE1ogrJyrikD+lhl
	0ZEydgwG2FQD6ZYGfIP0BObQ5GPCD7G83qzt/fcNUG41ddHTkS+daG8BLN1jZRd8PBLs
	c4asdCyid2W8hG6PY9T04XaKXqUTMhsHWfkVxRPgnkf1wZL4Qmc4HSs6aQpdG1KA6rho
	QMnEmYehKIAXZZOf/izy7lSYLfvgVFpejXz7AOQz2/XwaXJJI3X7qI/5rzUEycTlQ4uM
	Q1C7l5a+G7hTyVFMoSVhfveB0ztjx9cvkgmbmCDAj9AiSSjOBJSjmYZP81LnK6OWOitB
	CZdg==
X-Received: by 10.14.173.65 with SMTP id u41mr41473352eel.13.1356196642752;
	Sat, 22 Dec 2012 09:17:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 46sm29353929eeg.4.2012.12.22.09.17.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Dec 2012 09:17:22 -0800 (PST)
Date: Sat, 22 Dec 2012 18:17:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121222171718.GC8988@jama.palm1.palmone.com>
References: <20121220090714.GE14543@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20121220090714.GE14543@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: recipes failing after libpng and cups upgrade
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
X-List-Received-Date: Sat, 22 Dec 2012 17:32:10 -0000
X-Groupsio-MsgNum: 42323
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Content-Disposition: inline

--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 20, 2012 at 10:07:14AM +0100, Martin Jansa wrote:
> FYI: there are few more failing recipes in world build now:
> due to libpng upgrade:
> meta-oe/recipes-support/links/links-x11_2.0+2.1pre30.bb
> meta-oe/recipes-support/links/links_2.0+2.1pre30.bb
> meta-oe/recipes-multimedia/libass/libass_0.9.11.bb
> meta-oe/recipes-support/fltk/fltk_1.1.10.bb
> meta-oe/recipes-support/emacs/emacs_23.4.bb
> meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
> meta-oe/recipes-navigation/omgps/omgps_svn.bb

I've fixes for above, will send them tomorrow after more tests.

> due to cups upgrade:
> meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
>=20
> Cheers,
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDV6x4ACgkQN1Ujt2V2gBy2KQCfUoAPUpIuyv4DGtJOUTTzF93J
gpsAn2NmFc3dkSxIkh3tnsX0T7JHvGjz
=cS+x
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--
