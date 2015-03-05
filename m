Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 451E771637
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 20:57:35 +0000 (UTC)
Received: by pabrd3 with SMTP id rd3so21607185pab.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 12:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=G+r8Ep5pfEG5wxdo5Meg2TqNTkJ4KNvdeKaQJvBtChM=;
	b=dSm1eQwiBMWypGo8FxyUYuIe1FMGdabKc+9d3RpnWbKBkRMKqtyffLmcSVRXVrpphH
	Zn1yrI/vLRuHanMeNeM0byekjpb2L8CUfdTGdzDT23+KoP6+HdskJzhfa2xT/PG9ll+h
	CgmjQ5t263kl3vFA4jpHJpmFjTgb8kFAq75A9PcG+pSs/gcdm2pNkfivUMUY4SWMn7dw
	4EUcZxbEHLnsy/0oxGXMGYIXEPaQbKifvHVnnJfj+Rl1pJBtJfbM1e4bkutjyd7FLH6G
	fvaZ0AsO9ym5P8hi6zG2ATSxkyefAKx9d2vqBC2Pk1C7QzHcDo57U+zF0a9erpyJWg4C
	KHHw==
MIME-Version: 1.0
X-Received: by 10.70.132.71 with SMTP id os7mr11001759pdb.94.1425589057180;
	Thu, 05 Mar 2015 12:57:37 -0800 (PST)
Received: by 10.70.38.9 with HTTP; Thu, 5 Mar 2015 12:57:37 -0800 (PST)
In-Reply-To: <20150305180120.GX2337@jama>
References: <1425248624-2993-1-git-send-email-schnitzeltony@googlemail.com>
	<20150305180120.GX2337@jama>
Date: Thu, 5 Mar 2015 21:57:37 +0100
Message-ID: <CALbNGRSb40o4eW=keqYx+3Ty04f-DHPj53h9bysC_WfhxgG_gA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] qt-creator: avoid conflicts with meta-qt5's qt5-creator
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
X-List-Received-Date: Thu, 05 Mar 2015 20:57:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2015 at 7:01 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Sun, Mar 01, 2015 at 11:23:44PM +0100, Andreas M=C3=BCller wrote:
>> We avoid conflicts by installing no files to sysroot. This causes no fal=
lout
>> because nothing depends on qt5-creator (if something included later depe=
nding
>> on qt-creator it should depend on qt5-creator).
>> Note that
>>
>> | WARNING: QA Issue: qt5-creator rdepends on qt-creator, but it isn't a =
build dependency? [build-deps]
>>
>> is a false positve because the names of the libraries are same as for
>> qt5-creator (see test below).
>
> This isn't enough to resolve the warning (but it resolves the sysroot
> conflict which is good).
>
> qt-creator is still recorded as runtime provider for couple of
> libraries, we can list them all in PRIVATE_LIBS (if we can assume that
> nothing will link against them - which is already assumed by not staging
> them).
>
> Here is the list from qt5-creator log.do_package:
>
> $ grep "requires package qt-creator" log.do_package
> DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (us=
ed by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux=
-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcrea=
tor/plugins/libQmlJSTools.so)
Very interesting:

* qt5-creator complains for libs it has installed itself (see qt5 in path)
* how should someone link against libraries that are not in sysroot?
* during my tests for sysroot patch I have build qt-creator from
scratch and then an image with qt5-creator included. If this warning
would be true the image creation would have failed because qt5-creator
RCONFLICTS qt-creator (error occured when starting the last patch)

Problem seems that that the instance creating (have not looked
further) these warnings just checks the name of the library without
path. Library names are same for both versions of qt-creator.

We could try it with PRIVATE_LIBS but I'd suggest to simply ignore
these false warnings.

What do you think?

Andreas

