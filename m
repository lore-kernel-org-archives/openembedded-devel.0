Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q9YnS-0001X1-3e for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 10:18:02 +0200
Received: from f053043024.adsl.alicedsl.de ([78.53.43.24]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q9YlY-0003ao-CT for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 08:16:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Apr 2011 10:15:49 +0200
Message-ID: <1302596149.4323.18.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: gstreamer*, starling: ERROR: Nothing RPROVIDES 'gst-plugin-ivorbis' (but /oe/openembedded/recipes/starling/starling_0.9.bb RDEPENDS on or otherwise requires it)
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
X-List-Received-Date: Tue, 12 Apr 2011 08:18:02 -0000
X-Groupsio-MsgNum: 31125
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ZxXdmSbiQkoSC2K8JpJT"

--=-ZxXdmSbiQkoSC2K8JpJT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


`e-image` depends on `starling` which has

        RRECOMMENDS_${PN} =3D "\
          gst-plugin-mad \
          gst-plugin-modplug \
          gst-plugin-ivorbis \
          gst-plugin-tcp \
        "

in its recipe. I think commit e6d170ab [1]

        commit e6d170abad28fcd0e3b8ba831705bed23e3309a4
        Author: Martin Jansa <martin.jansa@gmail.com>
        Date:   Thu Apr 7 00:12:22 2011 +0000
       =20
            gst-plugins: define disjunctive PACKAGES_DYNAMIC for each pack =
base/good/bad/ugly
           =20
            * adds a bit more bits to keep in sync while changing gst-plugi=
ns
              version, but not that much (this patch was mostly prepared by=
 script)
            * overlap in PACKAGES_DYNAMIC namespace causes notes like this =
in every build
              NOTE: multiple providers are available for runtime gst-plugin=
-autodetect (gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugi=
ns-ugly)
              NOTE: consider defining a PREFERRED_PROVIDER entry to match g=
st-plugin-autodetect
           =20
            Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
            Acked-by: Mike Westerhof <mike@mwester.net>

is responsible for this regression and has just

        +PACKAGES_DYNAMIC =3D "\
        [=E2=80=A6]
        +gst-plugin-ivorbisdec* \
        [=E2=80=A6]
        "

in the list. I do not know anything about this plugin and where the
error is.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3De6d170a=
bad28fcd0e3b8ba831705bed23e3309a4

--=-ZxXdmSbiQkoSC2K8JpJT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2kCjUACgkQPX1aK2wOHVh5cwCfQXJ24FE3PwlpJim7KGmMPtjz
i5EAnA9dRG7rSlMz7bgPTV2WjHQ/cAMX
=mqY8
-----END PGP SIGNATURE-----

--=-ZxXdmSbiQkoSC2K8JpJT--
