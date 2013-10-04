Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6F15F60FA6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 14:19:31 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so1811170eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 07:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=brl/UKLhb+kSu7lnVoihfEq7EnlPrSwzWeIB0bSdZYA=;
	b=uaQR1xp+HvWn3YYrREeOHkNtvJRjbRQ+Djw4rk/hTbcXXNUIC0PvP7/d18ul8Fxta2
	HG46E/RmyaxORpMcYDS8XcV1DlryNtauKc5h1AiQ/nPBGd1Fq3ZVRCu2FhqsRZu/Ggiv
	s1ck3nB9P+r08FUEN7dm/qtpyUA2o8kTi3pYCm/zLqC6R+h8ESSPh1/QF0D3OQIQBFNV
	46Gg1PuZou/+5UaOJtSnt3UJIRBSO4IFJQ1eh5KICZDqNFZRMzCAIEQvB1fEihmExaLR
	OctJmk5x9gzVU1ISRqv3H9m1Yg2SQ8CRgOdV4wI8zMIhebrbBsmYVBve//9tFurpf5O9
	p+kQ==
X-Received: by 10.15.99.205 with SMTP id bl53mr2729916eeb.82.1380896372729;
	Fri, 04 Oct 2013 07:19:32 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm28556674eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Oct 2013 07:19:31 -0700 (PDT)
Date: Fri, 4 Oct 2013 16:19:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131004141938.GI6240@jama>
References: <1380026637-6511-1-git-send-email-mario@ossystems.com.br>
	<CAP9ODKpxHF4NUurt-U9HakdAWJ6LAz6HaNoHnuuf5fpEh0h-ow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpxHF4NUurt-U9HakdAWJ6LAz6HaNoHnuuf5fpEh0h-ow@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/2] wvstreams: add recipe for version 4.6.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Oct 2013 14:19:32 -0000
X-Groupsio-MsgNum: 46445
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MFZs98Tklfu0WsCO"
Content-Disposition: inline

--MFZs98Tklfu0WsCO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2013 at 11:42:21AM -0300, Otavio Salvador wrote:
> On Tue, Sep 24, 2013 at 9:43 AM, Mario Domenech Goulart
> <mario@ossystems.com.br> wrote:
> > Recipe based on OE classic's recipe for version 4.4.1, as of
> > 0585ccfa49f71a81652c7f63885202e952ebd0e9.
> >
> > Summary of changes against OE classic's recipe:
> >
> > * Apply some Debian patches from
> >   http://patch-tracker.debian.org/package/wvstreams/4.6.1-6
> >
> > * Minor adjustments for the current build system (add
> >   LIC_FILES_CHKSUM, md5 and sha256 sums for SRC_URI, fix LICENSE, remove
> >   PR)
> >
> > * Disable parallel make, since it was causing errors like
> >
> > Log data follows:
> > | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-l=
inux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> > | DEBUG: Executing shell function do_compile
> > | NOTE: make -j 8
> > | ./CXX -c utils/wvbuffer
> > | ./CXX -c utils/wvbufferstore
> > | ./CXX -c utils/wvcont
> > | /bin/bash: ./CXX: No such file or directory
> > | /bin/bash: ./CXX: No such file or directory
> > | /bin/bash: ./CXX: No such file or directory
> > | * Generating CC using c
> > | make: * Generating CXX using cc
> > | *** [utils/wvbuffer.o] Error 127
> > | make: *** Waiting for unfinished jobs....
> > | make: *** [utils/wvbufferstore.o] Error 127
> > | make: *** [utils/wvcont.o] Error 127
> > | ERROR: oe_runmake failed
> > | WARNING: .../tmp/work/armv7a-vfp-neon-oel-linux-gnueabi/wvstreams/4.6=
=2E1-r0/temp/run.do_compile.19302:1 exit 1 from
> > |   exit 1
> > | ERROR: Function failed: do_compile (log file is located at .../tmp/wo=
rk/armv7a-vfp-neon-oel-linux-gnueabi/wvstreams/4.6.1-r0/temp/log.do_compile=
=2E19302)
> >
> > Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
>=20
> Just for reference, Mario and I discussed about the path for including
> this recipe.
>=20
> We agreed it to be placed at wvdial subdir as it will only be used by it.
>=20
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Sorry for huge delay caused by monster build running on jenkins for 11
days.. but this needs small fix for new QA issue:

wvstreams-4.6.1: wvstreams: Files/directories were installed but not
shipped
  /usr/lib/valgrind
  /usr/lib/valgrind/wvstreams.supp

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MFZs98Tklfu0WsCO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJOznoACgkQN1Ujt2V2gByW9ACfdYIzFohK3BYVAvkV/uwQ/B9y
1FUAniGkucXbdV1zEAyX1wucVgGtfgXm
=txFo
-----END PGP SIGNATURE-----

--MFZs98Tklfu0WsCO--
