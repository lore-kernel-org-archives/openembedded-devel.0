Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id A7DE16FFEA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 17:17:49 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id c200so38776847wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 09:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=BXmRK4gvmFeX/ANSXqIzoesonlkZMP7sxtpiXiZhlUg=;
	b=b3TiMqBrnXIbSvxFVmvm8D0teygsEpXHeEAYOq2fMDXrZhxzAMbP3JUW6zJZ+gt6eV
	SVYqUml3CnTiqhXRHLIRf2x0/QIw9uk7SXdkg9jYytAG+JXrKH2cbXQbWPgwO88n8YWm
	iSSgSBLCyYwJnhD2HJBRBICmVhTrBGBVm96WLvidm77Ckoxi9gIyE37YYaU99JDolUs/
	OcI+Qh87uwTUDYJEkeRdEfC4Q7nVlvC+89D9hRkkfmDXeYKJZPODc8Dru3OlATgspiSd
	6M0m9PqyU5/FvMfDJcuLBGjwTXRLQciPrRdQ2kC1eTwoOXwObFtDg3n2IDQWgqY1yAZO
	Wr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=BXmRK4gvmFeX/ANSXqIzoesonlkZMP7sxtpiXiZhlUg=;
	b=lrORMCctbJ01oIT4Uekp9RoKqNg0l5IId/EQrKs6tw5SjYBZ+MfS8u0v04xngJqkhn
	STY/1vP61y/0K/YB5+AyXi9O7MRfUJ6i76IuTxAjcJ+bQEHLl1K9RJ94LhyjSpAnSJcq
	Q8mIMfiyJ3h6DJQncyPEaX3SIyiEFxqnwLCmkFdOSUKkB9/4eqknBS/YsqXHgl9snr+I
	hEjD69X9G9Ymj+qaGf4+x+zIXMcJ97iURTzzB3ouJiiihbH+U9dqNuErL6GIKSg7pUaM
	6R2o2pOOsqu5OG+r7qocpfQ6o0OMvLzAJXE/FmZma+MhuFaQaO2pQLzy5XK4WGF1Ffpt
	iN2Q==
X-Gm-Message-State: AG10YOTp4qSXNWe88vJdy/WCwIrgNwI/CK82lf8+cy3FoyvUCPgxa9fNI6Ay7rKRpdCkLg==
X-Received: by 10.28.98.138 with SMTP id w132mr4463391wmb.45.1456420670300;
	Thu, 25 Feb 2016 09:17:50 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r10sm8796496wjz.24.2016.02.25.09.17.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 09:17:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 25 Feb 2016 18:19:03 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160225171903.GC2565@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Still many meta-networking changes waiting in patchwork/master-next
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Feb 2016 17:17:53 -0000
X-Groupsio-MsgNum: 60207
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n2Pv11Ogg/Ox8ay5"
Content-Disposition: inline

--n2Pv11Ogg/Ox8ay5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Joe.

there are still 18 meta-networking commits in master-next:
pick 959b908 postfix: premission of /var/spool/mail seems incorrect
pick 21ccb84 wireshark: update SRC_URI link to sources
pick 204683a nbd: use BPN in Files
pick ed0b197 cim-schema-exper: fix host-user-contaminated
pick 1dd195e ctdb: add PACKAGECONFIG for libtdb
pick 3c95127 netkit-ftp: fixed invalid symlink
pick 56c4f31 iscsitarget: split the kernel module into separate package
pick 38fd81c iscsitarget: skip the arch test for kernel modules
pick 84bfeae ncftp: fix build failures with ccdv
pick 46b1e93 postfix: fix clean broken issue
pick ba57020 lowpan-tools: add missing flex/bison deps
pick dd64a6b samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
pick c3c6106 waf-samba.bbclass: add cross-answers option and files
pick ef42784 ebtables: enable KERNEL_64_USERSPACE_32 for powerpc
pick 87edda7 samba: update systemd service files
pick 8b320f4 lldpd: use bash-completion.bbclass
pick 32b5c6f ntp: remove empty libexecdir to prevent potential QA issues
pick 93c8a3c inetutils: Fix build when static libs disabled

Not all of them are still "open" on patchwork, maybe they are no longer val=
id.

+ there are few meta-networking patches on patchwork which didn't make it t=
o master-next
  here is complete list:
  http://patchwork.openembedded.org/bundle/jama/master-next/?archive=3Dboth
	postfix: premission of /var/spool/mail seems incorrect	2015-10-27	Zhenbo G=
ao		New
	[meta-oe] lldpd: configure the systemd unit file dir	2015-10-30	rongqing.l=
i@windriver.com		New
	[meta-oe] samba: systemv-init script must be executable	2015-11-04	Jens Re=
hsack		New
	[meta-oe,v2,1/3] samba: fix dependencies and QA issues	2015-11-12	Jens Reh=
sack		New
	[2/7] nbd: use BPN in Files	2015-11-20	Robert Yang		New
	[4/7] cim-schema-exper: fix host-user-contaminated	2015-11-20	Robert Yang	=
	New
	[6/7] ctdb: add PACKAGECONFIG for libtdb	2015-11-20	Robert Yang		New
	[7/7] netkit-ftp: fixed invalid symlink	2015-11-20	Robert Yang		New
	[1/2] iscsitarget: split the kernel module into separate package	2015-11-2=
5	jackie huang		New
	[2/2] iscsitarget: skip the arch test for kernel modules	2015-11-25	jackie=
 huang		New
	ncftp: fix build failures with ccdv	2015-11-30	jackie huang		New
	samba: Fix typo in PACKAGECONFIG for "acl" and "aio"	2015-12-22	mike.looij=
mans@topic.nl		New
	[meta-networking,0/7,v3] waf-samba: fix build failure on targets unsupport=
ed by qemu	2016-01-06	jackie huang		New
	[meta-oe,7/7,v3] waf-samba.bbclass: add cross-answers option and files	201=
6-01-06	jackie huang		New
	ebtables: enable KERNEL_64_USERSPACE_32 for powerpc	2016-01-20	rongqing.li=
@windriver.com		New
	[RFC,3/4] lldpd: use bash-completion.bbclass	2016-01-14	George McCollister=
		New
	[07/12] inetutils: Fix build when static libs disabled	2016-02-22	Richard =
Purdie		New

If they are still there next month, I'll drop them from master-next branch
and master-next bundle on patchwork.

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--n2Pv11Ogg/Ox8ay5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbPN4YACgkQN1Ujt2V2gBzsJwCbBjmxO3/oe2aKffZAMJOfKJ9k
3xEAnRJRPvW8Y5dyDiXuBM23aNFBZQVy
=RZiw
-----END PGP SIGNATURE-----

--n2Pv11Ogg/Ox8ay5--
