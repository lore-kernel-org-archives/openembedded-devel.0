Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 029686B8D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 06:18:46 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id jt11so9301833pbb.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 23:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:message-id:mime-version:subject:date:references
	:to:in-reply-to;
	bh=bTqbld/TxPzD1T+yIyqEwYu9suJC8vZIuMGHS6f5SUw=;
	b=UhaGrrfnLy6AJ4kfx7g2NcD0GKp/NFI15Y4aIcMwl8BhssRulIZKqrbJYX5cd7HDdE
	vYmqeQDz8HSbZdeHMSxhaoE/2PCiT2uWn3xhlNIpFfFHtxDYDffF8WQb+qIr4cuucHOq
	pZn+JbMgCV+N4kV8S14D3V4t8BX3Z+lFz9/Vx55pDNs2aGpRfzUsJMBAZCtDi5rLXvBt
	Nm3IvoPA+c2ym8ikFlod2Rr7xvGE8B+DMKvFAvhJ5iMU2431StzflToQbPq7m+71ewSz
	pM2lFMQSue3m4S59i2e2gftn5aG5xUyVhT/f0kPp07R6lA9As93DIGPItowFl/q7V6Xu
	vs5Q==
X-Received: by 10.66.249.233 with SMTP id yx9mr29313986pac.3.1396333127360;
	Mon, 31 Mar 2014 23:18:47 -0700 (PDT)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	vd8sm51024615pac.12.2014.03.31.23.18.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 31 Mar 2014 23:18:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <3F0D5A70-AC82-4FBA-A613-48DBB4DC3227@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Date: Mon, 31 Mar 2014 23:18:45 -0700
References: <CALYKT1hK8DF=kt9k_0bMjn4_nZGTMb=hakdTpUVObgdBJ1NhWQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CALYKT1hK8DF=kt9k_0bMjn4_nZGTMb=hakdTpUVObgdBJ1NhWQ@mail.gmail.com>
X-Mailer: Apple Mail (2.1874)
Subject: Re: How can I make my own program start up when my system boots up?
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
X-List-Received-Date: Tue, 01 Apr 2014 06:18:49 -0000
X-Groupsio-MsgNum: 48941
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C583D784-A992-4793-9441-CE7E5D49CE44";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C583D784-A992-4793-9441-CE7E5D49CE44
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Mar 31, 2014, at 11:07 PM, Journeyer J. Joh =
<oosaprogrammer@gmail.com> wrote:

> I tried to add the execution command in /etc/init.d/data-init - at the =
very
> bottom. And it worked!
>=20
> But I am not sure if this method is correct or not.

I think you are using standard sysvinit here so as long as you define an =
init script
for your binary and enable it in rc scripts you should be ok.

--Apple-Mail=_C583D784-A992-4793-9441-CE7E5D49CE44
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlM6WkUACgkQuwUzVZGdMxQZ0QCfSxbJoPsHZ+xcp8DMn7ghWrTq
zh0AnAyyZUFb6pX4T4IRte7vfBMI0pkt
=Y94I
-----END PGP SIGNATURE-----

--Apple-Mail=_C583D784-A992-4793-9441-CE7E5D49CE44--
