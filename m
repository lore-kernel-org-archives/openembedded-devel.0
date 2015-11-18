Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 33F7D60043
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 17:48:24 +0000 (UTC)
Received: by wmww144 with SMTP id w144so207643610wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 09:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=hO0c+7/Kh4euI4DScV91PWkfwjBJiXyaTLXQuNE8V7Q=;
	b=CnYkf/xM72yo8el2i2z15mvqyhhBFY2F5h1KaPAFNGVffBg9r7WHDWvGnpxcW63Au5
	6HGTC/oVVOAaDMEVudppN09fubkhdlA5lwgwdigPeJz6meYzMWYuUeGeZNvrpXobJNHO
	dA3JEQuS9Zr2WFL6kGyfF45PkOFW/VD31n14vAgLu13xEZ/iXsMHWFIGvVT6oNqK2fWm
	n4Ft7FXFWHHA6ggCvRO9TkFZ6TPXyTzE2fP/Ju38v68eDhvACDGjYEirfBm9pybU1JK+
	qjeqTxQCR/ZpxhLvogeh7MbGUwllWIOeyRfj5TkvfJWoAVVljtZXDqw23XsRE1LUksmi
	c1Iw==
X-Received: by 10.194.232.230 with SMTP id tr6mr3877856wjc.21.1447868904923;
	Wed, 18 Nov 2015 09:48:24 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	b84sm4353230wmh.15.2015.11.18.09.48.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Nov 2015 09:48:24 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA010C724338@ALA-MBA.corp.ad.wrs.com>
Date: Wed, 18 Nov 2015 18:48:21 +0100
Message-Id: <1822562F-CFC0-4213-A960-B1FA75D8BF33@gmail.com>
References: <1447359445-27258-1-git-send-email-kergoth@gmail.com>
	<1447359445-27258-2-git-send-email-kergoth@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C724338@ALA-MBA.corp.ad.wrs.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Cc: Volker Moesker <volker.moesker@rademacher.de>,
	Tobias Theophile <Tobias.Theophile@rademacher.de>,
	Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-oe][PATCH 2/5] talloc, libtevent, libtdb: depend on attr
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
X-List-Received-Date: Wed, 18 Nov 2015 17:48:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 13.11.2015 um 03:48 schrieb Huang, Jie (Jackie) =
<Jackie.Huang@windriver.com>:
>=20
>=20
>=20
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-
>> bounces@lists.openembedded.org] On Behalf Of Christopher Larson
>> Sent: Friday, November 13, 2015 4:17 AM
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Christopher Larson
>> Subject: [oe] [meta-oe][PATCH 2/5] talloc,libtevent,libtdb: depend on =
attr
>>=20
>> From: Christopher Larson <chris_larson@mentor.com>
>>=20
>> These will depend on libattr if it's available, and we need =
deterministic
>> builds. This fixes a build-deps failure which occurs when attr is =
built before
>> them. There's currently no configuration option to explicitly control =
this
>> dependency, and I don't know enough about waf to add such an option, =
so
>> unconditionally dep on it for now.
>=20
> I added depends on libcap  for libtevent for the same reason days ago, =
but it really concern
> me now, the 'libreplace' in these waf based packages check many =
packages(I see
> libbsd, libcap, libacl for now) existence then build with them if =
found, and there
> is no configure option to disable them, does anyone has a better idea =
how to
> make waf build in deterministic way? Maybe we should disable the =
built-in
> libraries 'libreplace' or add a PACKAGECONFIG for it?

I dug for it (libcap) since I couldn't find any reference in wscript & =
co and finally a=20
$ for l in tmp/sysroots/curie/usr/lib/lib*.so; do =
tmp/sysroots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-=
linux-gnueabi/4.9.3/arm-poky-linux-gnueabi-objdump -x $l; done | less
pointed the origins:

* libldap_r.so
* libsmbconf.so

Think it shouldn't be a dependency in tevent, but in openldap ...

I add it to my patch series - just wanted to let you know.

Wrt. libbsd - if libbsd is found, stdlcat etc. is used from there, =
otherwise own implementation via lib/replace is provided, similar for =
some attr calls - but they aren't used in tevent/talloc ...
Looks as if lib/replace is a poor maintained libnbcompat alike :)

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


