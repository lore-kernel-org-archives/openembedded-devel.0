Received: from mail-wg0-f52.google.com ([74.125.82.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TxZPG-0008Hw-7I
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 09:40:35 +0100
Received: by mail-wg0-f52.google.com with SMTP id 12so1950288wgh.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 00:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=a/6jEHFAkTq2oaNMm/wJyMZ8O+BkRziji0EazxK1Hr8=;
	b=GwnxvsGdaHzYpa9PdoWlOf4QFNtrgQuOrhLQyfQLEHUlOxKEkwmFf0PzUkOwZPXCgb
	tp9LQTa9xos52s1huoyH5mf/5Fb0GxiPvW4WEMmbxB5AciNOI1W+xtbPnFoKnqmqlMLs
	NEaq+0oPibNXvfhmvN0NMPPSKnCPfqBUr1b3DBGtnlbHu4mjDS2AnDCNUCq/zzlJmQmc
	DrEpXxZJN4AX3aHrPXuVArgHQklQwvmSheGtSEu4bKTJqTuBLbKb651Z9hHBHYTyYnid
	OOBRG7XG7oS11Mqdi+Ib0VmoGDmaIbimGqgoobnst1Rr54r5/4ZH0+6aq5eqi15EDE6D
	vE2w==
X-Received: by 10.180.95.135 with SMTP id dk7mr19668426wib.29.1358843101524;
	Tue, 22 Jan 2013 00:25:01 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id h19sm20450415wiv.7.2013.01.22.00.25.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 00:25:00 -0800 (PST)
Date: Tue, 22 Jan 2013 09:25:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130122082504.GO29386@jama.palm1.palmone.com>
References: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
	<1358681528-19761-2-git-send-email-koen@dominion.thruhere.net>
	<20130121102520.GM29386@jama.palm1.palmone.com>
	<32A56019-9BB6-4E54-874B-7F56D95006BA@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <32A56019-9BB6-4E54-874B-7F56D95006BA@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-multimedia][PATCH v2 2/7] x264: add git version
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
X-List-Received-Date: Tue, 22 Jan 2013 08:40:39 -0000
X-Groupsio-MsgNum: 42783
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m46qSNjkc66Ye11q"
Content-Disposition: inline

--m46qSNjkc66Ye11q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2013 at 09:16:43AM +0100, Koen Kooi wrote:
>=20
> Op 21 jan. 2013, om 11:25 heeft Martin Jansa <martin.jansa@gmail.com> het=
 volgende geschreven:
>=20
> > On Sun, Jan 20, 2013 at 12:32:03PM +0100, Koen Kooi wrote:
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> meta-oe/recipes-multimedia/x264/x264_git.bb | 38 +++++++++++++++++++++=
++++++++
> >> 1 file changed, 38 insertions(+)
> >> create mode 100644 meta-oe/recipes-multimedia/x264/x264_git.bb
> >>=20
> >> diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb b/meta-oe/rec=
ipes-multimedia/x264/x264_git.bb
> >> new file mode 100644
> >> index 0000000..8199a83
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-multimedia/x264/x264_git.bb
> >> @@ -0,0 +1,38 @@
> >> +SUMMARY =3D "x264 is a free software library and application for enco=
ding video streams into the H.264/MPEG-4 AVC format"
> >> +HOMEPAGE =3D "http://www.videolan.org/developers/x264.html"
> >> +
> >> +LICENSE =3D "GPLv2"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079=
bae19f"
> >> +
> >> +DEPENDS =3D "yasm-native"
> >> +
> >> +SRC_URI =3D "git://git.videolan.org/x264.git"
> >> +SRCREV =3D "1cffe9f406cc54f4759fc9eeb85598fb8cae66c7"
> >> +
> >> +PV =3D "r2230+git"
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +inherit lib_package pkgconfig
> >> +
> >> +EXTRA_OECONF =3D '--prefix=3D${prefix} \
> >> +                --host=3D${HOST_SYS} \
> >> +                --cross-prefix=3D${TARGET_PREFIX} \
> >> +                --sysroot=3D${STAGING_DIR_TARGET} \
> >> +                --enable-shared \
> >> +                --enable-static \
> >> +                --disable-lavf \
> >> +                ${X264_DISABLE_ASM} \
> >> +               '
> >=20
> > Did you forget to initialize X264_DISABLE_ASM?
> >=20
> > | You specified a pre-ARMv6 or Thumb-1 CPU in your CFLAGS.
> > | If you really want to run on such a CPU, configure with --disable-asm.
> > | ERROR: Function failed: do_configure (see
> > /OE/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/x264/r2230+git-r=
0/temp/log.do_configure.369
> > for further information)
>=20
> What's the TARGET_ARCH for that one? I'll add the arch overrides for disa=
bling the asm, but I'll need some help figuring out what those archs are :)

This was with armv5te (qemuarm, spitz) also failed for armv4t
(om-gta02).

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--m46qSNjkc66Ye11q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD+TN8ACgkQN1Ujt2V2gBye2gCffu4T4KVZsYWwoBMqsPJAzYx5
R4IAniSR2b1M1iXliAp9YeJiLXuMx7M7
=yzgv
-----END PGP SIGNATURE-----

--m46qSNjkc66Ye11q--
