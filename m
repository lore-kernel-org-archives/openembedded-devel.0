Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id A08C26028A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Jan 2014 13:28:47 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so7468101ead.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Jan 2014 05:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Yr1C3CJb71i9yGZlQCLuq3cggS+dRpTGX+rSyq8vsjU=;
	b=AAoXxRN221GZk8WoG3QRdeh8QJzwGOxZFHfRPduRlFG0q2nxBxjCUqtB3+2nFMmC9H
	u8fmhiOPTma08/QRPDDo+L5QikNUfMfp2K+nhQgOo5qEDPaMGn2E1tjG+JlyjnPNPRFJ
	nLxh3lRCNAywFJTb1exJKJMtgx0nufZH+ajmiTu4E2uVG8v7PmS8pDf0pzYgdxtWfQ+e
	rWtoFJ2K0LTbnTCVMmK8Cp6WkiYMOM9GsyfF/JBOC/lHTdlsEFYox82wNSMg3tD7Y3hl
	uxMDhIVII5yGP+GeVLi7DH5X7WSiMMwIDlXLPgU3k0yzJO9LerbI330AMFu3x6vFHcu9
	mhYw==
X-Received: by 10.15.111.201 with SMTP id cj49mr30200647eeb.56.1388928527852; 
	Sun, 05 Jan 2014 05:28:47 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 44sm162137858eek.5.2014.01.05.05.28.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Jan 2014 05:28:46 -0800 (PST)
Date: Sun, 5 Jan 2014 14:28:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20140105132853.GB3709@jama>
References: <1387240261-7045-1-git-send-email-otavio@ossystems.com.br>
	<1387240261-7045-4-git-send-email-otavio@ossystems.com.br>
	<20140101123625.GC11840@jama>
	<CAP9ODKoxN6pb3JvjzY7x8NPmDj2U0jVtsUgYxrgdx7ney5J2cw@mail.gmail.com>
	<20140103215930.GI3707@jama>
MIME-Version: 1.0
In-Reply-To: <20140103215930.GI3707@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH v2 4/6] gdal: Add recipe for 1.10.1 version
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
X-List-Received-Date: Sun, 05 Jan 2014 13:28:49 -0000
X-Groupsio-MsgNum: 47599
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline

--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 03, 2014 at 10:59:30PM +0100, Martin Jansa wrote:
> On Fri, Jan 03, 2014 at 04:01:36PM -0200, Otavio Salvador wrote:
> > Hello Martin,
> >=20
> > On Wed, Jan 1, 2014 at 10:36 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> > > On Mon, Dec 16, 2013 at 10:30:59PM -0200, Otavio Salvador wrote:
> > >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > >> ---
> > >> Changes in v2: None
> > >
> > > Please fix following error detected in:
> > > http://jenkins.nas-admin.org/job/oe_shr-image-all_tmpfs_qemuarm/173/c=
onsoleFull
> > >
> > > ERROR: This autoconf log indicates errors, it looked at host include
> > > and/or library paths while determining system capabilities.
> > > Rerun configure task after fixing this. The path was
> > > '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-=
oe-linux-gnueabi/gdal/1.10.1-r0/gdal-1.10.1'
> > > ERROR: Function failed: do_qa_configure
> > > ERROR: Logfile of failure stored in:
> > > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-o=
e-linux-gnueabi/gdal/1.10.1-r0/temp/log.do_configure.883
> > > NOTE: recipe gdal-1.10.1-r0: task do_configure: Failed
> > > ERROR: Task 14201
> > > (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-o=
e/recipes-navigation/gdal/gdal_1.10.1.bb,
> > > do_configure) failed with exit code '1'
> >=20
> > Can you send me the full log? I failed to identify  what causes it.
>=20
> It's already gone running another build but next time I see it I'll try
> to keep the log.

configure:25255: $? =3D 0
configure:25264: result: yes
configure:25338: checking for SQLite3 library >=3D 3.0.0
configure:25374: i586-oe-linux-g++  -m32 -march=3Di586 --sysroot=3D/home/je=
nkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemux86 -c  -O2 -pi=
pe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidd=
en -msse -DHAVE_SSE_AT_COMPILE_TIME  -I/usr/include conftest.cpp >&5
cc1plus: warning: include location "/usr/include" is unsafe for cross-compi=
lation [-Wpoison-system-directories]
In file included from /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglib=
c/sysroots/qemux86/usr/include/stdc-predef.h:30:0,
                 from <command-line>:0:
/usr/include/bits/predefs.h:20:3: error: #error "Never use <bits/predefs.h>=
 directly; include <features.h> instead."
 # error "Never use <bits/predefs.h> directly; include <features.h> instead=
=2E"
   ^
configure:25374: $? =3D 1

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLJXhUACgkQN1Ujt2V2gBwvYQCgtTSorpJoPSt2TWR9Xp/4nSHE
0uwAn2rQL2IhOYKkeY4Y6a4U8HNiLt5O
=yLD+
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
