Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1759575E80
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 15:34:51 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so80291475wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 08:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RZpcA4n1U82VIETro/eytLAtuTP2MJ4nXo2NONwDbOU=;
	b=SE3t2wV7VJ56JjZOEa8RganYgnAUdC37wlPvL7m6244vdXdRBawYSKZSAxhatIhayG
	f7snrYYugZ0NasAW9XCzC5eWxaMQZpwH/SqLfD8CSn8b+qIHqsM/qVFt+dnjgG0iFbKv
	aH55cNcsaTY3binJxfLO7RpoS0OPC36GMyLIDlzZC2JsIm5q2/sZCWjivZ8QVJ0SDngH
	75nFgzAT/Q8ksmKvkLFRrwi820zdRcxYsmh/N88q3VCk5N3cVLZx+VfpF9ta+kybtCsy
	WuS/xWHlKKBRZbMO4sNHZ6olAoKEm2tsoPhQNlwAcxqjoY6qk3ToNVo7SSUbVeGUAUnf
	XR+A==
X-Received: by 10.194.175.232 with SMTP id cd8mr12587192wjc.45.1445441691141; 
	Wed, 21 Oct 2015 08:34:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bv2sm11100750wjc.11.2015.10.21.08.34.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 08:34:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 Oct 2015 17:35:08 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20151021153508.GF2556@jama>
References: <5625864A.4000007@gmail.com>
 <20151020154109.GA2557@jama>
MIME-Version: 1.0
In-Reply-To: <20151020154109.GA2557@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: dizzy-next sync to dizzy
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
X-List-Received-Date: Wed, 21 Oct 2015 15:34:52 -0000
X-Groupsio-MsgNum: 57952
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HCdXmnRlPgeNBad2"
Content-Disposition: inline

--HCdXmnRlPgeNBad2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2015 at 05:41:09PM +0200, Martin Jansa wrote:
> On Mon, Oct 19, 2015 at 05:09:46PM -0700, akuster808 wrote:
> > Hello Martin,
> >=20
> > Are there issues with the changes in dizzy-next? need Otavio to signoff?
>=20
> No issues, I was just waiting for one of you to request the merge.
>=20
> Pushed now and new pull request pushed to dizzy-next.

Hmm there seems to be an issue after all.

At least
7f1df52 fuse: fix for CVE-2015-3202 Privilege Escalation
is missing in fido branch, both are using 2.9.3 version which is
affected.

I haven't tested other patches (except testing that they don't apply
cleanly to fido as they are) and haven't checked if we need them in
master/jethro branch.

But older releases shouldn't get fixes which are missing in newer
releases, otherwise people upgrading from dizzy to fido will get
suddenly vulnerable to this fuse issue probably without noticing.

Regards,

> > Dizzy behind by:
> >=20
> > e3dbf78 ipsec-tools: Security Advisory - CVE-2015-4047
> > 0fb90be mariadb: Security Advisory -CVE-2015-2305
> > c580b62 libssh2: fix CVE-2015-1782
> > e00844e ptpd: disable libpcap detection via pcap-config
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HCdXmnRlPgeNBad2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYnsKsACgkQN1Ujt2V2gByz/wCgr5NvDzhXdgLUDarvaiEK+sf2
T1gAoLb1t58ltUt/yVCQNFOX3Y/tSegS
=+Xk6
-----END PGP SIGNATURE-----

--HCdXmnRlPgeNBad2--
