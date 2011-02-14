Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PowtV-0002Wz-ON
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 12:47:06 +0100
Received: by bwz10 with SMTP id 10so5103377bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 03:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ikd51IYObyCxF3HRrV7cqOG15zT/LLSIeBarBxcnmfE=;
	b=xEOVWo8IKeAtgO8csSXFfWnbtQ+1rJp2BQBK70WQLbFnlvjGLY7qVKK4d4Cz7gt2qE
	9uOFfkfYewG965pJAT13MiW2zjdvWxzp4F1u7ztNIB2f08miJKWjYe7Z48haImWhkCHn
	+NPF2RV8zCRQAgbXYdAgUxwyxJExu8kvjey48=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=dA8wwmBJ/Y0hAgqBAq2lYsaiNbkU/4Vq93S6+9H7l0sQG5gkSV55DMBEPuY/X8uCX2
	alEfdW6hAu7jKKZBudzgNcbKY9YyQM4UgKdbLdLKu4a7+zvi0ei4cSZPidz95ce49v6R
	h3MhIMUxr58nF4YJIqwEz49NPa7cmR/0B0xLg=
Received: by 10.204.32.216 with SMTP id e24mr14013462bkd.204.1297683953406;
	Mon, 14 Feb 2011 03:45:53 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f20sm1714671bkf.16.2011.02.14.03.45.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Feb 2011 03:45:52 -0800 (PST)
Date: Mon, 14 Feb 2011 12:45:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110214114545.GC8619@localhost.jama.net>
References: <20110214102232.GB8619@localhost.jama.net>
MIME-Version: 1.0
In-Reply-To: <20110214102232.GB8619@localhost.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: debian.bbclass issues when some package is substring of another
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
X-List-Received-Date: Mon, 14 Feb 2011 11:47:06 -0000
X-Groupsio-MsgNum: 29160
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Content-Disposition: inline

--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2011 at 11:22:32AM +0100, Martin Jansa wrote:
> After last rebuild from scratch I got
> Package libncursesw (5.7+20110115-r16.6)
> instead of expected
> Package libncursesw5 (5.7+20110115-r16.6)
> which I had before (and which is _still_ in depends of packages needing
> it - like ie screen)

To be more clear about that issue:

second buildhost
DEBUG: setVar PKG_ncurses-libpanelw, libpanelw5            <=3D ok
DEBUG: setVar PKG_ncurses-libmenu, libmenu5
DEBUG: setVar PKG_ncurses-libmenuw, libmenuw               <=3D bad
DEBUG: setVar PKG_ncurses-libncursesw, libncursesw5        <=3D ok
DEBUG: setVar PKG_ncurses-libformw, libformw5              <=3D ok
DEBUG: setVar PKG_ncurses-libtic, libtic5
DEBUG: setVar PKG_ncurses-libticw, libticw                 <=3D bad
DEBUG: setVar PKG_ncurses-libtinfo, libtinfo5
DEBUG: setVar PKG_ncurses-libncurses, libncurses5
DEBUG: setVar PKG_ncurses-libform, libform5
DEBUG: setVar PKG_ncurses-libpanel, libpanel5

my buildhost
DEBUG: setVar PKG_ncurses-libformw, libformw5             <=3D ok
DEBUG: setVar PKG_ncurses-libncurses, libncurses5
DEBUG: setVar PKG_ncurses-libncursesw, libncursesw        <=3D bad
DEBUG: setVar PKG_ncurses-libpanelw, libpanelw5           <=3D ok
DEBUG: setVar PKG_ncurses-libmenuw, libmenuw5             <=3D ok
DEBUG: setVar PKG_ncurses-libtinfo, libtinfo5
DEBUG: setVar PKG_ncurses-libpanel, libpanel5
DEBUG: setVar PKG_ncurses-libtic, libtic5
DEBUG: setVar PKG_ncurses-libticw, libticw                <=3D bad
DEBUG: setVar PKG_ncurses-libform, libform5
DEBUG: setVar PKG_ncurses-libmenu, libmenu5

my buildhost after removing prepend=3DTrue in ncurses recipe
-        do_split_packages(d, libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses =
%s library', prepend=3DTrue, extra_depends =3D '', allow_links=3DTrue)
+        do_split_packages(d, libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses =
%s library', extra_depends =3D '', allow_links=3DTrue)

DEBUG: setVar PKG_ncurses-libticw, libticw5              <=3D ok
DEBUG: setVar PKG_ncurses-libmenu, libmenu5
DEBUG: setVar PKG_ncurses-libmenuw, libmenuw             <=3D bad
DEBUG: setVar PKG_ncurses-libform, libform5
DEBUG: setVar PKG_ncurses-libformw, libformw             <=3D bad
DEBUG: setVar PKG_ncurses-libtic, libtic5
DEBUG: setVar PKG_ncurses-libpanel, libpanel5
DEBUG: setVar PKG_ncurses-libpanelw, libpanelw           <=3D bad
DEBUG: setVar PKG_ncurses-libtinfo, libtinfo5
DEBUG: setVar PKG_ncurses-libncursesw, libncursesw5      <=3D ok
DEBUG: setVar PKG_ncurses-libncurses, libncurses5

so it really depends on order in PACKAGES which in this case also depends on
for walkroot, dirs, files in os.walk(dvar + root) (from package.bbclass)
which isn't consistene even between 2 buildhosts.

Alphabetical descending sort should give better results (substrings later),
but is it right thing to do? And can we do it in do_split_packages as sorti=
ng
whole PACKAGES var is not possible due to order how FILES_ are used.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1ZFekACgkQN1Ujt2V2gBxQPQCgm/S8JhJByUaYiPb4MNKX6IFY
d5QAn0AEK2u9u4DPUVwfW8wHz7khKaX5
=uWGl
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--
