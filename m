Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5GRP-0006QX-TB for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 13:21:17 +0200
Received: from f053041204.adsl.alicedsl.de ([78.53.41.204]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5GR2-0007CO-DC for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 11:20:52 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Oct 2010 13:20:51 +0200
Message-ID: <1286796051.3835.78.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gtk+-native: depends somehow on cups-native: `ERROR: Required build target 'gtk+-native' has no buildable providers.`
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
X-List-Received-Date: Mon, 11 Oct 2010 11:21:17 -0000
X-Groupsio-MsgNum: 24666
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-zq+IahuACLefcapjcDli"

--=-zq+IahuACLefcapjcDli
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


	$ bitbake evince

fails with the following error for `angstrom-2010.x` for `MACHINE =3D
"beagleboard"`.

        ERROR: Required build target 'evince' has no buildable providers.
        Missing or unbuildable dependency chain was: ['evince', 'gnome-keyr=
ing', 'gtk+-native', 'cups-native']
        Command execution failed: Traceback (most recent call last):
          File "/home/paul/oe/bitbake/lib/bb/command.py", line 88, in runAs=
yncCommand
            commandmethod(self.cmds_async, self, options)
          File "/oe/bitbake/lib/bb/command.py", line 174, in buildTargets
            command.cooker.buildTargets(pkgs_to_build, task)
          File "/oe/bitbake/lib/bb/cooker.py", line 784, in buildTargets
            taskdata.add_unresolved(localdata, self.status)
          File "/oe/bitbake/lib/bb/taskdata.py", line 556, in add_unresolve=
d
            self.remove_buildtarget(targetid)
          File "/oe/bitbake/lib/bb/taskdata.py", line 510, in remove_buildt=
arget
            self.fail_fnid(fnid, missing_list)
          File "/oe/bitbake/lib/bb/taskdata.py", line 490, in fail_fnid
            self.remove_buildtarget(target, missing_list)
          File "/oe/bitbake/lib/bb/taskdata.py", line 510, in remove_buildt=
arget
            self.fail_fnid(fnid, missing_list)
          File "/oe/bitbake/lib/bb/taskdata.py", line 490, in fail_fnid
            self.remove_buildtarget(target, missing_list)
          File "/oe/bitbake/lib/bb/taskdata.py", line 510, in remove_buildt=
arget
            self.fail_fnid(fnid, missing_list)
          File "/oe/bitbake/lib/bb/taskdata.py", line 490, in fail_fnid
            self.remove_buildtarget(target, missing_list)
          File "/oe/bitbake/lib/bb/taskdata.py", line 519, in remove_buildt=
arget
            raise bb.providers.NoProvider
        NoProvider

`gtk+.inc` `DEPENDS` on `cups` [1]. Is this converted to `cups-native` for =
`gtk+-native`?


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/gtk+/gt=
k+.inc

--=-zq+IahuACLefcapjcDli
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyy8xMACgkQPX1aK2wOHVhVzQCgh1L4xaZRF1MhERma4c4dn1yX
pJAAn1363Ir2JI7tbUb5QDx9Hw2STUz0
=e/DV
-----END PGP SIGNATURE-----

--=-zq+IahuACLefcapjcDli--
