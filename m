Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2B06873A22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 13:30:00 +0000 (UTC)
Received: by wibbs8 with SMTP id bs8so30211647wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 06:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=Shci06xStZVEXTZ/joElv+VexZ5OyTnplE6RJYFqsc4=;
	b=b3E/EMjTZWw5PQBwTOk9t2yxI0arRWVLBYN5xPcobSRrJApUvJFacPmQYrUe0gop/z
	ufjTpitd0WQd20fiNmOGdva5zyCPNHcFv5OynPLjHesJomD3emEmd2YCMEpSoB7LFaPo
	pHBlBP94N/SOkNAOZuYdfCue339KL0cIbkck42QMDTcUAFsvZk3iLczTxab4xBymzLX7
	da5mZoy6whkYrk6a7O4C7nBHlWTv13PGD7YqaZnnxJG9elYJIDiRvBxv89YEWYVYAxU5
	fWcWg0Mh5xYm5onr13e6iY0DeDekSrLwsZP2a6hyHjaeDb81QkA4RO9Hp8bV7aFB7cmq
	uS1Q==
X-Received: by 10.194.177.132 with SMTP id cq4mr65524272wjc.99.1425994201496; 
	Tue, 10 Mar 2015 06:30:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fo9sm20286841wib.16.2015.03.10.06.29.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 06:29:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Mar 2015 14:30:30 +0100
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20150310133030.GA2340@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: meta-networking pending patches
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
X-List-Received-Date: Tue, 10 Mar 2015 13:30:01 -0000
X-Groupsio-MsgNum: 54706
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline

--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Joe,

can you please check pending meta-networking patches?

my master-next shows:
pick e7be331 openl2tp: add new recipe
pick 64461e1 ipvsadm: Add version 1.26 (initial recipe)
pick f5ba5af netkit-telnet: add new recipe
pick 1e6dd99 iscsi-initiator-utils: fix SELinux label for initiatorname.isc=
si
pick 8a09ac6 vlan: install vconfig into /sbin same as Ubuntu and Fedora.
pick 6fdadbe stunnel: Update to version 5.10
pick e74b325 postfix: add link file /usr/lib/sendmail
pick 64de50c wireshark: update to 12.4
pick 4428a44 crda: move libnl, libgcrypt to DEPENDS
pick 5cd9417 esmtp: update sendmail link files

and few more are in patchwork:
http://patchwork.openembedded.org/bundle/jama/meta-networking/?archive=3Dbo=
th

Thanks
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT+8fYACgkQN1Ujt2V2gBzpUQCfSal0C16LzTvnQXlrquuBflNb
RVkAoIafGDmbQE20aW+rzSuwo1uWJWbB
=Dmpd
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
