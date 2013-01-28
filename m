Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tzqev-00021o-FA
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 16:30:09 +0100
Received: by mail-wi0-f170.google.com with SMTP id cb5so795761wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 07:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bgd/ZZ5XFGsTcJqztfvo+il4DKNuCjpbOJFKe08w6UE=;
	b=AQ1BYliyNJEVT02jcB7QXJ6eNxsljWI8zaS7pgirik7A6u/TFiv2Oagt3lZJ9k1U/X
	4RjzACSzwRT3gSun4mv1yfUDoKCtTBX7a7+nLnS07lBA3esp5uKSX80/YsSgJGiQ+GwB
	Jlhb9I0sunECfZil43lMcre4DMFL4+ZJ3w9/2q6mXub5SNkflCyQIYvPOYpejyyMPZ30
	HPgCEkUnZzk/0xP7HU88IcI4Ld1MzmjUcVFFTc6/lab12ose3j7NSBTTkR626f2/62KB
	SxhluSAM1rV0jUvhMaKQUv2ZjPoM8A8XF52LSeowAIBRcBXh+U1EcAeWSpnV6XCbGUmt
	oUnw==
X-Received: by 10.195.12.42 with SMTP id en10mr21940915wjd.24.1359386070917;
	Mon, 28 Jan 2013 07:14:30 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hu8sm12514737wib.6.2013.01.28.07.14.29
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 07:14:30 -0800 (PST)
Date: Mon, 28 Jan 2013 16:14:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130128151434.GC16904@jama.palm1.palmone.com>
References: <1359381032-24881-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1359381032-24881-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd/V2 0/4] remove systemd core images & update bbappends
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
X-List-Received-Date: Mon, 28 Jan 2013 15:30:10 -0000
X-Groupsio-MsgNum: 42896
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kJMkLA1uPhjFFA+D"
Content-Disposition: inline

--kJMkLA1uPhjFFA+D
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2013 at 02:50:28PM +0100, Andreas M=FCller wrote:
> The following changes since commit 164caa34458ed2c145dfa2e4d2d207f8ce47a0=
57:
>=20
>=20
> are available in the git repository at:
>   git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches
>=20
> Andreas M=FCller (4):
>       systemd: remove core recipes - they migrated to oe-core
>       systemd-speed-hacks: remove

I plan to merge those 2 a bit later

>       dhcp: follow oe-core to 4.2.5
>       util-linux: follow oe-core to 2.22.2

Applied those 2 now, thanks!.

Cheers,

>=20
>  ...{dhcp_4.2.4-P2.bbappend =3D> dhcp_4.2.5.bbappend} |    0
>  ..._2.22.1.bbappend =3D> util-linux_2.22.2.bbappend} |    0
>  .../recipes-core/systemd/systemd-compat-units.bb   |   59 ----
>  .../systemd/systemd-compat-units/machineid.service |   16 -
>  .../systemd-compat-units/run-postinsts.service     |   17 -
>  .../recipes-core/systemd/systemd-serialgetty.bb    |   46 ---
>  .../systemd/systemd-serialgetty/LICENSE            |  339 --------------=
------
>  .../systemd-serialgetty/serial-getty@.service      |   32 --
>  .../recipes-core/systemd/systemd-speed-hacks.bb    |   18 -
>  .../systemd/systemd-systemctl-native.bb            |   18 -
>  .../systemd/systemd-systemctl-native/systemctl     |  126 --------
>  ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ------
>  ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ------
>  .../recipes-core/systemd/systemd/gtk-doc.make      |  230 -------------
>  .../recipes-core/systemd/systemd/modprobe.rules    |   17 -
>  .../systemd/systemd/optional_secure_getenv.patch   |   19 --
>  .../systemd-pam-configure-check-uclibc.patch       |   26 --
>  .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 --
>  .../systemd/systemd-pam-fix-fallocate.patch        |   82 -----
>  .../systemd/systemd-pam-fix-getty-unit.patch       |   35 --
>  .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ----------
>  .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 --------------=
-----
>  .../recipes-core/systemd/systemd/touchscreen.rules |   18 -
>  .../recipes-core/systemd/systemd/var-run.conf      |    4 -
>  meta-systemd/recipes-core/systemd/systemd_git.bb   |  263 ---------------
>  25 files changed, 0 insertions(+), 2086 deletions(-)
>  rename meta-systemd/oe-core/recipes-connectivity/dhcp/{dhcp_4.2.4-P2.bba=
ppend =3D> dhcp_4.2.5.bbappend} (100%)
>  rename meta-systemd/oe-core/recipes-core/util-linux/{util-linux_2.22.1.b=
bappend =3D> util-linux_2.22.2.bbappend} (100%)
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-compat-unit=
s.bb
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-compat-unit=
s/machineid.service
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-compat-unit=
s/run-postinsts.service
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-serialgetty=
=2Ebb
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-serialgetty=
/LICENSE
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-serialgetty=
/serial-getty@.service
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-speed-hacks=
=2Ebb
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-systemctl-n=
ative.bb
>  delete mode 100755 meta-systemd/recipes-core/systemd/systemd-systemctl-n=
ative/systemctl
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/0001-Revert=
-systemd-analyze-use-argparse-instead-of-getop.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/0002-Revert=
-analyze-use-GDBus-instead-of-dbus-python.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/gtk-doc.make
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/modprobe.ru=
les
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/optional_se=
cure_getenv.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-configure-check-uclibc.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-fix-execvpe.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-fix-fallocate.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-fix-getty-unit.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-fix-mkostemp.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-fix-msformat.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/touchscreen=
=2Erules
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/var-run.conf
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd_git.bb
>=20
> --=20
> 1.7.6.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kJMkLA1uPhjFFA+D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEGldoACgkQN1Ujt2V2gBzl2gCfbmkimWoUE9N1iGsdKFrQIrJ0
QaQAnizPBtdOLpZ3+G/AdYmmGYFcfOWQ
=qV5o
-----END PGP SIGNATURE-----

--kJMkLA1uPhjFFA+D--
