Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id EFF8B772A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 19:54:52 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id a4so900046wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 11:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=rxF6K4Z4mIo9KdG8jLrdK/CemKSGgtS8ZFNYJs31cnU=;
	b=opky8L2WXpW0NEaGhOuoW0FMvLyLg/sAzYOZ2t2geDmVwgmxMrnYT87Bg3J/5wbYkq
	pjrgWqWBS5x2BI3+HJEEUM7GA8qNX7LFhLhIKN7ytiUk36Wr2erGsihJ+ibGeTxN/IQD
	FT12ft1zlHUXTV+0Ay2g8bPUL2adCcE6P2HS/RE895aYijePbzt4HbLkVY2ZTQnms/CH
	96Qf7BPKr0TeviMkyC9i59D+o0UTA17XTlFeHNZ4cB042h/f9UInzEuWS/Wj83s640Gn
	S4eqFxgr5a5gl8tBgC9muVQ58fKxYAFkKISF5mU3Zv1yVntHkOdj7cuEI0kkbWb2YjJy
	F8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rxF6K4Z4mIo9KdG8jLrdK/CemKSGgtS8ZFNYJs31cnU=;
	b=XJxjI3tcwNQxfk7iXv6VtQMg5i4ujgm1A1XpR5cJBctEO5ULCI4ogcGL+xnPJmPtuR
	bmlseB5JpCFjEtAbQv3aIL/8mrZzJsXLQekTRfUnIIYpl8POkgF/w9fPf/4wUEQBRNwy
	rLY9OWp4h41btUl6hA4/F0s7RQfUZbLY/EQdZjHUF8uXrg1AGdHKzUSypQlA98/+9y2F
	Y3kbVST+qj2oAodVkGsW3qZJS+LgaTVT3Twp6W0tAA73GnNfmd/Xzv47n+k4Gj/7YaoP
	ozp9aY90HuX9/jh0/yQxjf5fWRmXho5lnVC7+TfSipwtulUQ5nhhfjNAUt4hXQ+RjoTK
	FVyg==
X-Gm-Message-State: AD7BkJKC+ksfkKSeLRiCvkJMOqK4CRhN8eBLduAJtMUrFfzOcSmfrWsPeHRpZIh8IeHyjA==
X-Received: by 10.28.189.67 with SMTP id n64mr5123057wmf.24.1456516492800;
	Fri, 26 Feb 2016 11:54:52 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v66sm4167660wmb.18.2016.02.26.11.54.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 11:54:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 26 Feb 2016 20:56:17 +0100
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20160226195617.GA2554@jama>
References: <20160225171903.GC2565@jama>
 <20160226181315.GA6310@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20160226181315.GA6310@mentor.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Still many meta-networking changes waiting in patchwork/master-next
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
X-List-Received-Date: Fri, 26 Feb 2016 19:54:54 -0000
X-Groupsio-MsgNum: 60230
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2016 at 01:13:17PM -0500, Joe MacDonald wrote:
> Hey Martin,
>=20
> [[oe] Still many meta-networking changes waiting in patchwork/master-next=
] On 16.02.25 (Thu 18:19) Martin Jansa wrote:
>=20
> > Hi Joe.
> >=20
> > there are still 18 meta-networking commits in master-next:
>=20
> I thought I'd follow up to this and let you know I'll do something with
> these before the end of the month.  Almost all of them (waf-samba aside)
> obviously got missed because I'm watching patchwork based on
> 'meta-networking' and none of these had it in the subject line.
>=20
> I think I've asked before, but are you curating all of those bundles by
> hand or have you got some machinery that filters patches into bundles
> based on path names in the patches?  Because that would be kind of neat
> to have.

I think I've answered before, but I'm filtering them manually based on
subject and also actual paths inside the patch. I also need to mark them
"Accepted", "Superseded", ..  manually, there is git hooks which is supposed
to mark at least accepted one, but it finds 1 from 1000 if any.

This is of course a bit error prone, especially when there are multiple
versions of the same patch already in master-next - I usually end up
marking all versions merged patch as Accepted (unless I've marked older
versions already as Superseded when filtering incoming queue).

