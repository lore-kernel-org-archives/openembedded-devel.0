Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2A9EC71633
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 21:25:07 +0000 (UTC)
Received: by padhm10 with SMTP id hm10so18526422pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 14:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=2KYKzgSbdLQTDwA2CooDV2oMXJI92fN88Nul4gbHoHs=;
	b=FQGcBJTignlRvi41DKS77W2pRXGp0owJYdApwFUKPea7IfBflHMRxI6nQarxdCSrcj
	48FjeS5Ghk448Yt6eboe3hxOA1DvY+/9BvfZFk6uo0n/IEF4uFgd82bNBBe8gvik5ai1
	vs5Zz5i2GL2xfFOESdsHtd9/M74X4+0mdKXQrCkQAEuL98ipp0ynoeroXrgh5LCBMvfZ
	at4zF5JRRkV26T19vLXOlZ0X3braUABbhpwUYdPkGJ4hzqCWAA1HSvYpOS0NgOxSM1vu
	SYaI748xFBU9XWr6tA6eZS8aX9Y5hOGM4LRg13A72OxV1O3aQlIzcqHftBR7kCQkVAeA
	9FeQ==
X-Received: by 10.66.158.3 with SMTP id wq3mr18994038pab.38.1440797108085;
	Fri, 28 Aug 2015 14:25:08 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:7d23:7778:9afb:7675?
	([2601:646:8601:4580:7d23:7778:9afb:7675])
	by smtp.gmail.com with ESMTPSA id
	dh1sm6721319pbd.49.2015.08.28.14.25.07
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Aug 2015 14:25:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1440795819-12741-1-git-send-email-soren.brinkmann@xilinx.com>
Date: Fri, 28 Aug 2015 14:24:59 -0700
Message-Id: <8C2F1BF4-189B-4743-82F1-C2BB272AEA8A@gmail.com>
References: <1440795819-12741-1-git-send-email-soren.brinkmann@xilinx.com>
To: Soren Brinkmann <soren.brinkmann@xilinx.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] Add analyze-suspend
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
X-List-Received-Date: Fri, 28 Aug 2015 21:25:08 -0000
X-Groupsio-MsgNum: 57114
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2C7DA0FC-DC8F-4A26-918F-E11A17299A5B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2C7DA0FC-DC8F-4A26-918F-E11A17299A5B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 28, 2015, at 2:03 PM, Soren Brinkmann =
<soren.brinkmann@xilinx.com> wrote:
>=20
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
> v3:
> - define PV =3D "3.2+gitr${SRCPV}"
> - simplify do_install function
> - add DESCRIPTION
> - fix README file perms
> v2:
> - replace 'boot'->'suspend' in commit message
> - document kernel dependencies in recipe
> - pin git commit

this is fine

> ---
> .../analyze-suspend/analyze-suspend_git.bb         | 29 =
++++++++++++++++++++++
> 1 file changed, 29 insertions(+)
> create mode 100644 =
meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
>=20
> diff --git =
a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb =
b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
> new file mode 100644
> index 000000000000..d97ff0a5bdd2
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
> @@ -0,0 +1,29 @@
> +SUMMARY =3D "Analyze Suspend"
> +DESCRIPTION =3D "analyze-suspend is a tool for system developers to =
visualize \
> +the activity between suspend and resume, allowing them to identify \
> +inefficiencies and bottlenecks."
> +HOMEPAGE =3D "https://01.org/suspendresume"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7e"
> +
> +# Apart from the listed RDEPENDS, analyze-suspend depends on some =
features
> +# provided by the kernel. These options are:
> +#   - CONFIG_PM_DEBUG=3Dy
> +#   - CONFIG_PM_SLEEP_DEBUG=3Dy
> +#   - CONFIG_FTRACE=3Dy
> +#   - CONFIG_FUNCTION_TRACER=3Dy
> +#   - CONFIG_FUNCTION_GRAPH_TRACER=3Dy
> +
> +RDEPENDS_${PN} +=3D "python-core python-datetime python-stringold"
> +
> +PV =3D "3.2+gitr${SRCPV}"
> +SRCREV =3D "bce3cbec43bc2ce7a8c79b210314dd9d9ac1010b"
> +SRC_URI =3D "git://github.com/01org/suspendresume.git;protocol=3Dhttps"=

> +S =3D "${WORKDIR}/git"
> +
> +do_install() {
> +	install -Dm 0755 analyze_suspend.py =
${D}${bindir}/analyze_suspend.py
> +	install -Dm 0644 README ${D}${docdir}/analyze-suspend/README
> +}
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.5.0.3.g52d66ab
>=20


--Apple-Mail=_2C7DA0FC-DC8F-4A26-918F-E11A17299A5B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXg0bIACgkQuwUzVZGdMxTWSgCghoVsNcuyTU5AaEyB9OqzNpA6
kWwAnjd034esQwWqiTnDsTvWQ2bOSBOw
=WazS
-----END PGP SIGNATURE-----

--Apple-Mail=_2C7DA0FC-DC8F-4A26-918F-E11A17299A5B--
