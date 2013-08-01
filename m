Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 25C196B1C1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2013 10:32:17 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so906079eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Aug 2013 03:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wV7e8vQ+uuU6lkCdWdNrkthK72f7pEZX0Loq1p3fgrU=;
	b=N86Zt3QsZfOQQVis6lXicPinCz0Wo3627JzseZxiEh/DkEK7R6QNO24TOJsxLP/cWH
	sVmFHNfqJ8jwwWDpI6CPENYjahFZz0HY5N8Zv9PyPyjJeZqPKOmNVpeln1vYnFBYijUr
	L53/ulnmmVFVDNGunag/v55zSt/5IQ2a8y+4N/F9Pe46rd25mplkyRJixBcvcbdC/T4J
	FHqe8Chbe7zDANd+d5TZHuqVUKoHPHgQV76xptO7x06OQJgTad+OUn5R4DjAsIVR/CoW
	vmlcflPO5di07MRgDFNH9SaqWWYjLUx15FeICWG44zp8LYBuQnnbcYz9m/ubKd5wTlCr
	qysQ==
X-Received: by 10.15.95.4 with SMTP id bc4mr887792eeb.40.1375353138026;
	Thu, 01 Aug 2013 03:32:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id j2sm3283746eep.6.2013.08.01.03.32.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 03:32:17 -0700 (PDT)
Date: Thu, 1 Aug 2013 12:32:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130801103252.GL3280@jama>
References: <91586D499ADFD74FBCFB8425266A5DE40153ADA9D291@pluto.melinkcorp.local>
MIME-Version: 1.0
In-Reply-To: <91586D499ADFD74FBCFB8425266A5DE40153ADA9D291@pluto.melinkcorp.local>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: opkg: How to make package signal reboot required?
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
X-List-Received-Date: Thu, 01 Aug 2013 10:32:19 -0000
X-Groupsio-MsgNum: 45540
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EEx6GiKZGZ1wKUra"
Content-Disposition: inline

--EEx6GiKZGZ1wKUra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2013 at 09:28:50PM -0400, Bryan Evenson wrote:
> All,
>=20
> I have a package that I created for my setup which, when upgraded, will r=
equire a system reboot.  Is there a general flag/setting that already exist=
s to put in my Bitbake recipe to signal that the package requires a reboot?=
  If so, does it just set a flag that a reboot is required or does it force=
 a reboot?

I don't know about the feature to do the reboot, but we were using extra
metadata flags for .ipk to mark packages which need the reboot (so that
package manager can query updated packages and decide if it's needed).

See
http://patches.openembedded.org/patch/39181/
http://patches.openembedded.org/patch/39183/

I don't know why this wasn't ever merged in oe-core
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/031856=
=2Ehtml
doesn't have any negative review AFAIK.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EEx6GiKZGZ1wKUra
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH6OVQACgkQN1Ujt2V2gBwqmQCgteNHvW0bZKij0zPrkBvZ0j77
o2UAn3NyRwnrriufH7jmaiaQwY7eTDbL
=/1i3
-----END PGP SIGNATURE-----

--EEx6GiKZGZ1wKUra--
