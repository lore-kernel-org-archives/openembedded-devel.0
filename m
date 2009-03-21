Received: from [209.85.200.168] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LkrB4-00057v-Bn
	for openembedded-devel@openembedded.org; Sat, 21 Mar 2009 03:43:14 +0100
Received: by wf-out-1314.google.com with SMTP id 28so1396502wfa.6
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Mar 2009 19:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=SKZRj4f6tK9ziImv5CIi79HpZ86hFg0RzB/kpwsANOI=;
	b=CqJyG2PkEhhk2ZWHpqEz33rPqjRMiWMOwx0VbVVq3X6Uj8NYMyhEDiMjOF9SnBNwOU
	N0yYLbFOVWAzaz7nJT24YZNm88I9tHR4b9yQxocIQH661d0szanOEnibYCVuVLWI69Xf
	lj1mgzCNO+OGK0uMUfXovBvdF0yK93hlidwGQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=mpmgK1t9Rgr+OnuLPRuV4hXJDPtkRxz/BtMsOAjVvieo2mOPTPTl+qqnbZVnLVd3yj
	Y2phb323pwm2s5xCKY1HIn6yRpm8ddv3tRZm7SbKbI9N2s6+86h7OYEkCR2JhcS9ebsA
	hNgZ/JqeKi7ve/DrfAC9n7JzGm8rPUSqEU9Lo=
Received: by 10.114.103.1 with SMTP id a1mr2842262wac.218.1237603327186;
	Fri, 20 Mar 2009 19:42:07 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-12-154.dsl.pltn13.sbcglobal.net
	[71.146.12.154])
	by mx.google.com with ESMTPS id m26sm9971927pof.18.2009.03.20.19.42.06
	(version=SSLv3 cipher=RC4-MD5); Fri, 20 Mar 2009 19:42:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Mar 2009 19:42:01 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-11-generic; KDE/4.2.1; x86_64; ; )
References: <49C4516C.90607@dls.net>
In-Reply-To: <49C4516C.90607@dls.net>
MIME-Version: 1.0
Message-Id: <200903201942.04745.raj.khem@gmail.com>
Cc: openembedded-devel@openembedded.org
Subject: Re: Parse failure for the new RPM recipes
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
X-List-Received-Date: Sat, 21 Mar 2009 02:43:15 -0000
X-Groupsio-MsgNum: 8586
Content-Type: multipart/signed; boundary="nextPart1364369.aNS9EJXPCH";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1364369.aNS9EJXPCH
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 20 March 2009 19:31:08 Mike (mwester) wrote:
> Something wrong; looks like a python function is being called during the =
parse phase - it throws up because TMPDIR is empty -- of course there's no =
python-native; I haven't built anything yet!
>=20
> I have no idea what this is doing.  I'll try converting it to a warning s=
o that parsing continues.  If that works, I'll commit that change -- someon=
e can revert it as soon as the real fix comes along (that's the best I can =
do; I just have no idea what this is trying to do, or why that function is =
being evaluated at parse time).
>=20
> Mike (mwester)
>=20
> -----------------------
>=20
> NOTE: Out of date cache found, rebuilding...
> NOTE: Handling BitBake files: | (4851/6608) [73 %]__builtin__:6: Deprecat=
ionWarning: raising a string exception is deprecated
> NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None w=
hile evaluating:
> ${@python_dir(d)}
> /r/slug/slugos/bitbake/lib/bb/data_smart.py:93: DeprecationWarning: raisi=
ng a string exception is deprecated
>   raise
> NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None w=
hile evaluating:
> --with-python           --with-python-incdir=3D${STAGING_INCDIR}/${PYTHON=
_DIR}            --with-python-libdir=3D${libdir}/${PYTHON_DIR}            =
=2D-without-apidocs               --without-selinux               --without=
=2Dlua           --without-dmalloc               --without-efence ${MUTEX}
> ERROR: Error in executing: /r/slug/slugos/openembedded/recipes/rpm/rpm-na=
tive_4.4.2.3.bb
> ERROR: Exception:No Python in STAGING_INCDIR. Forgot to build python-nati=
ve ? Message:None
> ERROR: Printing the environment of the function
> ERROR:  0002:    import bb
> ERROR:  0003:    from bb import __version__
> ERROR:  0004:    base_after_parse(d)
> ERROR:  0005:
> ERROR:  0006:    # Remove this for bitbake 1.8.12
> ERROR:  0007:    try:
> ERROR:  0008:        from distutils.version import LooseVersion
> ERROR:  0009:    except ImportError:
> ERROR:  0010:        def LooseVersion(v): print "WARNING: sanity.bbclass =
can't compare versions without python-distutils"; return 1
> /r/slug/slugos/bitbake/lib/bb/utils.py:191: DeprecationWarning: raising a=
 string exception is deprecated
