Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QP8mT-0001Ga-DC for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 09:45:25 +0200
Received: from f053034074.adsl.alicedsl.de ([78.53.34.74]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QP8jq-0004Tv-TG for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 07:42:43 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 May 2011 09:42:22 +0200
Message-ID: <1306309342.10056.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: gitpkgv.bbclass: ExpansionError: Failure expanding variable GITPKGVTAG, expression was ${@get_git_pkgv(d, True)} which triggered exception TypeError: %d format: a number is required, not str
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
X-List-Received-Date: Wed, 25 May 2011 07:45:25 -0000
X-Groupsio-MsgNum: 32272
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-RD+7uzRsypVydWo4KTOw"

--=-RD+7uzRsypVydWo4KTOw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


task package of for example `systemd_git.bb` or `freerdp_git.bb` fails
with the following error message.

        ERROR: Error executing a python function in /oe/openembedded/recipe=
s/systemd/systemd_git.bb:
        ExpansionError: Failure expanding variable GITPKGVTAG, expression w=
as ${@get_git_pkgv(d, True)} which triggered exception TypeError: %d format=
: a number is required, not str
       =20
        ERROR: The stack trace of python calls that resulted in this except=
ion/failure was:
        ERROR:   File "package_do_package", line 23, in <module>
        ERROR:=20
        ERROR:   File "package_do_package", line 19, in package_do_package
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/build.py", line 169, in exec_func
        ERROR:     exec_func_python(func, d, runfile, cwd=3Dadir)
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/build.py", line 184, in exec_func=
_python
        ERROR:     code =3D _functionfmt.format(function=3Dfunc, body=3Dd.g=
etVar(func, True))
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/data_smart.py", line 272, in getV=
ar
        ERROR:     return self.expand(value, var)
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/data_smart.py", line 144, in expa=
nd
        ERROR:     return self.expandWithRefs(s, varname).value
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/data_smart.py", line 127, in expa=
ndWithRefs
        ERROR:     s =3D __expand_var_regexp__.sub(varparse.var_sub, s)
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/data_smart.py", line 60, in var_s=
ub
        ERROR:     var =3D self.d.getVar(key, 1)
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/data_smart.py", line 272, in getV=
ar
        ERROR:     return self.expand(value, var)
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/data_smart.py", line 144, in expa=
nd
        ERROR:     return self.expandWithRefs(s, varname).value
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/data_smart.py", line 127, in expa=
ndWithRefs
        ERROR:     s =3D __expand_var_regexp__.sub(varparse.var_sub, s)
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/data_smart.py", line 60, in var_s=
ub
        ERROR:     var =3D self.d.getVar(key, 1)
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/data_smart.py", line 272, in getV=
ar
        ERROR:     return self.expand(value, var)
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/data_smart.py", line 144, in expa=
nd
        ERROR:     return self.expandWithRefs(s, varname).value
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/data_smart.py", line 127, in expa=
ndWithRefs
        ERROR:     s =3D __expand_var_regexp__.sub(varparse.var_sub, s)
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/data_smart.py", line 60, in var_s=
ub
        ERROR:     var =3D self.d.getVar(key, 1)
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/data_smart.py", line 272, in getV=
ar
        ERROR:     return self.expand(value, var)
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/data_smart.py", line 144, in expa=
nd
        ERROR:     return self.expandWithRefs(s, varname).value
        ERROR:=20
        ERROR:   File "/oe/bitbake/lib/bb/data_smart.py", line 134, in expa=
ndWithRefs
        ERROR:     raise ExpansionError(varname, s, exc)
        ERROR:=20
        ERROR: The code that was being executed was:
        ERROR:      0019:               bb.build.exec_func(f, d)
        ERROR:      0020:               package_run_hooks(f, d)
        ERROR:      0021:
        ERROR:      0022:
        ERROR:  *** 0023:package_do_package(d)
        ERROR:      0024:
        ERROR: (file: 'package_do_package', lineno: 23, function: <module>)
        ERROR:      0015:               bb.error("WORKDIR, DEPLOY_DIR, D, P=
N and PKGD all must be defined, unable to package")
        ERROR:      0016:               return
        ERROR:      0017:
        ERROR:      0018:       for f in (bb.data.getVar('PACKAGEFUNCS', d,=
 True) or '').split():
        ERROR:  *** 0019:               bb.build.exec_func(f, d)
        ERROR:      0020:               package_run_hooks(f, d)
        ERROR:      0021:
        ERROR:      0022:
        ERROR:      0023:package_do_package(d)
        ERROR: (file: 'package_do_package', lineno: 19, function: package_d=
o_package)
        ERROR: Function 'package_do_package' failed

Both recipes, for example [1], adhere to the usage example at the top of
`gitpkgv.bbclass` [2].


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/systemd=
/systemd_git.bb?id=3Dbefc2ba11da94a569ef0b5fec64b98257d809687#n13
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/classes/gitpkgv=
.bbclass?id=3Dbefc2ba11da94a569ef0b5fec64b98257d809687#n24

--=-RD+7uzRsypVydWo4KTOw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3cstkACgkQPX1aK2wOHVgnegCfd6v9PDT+txTYv4ZAl78P2XEg
eA8AnRk4raPZCCfoYqW2lSQxsxRPFMpQ
=pS2e
-----END PGP SIGNATURE-----

--=-RD+7uzRsypVydWo4KTOw--
