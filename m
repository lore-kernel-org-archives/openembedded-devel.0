Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id A5C847057F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 13:13:32 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so3337166wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 06:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ohh1Jq99/aPllYCoY00fbeTa8a7a4qIS/pm8OxhquEI=;
	b=LJ4yZyIfOJ0VkyGJmsbSqKR5fj+aofOCkRFnE8E6LqaWYzGY8aLWIPudnGpzvAC3zj
	oWuQvaGPPBMJ7N9iAzMtKu7LJ906CHHLBB6Sc7OZLIHihR3LrBMvmxOJ7tVXyJT0FPbF
	FOt/6e5TVoHNpK3RW7szMFIMBcBquZuikxpLe/CaG3QinDelK5jDXyi8HPP3HDKaE1Rs
	qzrVZTmu+1QqjoXvq7ShYzax4Zd+STTy9ujw0mWbqI1w+HYHTzaOROvoZrW5LRU6xIzv
	rVNnhTEQ5YBfcg6dV2aosLmrixj0XAQ6v8PKWoutoTYCriow1Qf8fJ/gM/OJdjIeMdr3
	SyIQ==
X-Received: by 10.180.86.7 with SMTP id l7mr5421836wiz.55.1405430013778;
	Tue, 15 Jul 2014 06:13:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ut2sm25203134wjc.49.2014.07.15.06.13.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 06:13:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Jul 2014 15:13:42 +0200
To: jackie.huang@windriver.com
Message-ID: <20140715131342.GL2433@jama>
References: <1405072509-8901-1-git-send-email-jackie.huang@windriver.com>
	<1405072509-8901-2-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1405072509-8901-2-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2 v2] syslog-ng: uprev to 3.5.4.1
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
X-List-Received-Date: Tue, 15 Jul 2014 13:13:39 -0000
X-Groupsio-MsgNum: 50953
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/jvaajy/zP2g41+Q"
Content-Disposition: inline

--/jvaajy/zP2g41+Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2014 at 05:55:09AM -0400, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> - initscript: add status, PIDFILE and xconsole
> - syslog-ng.conf: dump the version
> - Fix some memory leak problems we found
> - Some backport patches
> - scl: fix wrong ownership issue
> - libnet: add libnet enable option and add it in PACKAGECONFIG
> - add HOMEPAGE
> - remove INC_PR
> - change some config into PACKAGECONFIG
> - add PACKAGE syslog-ng-tools
> - use volatiles
> - inherit update-rc.d and update-alternative

syslog-ng.inc changes don't apply in current master, maybe it got broken
by patchwork, can you rebase and push it to some repo?

--/jvaajy/zP2g41+Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPFKQYACgkQN1Ujt2V2gBzDbQCfQv0CKyg1i/AmzOa857X4LhEV
xDcAn24jR6EPLNng7ODZw5UHeb7AOUzB
=Vv+l
-----END PGP SIGNATURE-----

--/jvaajy/zP2g41+Q--