>   raise
> /r/slug/slugos/bitbake/lib/bb/cache.py:415: DeprecationWarning: raising a=
 string exception is deprecated
>   raise
> /r/slug/slugos/bitbake/lib/bb/cooker.py:766: DeprecationWarning: raising =
a string exception is deprecated
>   raise
> Traceback (most recent call last):
>   File "/r/slug/slugos/bitbake/bin/bitbake", line 143, in <module>
>     main()
>   File "/r/slug/slugos/bitbake/bin/bitbake", line 140, in main
>     cooker.cook()
>   File "/r/slug/slugos/bitbake/lib/bb/cooker.py", line 617, in cook
>     self.updateCache()
>   File "/r/slug/slugos/bitbake/lib/bb/cooker.py", line 587, in updateCache
>     self.parse_bbfiles(filelist, masked, self.myProgressCallback)
>   File "/r/slug/slugos/bitbake/lib/bb/cooker.py", line 726, in parse_bbfi=
les
>     fromCache, skip =3D self.bb_cache.loadData(f, self.configuration.data)
>   File "/r/slug/slugos/bitbake/lib/bb/cache.py", line 170, in loadData
>     bb_data, skipped =3D self.load_bbfile(fn, cfgData)
>   File "/r/slug/slugos/bitbake/lib/bb/cache.py", line 407, in load_bbfile
>     bb_data =3D parse.handle(bbfile, bb_data) # read .bb data
>   File "/r/slug/slugos/bitbake/lib/bb/parse/__init__.py", line 75, in han=
dle
>     return h['handle'](fn, data, include)
>   File "/r/slug/slugos/bitbake/lib/bb/parse/parse_py/BBHandler.py", line =
161, in handle
>     build.exec_func("__anonfunc", d)
>   File "/r/slug/slugos/bitbake/lib/bb/build.py", line 113, in exec_func
>     exec_func_python(func, d)
>   File "/r/slug/slugos/bitbake/lib/bb/build.py", line 136, in exec_func_p=
ython
>     utils.better_exec(comp, g, tmp, bbfile)
>   File "/r/slug/slugos/bitbake/lib/bb/utils.py", line 171, in better_exec
>     exec code in context
>   File "__anonfunc", line 76, in <module>
>   File "__anonfunc", line 74, in __anonfunc
>   File "<bb>", line 5, in gettext_after_parse
>   File "/r/slug/slugos/bitbake/lib/bb/data.py", line 97, in getVar
>     return d.getVar(var,exp)
>   File "/r/slug/slugos/bitbake/lib/bb/data_smart.py", line 167, in getVar
>     return self.expand(value,var)
>   File "/r/slug/slugos/bitbake/lib/bb/data_smart.py", line 84, in expand
>     s =3D __expand_var_regexp__.sub(var_sub, s)
>   File "/r/slug/slugos/bitbake/lib/bb/data_smart.py", line 61, in var_sub
>     var =3D self.getVar(key, 1)
>   File "/r/slug/slugos/bitbake/lib/bb/data_smart.py", line 167, in getVar
>     return self.expand(value,var)
>   File "/r/slug/slugos/bitbake/lib/bb/data_smart.py", line 85, in expand
>     s =3D __expand_python_regexp__.sub(python_sub, s)
>   File "/r/slug/slugos/bitbake/lib/bb/data_smart.py", line 71, in python_=
sub
>     s =3D eval(code)
>   File "<string>", line 1, in <module>
>   File "<bb>", line 6, in python_dir
> No Python in STAGING_INCDIR. Forgot to build python-native ?
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20

Are you also using uclibc as system C library. For me it happens when I cho=
se uclibc
if I chose glibc or eglibc parse completes.
=2D-=20
Khem Raj

--nextPart1364369.aNS9EJXPCH
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknEU/kACgkQHnJKy6V6em52KQCaAsFM8y12EYM/8OREnupzYFoH
758AoKgImJHnENXqu5UyfOs9sO+bRkS/
=7ln9
-----END PGP SIGNATURE-----

--nextPart1364369.aNS9EJXPCH--
