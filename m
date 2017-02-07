Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6E01371AD4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 10:25:18 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id le4so4550274wjb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 02:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=AGfu6RP9WFQYXPi650QIL6ss/i7584uahDmhVqQ6360=;
	b=IWqqZIfF0z+A9ipQ9RzeEF+VLqlFFCVfysqPIVEcO8KuRAmtta53ORkpuoNnG9fba9
	HXxtyIXjh53A/6Qp3S5e1ua7PcNSPcx4i68vH39ElPoGdPC1Jezr9thPGGw1oWy50rHA
	KQ+qeaVg0P06UjhDxZhGLfHXZ8JbuWmXngo+vAYhb7hE53JIlvsuojkBwuH8naUxZ2U6
	UFa80RnxlH4tFtFvLnIt/RyX+i/Rs2CaCxS+qrdV57jWTeUgsStrCrTRe3RLuhpY0Qb5
	UyEmo6LJju9Cs9ik1uyBGJjjDKhYlNHkj0qpTdvfRZ3Xrrq99N3libtOvqlJTwXyuJLB
	Isag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=AGfu6RP9WFQYXPi650QIL6ss/i7584uahDmhVqQ6360=;
	b=ISb8xYC5gbRt7hs2jz73l5XFYP+b2FfGz7c8Mr6km0RJ/0aL4uFLAT9p7811HRKCM/
	SR+j2ifO21Du8ry0NrHCS13eHz5rrSBHjoHN1ausgN8V6wxXZme4bhEl4J6Wla86Ngnd
	h3JQjA7AAKTe7bqCobbwSe2kF8OTxVE94VJZOfdF8eFEffikpoV8CsNILcSGZvr6O4Y3
	F30XAhAeiIOokO6KS0VTHKvd0rqIQSUy3OF2Y+6L7geBR/XS3XgEC2LMeaNfaPLBhEb+
	+FC9XHLDvz8vwIwU3kgLuriwyjmMt/bLS7mRGiLBwdcYoFK3DJG49c2YCTneL5EG9AGx
	6DHw==
X-Gm-Message-State: AIkVDXLRHnJ5qmkeFWyn012j42OlxvckDs9i2FCVEuacoNlW3B3EAtWKum5L0/L55Kksag==
X-Received: by 10.223.151.99 with SMTP id r90mr12755474wrb.183.1486463118698; 
	Tue, 07 Feb 2017 02:25:18 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u198sm17972325wmf.9.2017.02.07.02.25.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Feb 2017 02:25:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 7 Feb 2017 11:25:18 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170207102518.GA3276@jama>
References: <1486399174-28949-1-git-send-email-akuster808@gmail.com>
	<caa1a269-b4e4-9909-967f-c637146fc4ba@gmail.com>
	<1486453274.14889.135.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1486453274.14889.135.camel@intel.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-networking][PATCH] crda: fix build issue do to missing python module
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
X-List-Received-Date: Tue, 07 Feb 2017 10:25:20 -0000
X-Groupsio-MsgNum: 65016
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2017 at 08:41:14AM +0100, Patrick Ohly wrote:
> On Mon, 2017-02-06 at 09:10 -0800, akuster808 wrote:
> > please drop. this is fixed via a change in master-next.
> >=20
> > http://cgit.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&=
id=3D2e83e33c592543045a7761907d8cd62937e1e60d
>=20
> Let's see whether the magic keyword works :-)
>=20
> [Patchwork-Status: Superseded]
>=20
> https://patchwork.openembedded.org/patch/136794/
>=20
> --=20
> Best Regards, Patrick Ohly
>=20
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.

If it was supposed to update status on Patchwork, then it didn't work
it's still in "New" state.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWJmgjQAKCRA3VSO3ZXaA
HP5GAJsGZCV9gW2OnvXAql06Xs4IL9mBdgCfXxmUIJSTiv2FCamc9i1csiihGyY=
=kuOH
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
