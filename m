Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 863686E927
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 07:45:10 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e53so6772498eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2014 23:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=tAtUHeqk37PODnGJP80TeKXyGbEEuSkONiveRx82fRY=;
	b=GCvJDEI7e3mH+x31jfvFwmMSe6AR3WklT9hn8SZBvudBl0JKd7iTEyKMt7q2olhB4c
	8QMmha0N3nN3w8UqJKp1AcWeXeqM7uXHXMOrQxkv0X8Hr84QV1k7f6U+nFVLUjsivfU/
	45q3upcjmLyumNXrMYkY/hHTvNhUDaAuSKvUoGcdkbTA6++hEJXB3wGEO8GOssRsKShR
	X9KFQWJvtHQXTJ22A35Emxt4iJOXyZNnAwiBrhiDAMy94Fmsa0wiuugZgrjG7Ofahckq
	gGVZeGFBGuTF0Yyp3d1M9I6MIpa8lhuaMrCi4ayAhk9goPbmtSSyokL3NFXpLGhv7Avp
	kc7w==
X-Received: by 10.15.64.4 with SMTP id n4mr16433eex.110.1392623110528;
	Sun, 16 Feb 2014 23:45:10 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g1sm54168939eet.6.2014.02.16.23.45.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Feb 2014 23:45:09 -0800 (PST)
Date: Mon, 17 Feb 2014 08:45:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Message-ID: <20140217074539.GD4067@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: spitz linux-yocto 3.10 fails to patch
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
X-List-Received-Date: Mon, 17 Feb 2014 07:45:10 -0000
X-Groupsio-MsgNum: 48159
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WK3l2KTTmXPVedZ6"
Content-Disposition: inline

--WK3l2KTTmXPVedZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

is this known issue?

ERROR: Function failed: do_patch (log file is located at /OE/build/shr-core=
/tmp-eglibc/work/spitz-oe-linux-gnueabi/linux-yocto/3.10.28+gitAUTOINC+8f8a=
f5a3b1_3e0a296fae-r0/temp/log.do_patch.25528)
ERROR: Logfile of failure stored in: /OE/build/shr-core/tmp-eglibc/work/spi=
tz-oe-linux-gnueabi/linux-yocto/3.10.28+gitAUTOINC+8f8af5a3b1_3e0a296fae-r0=
/temp/log.do_patch.25528
Log data follows:
| DEBUG: Executing shell function do_patch
| Deleted branch meta-temp (was f58e62b).
| ERROR: could not find file cfg/serial-8250.cfg, included from /OE/build/s=
hr-core/tmp-eglibc/work/spitz-oe-linux-gnueabi/linux-yocto/3.10.28+gitAUTOI=
NC+8f8af5a3b1_3e0a296fae-r0/linux/.meta/cfg/scratch/obj/OE/build/shr-core/m=
eta-handheld/recipes-kernel/linux/linux-yocto-3.10/zaurus-common.scc
| ERROR: could not process input files: /OE/build/shr-core/tmp-eglibc/work/=
spitz-oe-linux-gnueabi/linux-yocto/3.10.28+gitAUTOINC+8f8af5a3b1_3e0a296fae=
-r0/linux/.meta/cfg/scratch/obj/OE/build/shr-core/meta-handheld/recipes-ker=
nel/linux/linux-yocto-3.10/spitz/spitz-standard.scc /OE/build/shr-core/tmp-=
eglibc/work/spitz-oe-linux-gnueabi/linux-yocto/3.10.28+gitAUTOINC+8f8af5a3b=
1_3e0a296fae-r0/linux/.meta/cfg/scratch/obj/OE/build/shr-core/meta-handheld=
/recipes-kernel/linux/linux-yocto-3.10/feature-top.scc
| ERROR. A meta series could not be created for /OE/build/shr-core/tmp-egli=
bc/work/spitz-oe-linux-gnueabi/linux-yocto/3.10.28+gitAUTOINC+8f8af5a3b1_3e=
0a296fae-r0/linux/.meta/cfg/scratch/obj/OE/build/shr-core/meta-handheld/rec=
ipes-kernel/linux/linux-yocto-3.10/spitz/spitz-standard.scc
| ERROR. Could not locate meta series for spitz
| ERROR. Could not apply patches for spitz.
|        Patch failures can be resolved in the devshell (bitbake -c devshel=
l linux-yocto)
| WARNING: /OE/build/shr-core/tmp-eglibc/work/spitz-oe-linux-gnueabi/linux-=
yocto/3.10.28+gitAUTOINC+8f8af5a3b1_3e0a296fae-r0/temp/run.do_patch.25528:1=
 exit 1 from
|   exit 1
| ERROR: Function failed: do_patch (log file is located at /OE/build/shr-co=
re/tmp-eglibc/work/spitz-oe-linux-gnueabi/linux-yocto/3.10.28+gitAUTOINC+8f=
8af5a3b1_3e0a296fae-r0/temp/log.do_patch.25528)
ERROR: Task 3 (/OE/build/shr-core/openembedded-core/meta/recipes-kernel/lin=
ux/linux-yocto_3.10.bb, do_patch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 387 tasks of which 382 didn't need to be rer=
un and 1 failed.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WK3l2KTTmXPVedZ6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMBviMACgkQN1Ujt2V2gBxVQACgpOcHk+4ucTvHyhKmXYhRRCa8
L/AAoI10eA2lh5TcTi0/Vx5kCH8tqwnW
=UjOh
-----END PGP SIGNATURE-----

--WK3l2KTTmXPVedZ6--
