Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UK0Vs-0008Dh-Iz
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Mar 2013 07:04:11 +0100
Received: by mail-pa0-f43.google.com with SMTP id rl6so846150pac.30
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Mar 2013 22:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=63iwPVxYaZqMvqDJKBRiLdYa1vmCUFZ2tvJag3lEU4E=;
	b=Fgby1X2UBIubzERWI3pUovbr1ozxR+Ubmobc/p929z+5wq5sJf1hXYw7oLKZQ2/ySq
	6hE9IA7duyS+b1T0+OfVDyseYDpT8ek08A1MVBAbJsILG8xq8S/nyOA2q+iVej1rh1DC
	chCf3WAlM5YUuSiF6JefSKv5TZ2b1Jdx3dnQQiFwkBpJokOj6EiN3mx/8uKo2UkfJmGT
	hp4uHWfbsqdKlaktweMrB475URe+fs/46KVBltoZ9KQPZr9Wsb1Y8SOn6bAy+i9cWhn1
	UOKkQYkSy5Sa7SaupwkxuYTCCicAl/uF31043iUNqmgNv7NzBCJdEHf2/hnp+0HVpPm7
	x2Yw==
X-Received: by 10.66.175.73 with SMTP id by9mr15976484pac.191.1364190430018;
	Sun, 24 Mar 2013 22:47:10 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id zm1sm12085329pbc.26.2013.03.24.22.47.08
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 24 Mar 2013 22:47:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1364150558.389@bughunter.ca>
Date: Sun, 24 Mar 2013 22:47:11 -0700
Message-Id: <BA0ECF04-A8DA-41AE-904C-8D04EE418DC3@gmail.com>
References: <1364150558.389@bughunter.ca>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: ATNGW100
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
X-List-Received-Date: Mon, 25 Mar 2013 06:04:13 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Mar 24, 2013, at 11:42 AM, Justin Seitz <jms@bughunter.ca> wrote:

> Hey all,
>=20
> I am pretty new to OE, and having followed some scattered instructions =
on building the ATNGW100 I have been unsuccessful with the new OE core. =
My local.conf includes the directives:
>=20
> TARGET_OS =3D =93linux-uclibc=94
> MACHINE =3D =93atngw100&#8243;
> DISTRO =3D =93angstrom-2008.1&#8243;
> ANGSTROMLIBC =3D =93uclibc=94
>=20
> Which it complains that angstrom-2008.1 cannot be found as a distro. =
Is this a case that I can just pull the configs from the OE-classic repo =
over or is there a guide somewhere that I can't find in YOCTO that =
describes how I can move the ATNGW100 build over to the new OE-core?

this question belongs to angstrom distro ml. I will answer is here =
however. You should be able to checkout
2011.03 maintenance branch of oe.classic and use that one for the above =
machine and distro policies. No
one has yet forward ported the avr32 support into latest angstrom.

>=20
> Thanks in advance,
>=20
> JMS
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



