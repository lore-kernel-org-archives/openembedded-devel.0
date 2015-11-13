Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5BF77359
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 17:03:23 +0000 (UTC)
Received: by wmww144 with SMTP id w144so36972471wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=OnLdIh1IltTDbrptoWcn1Jw90/QBZdsAEUoO5tAUc2g=;
	b=NJgMlbZRKVusdHCjHonQ8IhwOUmWFAHRVUMqqJK7ZUexHv2GX4rRQnVo1jHq+DS7oj
	hhmuFqbCU7aTeYVxDazNEEIy859iVUwHg/w8mihDwwzvZdXY7+Y3F57bzRUl14kJWIkw
	svkSEnFTvR7iX4QVNWyZPD0n/ssCVIhOROQ637j47NGFxfYo+ge674/YrWELIJsw12MF
	w1L+RfYNKUMV8VxnUar6kpQAHAfJYYpa37J5Ug5XlTFTAmJ1HP2yij0B54MfzCUZLKYq
	ngaUkqlk4+BVS/ZBh1E2WOK5EeypNvAOSqVZmn6l/EIfqkzCGHh2JjMENK9e/b/b16Qa
	QT5g==
X-Received: by 10.28.55.209 with SMTP id e200mr4663538wma.79.1447434203203;
	Fri, 13 Nov 2015 09:03:23 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id u4sm14353755wjz.4.2015.11.13.09.03.22
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Nov 2015 09:03:22 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CABcZAN=+c2SkEiZtVjZ1ZGtp5dXs79xYmRh2f1P50qV0Kzd2cw@mail.gmail.com>
Date: Fri, 13 Nov 2015 18:03:20 +0100
Message-Id: <3A90D2C4-0CA5-4CF0-B0CE-5B438629F8FD@gmail.com>
References: <9A2ED550-50FC-4223-B79E-5801010FEF49@gmail.com>
	<CABcZAN=+c2SkEiZtVjZ1ZGtp5dXs79xYmRh2f1P50qV0Kzd2cw@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] talloc: rename to libtalloc and cleanup dependency mess
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
X-List-Received-Date: Fri, 13 Nov 2015 17:03:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 13.11.2015 um 17:56 schrieb Christopher Larson <kergoth@gmail.com>:
>=20
> On Fri, Nov 13, 2015 at 8:53 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
> To avoid errors when building dev-images (talloc-dev is missing), and =
to avoid
> insane empty packages for that, rename talloc -> libtalloc as =
libtevent shows.
>=20
> With that, remove dependencies to attr/xattr and libbsd - unless =
explicitely
> enabled via PACKAGECONFIG.
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>=20
> Our recipe names should be named based on the upstream project name, =
not the library they happen to ship.
>=20
> Instead, either we could we should kill all the libtalloc bits in the =
PACKAGES var, and let the debian shlib renaming handle renaming talloc* =
to libtalloc*, or add a talloc-dev that pulls in libtalloc-dev & =
pytalloc-dev.

libtevent does it the same way - neither is ideal, but the original =
behaviour results in unbuildable -dev images with talloc (samba) in it.

Beside of the rename, what's with the rest?

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


