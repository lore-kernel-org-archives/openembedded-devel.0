Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21872.1795538520002439526
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 08:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pengutronix.de header.s=20260414 header.b=G3UKqEWn;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: mfe@pengutronix.de)
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.4.pengutronix.de [10.9.0.3])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C1D0E201FF7;
	Tue, 24 Nov 2026 17:41:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795538512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WKCFffV+TKEuMz0XJVRJNG13Iv7Wj2YuDCKyCReoDS4=;
	b=G3UKqEWnwdwb2YvayWKxQTyATRCPX2zYdUSRCOlwesHWAy4dDrvn2gzBcsdhozEvnPLpZe
	E01NvUiMk/1YfUX6kbBUPiu3l4Kil3yZfYk+5Q2JUl9pll6IyvyJUZmUmO3qRJCNrm8NrG
	F/MNW2KzINZWpaOq7qbf2rFuKy9Tbw/VuL8IrJI7PthzBJbpFRn4HYVMNk6ti/ZvpTDLJt
	mK7UH5ILq56GZtqymMLLi685hiIs2spxp7LlB/g0XeihRUCfZ1qHWCnhh2oyXNQ/qxQCLk
	66KgUvl6hmoMhVD0WPlik57/Xswd8VbjDUTvaT3NVLn2dCiTWfN6ymMR4AaSOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795538512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WKCFffV+TKEuMz0XJVRJNG13Iv7Wj2YuDCKyCReoDS4=;
	b=Vy6YMRFlxbRqTUzeTj/gePKNyH8rl94wcWwLD3VU48YwNq+G/uWsjNf34Gn+yMif5RRPtS
	3fsgT9kAaxYuXbbljy27tibI0chPEDHGDOxDh9YZhcTUSNJvq7dFj1fmv+x/dYofjVdHsc
	H30BduMy0IfWbE5hE2HPWEzRq4pEOOc97UMSQyt+UfZ5Tzwy/6oIPhfkk64/R6TxiOHjke
	MVTxWZf0GTFMZOn9RBlnL3gvacD0jHPmqnOWexr4Kdtes/wo8ntGvqXrCYyATlqP4dS3AG
	2PqPRmPyR2iCIT2phuAWAkPfwp+8UCifF30a6lAep4t2itVdReqfsitS0RrQ9g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795538512; a=rsa-sha256;
	cv=none;
	b=CJW6WBQIkB9bPEobdlcrznyJLjYNBA3dsWdlzW7yU1Du/YPUL5CB7kQylN3ndjpsvM46Ly
	z8VkctBM1es+l7wvGZ0aCYjQs9VU9zpPhqUd8ORtOvsOEX/V3uKDJsIH/otnHkFPTU5mfJ
	sTXd2n+l5ZMUI65rFuoxWQdvJD+LZX9P9TJxAZxfTmuTcWIR4GnJMBKcmANyN5My7jLbEt
	+QA/Jx1zcDX2fQ0Mcka3z03g151lxqazJvwct279G0WdF34sVsERWnsY8e2mGz5C4dCuvH
	cN3wC70HTSLiIkZX7ecnO5xl5AGPFuUCL04BtRoZV7lcI3VTrE0axA9mNPMgJw==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id A424E1BF3F0; Tue, 24 Nov 2026 17:41:52 +0100 (CET)
Date: Tue, 24 Nov 2026 17:41:52 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: Fabian Pflug <f.pflug@pengutronix.de>, khem.raj@oss.qualcomm.com, 
	openembedded-devel@lists.openembedded.org, yocto@pengutronix.de
Subject: Re: [oe] [yocto] [meta-initramfs][PATCH] rsinit: add recipe for
 /init written in rust
