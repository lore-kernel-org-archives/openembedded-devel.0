Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id CC11C6AC23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 11:02:31 +0000 (UTC)
Received: by widdi4 with SMTP id di4so47006870wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 04:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=X2I5pT6/D85WzvNPxjGoddhfw0sz8d/vW8IdHIQiTHk=;
	b=imuM8X3NJn6DFOtroU2szjlzBFfPq+Ppz2+hPJ9tjYj4l48U2UkXbM0YfS4HhnX6AN
	iPfgVfZzVi2bqFuVKzUwyqwJfckT+m8BbQzlzRCucC2oKevktwmIdqV4AV7TXlSerCK9
	PagLV79srsD8D7Nxij6o2mnWgp6AAiee6Hx1ljhlpXeN/1hTD4MAcoZOJqSlZMp3d5KD
	RYRZ2wSsvb8rKY0wnrj2madqyCN4TVOk6Z0MN7E6gnAkRCR4aQ4E7NpG67MQlID6RfvK
	6AsWFjkwQ7GSEJdBrWVJT0+xAtSZZN09eWh9je40NkVWPqQxATOiHuJ+YELG/XEuPHdF
	JZPA==
X-Received: by 10.194.89.7 with SMTP id bk7mr26333481wjb.127.1428922952191;
	Mon, 13 Apr 2015 04:02:32 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id k2sm10988931wif.3.2015.04.13.04.02.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 04:02:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Apr 2015 13:02:35 +0200
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20150413110235.GC2330@jama>
References: <20150310133030.GA2340@jama>
MIME-Version: 1.0
In-Reply-To: <20150310133030.GA2340@jama>
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
X-List-Received-Date: Mon, 13 Apr 2015 11:02:32 -0000
X-Groupsio-MsgNum: 55061
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
Content-Disposition: inline

--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 02:30:30PM +0100, Martin Jansa wrote:
> Hi Joe,
>=20
> can you please check pending meta-networking patches?
>=20
> my master-next shows:
> pick e7be331 openl2tp: add new recipe
> pick 64461e1 ipvsadm: Add version 1.26 (initial recipe)
> pick f5ba5af netkit-telnet: add new recipe
> pick 1e6dd99 iscsi-initiator-utils: fix SELinux label for initiatorname.i=
scsi
> pick 8a09ac6 vlan: install vconfig into /sbin same as Ubuntu and Fedora.
> pick 6fdadbe stunnel: Update to version 5.10
> pick e74b325 postfix: add link file /usr/lib/sendmail
> pick 64de50c wireshark: update to 12.4
> pick 4428a44 crda: move libnl, libgcrypt to DEPENDS
> pick 5cd9417 esmtp: update sendmail link files
>=20
> and few more are in patchwork:
> http://patchwork.openembedded.org/bundle/jama/meta-networking/?archive=3D=
both

Another round pending in my master-next:

pick 6a89b66 ipvsadm: Add version 1.26 (initial recipe)
pick 5f63e35 wolfssl: change name from cyassl to wolfssl, update to version=
 3.4.0
pick 446c0cf vpnc: don't rdepend on kernel-module-tun
pick e44ecd9 vsftpd / init: add LSB init infos
pick 5033f44 postfix: add LSB init infos

I plan to create "fido" branch today, so all these will need to go
through fido maintainers if you want to merge them in fido release as
well.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUroksACgkQN1Ujt2V2gBz44QCfWHM4ORmHa1wsSDw1PLuIFMnS
LvwAni5y+aDwNdX1vvHyG9Q5LdwOP8YZ
=ZNdk
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--
