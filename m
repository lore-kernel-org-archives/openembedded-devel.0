Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T9xlL-0005QS-UA
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 14:34:20 +0200
Received: by pbcwy7 with SMTP id wy7so4299923pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2012 05:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=cvjOoNih4iprUm23AC2fFyOvz5ssSFGVtMfyWBwagMo=;
	b=SLatHdAg5nij4CBDbPohR4leNTdRMPue6RQVW+rmqDhJGrnKLq/aikX77gxPHWvc9a
	JmhcqnxTGGMVd1otjyBZamwRyiFlv8Zs0qtM91QvwG4Yb2c/KgIFNEXpIusTTYNDrcmn
	0uTTPAorTScNW4B4lqx2ciAkhj68MELZ1Z1SCAA2UFHTQxnls2yQ+VHCz4tvj1MkSw6d
	9ZCifYgrbpHsURYxa/c6JBN61FjjF6uEW/PJy+2m1ZXaUx5zaD02vUZbsYRxAleWjUin
	tD1bb/JceAZQ5WqiMp00Utj5Z1QqwFt54rMBSE0zMwOcfcLaiK3ylO4uICIJ810BJHgo
	Yeiw==
Received: by 10.68.229.6 with SMTP id sm6mr9635650pbc.120.1347020513631;
	Fri, 07 Sep 2012 05:21:53 -0700 (PDT)
Received: from [192.168.1.66] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id it6sm3050223pbc.14.2012.09.07.05.21.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Sep 2012 05:21:52 -0700 (PDT)
References: <CACW_hTYFeqSYx5R9rgf9vV0GG-iTcnjKx+czrVXX=rUTx2z_xw@mail.gmail.com>
In-Reply-To: <CACW_hTYFeqSYx5R9rgf9vV0GG-iTcnjKx+czrVXX=rUTx2z_xw@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <96FA1660-A208-41E4-806A-B0C80C9D1D11@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: iPad Mail (9B206)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Sep 2012 05:21:51 -0700
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: oe classic: eglibc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Sep 2012 12:34:20 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



-Khem

On Sep 7, 2012, at 4:27 AM, Frans Meulenbroeks <fransmeulenbroeks@gmail.com>=
 wrote:

> Not sure if anyone is still interested in oe classic, but while rebuilding=

> some sw using oe classic I noticed the eglibc recipes did not build any
> more as upstream changed things in the repo.

Probably your IT blocked Svn


> I've locally fixed this by changing SRC_URI from
> SRC_URI =3D "svn://svn.eglibc.org/branches;module=3D${EGLIBC_BRANCH};proto=
=3Dsvn \
> into
> SRC_URI =3D "svn://
> www.eglibc.org/svn/branches;module=3D${EGLIBC_BRANCH};proto=3Dhttp \
>=20
> builds and tests fine. If anyone is tempted, feel free to author a patch.
>=20
> Frans
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://l.org/cgi-bin/mailman/listinfo/openembedded-devel


