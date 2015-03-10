Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8C72673A39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 22:27:10 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1YVScK-00014E-2F from Joe_MacDonald@mentor.com ;
	Tue, 10 Mar 2015 15:27:12 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Mar 2015 15:27:11 -0700
Received: by burninator (Postfix, from userid 1000)	id 70E53581EE8; Tue, 10
	Mar 2015 18:27:18 -0400 (EDT)
Date: Tue, 10 Mar 2015 18:27:18 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20150310222718.GB4083@mentor.com>
References: <EC21369A6993DD47985E1CBF1038266E263DC619@NA-MBX-04.mgc.mentorg.com>
MIME-Version: 1.0
In-Reply-To: <EC21369A6993DD47985E1CBF1038266E263DC619@NA-MBX-04.mgc.mentorg.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-networking pending patches
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
X-List-Received-Date: Tue, 10 Mar 2015 22:27:12 -0000
X-Groupsio-MsgNum: 54729
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline

--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] meta-networking pending patches] On 15.03.10 (Tue 13:44) MacDonal=
d, Joe wrote:

> Sure thing. I'll have a look today and update the status appropriately.
>=20
> -J.
>=20
> On 10 Mar 2015 06:30, Martin Jansa <martin.jansa@gmail.com> wrote:
> Hi Joe,
>=20
> can you please check pending meta-networking patches?
>=20
> my master-next shows:
> pick e7be331 openl2tp: add new recipe

This has already been merged (ab75a8c8d0a57411af1452f9f8f41ccf29bb0cc7)
and I don't see it in my patchworks list now.  The filter I'm using is
this:

http://patchwork.openembedded.org/project/oe/list/?state=3D1&q=3Dmeta-netwo=
rking&archive=3Dboth

> pick 64461e1 ipvsadm: Add version 1.26 (initial recipe)

I placed this one in 'rework' state on January 26th after requesting a
clarification on the bash requirement and suggesting at least one of the
patches be tweaked.

http://article.gmane.org/gmane.comp.handhelds.openembedded/67476

I haven't seen a follow-up on it, but it looks like master-next has the
v3 that I commented on.

> pick f5ba5af netkit-telnet: add new recipe

It looks like this was merged (56e58865851a3160c49d9929011a0eccc9b0c8e2)
and I'm not seeing it in my filter.

> pick 1e6dd99 iscsi-initiator-utils: fix SELinux label for initiatorname.i=
scsi

This was dropped in favour of the version going to meta-selinux.  I
updated patchworks to indicate it was being reworked a while back.

> pick 8a09ac6 vlan: install vconfig into /sbin same as Ubuntu and Fedora.

I've merged this today.

> pick 6fdadbe stunnel: Update to version 5.10

This got missed in my regular filter for obvious reasons.  I've merged
it as well.

> pick e74b325 postfix: add link file /usr/lib/sendmail
> pick 64de50c wireshark: update to 12.4
> pick 4428a44 crda: move libnl, libgcrypt to DEPENDS
> pick 5cd9417 esmtp: update sendmail link files

These were already in my queue but I've dumped them in favour of the
cherry-picks.

> and few more are in patchwork:
> http://patchwork.openembedded.org/bundle/jama/meta-networking/?archive=3D=
both

The others in this list also look like they were missed because they
didn't contain the meta-networking tag in the subject line.  Are you
manually creating that bundle or do you just have better filtering
technology than I do for catching these oddball ones?

--=20
-Joe MacDonald.
:wq

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU/2/GAAoJEEn8ffcsOfaW6+AIAKr3pWmUnXnu9DQiZNXepEGT
ZMHxhcdrnYXG4JsQmsTKPxUrJfXzYc7+Um/EXLdnNf02Y/CLCF+unfN0zTzmaBXi
+dlU8KwyPmFNFwf2WZFfIPZr0564arH75/BkO734B6ezUPKUTT3DWgRqt3eqoDwE
tXpA85/sfDPGnPDqGQgqICW3pQHUK4G6I430uSTuONxCDHpy/7s7HDglu0O7X1UK
+W+DtseVY7M82SV5WPkWQvJVbTwRTQC2l/k3nW2GjVtkCIyEJhpBgRk4UPyD3ga1
RyU2MoH7Damui0yyfCE72GSc9fjo13AkSWl2mu2pKYqRWnU7ILYzd2+lAWQOjhI=
=Dsrw
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--
