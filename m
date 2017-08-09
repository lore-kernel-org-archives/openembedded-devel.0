Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 016D171DD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 16:55:03 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id w45so30875228uac.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 09:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DtzmdsKqfKjPfVSGQopvvn7v7EUsjjIxi5thqzb08V8=;
	b=OLGeZ3eTeIZJrGb2nzpsvsWEP5/aOEwARItX2nqwtPJ4/9E0BdwpMskgB407nALGW6
	zIMROdwnYIrxUG0MNixDmuDPoF9TTE7kkeAxgPOpHIvGHBzzYzjCBNAVkE9XW3iBX4PS
	8IYGVtO6CFV+KREkGKofHT2p+gQTy0CfBiham/uhXptLVVSD/+m00viLqEq2yYkfoTL7
	LZ9afmBTeV9p675J4x29vYl2B8UM5GtsEMMw8/6hO++lnNEYqq8cVG/jkwhzR3OlfGkm
	ZKW7UQ9giMoGDXW/vjC0aAcQ/f7k+wB7R+mrNbjDWkQPUCNIN/au0U7AmMAjbPJwqyYs
	HIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DtzmdsKqfKjPfVSGQopvvn7v7EUsjjIxi5thqzb08V8=;
	b=sJXV+Se+qY+EdT5WQO/nXM1sVwLelnvFjcItwjIYHJYVj/OG8H8RSDqpbWbfVMIJ2b
	DiUAPXPOJTxTdU+A/EygngRLstkQ6btdKAbiliB97RW2N7dnB4PsfCOBvwPzwmiOeIF3
	MBHmOo1ZMcIrirWLH3ZeNkguYq28J+seXuNP36bqcF679hoGri7Vn49w6jHfQ3R65crb
	3FY62vUry2q5QLxU1zsqg94IJ2vhdXGBBjPpgSFJ05hGKhpYx9bkcaPcUEgTs4lewqpS
	ZY/qE6lHWXFOb6+9tMiT6P38erMEseROYB9QLZODbPQ7aIVGMWfP0CUdQF6ZL9urYgVp
	L1wA==
X-Gm-Message-State: AHYfb5hI9SLIu/E3ruiejt4lg/PFcSjSaYFl6rjoyUxGkA3xRjewyFV3
	VwkZmJEulP8cGK77UxmLgHA9Gxr6Ow==
X-Received: by 10.159.62.147 with SMTP id x19mr5269941uai.179.1502297705270;
	Wed, 09 Aug 2017 09:55:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Wed, 9 Aug 2017 09:55:04 -0700 (PDT)
In-Reply-To: <20170809081744.GA3394@jama>
References: <20170801170152.94586-1-Randy.MacLeod@windriver.com>
	<olqm6a$87a$1@blaine.gmane.org>
	<4aaa2c14-284f-71b4-47d2-fc7e8e27beef@windriver.com>
	<BFE10A87-CF18-46BA-88E4-A795FB20506E@dominion.thruhere.net>
	<f3b1d5bc-6d6f-4fdd-8076-5d856af4b8cf@windriver.com>
	<CAMKF1srRkN_vfF5HkMQy4YM5aa8bUCC+HOX0zALdbweUeT8dCQ@mail.gmail.com>
	<9ec26f7f-f87b-b470-ee15-459ac5712bfd@windriver.com>
	<CALbNGRQQHqg-qWOxJim5Do08VSUCt_F8kSA-75LXeDx=SoDbqA@mail.gmail.com>
	<CAMKF1spVbt=sEkrkrJbPjLJ=SRC7zAkPKy4A9xUK1OR=90pOMQ@mail.gmail.com>
	<20170809081744.GA3394@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 9 Aug 2017 18:55:04 +0200
Message-ID: <CA+chaQfufXS=A=V67Kj7_z_OvM12ZZHLYN_dUgrdsHSjXZzXoQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] imagemagick: upgrade from 7.0.5 to 7.0.6p4
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
X-List-Received-Date: Wed, 09 Aug 2017 16:55:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

And jenkins builds won't populate it, because it failed there as well
already:
http://errors.yoctoproject.org/Errors/Details/150176/

I'll drop it from master-next in next update.

On Wed, Aug 9, 2017 at 10:17 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Tue, Aug 08, 2017 at 07:42:59PM -0700, Khem Raj wrote:
> > On Tue, Aug 8, 2017 at 7:28 PM, Andreas M=C3=BCller
> > <schnitzeltony@googlemail.com> wrote:
> > > On Wed, Aug 9, 2017 at 4:02 AM, Randy MacLeod
> > > <randy.macleod@windriver.com> wrote:
> > >> On 2017-08-08 08:42 PM, Khem Raj wrote:
> > >>>
> > >>> I am seeing
> > >>>
> > >>> downloads
> > >>> 'http://www.imagemagick.org/download/releases/ImageMagick-
> 7.0.6-4.tar.xz'
> > >>> --progress=3Ddot -v failed with exit code 8, output:
> > >>> --2017-08-08 15:05:59--
> > >>> http://www.imagemagick.org/download/releases/ImageMagick-
> 7.0.6-4.tar.xz
> > >>> Resolving www.imagemagick.org... 198.72.81.86
> > >>> Connecting to www.imagemagick.org|198.72.81.86|:80... connected.
> > >>> HTTP request sent, awaiting response... 404 Not Found
> > >>> 2017-08-08 15:05:59 ERROR 404: Not Found.
> > >>>
> > >>>
> > >>> ERROR: imagemagick-7.0.6-r0 do_fetch: Fetcher failure for URL:
> > >>> 'http://www.imagemagick.org/download/releases/ImageMagick-
> 7.0.6-4.tar.xz'.
> > >>> Unable to fetch URL from any source.
> > >>> ERROR: imagemagick-7.0.6-r0 do_fetch: Function failed: base_do_fetc=
h
> > >>> ERROR: Logfile of failure stored in:
> > >>>
> > >>> /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-
> linux-gnueabi/imagemagick/7.0.6-r0/temp/log.do_fetch.17282
> > >>
> > >>
> > >> Ugh, the imagemagick devs have moved on to:
> > >>  http://www.imagemagick.org/download/releases/ImageMagick-
> 7.0.6-5.tar.gz
> > >>
> > >> and deleted the 7.0.6-4 tarball already!
> > >> I'll send a patch in the morning and also talk to upstream about the=
ir
> > >> archiving policy. I don't see a directory for that at the moment.
> > >>
> > >> Thanks for the heads up.
> > >>
> > >> ../Randy
> > >>
> > > Yes and they will do it again until 7-0.7.x comes up :(
> >
> > I think we should copy the tarballs to source.openembedded.org before
> > accepting imagemagick updates.
>
> That's what my jenkins builds do (or at least should do) once they build
> this.
>
> >
> > >
> > > Andreas
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

