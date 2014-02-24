Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id D2FC46E754
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 06:26:39 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rp16so6086888pbb.34
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 22:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=+eAnTWYNO5YzTjS9zCOD/V85UiElElqYRK8+aEkN6Wc=;
	b=dbKEPSSBYJ+j65ZO3HfpCJcBnhC/UOA6Q4cfQOu7TbBLY6EJQxQLOxyL5G5PIBWg0n
	UaFXUZz2ZoR9H7m9HjwgTTCLAEPz1hCR8XKJFHpeSPwo7kBnXAn0M89F3DK+x3dTORLO
	N7zXnBjJOohYgLeocshX3dN+jcqkGdkC/lP+80BrW63x5tEzfb7X8e5UdkXhJ3TBFADS
	qDwYZ57t3oSkhz3c2oLJO+uGzc1OjKMMMApgzM69ZbgS6N2vt+tTMt7okuMQSyhAiM+6
	s7ypHL2RvR4nFYUQOn1GtTZI57RJpMx7Moaj69+EZVFqFsID85mgp9Nrwp3Re6JrsuPw
	VOfQ==
X-Received: by 10.68.189.5 with SMTP id ge5mr23190107pbc.42.1393223200256;
	Sun, 23 Feb 2014 22:26:40 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	qh2sm111955263pab.13.2014.02.23.22.26.38 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 23 Feb 2014 22:26:39 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <530AE55F.9090108@oss.bmw-carit.de>
Date: Sun, 23 Feb 2014 22:26:34 -0800
Message-Id: <7A897146-8E97-4991-8003-2FFA5E6E866C@gmail.com>
References: <94BAA6DD-BBE2-46CE-8248-E8432BE9F242@blom.org>
	<20140220144314.GF3854@jama> <530AE55F.9090108@oss.bmw-carit.de>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1827)
Cc: Tobias Blom <tobias@blom.org>
Subject: Re: python-netifaces in oe?
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
X-List-Received-Date: Mon, 24 Feb 2014 06:26:41 -0000
X-Groupsio-MsgNum: 48293
Content-Type: multipart/signed;
	boundary="Apple-Mail=_804A8978-B598-4685-A47D-FE0BEF4CFC53";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_804A8978-B598-4685-A47D-FE0BEF4CFC53
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Feb 23, 2014, at 10:23 PM, Lukas Bulwahn =
<lukas.bulwahn@oss.bmw-carit.de> wrote:

> Hi Tobias,
>=20
> We provide a recipe for python-netifaces in the meta-ros layer as =
well. In fact, a quick search on the OpenEmbedded Layer Index [1] =
reveals that meta-ros and meta-openstack both provide a recipe for =
python-netifaces. With your use case and recipe, we would have now three =
recipes. So, I suggest to unify all three recipes and come up with the =
best (complete) recipe from these three versions and add them to the =
meta-oe layer. We then can remove the duplicate recipes in the =
application layers.

If these layers have dependency on meta-oe then please add the recipe =
there and remove from other places.

>=20
> Lukas
>=20
> [1] =
http://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dpytho=
n-netifaces
>=20
>=20
> On 02/20/2014 03:43 PM, Martin Jansa wrote:
>> On Thu, Feb 20, 2014 at 03:35:19PM +0100, Tobias Blom wrote:
>>> Hi Martin,
>> Hi Tobias,
>>=20
>>> I'm working with a yocto-project and needed a python module =
(netifaces). I now have a recipe for this, and I just wonder if it's of =
any interest push this upstream?
>> Better to ask in openembedded-devel@lists.openembedded.org
>>=20
>> Generally good recipes are always welcome.
>>=20
>>> I'm pretty new to Yocto / OE, so I don't really know how things =
works. Saw your name in the logs, and thought I'd just send an email and =
ask...
>>>=20
>>> By the way, thanks for your work!
>> You're welcome
>>=20
>>=20
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_804A8978-B598-4685-A47D-FE0BEF4CFC53
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMK5hoACgkQuwUzVZGdMxSnFwCfeTW2hv/g+UrwfqzFy1zJdntG
Wj4An0WnxL2h+n0ll18WcnQySia+5Igc
=LHJc
-----END PGP SIGNATURE-----

--Apple-Mail=_804A8978-B598-4685-A47D-FE0BEF4CFC53--
