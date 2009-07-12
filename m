Received: from [209.85.216.204] (helo=mail-px0-f204.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MQ5xf-0006Mj-4u
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Jul 2009 22:47:51 +0200
Received: by pxi42 with SMTP id 42so1416562pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2009 13:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:organization:to:subject
	:date:user-agent:mime-version:content-type:content-transfer-encoding
	:message-id; bh=LoNqSWJf1HPwt0dBuy4vB6+qGby/YNytPRRsQpFHamA=;
	b=htWm5kvPMBdh/YelNWR26WDY6IyEMl0Vwn/mTD/L7Ql07/o4cImyijeEJ2VINM5KVX
	B89WBSZjLyroiZLWvy4lPPCYrEEfk06GwEiE8OPMw8kIp30Ujo12t7jOxlHeBLkQsoVc
	FA01S+U6OGFcameD6lnrRUoLkruAGEby7Bmu4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:organization:to:subject:date:user-agent:mime-version
	:content-type:content-transfer-encoding:message-id;
	b=lBFW7m8a7e/MmMKba/713sQfLQHNi9G3RmSxUk4C1dCMVFFDV5nQxhBPMuBA7AH0I/
	O7L6ZypkupWODe2i3pPOJh882SzHRfOTpA7NI/ZlpntjRoXJWWlTqy5Gmv4n4Fsd4E7J
	nTFOF8MvYKuCrxKyZrQ/LrWlCO9AiBBlyXoMw=
Received: by 10.115.54.7 with SMTP id g7mr7355064wak.147.1247430881648;
	Sun, 12 Jul 2009 13:34:41 -0700 (PDT)
Received: from morpheus (adsl-71-146-11-93.dsl.pltn13.sbcglobal.net
	[71.146.11.93])
	by mx.google.com with ESMTPS id v32sm6904870wah.48.2009.07.12.13.34.40
	(version=SSLv3 cipher=RC4-MD5); Sun, 12 Jul 2009 13:34:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Organization: Home Inc.
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Jul 2009 13:34:34 -0700
User-Agent: KMail/1.12.0 (Linux/2.6.28-13-generic; KDE/4.2.95; x86_64; ; )
MIME-Version: 1.0
Message-Id: <200907121334.38852.raj.khem@gmail.com>
Subject: e2fsprogs-libs build failure analysis
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
X-List-Received-Date: Sun, 12 Jul 2009 20:47:51 -0000
X-Groupsio-MsgNum: 11889
Content-Type: multipart/signed; boundary="nextPart2043882.ZWqWIE83yn";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2043882.ZWqWIE83yn
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

Like many others I was also getting this problem reported on this mailing l=
ist in past=20

http://article.gmane.org/gmane.comp.handhelds.openembedded/24445/match=3De2=
fsprogs+libs

I looked a bit into this and the problem is that PN gets overwritten when=20
do_package_write_ipk -> read_subpackage_metadata=20

this loop below reads the subpkgdata also reads PV PN and PR which are then=
 overwritten
by bb.data.setVar(key, sdata[key], d)

       for pkg in bb.data.getVar('PACKAGES', d, 1).split():
                sdata =3D read_subpkgdata(pkg, d)
                for key in sdata.keys():
                        bb.data.setVar(key, sdata[key], d)


when this loop exits the last subpackage it read is build/eglibc/omap5912os=
k/pkgdata/armv5te-angstrom-linux-gnueabi/runtime/libblkid

which says that PN is util-linux-ng
and this value of PN is updated last into the bb.data for e2fsprogs-libs
so when do_package_ipk () is called it wants to get WORKDIR

workdir =3D bb.data.getVar('WORKDIR', d, 1)

but WORKDIR consits of PN PV and PR so it calculates it wrongly

So I think problem is caused because of emitting PV, PN and PR into pkgdata=
 files
which is then read and updated into bb.data

I added a workaround in base.bbclass

diff --git a/classes/base.bbclass b/classes/base.bbclass
index bc50c67..5eefdb7 100644
=2D-- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -1090,7 +1090,9 @@ def read_pkgdata(pn, d):
 python read_subpackage_metadata () {
        import bb
        data =3D read_pkgdata(bb.data.getVar('PN', d, 1), d)
=2D
+       pn =3D bb.data.getVar('PN', d, 1)
+       pv =3D bb.data.getVar('PV', d, 1)
+       pr =3D bb.data.getVar('PR', d, 1)
        for key in data.keys():
                bb.data.setVar(key, data[key], d)

@@ -1098,6 +1100,9 @@ python read_subpackage_metadata () {
                sdata =3D read_subpkgdata(pkg, d)
                for key in sdata.keys():
                        bb.data.setVar(key, sdata[key], d)
+       bb.data.setVar('PN', pn, d)
+       bb.data.setVar('PV', pv, d)
+       bb.data.setVar('PR', pr, d)
 }


and it works now but I feel this is not the right fix.=20

util-linux-ng.inc has

PACKAGES_DYNAMIC =3D "libblkid*"

and e2fsprogs-libs.inc has

do_stage () {
        for i in libcom_err libss libuuid libblkid; do
                oe_libinstall -a -C lib $i ${STAGING_LIBDIR}
=2E....
}

probably this also needs some thought.

Thanks

=2DKhem



--nextPart2043882.ZWqWIE83yn
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkpaSNsACgkQHnJKy6V6em6jOQCfUn98mGAAEaOWS08urzQhIJFd
1a0An2qpVQAJ0eoyDECV2c43ThDzTVXL
=XKi1
-----END PGP SIGNATURE-----

--nextPart2043882.ZWqWIE83yn--
