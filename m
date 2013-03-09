Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UEQAH-0004Gv-Gc
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Mar 2013 21:14:45 +0100
Received: by mail-pb0-f45.google.com with SMTP id ro8so2387243pbb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Mar 2013 11:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=4vt6bG3EkvA+tfjQpSDuGZsbMniJa1axRzU3z6fxE8U=;
	b=ezwxkyfnumlx/TqtCg0tZjqVHqai4HD8Z7qpSc8Z2RTLjnxlJ4zWCteJxkk4Yr652D
	USI51Bw+tSvJWOTaEz25afK4aeqffQUVHKaatdH6cpqVwBCdvN6fP+uBa38/4Z7BTnh2
	huttiO91pH95n0ysF/dwwAIHqs6Ji/VdDXhjbcpPTeTgxgNZN3/avmLQ2snurakeiXG5
	YT+5Y90VEZ7Wuebl0gtmiR/WjvdQyKQbDPGKTqHtnGH0nCwOh8BVgCs2GMpE2h/Q5hpY
	xHH7ZYc5DCENSj2HgGu7EBOrZUn6bWUFFsjQBp3LduGxLshmjd8OMO9pQN6sV5z8UY9s
	WqSA==
X-Received: by 10.68.44.2 with SMTP id a2mr7100354pbm.78.1362859089299;
	Sat, 09 Mar 2013 11:58:09 -0800 (PST)
Received: from sa-nc-apg-191.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPS id
	td10sm11666770pbb.25.2013.03.09.11.58.07
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Mar 2013 11:58:08 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130309195424.GA6272@hermes>
Date: Sat, 9 Mar 2013 11:58:06 -0800
Message-Id: <B07109A7-1245-46FD-A060-01AC1731337F@gmail.com>
References: <cover.1362831936.git.apelete@seketeli.net>
	<73f5d1d2501d60fb20e3290d758e35aaf6b91e4c.1362831936.git.apelete@seketeli.net>
	<3C660C3C-34A4-4805-B6C0-E49AC8EEED55@gmail.com>
	<20130309195424.GA6272@hermes>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1499)
Subject: Re: [2011.03-maintenance][PATCH v2 1/2] gnutls: update SRC_URI
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
X-List-Received-Date: Sat, 09 Mar 2013 20:14:46 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Mar 9, 2013, at 11:54 AM, Apelete Seketeli <apelete@seketeli.net> =
wrote:

> Le 09-Mar-13, Khem Raj a =E9crit:
>>=20
>> On Mar 9, 2013, at 4:38 AM, Apelete Seketeli <apelete@seketeli.net> =
wrote:
>>=20
>>> -SRC_URI =3D =
"ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2;name=3Dgnutls"
>>> +SRC_URI =3D =
"ftp://ftp.gnutls.org/gcrypt/gnutls/v2.10/gnutls-${PV}.tar.bz2;name=3Dgnut=
ls"
>>=20
>> can we use PV instead of 2.10 ? if not then move SRC_URI out of .inc =
into .bb
>=20
> PV is actually 2.10.4 here, it can't be used instead of 2.10 it seems.
> I'll move SRC_URI into .bb then.

now that I looked into oe.classic tree there is only 1 recipe for gnutls
so its ok to have it in .inc=20

>=20
> --=20
>        Apelete
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



