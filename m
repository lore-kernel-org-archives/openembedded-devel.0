Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LkriX-0005wL-Fq
	for openembedded-devel@openembedded.org; Sat, 21 Mar 2009 04:17:49 +0100
Received: by yw-out-1718.google.com with SMTP id 9so1031143ywk.30
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Mar 2009 20:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=aZrua6RPEDIXPyRjhpW9a0efohF/0d1EOXpOjvOEndA=;
	b=A9HNzyuqCxkAauZdCMi4GAVZ3KkfdFmGepPz3Q0gqE0RMfOwDnQVU6qroZszAS0Sgb
	gWxDmRvs9LRwLCHjhuxI2L4d08UGQ1lM3L/7Wuc1g+sagKWytqd1hrc1PgyWpI0+3VDL
	wFPgQ/n0pOcz+Y7Nef9ynR7e6+CzeYgBobos4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=fMm95NjmijgSeWXQvexGgPZhSKOTVrmB4N6yCgJjvFFK3LzBZZUuhW+zgkkZsi6qLi
	1cllOXv5DI29Rc7f8tbnJ7psWWyYljKzsg626XsZncqdmUzMSchmSSJnHiqX3XTPdGjv
	o6AvasHMrl8KGm6uFfbHlsZ7ItwtbL78uhtqo=
Received: by 10.142.246.20 with SMTP id t20mr1781995wfh.143.1237605401891;
	Fri, 20 Mar 2009 20:16:41 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-12-154.dsl.pltn13.sbcglobal.net
	[71.146.12.154])
	by mx.google.com with ESMTPS id 30sm5428483wff.7.2009.03.20.20.16.40
	(version=SSLv3 cipher=RC4-MD5); Fri, 20 Mar 2009 20:16:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Mar 2009 20:16:29 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-11-generic; KDE/4.2.1; x86_64; ; )
References: <49C4516C.90607@dls.net>
In-Reply-To: <49C4516C.90607@dls.net>
MIME-Version: 1.0
Message-Id: <200903202016.34258.raj.khem@gmail.com>
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
X-List-Received-Date: Sat, 21 Mar 2009 03:17:49 -0000
X-Groupsio-MsgNum: 8590
Content-Type: multipart/signed; boundary="nextPart1941150.kXHqpTvUQG";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1941150.kXHqpTvUQG
Content-Type: multipart/mixed;
  boundary="Boundary-01=_OwFxJFmV3nmrMZi"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_OwFxJFmV3nmrMZi
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

Attached is a better fix. Is it OK ?


=2D-=20
Khem Raj


--Boundary-01=_OwFxJFmV3nmrMZi
Content-Type: text/x-patch;
  charset="iso-8859-1";
  name="diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
	filename="diff"

diff --git a/recipes/rpm/rpm_4.4.2.3.bb b/recipes/rpm/rpm_4.4.2.3.bb
index db88282..7f9b666 100644
=2D-- a/recipes/rpm/rpm_4.4.2.3.bb
+++ b/recipes/rpm/rpm_4.4.2.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "The RPM Package Manager."
 HOMEPAGE =3D "http://rpm.org/"
 LICENSE =3D "LGPL GPL"
 DEPENDS =3D "zlib beecrypt file popt python sed-native"
=2DPR =3D "r13"
+PR =3D "r14"
=20
 SRC_URI =3D "http://www.rpm.org/releases/rpm-4.4.x/rpm-4.4.2.3.tar.gz \
            file://external-tools.patch;patch=3D1 \
@@ -21,7 +21,8 @@ ARM_INSTRUCTION_SET =3D "arm"
=20
 acpaths =3D "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
=20
=2DEXTRA_OECONF =3D "--with-python \
+do_configure_prepend (){
+	EXTRA_OECONF =3D "--with-python \
 		--with-python-incdir=3D${STAGING_INCDIR}/${PYTHON_DIR} \
 		--with-python-libdir=3D${libdir}/${PYTHON_DIR} \
 		--without-apidocs \
@@ -29,6 +30,7 @@ EXTRA_OECONF =3D "--with-python \
 		--without-lua \
 		--without-dmalloc \
 		--without-efence"
+}
=20
 PACKAGES +=3D "python-rpm"
 FILES_python-rpm =3D "${libdir}/python*/site-packages/rpm/_*"

--Boundary-01=_OwFxJFmV3nmrMZi--

--nextPart1941150.kXHqpTvUQG
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknEXA4ACgkQHnJKy6V6em7eDACdEtEn8+7EOK0syjNUyyXUicH0
NUUAn0eAtxM1QTBRDzz30wYwqDbvzaSG
=7rb8
-----END PGP SIGNATURE-----

--nextPart1941150.kXHqpTvUQG--
