Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF1F65CA7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Aug 2014 00:44:35 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so4949989wgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Aug 2014 17:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XHKu80GIm+gYWGuPmnx5vakraANK2yXwQpwD6LPzdhA=;
	b=mgn1YqJorb/Rtz1c1dWAhOYz0IOTfb1eQjZ4mmRQns9f4GiIqMNkEMJaceGyGBZB+v
	zQl1K+Ysgdwog5ZSQL6LagM3Ld9ksUl7dQBTbESbYoWd+NmIo66SX5z8iY5qkMeh8YKJ
	e+hcEYuxNrewHTyEk1a8azFBVRheZCnC/5ydnfUU1iOxYQSXPGg4IcRnnMH5tSwfPw/k
	KVxCgy00YrUVBenMzimt95R7J8e4qEih2B1HEt5SseMfw7aXNwP2GATV23UpYWxx6ArS
	Shwj0curF+NP+LnGKYPDhNG2RHFTXvsQDt6M0qzPkP9UU2A0U4nJ95dmohlNDXyuXseo
	gOrg==
X-Received: by 10.195.11.234 with SMTP id el10mr28270138wjd.95.1407458677064; 
	Thu, 07 Aug 2014 17:44:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	xn12sm1646060wib.13.2014.08.07.17.44.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Aug 2014 17:44:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 8 Aug 2014 02:45:07 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140808004507.GZ14848@jama>
References: <20140806192249.GP14848@jama>
	<1407418315-15620-1-git-send-email-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1407418315-15620-1-git-send-email-paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] mariadb: update to 5.5.38
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
X-List-Received-Date: Fri, 08 Aug 2014 00:44:40 -0000
X-Groupsio-MsgNum: 51491
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TXtETX/xrt1zdi6e"
Content-Disposition: inline

--TXtETX/xrt1zdi6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 02:31:55PM +0100, Paul Eggleton wrote:
> * Upstream switched from autotools to cmake
> * Separate build dir and parallel make now work
> * Library versioning no longer used for plugins; other libtool cruft
>   gone
> * Proper upstream initscript
> * Plugins moved from client library package to mariadb-server package
>   (matches how Fedora packages these)
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>=20
> Changes since v1:
> * Add readline and libaio to DEPENDS
> * Disable usage of boost

Thanks for update, I've found few more differences between failing (after b=
uilding world) and
working (with minimal deps) build:

646c646
< -- Looking for include files valgrind/memcheck.h, valgrind/valgrind.h - f=
ound
---
> -- Looking for include files valgrind/memcheck.h, valgrind/valgrind.h - n=
ot found
733c733
< -- Looking for include file security/pam_appl.h - found
---
> -- Looking for include file security/pam_appl.h - not found
759c759
< -- Looking for event.h - found
---
> -- Looking for event.h - not found

There is also floating systemtap-native dependency which enables DTRACE sup=
port
in mariadb (see mariadb-5.5.38/cmake/dtrace.cmake).


And groff-native is the cause for following error:
| Scanning dependencies of target ps
| make[2]: Leaving directory `/work/i586-oe-linux/mariadb/5.5.38-r0/build'
| make -f dbug/CMakeFiles/ps.dir/build.make dbug/CMakeFiles/ps.dir/build
| make[2]: Entering directory `/work/i586-oe-linux/mariadb/5.5.38-r0/build'
| /sysroots/x86_64-linux/usr/bin/cmake -E cmake_progress_report /work/i586-=
oe-linux/mariadb/5.5.38-r0/build/CMakeFiles
| [ 84%] Generating example3.r
| cd /work/i586-oe-linux/mariadb/5.5.38-r0/build/dbug && sed -e 's!\\!\\\\!=
g' </work/i586-oe-linux/mariadb/5.5.38-r0/mariadb-5.5.38/dbug/example3.c >e=
xample3.r
| /sysroots/x86_64-linux/usr/bin/cmake -E cmake_progress_report /work/i586-=
oe-linux/mariadb/5.5.38-r0/build/CMakeFiles
| [ 84%] Generating output1.r, output2.r, output3.r, output4.r, output5.r
| cd /work/i586-oe-linux/mariadb/5.5.38-r0/build/dbug && ./factorial 1 2 3 =
4 5 > output1.r
| ./factorial: /lib/i386-linux-gnu/libc.so.6: version `GLIBC_2.17' not foun=
d (required by ./factorial)
| make[2]: *** [dbug/output1.r] Error 1
| make[2]: Leaving directory `/work/i586-oe-linux/mariadb/5.5.38-r0/build'
| make[1]: *** [dbug/CMakeFiles/ps.dir/all] Error 2
| make[1]: Leaving directory `/work/i586-oe-linux/mariadb/5.5.38-r0/build'
| make: *** [all] Error 2
| ERROR: oe_runmake failed

Adding -DGROFF=3DFalse -DNROFF=3DFalse to EXTRA_OECMAKE allowed me to build=
 it after world, but please check other floating deps as well.

Thanks

--TXtETX/xrt1zdi6e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPkHZMACgkQN1Ujt2V2gByffQCcCCyhc3ApvAQMymPMoXFbxSR7
lcIAmgMm2aYP0IkNcti7cZAsVFtWzjUw
=bCLc
-----END PGP SIGNATURE-----

--TXtETX/xrt1zdi6e--
