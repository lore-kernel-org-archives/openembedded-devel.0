Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 99A2D73174
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 05:36:05 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id cf3so887363pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 22:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=hMFf995mNGAO2Xe2cZAnF8GSTwznv6BiA95BOGvsfQA=;
	b=gdAfHPyPRdhq2Ls9FR/Gud1WlyRWpduQaszpmTkrIkimbT6YNGia2STSnxzNIJ9t3y
	cmRPoBDRks/m/+QpXQ6uaclLT3J6TXU1xAy72B8vzn5opDHCkOewDtYX8w+HI0cfDBh3
	egX5A4U+TMqZawfu4LshOMZ4lZTx5r3xtPs+yUSYI1hjxbl9SvTVDy/cIcqTwXEovWLg
	4oORun9NOuBoBr6MQatFBH6LWF+zfEblOcUuLucNNdnMo1H8hZ0NsGY/VLdcHZsjucJw
	gXabutUy9kVPYL1+znRQ0CzHi0JgxeWZVpUQRl69mkx3fXZhXQW0GhaRYO4bBX3Hyb5n
	Yz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=hMFf995mNGAO2Xe2cZAnF8GSTwznv6BiA95BOGvsfQA=;
	b=Zl7n/0BaopRsmznkz0yinmOhSuOP0hDt+N9QE9iuC/GFmecy4GxVDZX/OeibByPXbL
	NJcZV3qb3vYHLfbuUjugpSdhD1QmcOHxTAmFqqNMAV2dKTWNMD96t5Z2FAyr49kAi3UE
	6VJK0qoRDZOWbboBKPjzJqKE+4gvuyqVvgCbPjVrnNOPmpqsWzTn97ij3nmcdLAOgDkT
	v0ZgetYLaXVcCz7GqQYpbXTVqvUsXNm+CIyO06AkY3RSTq6yyD8ZCcNC1pl/7F5Y3ljx
	YU/qQq24qokdmjZg8pmfnybDVdQE56Wo2Hjl1fGMnhM6ssjgUC1FQPg+lLDo98l/i17M
	ZIWg==
X-Gm-Message-State: AEkoout0W1ibcCMX0vSYZTPLk4SR4Wke17U7POhyewNXu6RwKwAhDu+YcNKnKEqtS/T0iw==
X-Received: by 10.67.3.197 with SMTP id by5mr23957191pad.119.1470980165672;
	Thu, 11 Aug 2016 22:36:05 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:5ca7:11cd:bb8a:7702?
	([2601:646:8882:b8c:5ca7:11cd:bb8a:7702])
	by smtp.gmail.com with ESMTPSA id
	ya6sm9269263pab.22.2016.08.11.22.36.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Aug 2016 22:36:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1470920876-22501-1-git-send-email-ricardo.ribalda@gmail.com>
Date: Thu, 11 Aug 2016 22:36:51 -0700
Message-Id: <D01FFBA5-7B48-4F0F-B1E0-3D96FE48044F@gmail.com>
References: <1470920876-22501-1-git-send-email-ricardo.ribalda@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-oe][PATCH v3 1/2] gflags: New recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Aug 2016 05:36:07 -0000
X-Groupsio-MsgNum: 62571
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B738EA10-2C59-4F85-8740-ED33F942D6D9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B738EA10-2C59-4F85-8740-ED33F942D6D9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 11, 2016, at 6:07 AM, Ricardo Ribalda Delgado =
<ricardo.ribalda@gmail.com> wrote:
>=20
> C++ library that implements commandline flags processing. It includes
> built-in support for standard types such as string and the ability to
> define flags in the source file in which they are used.
>=20
> Used optionally by glog
>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> meta-oe/recipes-support/gflags/gflags_2.1.2.bb | 19 =
+++++++++++++++++++
> 1 file changed, 19 insertions(+)
> create mode 100644 meta-oe/recipes-support/gflags/gflags_2.1.2.bb
>=20
> diff --git a/meta-oe/recipes-support/gflags/gflags_2.1.2.bb =
b/meta-oe/recipes-support/gflags/gflags_2.1.2.bb
> new file mode 100644
> index 000000000000..30fd5f85e253
> --- /dev/null
> +++ b/meta-oe/recipes-support/gflags/gflags_2.1.2.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "The gflags package contains a C++ library that =
implements commandline flags processing. It includes built-in support =
for standard types such as string and the ability to define flags in the =
source file in which they are used"
> +HOMEPAGE =3D "https://github.com/gflags/gflags"
> +LICENSE =3D =E2=80=9CBSD"

which Clause ?

> +LIC_FILES_CHKSUM =3D =
"file://COPYING.txt;md5=3Dc80d1a3b623f72bb85a4c75b556551df"
> +
> +SRCREV =3D "1a02f2851ee3d48d32d2c8f4d8f390a0bc25565c"
> +SRC_URI =3D "git://github.com/gflags/gflags.git;branch=3Drelease"
> +
> +S =3D "${WORKDIR}/git/"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE=3D"-DBUILD_SHARED_LIBS=3DON"
> +
> +FILES_${PN}-dev +=3D "${libdir}/cmake"
> +
> +PACKAGES =3D+ "${PN}-bash-completion"
> +FILES_${PN}-bash-completion +=3D "${bindir}/gflags_completions.sh"
> +RDEPENDS_${PN}-bash-completion =3D "bash-completion"
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_B738EA10-2C59-4F85-8740-ED33F942D6D9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAletYHgACgkQuwUzVZGdMxTnMgCeKrL2cpMoACBuCyI/fOJj1dZQ
lCUAnAqxmYrk2isJWPD129SJhsRRIIPR
=Eua2
-----END PGP SIGNATURE-----

--Apple-Mail=_B738EA10-2C59-4F85-8740-ED33F942D6D9--