Message-ID: <kxldhbqfbewjkjr3idksokecmjfyfsznst2phlwsnuealzeftn@knwddty63nxn>
References: <20261123101533.3325486-1-f.pflug@pengutronix.de>
 <ckxwzsldrxqucqv2hrf2vbixryv57tjnghwm5q3vzfsn244ucm@3naoywqkyuxy>
 <CAMKF1srGB20M0F--WUdkWMA6B64JdYXvzC82CUQaoFHUq9Rb=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMKF1srGB20M0F--WUdkWMA6B64JdYXvzC82CUQaoFHUq9Rb=Q@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 16:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132953

On 26-11-24 08:29, Khem Raj wrote:
> On Tue, Nov 24, 2026 at 8:09=E2=80=AFAM Marco Felsch via openembedded-d=
evel
> <m.felsch=3Dpengutronix.de@lists.openembedded.org> wrote:
>=20
> > Hi Khem,
> >
> > sorry for the noise, but this patch was sent prematurely and we notic=
ed
> > that you already applied it to master.
> >
> > Is it possible to revert the patch from master? Our goal is to get th=
e
> > recipe into oe-core instead.
> >
>=20
> Please provide needed fixes in meta-oe itself, getting into OE-Core is
> better
> justified that way eventually since there is a higher bar to be include=
d in
> OE-Core

If I got your right, the shall be:
 1) We send fixes patches on top of the merged patch.
 2) Once everything is in place we can try to move from meta-oe to
    oe-core?

Regards,
  Marco



