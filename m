Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NChMk-0004uK-51 for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 23:26:41 +0100
Received: from f053035190.adsl.alicedsl.de ([78.53.35.190]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NChLa-0006fx-Ta for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 22:25:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Nov 2009 23:25:05 +0100
Message-ID: <1259015105.7271.96.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: bitbake console-image: ERROR: function do_deploy failed: install: cannot stat `arch/arm/boot/uImage': No such file or directory
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
X-List-Received-Date: Mon, 23 Nov 2009 22:26:41 -0000
X-Groupsio-MsgNum: 14650
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-9r7UgTqSNVfrysAF8HOJ"

--=-9r7UgTqSNVfrysAF8HOJ
Content-Type: multipart/mixed; boundary="=-6MD/sjP9AS+mdOeHkhw8"

--=-6MD/sjP9AS+mdOeHkhw8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OpenEmbedded hackers,


I successfully built base-image with

        $ bitbake base-image

following [1].

I now want to build console-image afterwards, but I get an error.

        ERROR: function do_deploy failed
        ERROR: see log in /srv/oe/angstrom-dev/work/beagleboard-angstrom-li=
nux-gnueabi/linux-omap-2.6.29-r49/temp/log.do_deploy.18428
        NOTE: Task failed: /srv/oe/angstrom-dev/work/beagleboard-angstrom-l=
inux-gnueabi/linux-omap-2.6.29-r49/temp/log.do_deploy.18428
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /srv/oe/openembedded/recipes/linux/linux-omap_2.6.2=
9.bb do_deploy failed
        ERROR: Task 737 (/srv/oe/openembedded/recipes/linux/linux-omap_2.6.=
29.bb, do_deploy) failed
        ERROR: '/srv/oe/openembedded/recipes/linux/linux-omap_2.6.29.bb' fa=
iled

I attach my local.conf and log file.

I only found [2] on the Web with the same error message. Please tell me
what other information you need.


Thanks,

Paul


[1] http://www.angstrom-distribution.org/building-angstrom
[2] http://www.embeddedrelated.com/groups/AT91SAM/show/4280.php

--=-6MD/sjP9AS+mdOeHkhw8
Content-Disposition: attachment; filename="log.do_deploy.27595"
Content-Type: text/plain; name="log.do_deploy.27595"; charset="UTF-8"
Content-Transfer-Encoding: base64

aW5zdGFsbDogY2Fubm90IHN0YXQgYGFyY2gvYXJtL2Jvb3QvdUltYWdlJzogTm8gc3VjaCBmaWxl
IG9yIGRpcmVjdG9yeQ0K

--=-6MD/sjP9AS+mdOeHkhw8
Content-Disposition: attachment; filename="local.conf"
Content-Transfer-Encoding: base64
Content-Type: text/plain; name="local.conf"; charset="UTF-8"

IyBXaGVyZSB0byBzdG9yZSBzb3VyY2VzDQpETF9ESVIgPSAiJHtPRVRSRUV9L2Rvd25sb2FkcyIN
Cg0KSU5IRVJJVCArPSAiIHJtX3dvcmsgIg0KDQojIE1ha2Ugc3VyZSB5b3UgaGF2ZSB0aGVzZSBp
bnN0YWxsZWQNCkFTU1VNRV9QUk9WSURFRCArPSAiZ2RrLXBpeGJ1Zi1jc291cmNlLW5hdGl2ZSBp
bWFnZW1hZ2ljay1uYXRpdmUgbGlicnN2Zy1uYXRpdmUiDQoNCiMgV2hpY2ggZmlsZXMgZG8gd2Ug
d2FudCB0byBwYXJzZToNCkJCRklMRVMgOj0gIiR7T0VUUkVFfS9vcGVuZW1iZWRkZWQvcmVjaXBl
cy8qLyouYmIiDQpCQk1BU0sgPSAiIg0KIA0KIyBXaGF0IGtpbmQgb2YgaW1hZ2VzIGRvIHdlIHdh
bnQ/DQpJTUFHRV9GU1RZUEVTICs9ICIgdGFyLmJ6MiAiDQoNCiMgU2V0IFRNUERJUiBpbnN0ZWFk
IG9mIGRlZmF1bHRpbmcgaXQgdG8gJHB3ZC90bXANClRNUERJUiA9ICIke09FVFJFRX0vJHtESVNU
Uk99LWRldiINCg0KIyBNYWtlIHVzZSBvZiBTTVAgYW5kIGZhc3QgZGlza3MNClBBUkFMTEVMX01B
S0UgPSAiLWo0Ig0KQkJfTlVNQkVSX1RIUkVBRFMgPSAiNCINCg0KI3RpbmRlcmJveA0KI0lOSEVS
SVQgKz0gIm9lc3RhdHMtY2xpZW50Ig0KT0VTVEFUU19CVUlMREVSICAgICAgPSAibXluYW1lIg0K
DQpESVNUUk8gPSAiYW5nc3Ryb20tMjAwOC4xIg0KDQpNQUNISU5FID0gImJlYWdsZWJvYXJkIg0K
QlVJTERfQVJDSCA9ICJpNjg2Ig0KQlVJTERfT1MgPSAibGludXgiDQo=

--=-6MD/sjP9AS+mdOeHkhw8--

--=-9r7UgTqSNVfrysAF8HOJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAksLC8EACgkQPX1aK2wOHVh7VQCfW3OZL0ZGPtgwY0TUAMbw2f68
RskAn25fbsgd5fqUSzlIoNxrNCIpiQec
=6nCv
-----END PGP SIGNATURE-----

--=-9r7UgTqSNVfrysAF8HOJ--
