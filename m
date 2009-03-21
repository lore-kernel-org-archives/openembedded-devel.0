Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lkqqs-0004jz-RX
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Mar 2009 03:22:23 +0100
Received: by wa-out-1112.google.com with SMTP id n7so679281wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2009 19:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=A7N/LvHwggJoNexULDOX6jXV7N7l1Pe3fIsa8sgU/mw=;
	b=liOjc8Da1QF1ErEVbrcTcOGpuvX9gbT2lVcVDts9pYtvjNm5uuhldroZZwLrYvD1r/
	ZEfH+QgFfn3sRBOpX26+7KqOeQzZ0I4Hjs18D5Uf0mhE0oB7U/egN23ovLYVLUFHRzdq
	lMH+dRqerTRGv4WxphjqNF1yCUVMRTGQtPpng=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=gWUrBccugfJs36O5OenAegJqG3VQKuOY/E2BICq2uHg5dBr//k8PL6U/Ah/zVGS/x7
	M+brGq2yqp6kf1BlO2rqDCNh/HeGwtILPkAsyjIYtIO6aMtR2ADawhHAM55B0ILT92Jo
	gbkDy6dxLafL7VD0BpNwd7NzK8a+f21W1WMkw=
Received: by 10.114.72.1 with SMTP id u1mr2832152waa.154.1237602075801;
	Fri, 20 Mar 2009 19:21:15 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-12-154.dsl.pltn13.sbcglobal.net
	[71.146.12.154])
	by mx.google.com with ESMTPS id m29sm8872865poh.6.2009.03.20.19.21.14
	(version=SSLv3 cipher=RC4-MD5); Fri, 20 Mar 2009 19:21:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Mar 2009 19:21:09 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-11-generic; KDE/4.2.1; x86_64; ; )
References: <alpine.DEB.1.00.0903191522200.10548@localhost.localdomain>
	<200903201907.00480.raj.khem@gmail.com>