>=20
> -J.
>=20
> > pick 959b908 postfix: premission of /var/spool/mail seems incorrect
> > pick 21ccb84 wireshark: update SRC_URI link to sources
> > pick 204683a nbd: use BPN in Files
> > pick ed0b197 cim-schema-exper: fix host-user-contaminated
> > pick 1dd195e ctdb: add PACKAGECONFIG for libtdb
> > pick 3c95127 netkit-ftp: fixed invalid symlink
> > pick 56c4f31 iscsitarget: split the kernel module into separate package
> > pick 38fd81c iscsitarget: skip the arch test for kernel modules
> > pick 84bfeae ncftp: fix build failures with ccdv
> > pick 46b1e93 postfix: fix clean broken issue
> > pick ba57020 lowpan-tools: add missing flex/bison deps
> > pick dd64a6b samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
> > pick c3c6106 waf-samba.bbclass: add cross-answers option and files
> > pick ef42784 ebtables: enable KERNEL_64_USERSPACE_32 for powerpc
> > pick 87edda7 samba: update systemd service files
> > pick 8b320f4 lldpd: use bash-completion.bbclass
> > pick 32b5c6f ntp: remove empty libexecdir to prevent potential QA issues
> > pick 93c8a3c inetutils: Fix build when static libs disabled
> >=20
> > Not all of them are still "open" on patchwork, maybe they are no longer=
 valid.
> >=20
> > + there are few meta-networking patches on patchwork which didn't make =
it to master-next
> >   here is complete list:
> >   http://patchwork.openembedded.org/bundle/jama/master-next/?archive=3D=
both
> > 	postfix: premission of /var/spool/mail seems incorrect	2015-10-27	Zhen=
bo Gao		New
> > 	[meta-oe] lldpd: configure the systemd unit file dir	2015-10-30	rongqi=
ng.li@windriver.com		New
> > 	[meta-oe] samba: systemv-init script must be executable	2015-11-04	Jen=
s Rehsack		New
> > 	[meta-oe,v2,1/3] samba: fix dependencies and QA issues	2015-11-12	Jens=
 Rehsack		New
> > 	[2/7] nbd: use BPN in Files	2015-11-20	Robert Yang		New
> > 	[4/7] cim-schema-exper: fix host-user-contaminated	2015-11-20	Robert Y=
ang		New
> > 	[6/7] ctdb: add PACKAGECONFIG for libtdb	2015-11-20	Robert Yang		New
> > 	[7/7] netkit-ftp: fixed invalid symlink	2015-11-20	Robert Yang		New
> > 	[1/2] iscsitarget: split the kernel module into separate package	2015-=
11-25	jackie huang		New
> > 	[2/2] iscsitarget: skip the arch test for kernel modules	2015-11-25	ja=
ckie huang		New
> > 	ncftp: fix build failures with ccdv	2015-11-30	jackie huang		New
> > 	samba: Fix typo in PACKAGECONFIG for "acl" and "aio"	2015-12-22	mike.l=
ooijmans@topic.nl		New
> > 	[meta-networking,0/7,v3] waf-samba: fix build failure on targets unsup=
ported by qemu	2016-01-06	jackie huang		New
> > 	[meta-oe,7/7,v3] waf-samba.bbclass: add cross-answers option and files=
	2016-01-06	jackie huang		New
> > 	ebtables: enable KERNEL_64_USERSPACE_32 for powerpc	2016-01-20	rongqin=
g.li@windriver.com		New
> > 	[RFC,3/4] lldpd: use bash-completion.bbclass	2016-01-14	George McColli=
ster		New
> > 	[07/12] inetutils: Fix build when static libs disabled	2016-02-22	Rich=
ard Purdie		New
> >=20
> > If they are still there next month, I'll drop them from master-next bra=
nch
> > and master-next bundle on patchwork.
> >=20
> > Thanks
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> -Joe MacDonald.
> :wq



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbQrd8ACgkQN1Ujt2V2gBz5MwCgmrID1/sssmwC6e4aYbQB7Czr
rWsAn3QX8UKxnhvo31v073/ZIfnElq76
=nFdE
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
