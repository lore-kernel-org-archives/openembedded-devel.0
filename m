Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <julian_chu@openmoko.com>) id 1JrsWw-0003bW-DN
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 May 2008 12:30:19 +0200
Received: from [172.16.23.119] (helo=Macintosh.local)
	by aakash.openmoko.org with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <julian_chu@openmoko.com>) id 1JrsW8-0001uK-PH
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 May 2008 18:29:38 +0800
Message-ID: <481AED81.9040203@openmoko.com>
Date: Fri, 02 May 2008 18:31:29 +0800
From: Julian <julian_chu@openmoko.com>
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.6
X-SA-Exim-Connect-IP: 172.16.23.119
X-SA-Exim-Mail-From: julian_chu@openmoko.com
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: qa_staging failed with recipe which inherit sdk.bbclass
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
X-List-Received-Date: Fri, 02 May 2008 10:30:19 -0000
X-Groupsio-MsgNum: 5068
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigAD11671E76E0E47B45A2CCEA"

--------------enigAD11671E76E0E47B45A2CCEA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

I found that if there is a recipe which inherit sdk.bbclass, it always
fail in qa_staging.

for example, bitbake gdb-cross-sdk, the variables are

   STAGING_LIBDIR=3D${STAGING_DIR_HOST}${layout_libdir}
   STAGING_DIR_HOST=3D${STAGING_DIR}/${HOST_SYS}
   HOST_SYS=3D${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}

in sdk.bbclass, I saw

   HOST_ARCH =3D "${BUILD_ARCH}"

in my case, qa_staging will test ${STAGING_DIR}/i686-linux
However, the .pc files placed in ${STAGING_DIR}/i686-linux were made by
another recipe which inherit native.bbclass. the .pc file contains
${TMPDIR} (ie.
prefix=3D/home/walkingice/OpenMoko/build/tmp/staging/i686-linux/usr)

Finally, it could not pass qa_staging.

How can I solve this problem ?

Thanks :-)

-Julian


--------------enigAD11671E76E0E47B45A2CCEA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.8 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkga7YcACgkQPvWtVv2QI0CI2ACgr6WozxtUEEeUcJifwS+hxrsJ
CDcAoIB0GySHsZuKbTPGGTUGTdBM7aiO
=vVMO
-----END PGP SIGNATURE-----

--------------enigAD11671E76E0E47B45A2CCEA--