In-Reply-To: <200903201907.00480.raj.khem@gmail.com>
MIME-Version: 1.0
Message-Id: <200903201921.13408.raj.khem@gmail.com>
Subject: Re: rpm-native problem?
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
X-List-Received-Date: Sat, 21 Mar 2009 02:22:23 -0000
X-Groupsio-MsgNum: 8584
Content-Type: multipart/signed; boundary="nextPart9104381.p1xC2lqbkV";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart9104381.p1xC2lqbkV
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 20 March 2009 19:06:53 Khem Raj wrote:
> On Thursday 19 March 2009 15:30:29 Theodore A. Roth wrote:
> > Hi,
> >=20
> > I just did a pull this morning and am getting this failure when parsing
> > BitBake files:
> >=20
> >=20
> >=20
> > NOTE: Handling BitBake files: \ (0697/6606) [10 %]__builtin__:6:=20
> > DeprecationWarning: raising a string exception is deprecated
> > NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None=
=20
> > while evaluating:
> > ${@python_dir(d)}
> > /home/roth/dev/OE/bitbake/lib/bb/data_smart.py:93: DeprecationWarning:=
=20
> > raising a string exception is deprecated
> >   raise
> > NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None=
=20
> > while evaluating:
> > --with-python 	=09
> > --with-python-incdir=3D${STAGING_INCDIR}/${PYTHON_DIR} =09
> > --with-python-libdir=3D${libdir}/${PYTHON_DIR} 		--without-apidocs =09
> > --without-selinux 		--without-lua 		--without-dmalloc =09
> > --without-efence ${MUTEX}
> > ERROR: Error in executing:=20
> > /home/roth/dev/OE/openembedded/recipes/rpm/rpm-native_4.4.2.3.bb
> > ERROR: Exception:No Python in STAGING_INCDIR. Forgot to build=20
> > python-native ? Message:None
> > ERROR: Printing the environment of the function
> > ERROR: 	0002:    import bb
> > ERROR: 	0003:    from bb import __version__
> > ERROR: 	0004:    base_after_parse(d)
> > ERROR: 	0005:
> > ERROR: 	0006:    # Remove this for bitbake 1.8.12
> > ERROR: 	0007:    try:
> > ERROR: 	0008:        from distutils.version import LooseVersion
> > ERROR: 	0009:    except ImportError:
> > ERROR: 	0010:        def LooseVersion(v): print "WARNING: sanity.bbclas=
s=20
> > can't compare versions without python-distutils"; return 1
> > /home/roth/dev/OE/bitbake/lib/bb/utils.py:191: DeprecationWarning: rais=
ing=20
> > a string exception is deprecated
> >   raise
> > Traceback (most recent call last):
> >   File "/home/roth/dev/OE/bitbake/bin/bitbake", line 143, in <module>
> >     main()
> >   File "/home/roth/dev/OE/bitbake/bin/bitbake", line 140, in main
> >     cooker.cook()
> >   File "/home/roth/dev/OE/bitbake/lib/bb/cooker.py", line 617, in cook
> >     self.updateCache()
> >   File "/home/roth/dev/OE/bitbake/lib/bb/cooker.py", line 587, in=20
> > updateCache
> >     self.parse_bbfiles(filelist, masked, self.myProgressCallback)
> >   File "/home/roth/dev/OE/bitbake/lib/bb/cooker.py", line 717, in=20
> > parse_bbfiles
> >     def parse_bbfiles(self, filelist, masked, progressCallback =3D None=
):
> >   File "/home/roth/dev/OE/bitbake/lib/bb/cooker.py", line 766, in=20
> > parse_bbfiles
> >     raise
> >   File "/home/roth/dev/OE/bitbake/lib/bb/cooker.py", line 726, in=20
> > parse_bbfiles
> >     fromCache, skip =3D self.bb_cache.loadData(f, self.configuration.da=
ta)
> >   File "/home/roth/dev/OE/bitbake/lib/bb/cache.py", line 168, in loadDa=
ta
> >     bb_data, skipped =3D self.load_bbfile(fn, cfgData)
> >   File "/home/roth/dev/OE/bitbake/lib/bb/cache.py", line 413, in=20
> > load_bbfile
> >     raise
> >   File "/home/roth/dev/OE/bitbake/lib/bb/cache.py", line 405, in=20
> > load_bbfile
> >     bb_data =3D parse.handle(bbfile, bb_data) # read .bb data
> >   File "/home/roth/dev/OE/bitbake/lib/bb/parse/__init__.py", line 75, i=
n=20
> > handle
> >     return h['handle'](fn, data, include)
> >   File "/home/roth/dev/OE/bitbake/lib/bb/parse/parse_py/BBHandler.py",=
=20
> > line 184, in handle
> >     finalise(fn, d)
> >   File "/home/roth/dev/OE/bitbake/lib/bb/parse/parse_py/BBHandler.py",=
=20
> > line 92, in finalise
> >     build.exec_func("__anonfunc", d)
> >   File "/home/roth/dev/OE/bitbake/lib/bb/build.py", line 113, in exec_f=
unc
> >     exec_func_python(func, d)
> >   File "/home/roth/dev/OE/bitbake/lib/bb/build.py", line 136, in=20
> > exec_func_python
> >     utils.better_exec(comp, g, tmp, bbfile)
> >   File "/home/roth/dev/OE/bitbake/lib/bb/utils.py", line 171, in=20
> > better_exec
> >     exec code in context
> >   File "__anonfunc", line 76, in <module>
> >   File "__anonfunc", line 74, in __anonfunc
> >   File "<bb>", line 5, in gettext_after_parse
> >   File "/home/roth/dev/OE/bitbake/lib/bb/data.py", line 97, in getVar
> >     return d.getVar(var,exp)
> >   File "/home/roth/dev/OE/bitbake/lib/bb/data_smart.py", line 167, in=20
> > getVar
> >     return self.expand(value,var)
> >   File "/home/roth/dev/OE/bitbake/lib/bb/data_smart.py", line 84, in=20
> > expand
> >     s =3D __expand_var_regexp__.sub(var_sub, s)
> >   File "/home/roth/dev/OE/bitbake/lib/bb/data_smart.py", line 61, in=20
> > var_sub
> >     var =3D self.getVar(key, 1)
> >   File "/home/roth/dev/OE/bitbake/lib/bb/data_smart.py", line 167, in=20
> > getVar
> >     return self.expand(value,var)
> >   File "/home/roth/dev/OE/bitbake/lib/bb/data_smart.py", line 85, in=20
> > expand
> >     s =3D __expand_python_regexp__.sub(python_sub, s)
> >   File "/home/roth/dev/OE/bitbake/lib/bb/data_smart.py", line 71, in=20
> > python_sub
> >     s =3D eval(code)
> >   File "<string>", line 1, in <module>
> >   File "<bb>", line 6, in python_dir
> > No Python in STAGING_INCDIR. Forgot to build python-native ?
> >=20
>=20
> FWIW I am seeing same error on ubuntu 8.08 box (python 2.5.2 on box) . I =
do not  see this error on ubuntu 9.04 which has python 2.6.1 on box.

