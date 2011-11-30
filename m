Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVhba-00056X-Ts
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 11:41:34 +0100
Received: by eekc1 with SMTP id c1so236162eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 02:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G16+wwiax1nfrgb1MMYsRzxtyOOzIqhc+mrmZQoY5P0=;
	b=yGJlGi2GlAE4NOldyWsMbdWZEXNA7y1DVsiifnKJFUI2h43KFfjo2dXvKBGQXPntRJ
	jx1QmrtCO+TVbUBb/weKAFMXtPgyFCnaEDGp/+8l2Dx86fFD/JIvUUtbW+HCzUhE7hv/
	x0iAYTeGyYYNhf67e6jlWkFtBXa9lAQ93d3vQ=
Received: by 10.14.5.148 with SMTP id 20mr202702eel.105.1322649294890;
	Wed, 30 Nov 2011 02:34:54 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d6sm4755033eec.10.2011.11.30.02.34.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 02:34:53 -0800 (PST)
Date: Wed, 30 Nov 2011 11:34:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111130103441.GB4799@jama.jama.net>
References: <a>
	<55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
	<ecba1c3e0b6a24b2dfe237b04ad6789b32014391.1322640506.git.Martin.Jansa@gmail.com>
	<jb4t09$rmo$3@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jb4t09$rmo$3@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl 11/11] elementary: disable web support
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
X-List-Received-Date: Wed, 30 Nov 2011 10:41:35 -0000
X-Groupsio-MsgNum: 35759
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Content-Disposition: inline

--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2011 at 10:28:41AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 30-11-11 09:16, Martin Jansa schreef:
> > * we don't have webkit-efl in DEPENDS so it depends on build order if
> > it's autodetected or not for elementary * libewebkit0 is quite bit so we
> > don't want to pull it to every image with elementary
>=20
> I was about to suggest splitting it...
>=20
> > * and we cannot split elementary web support to different package becau=
se
> > libewebkit is linked directly from libelementary-ver-pre-svn-09.so.0.8.0
>=20
> ... but you've already answered that :)

I was also thinking about spliting libewebkit a bit more
SHR root@gjama / $ ls -lah /usr/lib/libewebkit.so.0.1.0
-rwxr-xr-x 1 root root 525K Nov 10 10:09 /usr/lib/libewebkit.so.0.1.0

525K is not that big, but:
SHR root@gjama / $ opkg info libewebkit0 | grep Size
Size: 13192646

lrwxrwxrwx 1 root root   19 Nov 28 15:47 /usr/lib/libewebkit.so.0 -> libewe=
bkit.so.0.1.0
-rwxr-xr-x 1 root root 525K Nov 10 10:09 /usr/lib/libewebkit.so.0.1.0
lrwxrwxrwx 1 root root   30 Nov 28 15:47 /usr/lib/libjavascriptcore_efl.so.=
0 -> libjavascriptcore_efl.so.0.1.0
-rwxr-xr-x 1 root root 4.2M Nov 10 10:09 /usr/lib/libjavascriptcore_efl.so.=
0.1.0
lrwxrwxrwx 1 root root   23 Nov 28 15:47 /usr/lib/libwebcore_efl.so.0 -> li=
bwebcore_efl.so.0.1.0
-rwxr-xr-x 1 root root  41M Nov 10 10:09 /usr/lib/libwebcore_efl.so.0.1.0
lrwxrwxrwx 1 root root   19 Nov 28 15:47 /usr/lib/libwtf_efl.so.0 -> libwtf=
_efl.so.0.1.0
-rwxr-xr-x 1 root root 413K Nov 10 10:09 /usr/lib/libwtf_efl.so.0.1.0
-rw-r--r-- 1 root root 116K Nov 10 10:06 /usr/share/ewebkit-0/themes/defaul=
t.edj

and
SHR root@gjama / $ ldd /usr/lib/libewebkit.so.0.1.0  | grep web
        libwebcore_efl.so.0 =3D> /usr/lib/libwebcore_efl.so.0 (0x403a5000)

So we cannot even pull only smaller 525K part of it..

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7WBsEACgkQN1Ujt2V2gBwWygCfdKQ8A9rcig9kkafiBWlAAI75
VWIAoLAyP4uxI0boU0YF4XbrDywwmP5G
=Xpkt
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
