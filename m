Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id BB9186009A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:14:53 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so176764eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=resent-from:resent-date:resent-message-id:resent-to:date:from:to
	:subject:message-id:mime-version:content-type:content-disposition
	:user-agent; bh=7Cpwoya8ajgKSyh1HHm6Ch1YhTIaSDwsnahYQSPsZC8=;
	b=U0mbgHw/5+wLNFHkbpIsCcvu5V9I51JBKlmwnGMhLguvckWRchSaNe51PYioIaTnvb
	jeMIfrUsR2ZKOtGSIDec1piWOW2NMSYGtQjy1CVC1KsGg4VipCtQmv0W8qm7iO7OE7WS
	tkSDkHJ1oGi2V6xoZBytheB/fU3+GEUB7HVFI7Hz8DrXtEUHjoZZeRBa0XPGOOd+wzSV
	Y4Gqdy6R91qviu8/ptMbFNcRS/nhEouK/gyjP5N2lXTrioKD/Y2ZEOupOHnNBBRNvmnd
	azezo5VRno9WaPM7mceCJJzCu8MCpUd4U0G6t+V1LVa0K0Q75I6Ur7pE09hBYoxeKfos
	omKg==
X-Received: by 10.15.111.136 with SMTP id cj8mr87947eeb.91.1376550893862;
	Thu, 15 Aug 2013 00:14:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bp43sm81894446eeb.4.2013.08.15.00.14.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:14:53 -0700 (PDT)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Thu, 15 Aug 2013 09:15:45 +0200
Resent-Message-ID: <20130815071545.GZ17945@jama>
Resent-To: openembedded-devel@lists.openembedded.org
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	dj7sm23038957wib.6.2013.05.28.02.43.37 for <eric@eukrea.com>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 28 May 2013 02:43:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20130528094347.GG3192@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-efl][dylan][PATCH] 2 backports
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
Date: Thu, 15 Aug 2013 07:14:54 -0000
X-Original-Date: Tue, 28 May 2013 11:43:47 +0200
X-List-Received-Date: Thu, 15 Aug 2013 07:14:54 -0000
X-Groupsio-MsgNum: 45689
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WkfBGePaEyrk4zXB"
Content-Disposition: inline

--WkfBGePaEyrk4zXB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

please backport 2 commits from meta-efl

It's minor upgrade (I know we shouldn't backport upgrades, but this=20
is from stable bugfix-only branch) and together with following patch
fixes evas segfaults).

commit 8b94591a585e4fb261599a9796f4199d650e24a5
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Wed May 22 13:54:06 2013 +0200

    evas: Add patch to fix segfaults
   =20
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

commit 4514f8ca26dac646e7e26fc1585e70304d9ef8ae
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Tue May 14 22:20:31 2013 +0200

    meta-efl: upgrade efl to 1.7.7, e-wm to 0.17.3
   =20
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WkfBGePaEyrk4zXB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGkfFMACgkQN1Ujt2V2gBzqCgCgmwmjTCq7Da9F73Wzs0Raq55l
gy4An2TN+PqgkZcL7FhYZnwN7BnJxrS1
=S9MS
-----END PGP SIGNATURE-----

--WkfBGePaEyrk4zXB--