and it happens only when I chose ANGSTROMLIBC=3Duclibc works well if I set =
it to eglibc or glibc.

>=20
> >=20
> >=20
> > Is this problem related to the following patch?
> >=20
> >=20
> > Author: Marcin Juszkiewicz <hrw@openembedded.org>  2008-11-19 03:12:37
> > Committer: Marcin Juszkiewicz <hrw@openembedded.org>  2009-03-19 12:22:=
34
> > Parent: 47bb0f5ca3d62205703973398d79ed553bed8a4f (linux-msm7xxx: bump=20
> > htcraphael SRCREV to a version that boots)
> > Child:  cabcbfe980d379e03589be3ed4bd0a4fc006e770 (beecrypt: get patch f=
rom=20
> > Poky to fix building on 64bit machines)
> > Branches: org.openembedded.dev, remotes/origin/org.openembedded.dev,=20
> > ts7800
> > Follows: mv-packages-to-recipes-post
> > Precedes:=20
> >=20
> >     rpm/rpm-native: Add recipe for 4.4.2.3 (from Poky)
> >    =20
> >     Squashed set of changes from Poky:
> >    =20
> >     svn r5069 - rpm/rpm-native: Add recipe for 4.4.2.3
> >     svn r5085 - rpm: Patch out some Makefile strangeness causing build=
=20
> > failures
> >     svn r5093 - rpm: Enable python extensions and improve cross compili=
ng=20
> > patches
> >     svn r5103 - rpm: Tweak patches to remove popt problem
> >     svn r5113 - rpm: Add recommends support from suse rpm patches
> >     svn r5132 - rpm-native: Set varprefix to get the rpm database in a=
=20
> > sane location
> >     svn r5152 - rpm: Handle PYTHONVER differently in EXTRA_OECONF to st=
op=20
> > gettext/uclibc failures during parsing
> >     svn r5154 - rpm: Add missing patches
> >     svn r5423 - rpm: Add python module packaging
> >    =20
> >     OE changes:
> >    =20
> >     rpm-native: add Python 2.6 support
> >     rpm: use distutils-base to get Python version
> >     rpm: use sed instead of ed - it is present in our metadata
> >     rpm: set ARM_INSTRUCTION_SET as it fails to build for thumb
> >    =20
> >     | /tmp/ccYO91se.s: Assembler messages:
> >     | /tmp/ccYO91se.s:71: Error: selected processor does not support `s=
wpb=20
> > r2,r3,[r4]'
> >     | /tmp/ccYO91se.s:72: Error: unshifted register required -- `eor=20
> > r2,r2,#1'
> >=20
> >=20
> >=20
> >=20
> > Thanks for any help.
> >=20
> > Ted Roth
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >=20
>=20

=2D-=20
Khem Raj

--nextPart9104381.p1xC2lqbkV
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknETxYACgkQHnJKy6V6em4RewCfRqt6kquJ86dQYbPeaZTM2B3n
4icAniTACTOnkNYBqwR44cOlpPTAyvvM
=Gs1S
-----END PGP SIGNATURE-----

--nextPart9104381.p1xC2lqbkV--
