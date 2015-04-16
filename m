Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 483BC73D0B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 04:18:23 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YibFw-0006Lk-Qv from Joe_MacDonald@mentor.com ;
	Wed, 15 Apr 2015 21:18:24 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 15 Apr 2015 21:18:24 -0700
Received: by burninator (Postfix, from userid 1000)	id 6C5B7582544; Thu, 16
	Apr 2015 00:18:39 -0400 (EDT)
Date: Thu, 16 Apr 2015 00:18:39 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20150416041839.GA4366@mentor.com>
References: <20150310133030.GA2340@jama>
 <20150413110235.GC2330@jama>
MIME-Version: 1.0
In-Reply-To: <20150413110235.GC2330@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 16 Apr 2015 04:18:26 -0000
X-Groupsio-MsgNum: 55095
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin,

[Re: meta-networking pending patches] On 15.04.13 (Mon 13:02) Martin Jansa =
wrote:

> On Tue, Mar 10, 2015 at 02:30:30PM +0100, Martin Jansa wrote:
> > Hi Joe,
> >=20
> > can you please check pending meta-networking patches?
> >=20
> > my master-next shows:
> > pick e7be331 openl2tp: add new recipe
> > pick 64461e1 ipvsadm: Add version 1.26 (initial recipe)
> > pick f5ba5af netkit-telnet: add new recipe
> > pick 1e6dd99 iscsi-initiator-utils: fix SELinux label for initiatorname=
=2Eiscsi
> > pick 8a09ac6 vlan: install vconfig into /sbin same as Ubuntu and Fedora.
> > pick 6fdadbe stunnel: Update to version 5.10
> > pick e74b325 postfix: add link file /usr/lib/sendmail
> > pick 64de50c wireshark: update to 12.4
> > pick 4428a44 crda: move libnl, libgcrypt to DEPENDS
> > pick 5cd9417 esmtp: update sendmail link files
> >=20
> > and few more are in patchwork:
> > http://patchwork.openembedded.org/bundle/jama/meta-networking/?archive=
=3Dboth
>=20
> Another round pending in my master-next:
>=20
> pick 6a89b66 ipvsadm: Add version 1.26 (initial recipe)
> pick 5f63e35 wolfssl: change name from cyassl to wolfssl, update to versi=
on 3.4.0
> pick 446c0cf vpnc: don't rdepend on kernel-module-tun
> pick e44ecd9 vsftpd / init: add LSB init infos
> pick 5033f44 postfix: add LSB init infos

Merged and the patches are updated in patchworks.  Most were simple, the
ipvsadm one had been outstanding for quite a while as I'd requested
changes in it.  I merged the patch from master-next and made the
correction myself before pushing it, since I never did see a v4 and
there wasn't an obvious update in patchworks.

>=20
> I plan to create "fido" branch today, so all these will need to go
> through fido maintainers if you want to merge them in fido release as
> well.

I sent out patches tagged for-fido, since I missed the window to get
them merged prior to the branch by a few days.

-J.

>=20
> Regards,
>=20
--=20
-Joe MacDonald.
:wq

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVLzgWAAoJEEn8ffcsOfaWt5EH/RbU6R0SqAvb2/ncfeciV890
L1Wxir5REDHhMsClKcv+iEWGjUdQontmWWHwGmQ/XV051u9oAFy1WwYmnXH56cIl
vuakqbpvUu8YQLXX6kzi0dKQtQe0UDs1XyT0EDJuAZ1f3YrNbfwyWOX1tWMf2OZm
O1w41HD09HtAQFnFT36J8eSGP8lAAnAIdh2IQ34ud3yVn3a5UzvAWe9X4TAx+z18
Qydw3N2DQhtPuzysMjWgPNDynLfZQMh/BAZAUZtXqLndn9TbNRsC5W/xgha6MY7y
wUCySPDQO42SJctl682N/E7+n0Zl90abmp4vMqx6kwH/fAKqaGe/aufl3m4tQYU=
=pN1q
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
