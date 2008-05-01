Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <julian_chu@openmoko.com>) id 1JrfGA-0006qt-MC
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 May 2008 22:20:07 +0200
Received: from 123-193-248-182.dynamic.kbronet.com.tw ([123.193.248.182]
	helo=Macintosh.local) by aakash.openmoko.org with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <julian_chu@openmoko.com>) id 1JrfFP-0008U8-Ed
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 May 2008 04:19:29 +0800
Message-ID: <481A2641.30609@openmoko.com>
Date: Fri, 02 May 2008 04:21:21 +0800
From: Julian <julian_chu@openmoko.com>
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.6
X-SA-Exim-Connect-IP: 123.193.248.182
X-SA-Exim-Mail-From: julian_chu@openmoko.com
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: return value of package_qa_check_staged in insane.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 01 May 2008 20:20:07 -0000
X-Groupsio-MsgNum: 5063
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigD36BBC82DECE504FFFED0A78"

--------------enigD36BBC82DECE504FFFED0A78
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

I got confused with the return value of package_qa_check_staged

the code in insane.bbclass is

 if not package_qa_check_staged(bb.data.getVar('STAGING_LIBDIR',d,True), =
d):
        bb.fatal("QA staging was broken by the package built above")

if return false, it cause a fatal, but in the body of the function
the return value was came from the LATEST one.

for example, if there are two sanity test fail.
the first one is "installed", sane =3D True
the second one is "tmpdir", sane =3D False
finally it return False and cause fatal.

but if the checking order changed, it return True and doesn't cause fatal=
=2E


it confused me, is anything wrong ?

Thanks  :-)

-Julian


--------------enigD36BBC82DECE504FFFED0A78
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.8 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkgaJkcACgkQPvWtVv2QI0DUMACfVBtPKAIfSiwxs9IOrwvzuwJP
J/oAoJbmB2lTL+WdO5ys0KYWk/L7sCPZ
=WjIL
-----END PGP SIGNATURE-----

--------------enigD36BBC82DECE504FFFED0A78--
