Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 38E2A75E2D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:32:21 +0000 (UTC)
Received: by iodd200 with SMTP id d200so71906904iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=QjxbY3Sja8Oif/GEj/AF1hDFm3OLoFN32W+lUzx8HwI=;
	b=q0C+Vh6Nx5URE0zO+VyRI0JteW2N7OWuQqGnNSkXGEYWpHiIwuVXfAuWqqv2Zdru94
	pJEPFLo2/D+Rj7Emrqd7UYEMqNguYKTk6WjSJUYpNobaVzH9pDkcP4ZapRQz8S0MHs+P
	1C6VYfAhQbsF1erC4GsKPp8b2aCM0Dv8zj8LUWroNbb2R8SLeFew+RZALzwpckbASJ+d
	L3nVnGzfYiMQGGSKC3zOrdFtC5pVpHcMTcxsT5kVqSpL0CAe5zVCFoI57tDd4M4ofk+e
	SvTjJelKmNyyivUjdJNrfk2W64vRnFpwRyu7xGnFTUxusMDzWDpWapZN2KJmXyI+a4aG
	q2mg==
MIME-Version: 1.0
X-Received: by 10.107.135.95 with SMTP id j92mr5856021iod.148.1446679941545;
	Wed, 04 Nov 2015 15:32:21 -0800 (PST)
Received: by 10.36.31.131 with HTTP; Wed, 4 Nov 2015 15:32:21 -0800 (PST)
In-Reply-To: <20151104225422.GB2556@jama>
References: <1446658209-27822-1-git-send-email-schnitzeltony@googlemail.com>
	<1446658209-27822-2-git-send-email-schnitzeltony@googlemail.com>
	<20151104225422.GB2556@jama>
Date: Thu, 5 Nov 2015 00:32:21 +0100
Message-ID: <CALbNGRTYEUrOur2hWhUa+WQApav7gagoA0S=Cd+e76Yk_RZA4w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] qtbase: align target qmake paths
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
X-List-Received-Date: Wed, 04 Nov 2015 23:32:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2015 at 11:54 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, Nov 04, 2015 at 06:30:09PM +0100, Andreas M=C3=BCller wrote:
>> With this we can setup qt-creator to build/debug on target again.
>
> Can we apply this change to qtbase-native and nativesdk-qtbase as well
> or will it break things?
Have not tested but I don't expect it to work for our cross/sysroot
magic: the patch wipes all host/sysroot paths out of (target) qmake.
>
> With 5.6 I was finally able to use the same patches for target qtbase
> and native(sdk) with only:
>     file://0008-Always-build-uic.patch \
>     file://0009-Add-external-hostbindir-option-for-native-sdk.patch \
> included only for native(sdk) that makes my qtbase branches in
> github.com/meta-qt5/qtbase a lot easier to maintain.
Understood, happy and fully agreed :)
>
> If it cannot be changed for all, can we make it conditional, e.g.
> [ "$QT_CROSS_COMPILE" =3D "yes" ]
> like in new version of:
> https://github.com/meta-qt5/qtbase/commit/10283d010d7a66c485cda1e9b1c0cf7=
c41e358b3
>
Need a look into but this seems to me the path to take: handling
conditionals during build is what configure is made for :)

As you might guess: I am using qt-creator on target from time to time
for building/debugging simple projects or profiling QML - so I am very
interested in qt-creator working on target.

Andreas

