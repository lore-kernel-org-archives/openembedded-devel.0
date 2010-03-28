Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NvwS6-0004qs-9Q for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 19:39:18 +0200
Received: from f053035077.adsl.alicedsl.de ([78.53.35.77]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NvwP1-0003sJ-DK for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 17:35:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Mar 2010 19:35:56 +0200
Message-ID: <1269797756.8018.85.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: ti-cmem-module: Loading kernel modules for gstreamer-ti... FATAL: Error inserting cmemk (/lib/modules/2.6.32/kernel/drivers/dsp/cmemk.ko): Bad address
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
X-List-Received-Date: Sun, 28 Mar 2010 17:39:18 -0000
X-Groupsio-MsgNum: 18203
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ZXd3lcnV7YFejvmX2E2w"

--=-ZXd3lcnV7YFejvmX2E2w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


doing `opkg update && opkg upgrade` on a BeagleBoard demo image [1] gave
me the following error message today.

        [=E2=80=A6]
        Configuring ti-cmem-module.
        Configuring gstreamer-ti.
         System startup links for /etc/init.d/gstti-init already exist.
        Unloading kernel module ...ERROR: Module cmemk does not exist in /p=
roc/modules
           done
        Loading kernel modules for gstreamer-ti... FATAL: Error inserting c=
memk (/lib/modules/2.6.32/kernel/drivers/dsp/cmemk.ko): Bad address
          done
        [=E2=80=A6]


Thanks,

Paul


[1] http://www.angstrom-distribution.org/demo/beagleboard/

--=-ZXd3lcnV7YFejvmX2E2w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuvk3wACgkQPX1aK2wOHVg1NQCeK59qnX6gw50ow6UmpNOqNJLG
btQAnA7f/DK92wl+H40zm6yY/QWOVJRy
=YEki
-----END PGP SIGNATURE-----

--=-ZXd3lcnV7YFejvmX2E2w--