>=20
>=20
> >
> > Regards,
> >   Marco
> >
> > On 26-11-23 11:14, Fabian Pflug wrote:
> > > rsinit speeds up the boot by not having to parse all the bash scrip=
ts
> > > currently used in the initramfs and replacing it with a single bina=
ry
> > > written in rust.
> > >
> > > Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
> > > ---
> > >  .../recipes-core/rsinit/rsinit-crates.inc     | 36 +++++++++++++++=
++++
> > >  .../recipes-core/rsinit/rsinit_v0.1.0.bb      | 31 +++++++++++++++=
+
> > >  2 files changed, 67 insertions(+)
> > >  create mode 100644 meta-initramfs/recipes-core/rsinit/rsinit-crate=
s.inc
> > >  create mode 100644 meta-initramfs/recipes-core/rsinit/rsinit_v0.1.=
0.bb
> > >
> > > diff --git a/meta-initramfs/recipes-core/rsinit/rsinit-crates.inc
> > b/meta-initramfs/recipes-core/rsinit/rsinit-crates.inc
> > > new file mode 100644
> > > index 0000000000..9970c4a913
> > > --- /dev/null
> > > +++ b/meta-initramfs/recipes-core/rsinit/rsinit-crates.inc
> > > @@ -0,0 +1,36 @@
> > > +# Autogenerated with 'bitbake -c update_crates rsinit'
> > > +
> > > +# from Cargo.lock
> > > +SRC_URI +=3D " \
> > > +    crate://crates.io/bitflags/2.13.0 \
> > > +    crate://crates.io/cfg-if/1.0.4 \
> > > +    crate://crates.io/cfg_aliases/0.2.1 \
> > > +    crate://crates.io/getrandom/0.2.17 \
> > > +    crate://crates.io/git-version/0.3.9 \
> > > +    crate://crates.io/git-version-macro/0.3.9 \
> > > +    crate://crates.io/json/0.12.4 \
> > > +    crate://crates.io/libc/0.2.186 \
> > > +    crate://crates.io/log/0.4.32 \
> > > +    crate://crates.io/nix/0.31.3 \
> > > +    crate://crates.io/proc-macro2/1.0.106 \
> > > +    crate://crates.io/quote/1.0.45 \
> > > +    crate://crates.io/syn/2.0.118 \
> > > +    crate://crates.io/unicode-ident/1.0.24 \
> > > +    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
> > > +"
> > > +
> > > +SRC_URI[bitflags-2.13.0.sha256sum] =3D
> > "b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8"
> > > +SRC_URI[cfg-if-1.0.4.sha256sum] =3D
> > "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
> > > +SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D
> > "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
> > > +SRC_URI[getrandom-0.2.17.sha256sum] =3D
> > "ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0"
> > > +SRC_URI[git-version-0.3.9.sha256sum] =3D
> > "1ad568aa3db0fcbc81f2f116137f263d7304f512a1209b35b85150d3ef88ad19"
> > > +SRC_URI[git-version-macro-0.3.9.sha256sum] =3D
> > "53010ccb100b96a67bc32c0175f0ed1426b31b655d562898e57325f81c023ac0"
> > > +SRC_URI[json-0.12.4.sha256sum] =3D
> > "078e285eafdfb6c4b434e0d31e8cfcb5115b651496faca5749b88fafd4f23bfd"
> > > +SRC_URI[libc-0.2.186.sha256sum] =3D
> > "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
> > > +SRC_URI[log-0.4.32.sha256sum] =3D
> > "953f07c43838f8e6f9758cab68bf5bed85465e7587ebe0b823f1bcd81978ad3a"
> > > +SRC_URI[nix-0.31.3.sha256sum] =3D
> > "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
> > > +SRC_URI[proc-macro2-1.0.106.sha256sum] =3D
> > "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
> > > +SRC_URI[quote-1.0.45.sha256sum] =3D
> > "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
> > > +SRC_URI[syn-2.0.118.sha256sum] =3D
> > "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
> > > +SRC_URI[unicode-ident-1.0.24.sha256sum] =3D
> > "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
> > > +SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D
> > "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
> > > diff --git a/meta-initramfs/recipes-core/rsinit/rsinit_v0.1.0.bb
> > b/meta-initramfs/recipes-core/rsinit/rsinit_v0.1.0.bb
> > > new file mode 100644
> > > index 0000000000..e2c5e71d54
> > > --- /dev/null
> > > +++ b/meta-initramfs/recipes-core/rsinit/rsinit_v0.1.0.bb
> > > @@ -0,0 +1,31 @@
> > > +SUMMARY =3D "minimalistic init written in rust"
> > > +DESCRIPTION =3D "rsinit is a minimalistic single binary init for t=
he
> > initramfs for embedded systems"
> > > +HOMEPAGE =3D "https://github.com/pengutronix/rsinit"
> > > +
> > > +LICENSE =3D "GPL-2.0-only AND CC0-1.0"
> > > +LIC_FILES_CHKSUM =3D
> > "file://LICENSES/GPL-2.0-only.txt;md5=3D570a9b3749dd0463a1778803b12a6=
dce \
> > > +
> > file://LICENSES/CC0-1.0.txt;md5=3D65d3616852dbf7b1a6d4b53b00626032"
> > > +
> > > +SRC_URI =3D "git://
> > github.com/pengutronix/rsinit.git;protocol=3Dhttps;branch=3Dmain"
> > > +SRCREV =3D "${PV}"
> > > +
> > > +inherit cargo cargo-update-recipe-crates
> > > +
> > > +require ${BPN}-crates.inc
> > > +
> > > +INSANE_SKIP:${PN} +=3D "already-stripped"
> > > +
> > > +PACKAGECONFIG ??=3D " \
> > > +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', =
'',
> > d)} \
> > > +    reboot \
> > > +"
> > > +
> > > +PACKAGECONFIG[defaults] =3D ",--no-default-features"
> > > +PACKAGECONFIG[dmverity] =3D "--features dmverity"
> > > +PACKAGECONFIG[reboot] =3D "--features reboot-on-failure"
> > > +PACKAGECONFIG[systemd] =3D "--features systemd"
> > > +PACKAGECONFIG[usb9pfs] =3D "--features usb9pfs"
> > > +
> > > +# cargo installs everything into ${bindir}, which is normally /usr=
/bin.
> > > +# Not the best choice for the init system, which should reside und=
er
> > /init
> > > +bindir =3D ""
> > > --
> > > 2.47.3
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#132951):
> > https://lists.openembedded.org/g/openembedded-devel/message/132951
> > Mute This Topic: https://lists.openembedded.org/mt/122431108/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [
> > raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
