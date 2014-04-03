Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id A6B386F622
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Apr 2014 12:43:43 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hm4so807880wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Apr 2014 05:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=zB0WORaZLYr47ObQ/Kp2R3otuB8oXJP4vibAm5RdsfU=;
	b=sbGEgtWb2IRviY6LB204xyszTntv3dy9aFZMgFwo22DTAcC6CYEDAntsIeY5QaliVJ
	xnmxa7Cb1EgBb2TNffn++4PSjyGpOZnRN7HmSeLDECy865DztQiagpQi6BiOp4O7kDTp
	XiVLGTm8Zvn6ia8PMghEMjU2AEsmKewT/fKCMdvDtMA46gZm27bjZFmHQ0bBphdirdlk
	F80a1fDuUNbeWpsAaVI81moz1Aw8Q8oa7qiwNblEQWvtF83V9j08udnpsc4qhXU47AXk
	jvLbCPwj0oy4oQLwwr/omlWIkN0meggI3kZAvG22Esd25Pf/5sKYUorHqQIwhO+iVYto
	tgJg==
X-Received: by 10.194.205.35 with SMTP id ld3mr10050254wjc.82.1396529024649;
	Thu, 03 Apr 2014 05:43:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y7sm11836092eev.5.2014.04.03.05.43.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Apr 2014 05:43:43 -0700 (PDT)
Date: Thu, 3 Apr 2014 14:43:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140403124344.GE2132@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: qtbase.inc: add -no-xkbcommon
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
X-List-Received-Date: Thu, 03 Apr 2014 12:43:45 -0000
X-Groupsio-MsgNum: 49043
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xA/XKXTdy9G3iaIz"
Content-Disposition: inline

--xA/XKXTdy9G3iaIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

How was this patch tested, here it fails with:

| Error: -no-xkbcommon is not supported on XCB platform plugin.

maybe it needs to be exclusive with xcb PACKAGECONFIG, please test and
document it in qtbase.inc

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xA/XKXTdy9G3iaIz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEUEARECAAYFAlM9V4AACgkQN1Ujt2V2gBwRJgCY62KGJVYlwS3bIKCmou4aYBl0
igCgtNL/cZm+iBZR7Zsx3wHfFN9hGgs=
=w9en
-----END PGP SIGNATURE-----

--xA/XKXTdy9G3iaIz--
