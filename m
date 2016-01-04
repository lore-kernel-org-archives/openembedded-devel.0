Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3E48C731AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 19:06:06 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id b14so199070597wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 11:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:cc:to:mime-version;
	bh=25ETD+6QGmGHB4ndz+Tq6u0Jhy4RvkHpg7KS4tpPRHo=;
	b=cn+xNAdDOQ3o/j3q3m1/RnIllNNvmO6GELpoTXZw1anpT4U5m21fQvwT9g5XUdO4eZ
	1CmV2310NXaledcgDqCVPSHjgyEfVWHhvQaLeHtMd3DTHqGgE87gsR1rF+OoABQ3rf9w
	tRPNSsjZLxtuo7sr0Fi3Qa41Dnj9Ties0lDbdr1ba4PhbB0fflBKMJsb3ntwUI5sxZ3f
	trpOIAq/rqNWXMn0BaCfp7L+g1lmuBDAaji8q2bMkqzTz+wEQU8gtINJEj8z+AFyyccD
	pgCxAB6wdIeZw3NNXD823jv+VshB7IIXhWA1LQetYiizkpg/c/FvUKq6RHVCZiNoFqfR
	AMhg==
X-Received: by 10.28.55.209 with SMTP id e200mr8897wma.2.1451934366958;
	Mon, 04 Jan 2016 11:06:06 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	kb5sm87137892wjc.20.2016.01.04.11.06.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jan 2016 11:06:06 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Mon, 4 Jan 2016 20:06:04 +0100
Message-Id: <8E273032-FCAF-4476-A017-50D6D2451F14@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [meta-networking][PATCH] samba: move RDEPENDS of perl from samba to samba-pidl
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
X-List-Received-Date: Mon, 04 Jan 2016 19:06:08 -0000
X-Groupsio-MsgNum: 59328
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5795F10D-E18C-44B3-8659-6D119936633A";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_5795F10D-E18C-44B3-8659-6D119936633A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

samba-pidl is the package containing the perl-extension, so RDEPENDS
must include perl for samba-pidl, not for samba.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index 5b343f2..de1f033 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -39,6 +39,8 @@ SRC_URI[md5sum] =3D "232016d7581a1ba11e991ec2674553c4"
 SRC_URI[sha256sum] =3D =
"033604674936bf5c77d7df299b0626052b84a41505a6a6afe902f6274fc29898"

 inherit systemd waf-samba cpan-base perlnative
+# remove default added RDEPENDS on perl
+RDEPENDS_${PN}_remove =3D "perl"

 DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb =
libtevent libldb krb5 ctdb libbsd"

@@ -319,4 +321,5 @@ FILES_${PN}-python-dbg =3D =
"${libdir}/python${PYTHON_BASEVERSION}/site-packages/.d
                           =
${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/dcerpc/.debug/* =
\
 "

+RDEPENDS_${PN}-pidl_append =3D " perl "
 FILES_${PN}-pidl =3D "${bindir}/pidl ${PERL_VERNDORLIB}/*"
--
1.9.1

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_5795F10D-E18C-44B3-8659-6D119936633A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWisKdAAoJEESZlq7c5QqdLUkP/05jx3yT1Wi48VNaZ28iuaO+
Fo21TfVXds2BoBJ6Qh2JCsUnWfRri47o8HzuHJwJPIeUXXkaaLJidf6SG7FT6gC3
bt7YyhUmYbtG5KJqKMPIGJtb9xAj+KieygWdulLZ1ksbpZrFNomalNOxGzXWIUhX
vO+/P24Hjh4jOL1kgiuboBuxqQNNk/bWE01VHNf4QE+NpnN8U7ff6er/RXGINLpR
vY0BQmZWQX56v6cq5lAOVyXSwKT2FZjt7xAuUW+WOUt68Nbe1Ad7PsACmRDjSRW7
oMGz30K5m05gmGth2c9UzK/CebtoGsG+TG5v2ScZnybzQFJuhiaItsK0keAwSHBP
9RgnH+0IYEuuJQVWjABsX90Tzp6maURb5UEfJ5oA1Xq1+Fq6lLwsGB59PKhaPrhH
mVmNvuWiyCjezgRv/7rvw1XPj2cENC/hsAEmBviK7sVqw14PwZJxsdjSaE2jQHb4
lQF7zveF6+cPzdB9QtmjY/iuU/pNj7mKWHTvHbvKCmLVmhoZ83v5HxQsSGLpQt3L
OazydWe7WpPu4TqzsZ3X9AAPKkZFtTcKethSwQy2zjl5y/03NyA6E5QpntzAI5VB
t0cDMh02cBEqM+E63CP2rDgLGVNxc6XPVpY7vhNdwEZE5QoaZuYNUUJE+qSxXsE4
gqC+WTCBCeOSHVjiLRRN
=apzp
-----END PGP SIGNATURE-----

--Apple-Mail=_5795F10D-E18C-44B3-8659-6D119936633A--
