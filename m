Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9160A76806
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 08:56:46 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so1670401wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 01:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mdLydS7/+1dvaKp5iiPZ+eZKl5GFXJTSYPtQnmE7Qk0=;
	b=WfsbqtTS7ieyhOdsLSP05qP0HKyzZrvzrIyFd91kN2qR++j9Tv2e5+Gd0Yf4wLiVw7
	CAyw4CL535hRx+BCEH1gIzl4JfYWpxK/mmhHJHfgLctGA3jlwdXw45Zj/8PuLD/awaaW
	L1cr3h4BcgB3SMQwhN3h0xMIb871Hl0rHfkgetvqRYZtcTMT/NnVo8oBYgrYaoKM0W1E
	GTFsB0XRdRvvYWBoDGYkwdJscvDo1ahuQhmVU4L2PXFkFexigsmwXL2ZxJyzPkQ9Ni3Y
	SKnUOTPBnZPvRchhluauGZISn6ONcE6tZutfWUdl+f71MYJEadoq+OA+pHQrIhciw/dz
	jehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mdLydS7/+1dvaKp5iiPZ+eZKl5GFXJTSYPtQnmE7Qk0=;
	b=UfTayrWt4GJSqS6B1FL8AYVzESUOQys6B5JDYQTCyJC160XV6uOgF4lKVz1oEsAV3S
	2dhSSfo/wsu+MJLl4cFQcz/G+aBEdysAaHfHq4fma8BygY/0BGxUAggB1s4HJ6VN+2Tf
	ti8U6OY085ajSBEXW36sW29O+EoRhBsm7jBjblZ2Yqv37t9tB/K8/TwW9vUdnkkvR69o
	gwWjVeMBS9Md02F1OkWTxcY/8Qpk4P0P8tyypCx/Z4xWS6c9zcMML/0k1CWwhZ8tSIZq
	dwGqjfETSjjyEtCMl9KIlRDX3ez17ayeABwqaRTPPaBhdU6scmd04CuEp2n0eo0OHP7i
	JTnA==
X-Gm-Message-State: AEkoouvgzU9OE8LXny//mfbedHdsl01Z9AFjCSaDZG+g6BLhxMvQFCYT6/ju6iSm90ui2Q==
X-Received: by 10.194.114.135 with SMTP id jg7mr14097488wjb.166.1470992206356; 
	Fri, 12 Aug 2016 01:56:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	jq5sm6525534wjc.20.2016.08.12.01.56.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Aug 2016 01:56:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 12 Aug 2016 10:56:47 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160812085647.mlrnbt7deezzgucm@jama>
References: <1470920876-22501-1-git-send-email-ricardo.ribalda@gmail.com>
	<D01FFBA5-7B48-4F0F-B1E0-3D96FE48044F@gmail.com>
	<CAPybu_35+Ug0CpasvpVg=WfC2N3F_6hmcSbN7CJ7tquhGr7C8A@mail.gmail.com>
	<CAMKF1sqhKAKN8EJVHTm50F6N0Ons3hqJrkc3ERujrwj90m94JA@mail.gmail.com>
	<CAPybu_2dSbwx3FbGzf9OuWyz9p6xDr6rAfiSnB+t1oNu2ZvrMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPybu_2dSbwx3FbGzf9OuWyz9p6xDr6rAfiSnB+t1oNu2ZvrMg@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH v3 1/2] gflags: New recipe
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
X-List-Received-Date: Fri, 12 Aug 2016 08:56:46 -0000
X-Groupsio-MsgNum: 62577
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tsdygvrluckyn435"
Content-Disposition: inline

--tsdygvrluckyn435
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2016 at 10:06:44AM +0200, Ricardo Ribalda Delgado wrote:
> Hi Kehm
>=20
> On Fri, Aug 12, 2016 at 9:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> > So it seems its BSD-3-Clause
> >
>=20
> Shall I produce a patch for glog and gflags?

I'll update it in master-next, you don't need to resend.

> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tsdygvrluckyn435
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAletj04ACgkQN1Ujt2V2gByxdQCgl1oBGxRnyAQwFN2s8ueUkZy4
R/cAn1N15EDdj9QWFXlLZeH82VSeuXN7
=YYS4
-----END PGP SIGNATURE-----

--tsdygvrluckyn435--
