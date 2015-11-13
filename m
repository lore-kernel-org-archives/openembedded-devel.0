Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 77F5C772D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 14:47:28 +0000 (UTC)
Received: by iouu10 with SMTP id u10so92058363iou.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 06:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=ALamZy9xf/QX5SrlQ3GWHWvDTGssteMicgKOGZ5Z5/g=;
	b=LWKNvyoLrb1upXw/A7GwALWfF4G7QGTjGMAvM2jU0CXp51OFvZDrZsArFMdDTEe3Wp
	OE/cL13XbZniAfaXBpSyQxdRFl4Sy4oAJ6z+/qrPT16LbhJl8+yOI0lZhk8QXh65mmPW
	F5eAlGk2guSZxh1AvwpG5oIIMlS97BWe9joOCLI6evs4VprJVRHY6AsE5wIEm3356jiA
	PezKSGCbykDvIRp37ymjzhWM69bJ0jEioSfLHoUeFBsxnD2b+OnfA630lKOxGXrRIbsU
	zFglRQwbW5LisnxtoLiOaMAAdew7YYz0r23wr7IEqPD/5Yb/hGB3HgmefMN5PKhh98bq
	pAxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=ALamZy9xf/QX5SrlQ3GWHWvDTGssteMicgKOGZ5Z5/g=;
	b=kZpMGLIceH62f8GZH3c7R6rPSF72XfDluSF1Jc0AxHJAfYe47qsdMFrdkztzuXk7yM
	jcqiw5Op7ivy6iXMJ9PE4RWKwPx5/DgqwlCekQugTc3/aHueX3VUKJOj9ifOgePCXBMr
	Ow5M1eq3TX/hkxkg38a7JqbujojIxUwnlpMNRhnIKuOs1LX68d+sk38PYQkehC7/vqrp
	7nayIKuaxU3uKRRUxp7gTcQict0MNJmgmw3kbP0+UqBueTtvJYTIsi/RrXMZDHkqmTAQ
	Bj6V9onxrLAI6MK8XIQoQfRQLo9YUAO44qc3ehA3Zf8+m7Hjnn/cqmk8ALezwxGYRiyB
	B0Sg==
X-Received: by 10.107.134.28 with SMTP id i28mr20204703iod.74.1447426049129;
	Fri, 13 Nov 2015 06:47:29 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.93.7 with HTTP; Fri, 13 Nov 2015 06:47:09 -0800 (PST)
In-Reply-To: <39CE9B1B-A0D2-4186-90B5-79281E821017@gmail.com>
References: <1447359445-27258-1-git-send-email-kergoth@gmail.com>
	<1447359445-27258-2-git-send-email-kergoth@gmail.com>
	<39CE9B1B-A0D2-4186-90B5-79281E821017@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Fri, 13 Nov 2015 07:47:09 -0700
X-Google-Sender-Auth: SVm0Pi6lW7XMs7AbfU7CzSc_G2A
Message-ID: <CABcZANkTiE5m75F2eaDQfpBNDvoPYT70p5Y7PEMGedvxK2tntA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 2/5] talloc, libtevent, libtdb: depend on attr
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
X-List-Received-Date: Fri, 13 Nov 2015 14:47:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 13, 2015 at 2:38 AM, Jens Rehsack <rehsack@gmail.com> wrote:

> > Am 12.11.2015 um 21:17 schrieb Christopher Larson <kergoth@gmail.com>:
> >
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > These will depend on libattr if it's available, and we need deterministic
> > builds. This fixes a build-deps failure which occurs when attr is built
> before
> > them. There's currently no configuration option to explicitly control
> this
> > dependency, and I don't know enough about waf to add such an option, so
> > unconditionally dep on it for now.
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> > meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb        | 1 +
> > meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb | 2 +-
> > meta-oe/recipes-support/talloc/talloc_2.1.1.bb        | 1 +
> > 3 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
> b/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
> > index 0b9e1f2..e349187 100644
> > --- a/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
> > +++ b/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
> > @@ -1,6 +1,7 @@
> > SUMMARY = "The tdb library"
> > SECTION = "libs"
> > LICENSE = "LGPL-3.0+ & GPL-3.0+"
> > +DEPENDS += "attr"
> >
> > LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b
> \
> >
>  file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
> > diff --git a/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
> b/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
> > index f297f30..c37eeb3 100644
> > --- a/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
> > +++ b/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
> > @@ -3,7 +3,7 @@ HOMEPAGE = "http://tevent.samba.org"
> > SECTION = "libs"
> > LICENSE = "LGPLv3+"
> >
> > -DEPENDS += "talloc libcap"
> > +DEPENDS += "talloc libcap attr"
> > RDEPENDS_${PN} += "libtalloc"
> > RDEPENDS_python-tevent = "python"
> >
> > diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> > index 89c390f..7931374 100644
> > --- a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> > +++ b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> > @@ -2,6 +2,7 @@ SUMMARY = "Hierarchical, reference counted memory pool
> system with destructors"
> > HOMEPAGE = "http://talloc.samba.org"
> > SECTION = "libs"
> > LICENSE = "LGPL-3.0+ & GPL-3.0+"
> > +DEPENDS += "attr"
> >
> > SRC_URI = "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz"
> > LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b
> \
> > --
> > 2.2.1
>
> RDEPENDS is wrong for deterministic builds, since they leave a race
> condition open that attr is build parallel to libtevent
> and 2nd build is different to first build.
>
> If you want, I handle that better in a patchy way I discussed with JaMa
> yesterday in #yocto (patch check out depending on PACKAGECONFIG)


I don't believe anyone said anything about rdepending on attr. This patch
certainly doesn't, it adds to DEPENDS. But as was said earlier in the
thread, a way to explicitly enable/disable the dep in the underlying
buildsystem would be better.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

