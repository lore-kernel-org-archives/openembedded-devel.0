Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id AE56070807
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 14:13:46 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so2784645wgh.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=RQIMUqe+tMbgW/Sft2g2oD1jiiSo3ZHCwMso09ncRgY=;
	b=pc6ZxS2qex48oyqCDNZdJJ9KguwvOt5dghMgfly+fRgnNTbRqQ4gg963dDy4/lgjr9
	TzpZQCp44D6dmrkHL7Y0afM8GRkxbXQiivSA/uUuna6Cd3C26qiPkXjgsVhbGxTyoN4X
	RJhvRJc5pyvv+jtYVhlTklWa7C1W3jpE071u+hOAes+Aqd6bgW4P4MTi1Vh6zDeyagL9
	VYvWNddPOSWLugK3/JlrPe8HYe0HBGTQWccmgPPreiPnVbVvoJMJg/abrdouBfH95mXW
	6QnJAWUAzBN2RReUz84BniLiQMVuknd/PV80x7di7B7yZYOfoXj5rYePbE5msfo/wtbz
	CLXw==
X-Received: by 10.194.92.115 with SMTP id cl19mr12701551wjb.29.1406211227414; 
	Thu, 24 Jul 2014 07:13:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	nc19sm23264185wic.4.2014.07.24.07.13.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 07:13:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Jul 2014 16:14:03 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140724141403.GL2492@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Patchwork almost clean
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
X-List-Received-Date: Thu, 24 Jul 2014 14:13:52 -0000
X-Groupsio-MsgNum: 51235
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0kRkyLZR5zsR9u2P"
Content-Disposition: inline

--0kRkyLZR5zsR9u2P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There are still 30 changes in master-next bundle:
http://patchwork.openembedded.org/bundle/jama/master-next/?archive=3Dboth

Some are new, some are old WIPs I haven't finished, some are still also
in master-next branch on way to master (after review comments are
addressed)

63b95b7 ipsec-tools: several fixes
efba173 snort: do not hardcode the libdir
135879a openvpn: not use the hardcoded libdir
2c137e4 syslog-ng: Improved initscript VERBOSE handling.
caa7815 xterm: disable-rpath-hack to avoid QA issue
e8203c9 meta-python: rename recipes-python to recipes-devtools
d5ee15e wireshark: Add missing pkgconfig dependency
f444b38 libxml-filter-buffertext-perl: add recipe
17da3f6 libxml-sax-writer-perl: add recipe
d9c9bd1 wireshark: fix build for arm
67c9ab3 wireshark: Add recipe 1.12.0-rc2
1b0361a packagegroups: Remove deprecated "task" backward compatibility
36e9829 monkey: new v1.5.1 release.
dc95fd1 usb-modeswitch: Upgrade to latest version
dd6e944 tcpslice: add recipe under tcpdump
ee0b865 opencv: Bump SRCREV to 2.4.9 release tag, PV is now 2.4.9+git.
8e8a40f opencv: Disable 'gtk' backend if X11 is not available
19f1992 php 5.4.14: use pkg-config for libxml2 detection
ddddaa7 mplayer2: Inherit python3native

Please check if you've submitted one of these commits and please update its=
 state.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0kRkyLZR5zsR9u2P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPRFKsACgkQN1Ujt2V2gBxmogCgrGyr49QI1JEb6Q62jbyaOfiP
2t4AoK4NvoULddohvtj2bfP7bmw6x4Qh
=84QF
-----END PGP SIGNATURE-----

--0kRkyLZR5zsR9u2P--
