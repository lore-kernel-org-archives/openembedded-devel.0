Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7C77318D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 18:00:53 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id n128so48114895pfn.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 10:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=C3/g3Ynjgdw7k2TRhnGrGgNXw794sclD8gm+Sxqzhwk=;
	b=LFVjcdgAMmQ1PUBlsBQotGZpCRr0U1t1OKf/EeraSDFPXCGEouhaBSKNWse4dEmk/H
	Wwpi4Gq+Wg56lbJmmE654W5OvzhWG9bTYr38pFafUUv64PlcSeiGYQ0VhCS9fdGWOWQH
	3AfZG6heINfICNkv6QPOe2jqTcik5GjZfKg6VjlkVik1Fgnxi5WIGHlaQEGY1aXQUe/H
	Q4Th4dj72v3TdiWUEHNKaUJhcH3JYr+tebWEsyWnUP+cNNNyxXXZ8DuVnyh/LXOH/Y1t
	rQfbOT6ct9XamDCbEQMKv9p7AbdtIovZ4eN+NplmkA4sH23lLYr5fi4et/6/Ea2s0ZiQ
	z2FA==
X-Received: by 10.98.87.204 with SMTP id i73mr27988586pfj.63.1452535254073;
	Mon, 11 Jan 2016 10:00:54 -0800 (PST)
Received: from [192.168.0.4] (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	m86sm24754021pfi.27.2016.01.11.10.00.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 10:00:53 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1452534832-3203-1-git-send-email-mike.looijmans@topic.nl>
Date: Mon, 11 Jan 2016 10:00:48 -0800
Message-Id: <1D770D53-86F4-45AA-9515-0A2F9538575F@gmail.com>
References: <1452534832-3203-1-git-send-email-mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-networking][PATCH] recipes-connectivity/samba: Only rmdir directories that exist
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
X-List-Received-Date: Mon, 11 Jan 2016 18:00:53 -0000
X-Groupsio-MsgNum: 59463
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2A8C42B1-FB81-459D-AB34-A261FE9F6831";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2A8C42B1-FB81-459D-AB34-A261FE9F6831
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 11, 2016, at 9:53 AM, Mike Looijmans <mike.looijmans@topic.nl> =
wrote:
>=20
> Depending on PACKAGECONFIG selection, the /run/samba directory may not
> have been created. Make the do_install_append handle both situations
> by checking whether these directories exist before attempting to =
remove
> them.
>=20
> This fixes do_install failing with an error like this:
> rmdir: failed to remove '/.../samba/4.1.12-r0/image/run/samba': No =
such file or directory
>=20
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 8 =
++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git =
a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> index a51d31f..8e89e49 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> @@ -104,8 +104,12 @@ EXTRA_OECONF +=3D "--enable-fhs \
> LDFLAGS +=3D "-Wl,-z,relro,-z,now"
>=20
> do_install_append() {
> -    rmdir --ignore-fail-on-non-empty "${D}/run/samba"
> -    rmdir --ignore-fail-on-non-empty "${D}/run"
> +    if [ -d "${D}/run" ]; then
> +        if [ -d "${D}/run/samba" ]; then
> +            rmdir --ignore-fail-on-non-empty "${D}/run/samba"
> +        fi
> +        rmdir --ignore-fail-on-non-empty "${D}/run"
> +    fi

why don=E2=80=99t we delete /run completely ? it won=E2=80=99t work if =
package contents are in there anyway

>=20
>     if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', =
'false', d)}; then
>         install -d ${D}${systemd_unitdir}/system
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_2A8C42B1-FB81-459D-AB34-A261FE9F6831
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaT7dQACgkQuwUzVZGdMxTLZACfW/o5lT+FZbB8lw2umUpqe9JO
QZ0AoIgtUx90t1QEOxOshCxUj/HO/Lpb
=nu9U
-----END PGP SIGNATURE-----

--Apple-Mail=_2A8C42B1-FB81-459D-AB34-A261FE9F6831--
