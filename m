Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id CE5B073198
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:15:20 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l126so61695675wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 04:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=UgCmXpNSsYjCULwLYqT8ZunFbTCPAfDXpkGBK5lVa0U=;
	b=MOA/xF521qQUNeHaPx7uJB8HIW9+QRBPaQn1pF2IRaw9j23rqKL/g9qdIaKRdd1ieG
	NooPqdj+Qn7KeCTBeUbgSxF8GcHZOmTMHoNa/9vJ16GGBc6BXbFzbmE8VXlKzGGzpgPA
	K86AWX189arvVvssxkAAx8Imcj0q3ELcge4/8VlcRx7ioZ0JxgPAz81XBCKHk3vv1/8L
	QaomnmrqCqbGJZ1e7Tzp6JkpHWFiU63XHxrz+YM+kiUz7EKEpjci56JL1Ea1XdP40Gj9
	i+a0uLU/STYEEYp3mYXvXLAO9B3OBSi7w/CETOSOgVoDOzeY1rmJUGpGhq8vu6PTj90k
	bsYA==
X-Received: by 10.28.125.201 with SMTP id y192mr2900023wmc.23.1450440920867;
	Fri, 18 Dec 2015 04:15:20 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	un6sm14567495wjc.34.2015.12.18.04.15.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 04:15:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Dec 2015 13:17:52 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20151218121752.GG2563@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: meta-oe, meta-qt5 patchwork queue
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
X-List-Received-Date: Fri, 18 Dec 2015 12:15:21 -0000
X-Groupsio-MsgNum: 59098
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L1c6L/cjZjI9d0Eq"
Content-Disposition: inline

--L1c6L/cjZjI9d0Eq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm sorry for huge delay caused by test-dependencies jenkins job taking
25 days to finish..

I've merged most meta-oe/meta-qt5 changes (except meta-networking).

Only exception are waf changes and nodejs upgrade which fails for
qemuarm.

Here is list of pending meta-networking changes waiting for Joe
+ waf-samba which is in meta-oe, but used only in meta-networking
so I'll leave that to Joe as well (feel free to even move it to
meta-networking).

pick d1d7bae tcpdump: add PACKAGECONFIG for libcap-ng
pick 1acd017 postfix: premission of /var/spool/mail seems incorrect
pick 5226454 talloc: rename to libtalloc and cleanup dependency mess
pick 743a7c4 libldb: allow chosing ldap dependency instead of hard requirin=
g it
pick c338951 libtevent: rework dependencies for deterministic build
pick 64f3415 samba: make cyrus-sasl optional
pick b1a57da libtevent: upgrade to 0.9.25
pick 32330ff talloc: upgrade to 2.1.3
pick 38b85a0 libldb: upgrade to 1.1.21
pick d078d09 libtdb: upgrade to 1.3.7
pick 0dd2b7d wireshark: update SRC_URI link to sources
pick f716b5b nbd: use BPN in Files
pick 9732a92 cim-schema-exper: fix host-user-contaminated
pick 73f3379 ctdb: add PACKAGECONFIG for libtdb
pick f7c04bb ctdb: add dependency on libldb
pick a97e0e0 netkit-ftp: fixed invalid symlink
pick 033720e quagga: fix segment fault when stopping ospf6d
pick eaaf285 iscsitarget: split the kernel module into separate package
pick 7a33f29 iscsitarget: skip the arch test for kernel modules
pick 35a6732 ncftp: fix build failures with ccdv
pick 067d96d net-snmp: apply patch for cross-compilation
pick 9ec115e postfix.inc: fix start postfix failed while hostname is numeric
pick 542484f postfix: fix clean broken issue
pick 80beb95 xl2tpd: fix warnings with gcc 5
pick 5aaf51d mime-construct: update runtime dependencies
pick 90e845c meta-networking: depends on layer meta-perl
pick fcff178 lowpan-tools: add missing flex/bison deps
pick de9a497 samba: fix typo distinguishing between plain sysv init and lsb=
 init
pick b3370e5 samba: add PACKAGECONFIG for valgrind
pick 04e1487 waf-samba: enable parallel builds
pick cf5bbc0 waf-samba.bbclass: add cross-answers option and files

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L1c6L/cjZjI9d0Eq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZz+W8ACgkQN1Ujt2V2gBwczACcC7s5i/5gAlxTIbN7Q9acsKFM
g9cAoICYDjhaInqQEkbZ3QIlkLQo06Nt
=vI0V
-----END PGP SIGNATURE-----

--L1c6L/cjZjI9d0Eq--
