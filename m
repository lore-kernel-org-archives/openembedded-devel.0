Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 080D760762
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 16:47:47 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y68so6229572pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2016 09:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=4FrhVPzISoBoFwIqSEApmR6RO8O/2cYBMkWSmDUz0Hw=;
	b=SylvisVtKEZaLZjLb5K91dKRrWdt0aTubSEn0OqYNkXbEJokq6bWxo5NXaJCKUXwxR
	NQaZWWe0SMcTYN0DjQwZ2t5WCHGbudaz1b9GFKEJgqz/ElcZ6FJG0lRfQ40EetfwuYTc
	l3XFYGoXFeVprnG4S0biFXfywPKk12Ho3TuFhlAe2AFeBI74vy/bkqh4UrXYdtsBrorE
	y+JYBQwlDPkQ3ZUHkOl4f6W+pZyCnFm/eckNsfG1NVUlGRvgv/698/WpMIw9y5BRk2Oy
	QduFZiV3O0tkjMS0Oj6wf5ZBLleUI8Eye43ULhKpVAt4bfv3H0jq8ff9pmkccUtRwXPe
	WiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=4FrhVPzISoBoFwIqSEApmR6RO8O/2cYBMkWSmDUz0Hw=;
	b=JkhQXTcLGCwtZIBEUUtNIfW2jttqubAT7zc8eXq4wWriqy7JNC2aBuX+i4V1T2Qkh3
	ekvatEXdxiQQow9HlpHtPYXTfiKjX5NajIczac5J/o6xIpkQBluDfMMZK+JICrwt8p43
	Hs3uYVuR8mYpBT4u5W4ZjIuxkoOjSsXmC4rw8oupmZlFETBimMucQLdCpQtmkpqyV7A7
	Vrae4kuT8xenOay+AXLNz51vpPJVN69xPq6lOwGbluJcO2xExUIYAkNMTQ1IXR6s0z4U
	HWIbs6/ikblwsbw8Eny5du+F2H9A/m4Bq1FnDghsLpVihEnSzZFNPqk5KghjIWW6gON3
	JPSg==
X-Gm-Message-State: ABUngvceCxxcntU2wDQ2F4VrbwKp0NRjQTqQicNiyER8u+dNPjf6Gfc8A/1XJrnmw/uq2w==
X-Received: by 10.99.143.2 with SMTP id n2mr50216879pgd.70.1478018868270;
	Tue, 01 Nov 2016 09:47:48 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:bd37:fcaa:669f:4910?
	([2601:646:8882:b8c:bd37:fcaa:669f:4910])
	by smtp.gmail.com with ESMTPSA id
	v6sm41505592paz.45.2016.11.01.09.47.47
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 09:47:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1477887173-20915-1-git-send-email-ting.liu@nxp.com>
Date: Tue, 1 Nov 2016 09:47:46 -0700
Message-Id: <8288DE57-F7E8-4C0C-B072-4043981592D3@gmail.com>
References: <1477887173-20915-1-git-send-email-ting.liu@nxp.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] xterm: package /usr/lib/X11 to avoid installed-vs-shipped error on ppc64
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
X-List-Received-Date: Tue, 01 Nov 2016 16:47:48 -0000
X-Groupsio-MsgNum: 63678
Content-Type: multipart/signed;
	boundary="Apple-Mail=_31FCD534-6F22-495A-BF45-6C76BF5659E3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_31FCD534-6F22-495A-BF45-6C76BF5659E3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 30, 2016, at 9:12 PM, ting.liu@nxp.com wrote:
>=20
> From: Ting Liu <ting.liu@nxp.com>
>=20
> commit 'ad5d2ff6c782a3319aedc25cc641574e39328460 xterm: 308 -> 320' =
changed
> FILES_${PN} from "/usr/lib/X11" to "${libdir}/X11". This leads to QA =
issue
> on ppc64 which defines libdir as /usr/lib64:
> ERROR: QA Issue: xterm: Files/directories were installed but not =
shipped in any package:
>  /usr/lib
>  /usr/lib/X11
>  /usr/lib/X11/app-defaults
>  /usr/lib/X11/app-defaults/UXTerm
>  /usr/lib/X11/app-defaults/KOI8RXTerm-color
>  /usr/lib/X11/app-defaults/XTerm-color
>  /usr/lib/X11/app-defaults/UXTerm-color
>  /usr/lib/X11/app-defaults/KOI8RXTerm
>  /usr/lib/X11/app-defaults/XTerm
>=20
> Restore the setting of FILES_${PN} to package the installed ASCII text =
files.
>=20
> Signed-off-by: Ting Liu <ting.liu@nxp.com>
> ---
> meta-oe/recipes-graphics/xorg-app/xterm_325.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_325.bb =
b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
> index e0baf3c..a627af0 100644
> --- a/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
> +++ b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
> @@ -27,4 +27,4 @@ do_configure() {
>     oe_runconf
> }
>=20
> -FILES_${PN} +=3D "${libdir}/X11"
> +FILES_${PN} +=3D "/usr/lib/X11=E2=80=9D

should it be ${nonarch_libdir}/x11

> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_31FCD534-6F22-495A-BF45-6C76BF5659E3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgYxzIACgkQuwUzVZGdMxQ7qQCfVanIBaTk1a6cAr4eaK+4yuCb
JusAnjZV2CS0IWDLF81IxzsOiTlzE3bx
=nk3N
-----END PGP SIGNATURE-----

--Apple-Mail=_31FCD534-6F22-495A-BF45-6C76BF5659E3--
