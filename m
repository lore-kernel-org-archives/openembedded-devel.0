Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrTSN-0003gO-Td for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 10:53:05 +0100
Received: from f053036046.adsl.alicedsl.de ([78.53.36.46]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrTPT-0004q6-8a for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 09:49:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 10:49:57 +0100
Message-ID: <1268732997.3990.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ffmpeg: Stage `avconfig.h` which is built at compile time.
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
X-List-Received-Date: Tue, 16 Mar 2010 09:53:06 -0000
X-Groupsio-MsgNum: 17717
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-6fAgjgOiXEBOGr2fNaJB"

--=-6fAgjgOiXEBOGr2fNaJB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This header is needed for `libvalhalla`.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
Could someone please test this with `ffmpeg_0.4.9-pre1.bb` as it includes `=
ffmpeg.inc` too.
---
 recipes/ffmpeg/ffmpeg.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/ffmpeg/ffmpeg.inc b/recipes/ffmpeg/ffmpeg.inc
index cd330f8..437a822 100644
--- a/recipes/ffmpeg/ffmpeg.inc
+++ b/recipes/ffmpeg/ffmpeg.inc
@@ -61,6 +61,8 @@ do_stage() {
            install -m 0644 ${S}/libavutil/$h        ${STAGING_INCDIR}/ffmp=
eg/$h
            install -m 0644 ${S}/libavutil/$h        ${STAGING_INCDIR}/liba=
vutil/$h=20
         done
+        install -m 0644 ${B}/libavutil/avconfig.h ${STAGING_INCDIR}/ffmpeg=
/
+        install -m 0644 ${B}/libavutil/avconfig.h ${STAGING_INCDIR}/libavu=
til/
=20
         install -d ${STAGING_INCDIR}/libswscale/=20
         install -m 0644 ${S}/libswscale/*.h ${STAGING_INCDIR}/ffmpeg/
--=20
1.7.0

--=-6fAgjgOiXEBOGr2fNaJB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkufVEUACgkQPX1aK2wOHVhHmQCfSqV6l30wQctkm3nGAVPkNxbA
110An1/x/21Y6k5W+NK96lrPNUZ+nMsa
=F1w6
-----END PGP SIGNATURE-----

--=-6fAgjgOiXEBOGr2fNaJB--
