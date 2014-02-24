Return-Path: <tobias.blom@techne-dev.se>
Received: from mail-la0-f68.google.com (mail-la0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id F36906E00C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 18:42:22 +0000 (UTC)
Received: by mail-la0-f68.google.com with SMTP id e16so2541250lan.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 10:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:message-id:mime-version
	:subject:date:references:to:in-reply-to;
	bh=Bnh+Qdn2ICbSTgh6Qsl0LcunoqDttSoPEvRKWbY4IQQ=;
	b=bSsMXoO4jsqEQfnypm76C7n05Ig9uzqPfANIn/RpGza99RZkZLcK16Ha6xnuHlX+cW
	w9+dqYA1OQtvJw7qrqrT+kkBcnaRWrVm/BcAyjxn47zlAjxG6MzFqmCuEmZ1H1WXYObC
	ulJa86dM797NSgGN8IUfaZfc/xFLMLue4jALviocC18XuJcqIHxiS33Q0s4KKG3H5ezC
	xahUrIVdONcbIozm6/TOMCxTimkZ/yLcSMBIZiJo+AqTAAFJWWj1KSRaD5AUytMttVJ/
	KuwaSzXaB+LCKBtbKVyG4v6UqjiuYrCJscjfH4dmnLPvrfiQ5sULwLhOQT4OaCtLVqgt
	jAOw==
X-Gm-Message-State: ALoCoQlmxS56yG44EaWUSDqamG3NXewIfwQFjK38XmA+Yq3p/6MKi9FtrlrTJBc4L4mVqtWOcEfj
X-Received: by 10.152.5.229 with SMTP id v5mr9363819lav.11.1393267342229;
	Mon, 24 Feb 2014 10:42:22 -0800 (PST)
Received: from [192.168.3.105] (h175n6-lk-d1.ias.bredband.telia.com.
	[213.65.152.175])
	by mx.google.com with ESMTPSA id y2sm26795160lal.10.2014.02.24.10.42.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Feb 2014 10:42:21 -0800 (PST)
From: Tobias Blom <tobias.blom@techne-dev.se>
Message-Id: <E082C697-DC2B-4F8D-BBAE-C4BA10B24176@techne-dev.se>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
Date: Mon, 24 Feb 2014 19:42:21 +0100
References: <94BAA6DD-BBE2-46CE-8248-E8432BE9F242@blom.org>
	<33174762.dysyrZqJd4@peggleto-mobl5.ger.corp.intel.com>
	<12554563.r7d5IAgdqr@leo>
	<2343897.GsqDN18PkL@peggleto-mobl5.ger.corp.intel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <2343897.GsqDN18PkL@peggleto-mobl5.ger.corp.intel.com>
X-Mailer: Apple Mail (2.1827)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Mon, 24 Feb 2014 18:42:23 -0000
X-Groupsio-MsgNum: 48317
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7D0A9803-2536-4B68-BC19-27B76A13F3FA";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_7D0A9803-2536-4B68-BC19-27B76A13F3FA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252

On 24 feb 2014, at 18:43, Paul Eggleton <paul.eggleton@linux.intel.com> =
wrote:

> On Monday 24 February 2014 09:41:45 Khem Raj wrote:
>> On Monday, February 24, 2014 12:19:07 PM Paul Eggleton wrote:
>>> On Sunday 23 February 2014 22:26:34 Khem Raj wrote:
>>>> On Feb 23, 2014, at 10:23 PM, Lukas Bulwahn
>>>> <lukas.bulwahn@oss.bmw-carit.de>> >=20
>>>> wrote:
>>>>> We provide a recipe for python-netifaces in the meta-ros layer as
>>>>> well. In
>>>>> fact, a quick search on the OpenEmbedded Layer Index [1] reveals =
that
>>>>> meta-ros and meta-openstack both provide a recipe for
>>>>> python-netifaces.
>>>>> With your use case and recipe, we would have now three recipes. =
So, I
>>>>> suggest to unify all three recipes and come up with the best
>>>>> (complete)
>>>>> recipe from these three versions and add them to the meta-oe =
layer. We
>>>>> then can remove the duplicate recipes in the application layers.
>>>>=20
>>>> If these layers have dependency on meta-oe then please add the =
recipe
>>>> there
>>>> and remove from other places.
>>>=20
>>> There has been some discussion about creating a meta-python layer =
(within
>>> the meta-openembedded repository) for these kinds of recipes. I =
think the
>>> time has come to actually do that, before we add any further python
>>> recipes to the general meta-oe layer. Could someone send a patch to
>>> create meta-python?
>>=20
>> meta-python is good. I always worry about layer being maintained, in =
fact I
>> have some python 3 extra recipes that I wanted to contribute which =
dont
>> belong to core.
>=20
> Agreed, continued maintenance is important. I would be happy to be co-
> maintainer of this if someone else will help me out...

I=92m pretty new to OE/Yocto, but if you need me, I can also help out.

Maybe it=92s appropriate for me to introduce myself. My name is Toby. I =
live in Link=F6ping, Sweden and run a company called Techne Development. =
I do both consulting and product development, and am currently working =
on a project where I use Yocto to build an embedded system for a client. =
I=92m also an iOS developer.

I have been working with Wind River Linux for a couple of years on a =
project, although the project was looking into changing to Yocto, but I =
never stayed that long in the project.

/Toby


--Apple-Mail=_7D0A9803-2536-4B68-BC19-27B76A13F3FA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQEcBAEBCgAGBQJTC5KNAAoJEBL2XAZ72QZb5uEIAJg4UL+xksNqhObyO3CXQlwt
QQYH2nbDE7rTogFAzOcJEovHlY+V8OE0ssZz8/DgBFOtq9i8nEAguROPc7fZkAck
ee5KA3X6Eu1M5xf9ahLPTvGFQ3iL7SAhab/WTdZRmZ8jwb6bBXGea+LN9hmZ9llq
2OKco0Aa6jA0KwSEUaT0DvKJE8TunkgyT6tPkYSgcZ/Bx9DK1/cbpbbIWATPsfFT
GJ5W0xdnbhd/A6BdCpX5A7srFJ30VPnbiwzdcVn++Ou81p5t72NkCtwCo1DQV3Th
xyjPRb12Rcyw+kX5LmnxhVYcd5vomOxZgZd88ijSo/o2cGIsi8OHx4i3dCMhyAI=
=ndn/
-----END PGP SIGNATURE-----

--Apple-Mail=_7D0A9803-2536-4B68-BC19-27B76A13F3FA--
