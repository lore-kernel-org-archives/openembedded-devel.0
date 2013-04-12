Received: from mail-pd0-f177.google.com ([209.85.192.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQn6e-0001iy-Gy
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 01:10:18 +0200
Received: by mail-pd0-f177.google.com with SMTP id u11so1612659pdi.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 15:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=R4ykOZHGYn0ncSVPWotx+n696VenDGxh1h/CgndOzWg=;
	b=iY+d1HqNnfelme+NdF/K/qW/7Ht4YMREda9nFNKRIwopWKzYUZtNPoDtDbzhm2FtnY
	JMYGDC2okefOHL0Xtph2ymS02xDeA4fS7R0DAQDr7PNJChMAGVMlpB818MbDh4egIlR9
	XYpT+req6ZP6izKEI5GwxrVP1wYjaAzKZPBzdqyccB4r37qIBtgDRt2Nl/8F8kdhkvxN
	7jt2PQXxB98qhPeARRF2NtaSBU1ateiBijXyBRYBs2GtLTDJSWhKPdqughGTFVSd8Inh
	Pepz6WwOYJiw+ZIPurAnjoB8WqPTHhePL/ekrpuex+JTGzJDGZbLJjeSTU8YQkjnRQiP
	zQrg==
X-Received: by 10.68.211.161 with SMTP id nd1mr17230075pbc.59.1365807162598;
	Fri, 12 Apr 2013 15:52:42 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z8sm10138049pbt.23.2013.04.12.15.52.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 15:52:41 -0700 (PDT)
Date: Sat, 13 Apr 2013 00:52:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130412225236.GZ2477@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-handheld] linux-yocto-3.8 failing
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
X-List-Received-Date: Fri, 12 Apr 2013 23:10:18 -0000
X-Groupsio-MsgNum: 44103
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYtRAvLPyLojxZ7Y"
Content-Disposition: inline

--zYtRAvLPyLojxZ7Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

patches from
http://git.openembedded.org/meta-handheld/commit/?id=3D54c01286d738e6a6dc29=
71853644b9ed0e0a9a2e

don't apply after linux-yocto upgrade in oe-core from today
http://git.openembedded.org/openembedded-core/commit/?id=3D0271dec64591c4d9=
1933b3a8db875a374a63640b

ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/spitz-oe=
-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc05f49a205c=
150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.do_patch.1=
8051 for further information)
ERROR: Logfile of failure stored in: /OE/shr-core/tmp-eglibc/work/spitz-oe-=
linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc05f49a205c1=
50d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.do_patch.18=
051
Log data follows:
| DEBUG: Executing shell function do_patch
| Deleted branch meta-temp (was 37fdb0c).
| [INFO] validating against known patches  (spitz-standard-meta)
error: patch failed: arch/arm/mach-pxa/spitz_pm.c:86##] (\)(102 %)
| error: arch/arm/mach-pxa/spitz_pm.c: patch does not apply
| To force apply this patch, use 'guilt push -f'
| [ERROR] unable to complete push
| pending patches are:
| links/linux-yocto-3.8/spitz_pm.patch
| links/linux-yocto-3.8/pxa27x-sa1100-rtc.patch
| links/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch
| ERROR. could not update git tree
| ERROR. Could not apply patches for spitz.
|        Patch failures can be resolved in the devshell (bitbake -c devshel=
l linux-yocto)
| ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/spitz-=
oe-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc05f49a20=
5c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.do_patch=
=2E18051 for further information)
ERROR: Task 3 (/OE/shr-core/openembedded-core/meta/recipes-kernel/linux/lin=
ux-yocto_3.8.bb, do_patch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 26 tasks of which 21 didn't need to be rerun=
 and 1 failed.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zYtRAvLPyLojxZ7Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFokDQACgkQN1Ujt2V2gBzONwCfXrOi8tfEJlcNuWA+fMdQq1nn
CzUAnRfFwoO6+SFHI5lgkpNC7P1pQKAr
=rV/8
-----END PGP SIGNATURE-----

--zYtRAvLPyLojxZ7Y--
