Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id A43B1731C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 19:23:29 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id l65so435633wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 11:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=Gno4rjwaLIo7cfyYAaStQNIKMXv44l/3xraMiGODVV8=;
	b=LMN37ku1r2NKEkw286q8fhGK1EbozpC9XPGE72Ks9jfiY6vlTThld+Tp/pL1z/RyE1
	1RRgmHBZCqitwY3czbvqczDXI1vfdrqgX42XSelba2gMZqdCQwlp474KSsoGWtDVEQV/
	LZwT27R0qHfjBVvD/RKI9BplAZ04GIvpRYnImwi8KHUaqijbDTwJRSASFqHYjioaYn+0
	TJHwiKIgG7VCWZcY4jASHv5uUZpP9VhWb04+RQVyp4IlhKD/cXKrGl7Rqk9vHp+vxycN
	7GqyLhyOvv0SPbenTtSZFWYiF6vP0J8PncS/fO60Q0oyPRW4YwBzXxPUu1wdhjupeaNF
	Fw0Q==
X-Received: by 10.28.132.146 with SMTP id g140mr26306wmd.49.1451935410173;
	Mon, 04 Jan 2016 11:23:30 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id o132sm42450wmb.7.2016.01.04.11.23.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jan 2016 11:23:29 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Mon, 4 Jan 2016 20:23:28 +0100
Message-Id: <39CD663F-7EB1-4C8D-B785-25ADEAB15362@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [meta-networking][PATCH v2] samba: move RDEPENDS of perl from samba to samba-pidl
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
X-List-Received-Date: Mon, 04 Jan 2016 19:23:30 -0000
X-Groupsio-MsgNum: 59332
Content-Type: multipart/signed;
	boundary="Apple-Mail=_88B7BB53-E769-4FA2-BC59-52D54C55DAF6";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_88B7BB53-E769-4FA2-BC59-52D54C55DAF6
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
index 5b343f2..f8a33e3 100644
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

+RDEPENDS_${PN}-pidl_append =3D " perl"
 FILES_${PN}-pidl =3D "${bindir}/pidl ${PERL_VERNDORLIB}/*"
--
1.9.1

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_88B7BB53-E769-4FA2-BC59-52D54C55DAF6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWisawAAoJEESZlq7c5QqdyfsP/2LCgutLfhccmNPF5k9FY0vv
cZhIq9S85MkDwPNP0sSDWNH5kgrCd4U1nxDCnon3Pv0i5BwJagvqABUTVwoPH8LB
o/uDR/ffbEMtecQi424zZ7tCcBkka1g02SEByvLCRVPQ12W52GtWrqjDo0oWBpYU
LPluhSaD+fxyZlr0kZ76F+wuqiKEnpPRxEG00G7pjty7bs4CzT4GxFkFhPaWQZRE
JI9cQjmjgjdsgmful9bUhQFRFRXGt2inqFNtODoaRLZCZFIpApc0v4Rq7NuU7oa4
ppP1V52Ex8rpVz9jPCGC64/2vmWkGmnwJMe6CqvVqq2baqnSgiilkdllqsTbmUnk
WFIEpaLndOH2cULrSbFzjW89rK9hrRxqlt8PWDsw8lzo6X43Rz/YQkmIB/n8ItrY
cTGGmAwYZbatmiOy1K3ygJi4C+12l4Pe7HxshE2TZqPYtzny/dcIzc6l33fiNVno
NHqM0Vpu/ls4MPm7NZwPuIc7WxNC13QbBQ2C+LJ44wG2y2TEJ9MmoPMXHDD9B5wy
vnKH6b45uGlTuwELSlGdJsySwck6QzZGJjTyrWJE3BlY2Efmt0KzKHWdolXnRR5q
yd23SVVZt13Ne20oVXNzAd4ZDP+oLUFP6NadCWXjmqfzHtqIG/nRZLvg41SN3g7T
za3G4uq6hAZKe5HN4gJt
=lmSi
-----END PGP SIGNATURE-----

--Apple-Mail=_88B7BB53-E769-4FA2-BC59-52D54C55DAF6--
