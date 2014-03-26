Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 31A3C6E713
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 20:43:57 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so2106731eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 13:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=4WQW/xDCCMs6euJmVaqeya2q2kG3rvuqSzlAeP0VHJQ=;
	b=CyPkN/5gRnDAm197r66b7IgRuJqp+LJ8JTiEl2RjRqg5Kk+ZalsUWN3GpqX+l5cyf6
	zbcFDyDCmmdCXEMbfF6GVMzlvrbc98YZPKRXCR34bfX5W0lveUfMkcYIX8YwUHfoK06H
	ZdosdXr2Y2/x8olepUNRLw+e/MDOPji8EA4m817tZKDQ89naewyGRPSAAz2gX8uLDlXn
	Ul/zW59okS/4pai/7kejfTUvlrATSFI6HbTsyGc7eimzn4wmhI5j3+J0h6SFh/wtSlkN
	xS8RCt6nPj9dGumFxySGxXlRHmc5LatK+/kCLIzNPEkkOOUSLqHiigeczfjOrOksbgc8
	h7mA==
X-Received: by 10.15.10.3 with SMTP id f3mr76852020eet.1.1395866638154;
	Wed, 26 Mar 2014 13:43:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l42sm49490574eew.19.2014.03.26.13.43.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Mar 2014 13:43:56 -0700 (PDT)
Date: Wed, 26 Mar 2014 21:43:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Lauren Post <lauren.post@freescale.com>
Message-ID: <20140326204356.GJ3709@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: glcompbench: Create 2012.08 version
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
X-List-Received-Date: Wed, 26 Mar 2014 20:44:00 -0000
X-Groupsio-MsgNum: 48842
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SBT+cnFS/G3NVgv4"
Content-Disposition: inline

--SBT+cnFS/G3NVgv4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Fails to build for qemuarm (looks like missing dependency)

ERROR: Function failed: do_configure (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/glco=
mpbench/2012.08-r0/temp/log.do_configure.19183)
ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/glcompbench/2012.08-r0/temp/=
log.do_configure.19183
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function do_configure
| Setting top to                           : /home/jenkins/oe/shr-core-bran=
ches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/glcompbench/2012.08-=
r0/glcompbench-2012.08
| Setting out to                           : /home/jenkins/oe/shr-core-bran=
ches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/glcompbench/2012.08-=
r0/glcompbench-2012.08/build
| Checking for 'g++' (c++ compiler)        : ok
| Checking for header inttypes.h           : yes
| Checking for header stdint.h             : yes
| Checking for header sys/time.h           : yes
| Checking for library m                   : yes
| Checking for function gettimeofday       : yes
| Checking for function sqrt               : yes
| Checking for function strtol             : yes
| Checking for function strtoul            : yes
| Checking for program pkg-config          : /home/jenkins/oe/shr-core-bran=
ches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/pkg-config
| Checking for 'x11'                       : yes
| Checking for 'xdamage'                   : yes
| Checking for 'xcomposite'                : not found
| The configuration failed
| (complete log in /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/w=
ork/armv5te-oe-linux-gnueabi/glcompbench/2012.08-r0/glcompbench-2012.08/bui=
ld/config.log)
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gl=
compbench/2012.08-r0/temp/log.do_configure.19183)
ERROR: Task 5 (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedde=
d/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb, do_configure=
) failed with exit code '1'

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SBT+cnFS/G3NVgv4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMzPAwACgkQN1Ujt2V2gBwVjgCeN5JBm7xBo1DlnsY32uBMUf23
WlYAoJRvED5NViDRiKTsszFCMuLCbC5e
=Srwh
-----END PGP SIGNATURE-----

--SBT+cnFS/G3NVgv4--
