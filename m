Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 731DF77469
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 18:13:18 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1aZMtC-00040h-SK from Joe_MacDonald@mentor.com ;
	Fri, 26 Feb 2016 10:13:18 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 26 Feb 2016 10:13:18 -0800
Received: by burninator (Postfix, from userid 1000)	id 5E0D6581080; Fri, 26
	Feb 2016 13:13:17 -0500 (EST)
Date: Fri, 26 Feb 2016 13:13:17 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160226181315.GA6310@mentor.com>
References: <20160225171903.GC2565@jama>
MIME-Version: 1.0
In-Reply-To: <20160225171903.GC2565@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Fri, 26 Feb 2016 18:13:19 -0000
X-Groupsio-MsgNum: 60228
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline

--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Martin,

[[oe] Still many meta-networking changes waiting in patchwork/master-next] =
On 16.02.25 (Thu 18:19) Martin Jansa wrote:

> Hi Joe.
>=20
> there are still 18 meta-networking commits in master-next:

I thought I'd follow up to this and let you know I'll do something with
these before the end of the month.  Almost all of them (waf-samba aside)
obviously got missed because I'm watching patchwork based on
'meta-networking' and none of these had it in the subject line.

I think I've asked before, but are you curating all of those bundles by
hand or have you got some machinery that filters patches into bundles
based on path names in the patches?  Because that would be kind of neat
to have.

-J.

> pick 959b908 postfix: premission of /var/spool/mail seems incorrect
> pick 21ccb84 wireshark: update SRC_URI link to sources
> pick 204683a nbd: use BPN in Files
> pick ed0b197 cim-schema-exper: fix host-user-contaminated
> pick 1dd195e ctdb: add PACKAGECONFIG for libtdb
> pick 3c95127 netkit-ftp: fixed invalid symlink
> pick 56c4f31 iscsitarget: split the kernel module into separate package
> pick 38fd81c iscsitarget: skip the arch test for kernel modules
> pick 84bfeae ncftp: fix build failures with ccdv
> pick 46b1e93 postfix: fix clean broken issue
> pick ba57020 lowpan-tools: add missing flex/bison deps
> pick dd64a6b samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
> pick c3c6106 waf-samba.bbclass: add cross-answers option and files
> pick ef42784 ebtables: enable KERNEL_64_USERSPACE_32 for powerpc
> pick 87edda7 samba: update systemd service files
> pick 8b320f4 lldpd: use bash-completion.bbclass
> pick 32b5c6f ntp: remove empty libexecdir to prevent potential QA issues
> pick 93c8a3c inetutils: Fix build when static libs disabled
>=20
> Not all of them are still "open" on patchwork, maybe they are no longer v=
alid.
>=20
> + there are few meta-networking patches on patchwork which didn't make it=
 to master-next
>   here is complete list:
>   http://patchwork.openembedded.org/bundle/jama/master-next/?archive=3Dbo=
th
> 	postfix: premission of /var/spool/mail seems incorrect	2015-10-27	Zhenbo=
 Gao		New
> 	[meta-oe] lldpd: configure the systemd unit file dir	2015-10-30	rongqing=
=2Eli@windriver.com		New
> 	[meta-oe] samba: systemv-init script must be executable	2015-11-04	Jens =
Rehsack		New
> 	[meta-oe,v2,1/3] samba: fix dependencies and QA issues	2015-11-12	Jens R=
ehsack		New
> 	[2/7] nbd: use BPN in Files	2015-11-20	Robert Yang		New
> 	[4/7] cim-schema-exper: fix host-user-contaminated	2015-11-20	Robert Yan=
g		New
> 	[6/7] ctdb: add PACKAGECONFIG for libtdb	2015-11-20	Robert Yang		New
> 	[7/7] netkit-ftp: fixed invalid symlink	2015-11-20	Robert Yang		New
> 	[1/2] iscsitarget: split the kernel module into separate package	2015-11=
-25	jackie huang		New
> 	[2/2] iscsitarget: skip the arch test for kernel modules	2015-11-25	jack=
ie huang		New
> 	ncftp: fix build failures with ccdv	2015-11-30	jackie huang		New
> 	samba: Fix typo in PACKAGECONFIG for "acl" and "aio"	2015-12-22	mike.loo=
ijmans@topic.nl		New
> 	[meta-networking,0/7,v3] waf-samba: fix build failure on targets unsuppo=
rted by qemu	2016-01-06	jackie huang		New
> 	[meta-oe,7/7,v3] waf-samba.bbclass: add cross-answers option and files	2=
016-01-06	jackie huang		New
> 	ebtables: enable KERNEL_64_USERSPACE_32 for powerpc	2016-01-20	rongqing.=
li@windriver.com		New
> 	[RFC,3/4] lldpd: use bash-completion.bbclass	2016-01-14	George McCollist=
er		New
> 	[07/12] inetutils: Fix build when static libs disabled	2016-02-22	Richar=
d Purdie		New
>=20
> If they are still there next month, I'll drop them from master-next branch
> and master-next bundle on patchwork.
>=20
> Thanks
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
-Joe MacDonald.
:wq

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJW0JW2AAoJEEn8ffcsOfaWdOgIAIgedOQrgivyPhAoJcwfzow4
w/bvZoQptlIfZ262Xop4FQvJaYHGFjGAl6NnuyR8MXqjFTnRZDoqZF+JhBplAGNQ
BGjNgt67JXnP7K6WZiRf0ckMtwRkQN59XcHASKKgsO+7tQuCh8ef2//TcOeEJExt
haQrPU8eqPIspdnB0/pXlLWjXOuklF0vYsEG9hMWLbBha/+gIdRrEKsoBSLxy/Zu
Se/MO/IGf05I6dXjX7KP4YQvhpNrO7Tzxs7Bd2mh0+CBpjTKB5JTZ2bUL8317DZ6
Hpcth6ARD7JPkTg9hSJNOZpwFmDA9RpDInvwcIiidzs+jo0cf4aVUSP83XREgPo=
=Fn7Y
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
