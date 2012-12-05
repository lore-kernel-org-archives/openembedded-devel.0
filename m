Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TgHtd-0000OF-O8; Wed, 05 Dec 2012 17:32:29 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2071701eaa.6
	for <multiple recipients>; Wed, 05 Dec 2012 08:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wQwNrZ+5UvtV3iD+6Ix64MTctAHIQaQuHvrGPLVIGLM=;
	b=LIh5oQHaHqD8qgELBIKN9Wexyabj5aYOJKF7XbqUttYLyFwff2UPgc6aC4Cfj6+t14
	1wU57Z9isYUA/ShUz/e4sweMFmoX24hYL0tId0NvlAQqENEOCt0X+DbS1fGBLwCKSHtY
	ZKQA+TH0dNLspSoPBc982fTmXWGBBj94SRHMmiTxH1ZACEdH7ZvB60Kma5qVzwlrouOJ
	vW/QIzOydT+XU7/en+61p4weUSP1pibLxGZrLtXbzPCWIOoyoRAFhSl0sdWX30eIX6fr
	fSNLhVMlH4jVNsPPGvsESJwofNs8lrFlox/5XR49hocFHnJ0m3P5HyheJTsfsykjE7BQ
	vK1w==
Received: by 10.14.3.8 with SMTP id 8mr12041640eeg.40.1354724285676;
	Wed, 05 Dec 2012 08:18:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q44sm10032289eep.5.2012.12.05.08.18.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 08:18:05 -0800 (PST)
Date: Wed, 5 Dec 2012 17:18:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mario Domenech Goulart <mario@ossystems.com.br>
Message-ID: <20121205161802.GD3396@jama.jama.net>
References: <20121204094959.979C9103B4@opal>
MIME-Version: 1.0
In-Reply-To: <20121204094959.979C9103B4@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Mario Domenech Goulart : freerdp: update to the latest commit (2012-11-20) in the stable-1.0 branch
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
X-List-Received-Date: Wed, 05 Dec 2012 16:32:29 -0000
X-Groupsio-MsgNum: 42000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OaZoDhBhXzo6bW1J"
Content-Disposition: inline

--OaZoDhBhXzo6bW1J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2012 at 09:49:57AM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: e7e3fd797b46a85ffc03cc7c4b2267d686476f93
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3De7e3fd797b46a85ffc03cc7c4b2267d686476f93
>=20
> Author: Mario Domenech Goulart <mario@ossystems.com.br>
> Date:   Mon Dec  3 16:03:22 2012 +0000
>=20
> freerdp: update to the latest commit (2012-11-20) in the stable-1.0 branch
>=20
> Change-Id: I9b872c1aa9a17e6ef9dc0fd4b18dfe9f354f62a6
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Not sure if it's caused by this patch or was failing before too,=20
but freerdp-extension-xpunlimited is now failing to build:

| /OE/jansa-test/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/freerdp-e=
xtension-xpunlimited/gitr1+e952627ff4c116b4ce8541c91cb96bd5422c4a0d-r0/git/=
src/xpu.c:29:28: fatal error: freerdp/rdpset.h: No such file or directory
| compilation terminated.
| make[2]: *** [src/CMakeFiles/xpu.dir/xpu_main.c.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: *** [src/CMakeFiles/xpu.dir/xpu.c.o] Error 1
| make[2]: Leaving directory `/OE/jansa-test/shr-core/tmp-eglibc/work/armv4=
t-oe-linux-gnueabi/freerdp-extension-xpunlimited/gitr1+e952627ff4c116b4ce85=
41c91cb96bd5422c4a0d-r0/git'
| make[1]: *** [src/CMakeFiles/xpu.dir/all] Error 2
| make[1]: Leaving directory `/OE/jansa-test/shr-core/tmp-eglibc/work/armv4=
t-oe-linux-gnueabi/freerdp-extension-xpunlimited/gitr1+e952627ff4c116b4ce85=
41c91cb96bd5422c4a0d-r0/git'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see /OE/jansa-test/shr-core/tmp-eglib=
c/work/armv4t-oe-linux-gnueabi/freerdp-extension-xpunlimited/gitr1+e952627f=
f4c116b4ce8541c91cb96bd5422c4a0d-r0/temp/log.do_compile.9195 for further in=
formation)
NOTE: recipe freerdp-extension-xpunlimited-gitr1+e952627ff4c116b4ce8541c91c=
b96bd5422c4a0d-r0: task do_compile: Failed

Can you check that?

Cheers,

--OaZoDhBhXzo6bW1J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC/c7oACgkQN1Ujt2V2gBy7hQCfduAAhrCkkfD9N7XXoqKKUGpo
/QcAn3GBi2yx9EYgX1ZrxtOyNMUtb66S
=Rod2
-----END PGP SIGNATURE-----

--OaZoDhBhXzo6bW1J--
