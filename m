Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id C46EC77354
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 17:09:00 +0000 (UTC)
Received: by wmec201 with SMTP id c201so39625138wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=8l2/5oEU2DFmCXIkMj6XyBSD82JupILKgHOtoxYevYQ=;
	b=L3FXXQSffzM1f3UJVhNjBPBYqmjWUU6XobvPC8UNnagLeqd/PyXJLe6OyCL7h3XE6G
	e5rJT9JQZY+8a+HOPIetmFWAhaxU96bQwhc5akul3EPNAHqIzLs96PsiW0HGLSmX3ORi
	38z8DU9pSWY2UnYFU2ErCIqdGFkwwkVCVgBDBNqUU6YYI8Xy1uPVPJIY0cDFu7OTwsdL
	EcBZGzNTmJs/h7fRslNE08Wl3LWv1GU6J/IPJWauaNKO3ApB7eKjHWSlMB5aAWoP2qHi
	Hy+zrTGolFLVcl2wsDcPrfw1O87+7FuVAGjat4809n+jKDn8zjYWxuU2X8ytQ3b/3Vsm
	xTjQ==
X-Received: by 10.194.189.228 with SMTP id gl4mr23670108wjc.44.1447434539826; 
	Fri, 13 Nov 2015 09:08:59 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	u205sm4808069wmb.12.2015.11.13.09.08.58
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Nov 2015 09:08:59 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CABcZAN=EgNrRxnML=Jb_ipNL-yYiFfwZRQLVaoNT2qBmpHA+rQ@mail.gmail.com>
Date: Fri, 13 Nov 2015 18:08:57 +0100
Message-Id: <577B0BDF-3AAB-44E9-AA59-781219452896@gmail.com>
References: <9A2ED550-50FC-4223-B79E-5801010FEF49@gmail.com>
	<CABcZAN=+c2SkEiZtVjZ1ZGtp5dXs79xYmRh2f1P50qV0Kzd2cw@mail.gmail.com>
	<CABcZAN=EgNrRxnML=Jb_ipNL-yYiFfwZRQLVaoNT2qBmpHA+rQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 13 Nov 2015 17:09:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 13.11.2015 um 18:01 schrieb Christopher Larson <kergoth@gmail.com>:
>=20
> On Fri, Nov 13, 2015 at 9:56 AM, Christopher Larson =
<kergoth@gmail.com> wrote:
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
>=20
> I just realized this may sound critical, but that wasn't intended. The =
other changes look great, thanks for your work on making those =
dependencies optional, it's good stuff.

In that case - please take me by the hand and explain a bit more =
detailed=20

> Instead, either we could we should kill all the libtalloc bits in the =
PACKAGES var, and let the debian shlib renaming handle renaming talloc* =
to libtalloc*

since I have no clue what you try to guide me.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


