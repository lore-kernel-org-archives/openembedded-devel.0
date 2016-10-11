Return-Path: <martin.jansa@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id D9B5460616
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 17:48:08 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id q7so1570466qtq.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 10:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=T0wQ71VBsI6su/HIXYOpK4YvZ+Q2vjYybLT340EMHew=;
	b=wFgtO8ZXBGayAzCSzBbc9gjTFx6xjHsxG+/4LdtD832cEx5zkRJ7YSU+6SGs06p4T9
	aWF+82+rjMAMq7gK0mt6YT9u2Fs+x17hwpZvsbnc6U2yUXbQkrS7zbaUeBTkj8RxINcy
	l06qFIJ4DAtxDjyrJww+DzcuD4948oPZe/PsWA7oha5oitNJJxtJ3yArWTR7OC58syS7
	bbgd8353iA4GMt5lAPJcv7zM7/BWjUtehMMszRLMBD0Yz2Hir9SHP90DbiQ7PDDObCLv
	mkzn4Tw1v+PckAg0ukM2EEk2jeXQHdOMEJxkWa8VQNM4BMjAlkdFAjd+14O+7CDzLheF
	tBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=T0wQ71VBsI6su/HIXYOpK4YvZ+Q2vjYybLT340EMHew=;
	b=EJ6O0be5XBD+p6bJoe0KKE/2sf0tD3I1dNddUyJ33Nm+bTBUq1F4okdoodQEpsOmqH
	8vlaia7EPydyQ2nFhxtgoJcwPcgCyg1uG8YVQe3QVBClpRtQkuqx7v3nOFkggvcqyPqC
	LBMwAF0y2Ygwd5I3PaUXK0J8EipuxxHrbO6J3jR6oWWO1e7g8rGnL1whOa/janeJIvGE
	L/VpCxqXspZk2jtUDgUkj+SR9wIt13a28fg59aLB37VpqmIj5L2ZiwsyJum9cELxnvlB
	MYhbalds2VYMBCvk7UxwJugYy38h8VkYPuokwofO2RgcPPTnBEfKZ+lbGe1PdOs7J6NS
	qoNg==
X-Gm-Message-State: AA6/9RkkpurJwXZ0/5t4NIxlMGBB6mDkNtKSXGeT/cEpKZtuIglklAzMJMHDEoEUSFO10A==
X-Received: by 10.194.104.232 with SMTP id gh8mr6383252wjb.49.1476208089187;
	Tue, 11 Oct 2016 10:48:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	kg7sm8143420wjb.34.2016.10.11.10.48.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Oct 2016 10:48:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 11 Oct 2016 19:48:09 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161011174809.GA2917@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: morty branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Tue, 11 Oct 2016 17:48:09 -0000
X-Groupsio-MsgNum: 63443
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

as every 6 months I'm looking for some volunteer(s) to step-up and
maintain "morthy" release branch.

You can sign-up by replying to this thread and then one of you need to
send README update like this:
https://github.com/openembedded/meta-openembedded/commit/3082e30da58df07111=
82cf114c71a8c6a093aeae

More details in thread searching for daisy maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2014-April/09560=
1.html
http://lists.openembedded.org/pipermail/openembedded-devel/2014-May/095694.=
html
or dizzy maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098=
441.html
or fido maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-March/10090=
1.html
or jethro maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-October/103=
810.html
or krogoth maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-April/10695=
2.html

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlf9JdcACgkQN1Ujt2V2gBwViQCeI8A6K6s8Tjmhh/m6sXYjqv9k
5bMAnighFpji3bLVL76ZqEgL/tbwHFEl
=LIyy
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
