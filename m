Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 56D677564B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 15:30:49 +0000 (UTC)
Received: by wgez8 with SMTP id z8so67009101wge.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9mYpL842KNP+bdaru3wFWor55uRCjiBu9JYwjmW+TWo=;
	b=M9mrlaSBBJhCE8otHPMSqt1AgYJfioABjbvTgyLsRH42bKaNjMqnBFjDyyhYEzU7ry
	ATHJpX4VfYVVAKsgG0qvi53Zk5UeoxbJQlWS99WB/rI0PiAkSEzm9NzjjyVMrxLV7O+T
	znzyPm10Se7cXZhvZe4hu2MlcdOjg0s87mztMZj3HpIIF50imFurcwQu9VB+4sFMpLZB
	IGLeg/D6621SMu7PdVkrBXqY+r/4FapzcgaumHC6Mz2OGCgbDV2bnSHD9tLwOFuWfT0R
	fnZTSVLTEMKOBT9HdqD+JTcODbpY5y+0hgjB/Hz8uRQgl93ecN1Inver9ecgzX340IrS
	MxWg==
X-Received: by 10.180.106.97 with SMTP id gt1mr28113664wib.37.1434641450584;
	Thu, 18 Jun 2015 08:30:50 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id wx9sm12711902wjb.6.2015.06.18.08.30.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jun 2015 08:30:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 18 Jun 2015 17:31:11 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150618153111.GC2451@jama>
References: <1434527353-47017-1-git-send-email-biannm@cn.fujitsu.com>
	<1434527353-47017-8-git-send-email-biannm@cn.fujitsu.com>
	<20150617203632.GA2390@jama>
	<30DC4EDFD798C94083F3E083754532CC73E10096@G08CNEXMBPEKD02.g08.fujitsu.local>
MIME-Version: 1.0
In-Reply-To: <30DC4EDFD798C94083F3E083754532CC73E10096@G08CNEXMBPEKD02.g08.fujitsu.local>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2 7/7] samba: upgrade to 4.1.12
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
X-List-Received-Date: Thu, 18 Jun 2015 15:30:53 -0000
X-Groupsio-MsgNum: 55966
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Content-Disposition: inline

--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2015 at 12:59:35AM +0000, Bian, Naimeng wrote:
>=20
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Martin Jansa
> > Sent: Thursday, June 18, 2015 4:37 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH v2 7/7] samba: upgrade to 4.1.12
> >=20
> > On Wed, Jun 17, 2015 at 03:49:13PM +0800, Bian Naimeng wrote:
> > > Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > >
> > > git send-email will catch error as below
> > >  fatal: 0002-samba-upgrade-to-4.1.12.patch: 965: patch contains a line
> > > longer than 998 characters
> > >
> > > So, please get patch from
> > > https://github.com/bendaaron/meta-oe-dev/commit/47678ed346a1ce347a6470
> > > 5c76df09d4fa537b0e
> >=20
> > I've cherry-picked first 6 patches from here, but this last one fails t=
o apply,
> > because you're removing samba 3.6.24, but in master we have 3.6.25 sinc=
e this
> > commit merged more than month ago:
> >=20
> > commit 9ac5713b2fcb5ce03693edd40636d8fce3e014d0
> > Author:     Roy Li <rongqing.li@windriver.com>
> > AuthorDate: Wed Apr 29 17:25:02 2015 +0800
> > Commit:     Martin Jansa <Martin.Jansa@gmail.com>
> > CommitDate: Mon May 11 10:27:28 2015 +0200
> >=20
> >     samba: upgrade to 3.6.25
> >=20
> > Also this patch only removes 3.6.24, but doesn't add 4.1.12.
> >=20
> > Please rebase to latest master and fix the last commit.
> >=20
>=20
> Thank you very much.
>=20
> Please cherry-pick the new one from here
> https://github.com/bendaaron/meta-oe-dev/commit/299fc6d67c6e755450c3a1e8c=
f0ba046eb7fa8b7

Thanks, it applies and builds now.

Last remaining issue is smbnetfs failing to build with samba 4:

| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -mthumb  -mthumb-interwork --s=
ysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -DHAVE_=
CONFIG_H -I. -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-li=
nux-gnueabi/smbnetfs/git-r0/git/src     -O2 -pipe -g -feliminate-unused-deb=
ug-types -Wall -W -D_REENTRANT -D_GNU_SOURCE -DFUSE_USE_VERSION=3D26 -D_FIL=
E_OFFSET_BITS=3D64 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qem=
uarm/usr/include/fuse -c -o samba.o /home/jenkins/oe/world/shr-core/tmp-gli=
bc/work/armv5te-oe-linux-gnueabi/smbnetfs/git-r0/git/src/samba.c
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/s=
mbnetfs/git-r0/git/src/smb_conn_srv.c:12:26: fatal error: libsmbclient.h: N=
o such file or directory
|  #include <libsmbclient.h>
|                           ^
| compilation terminated.
| make[2]: *** [smb_conn_srv.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/armv5te-oe-linux-gnueabi/smbnetfs/git-r0/build/src'
| make[1]: *** [all] Error 2
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/armv5te-oe-linux-gnueabi/smbnetfs/git-r0/build/src'
| make: *** [all-recursive] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/smbnetfs/git-r0/t=
emp/log.do_compile.11885)
NOTE: recipe smbnetfs-git-r0: task do_compile: Failed
ERROR: Task 13830 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-f=
ilesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb, do_compile) failed=
 with exit code '1'

Can you check it?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWC5D4ACgkQN1Ujt2V2gBwLnQCgkp6/RCEXKwFRodsa75mQ6SkG
e3IAoJg3oNCTE+x7K8I4lBFU6jhePPp/
=PDza
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--
