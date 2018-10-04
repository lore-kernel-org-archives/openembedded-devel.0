Return-Path: <uvv.mail@gmail.com>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by mail.openembedded.org (Postfix) with ESMTP id 180E979348
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Oct 2018 07:04:17 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id a13-v6so442758qkc.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2018 00:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a4lyJwSKoI8U/gFtBmuuuAyaOBilKL6Nq+zGkYHrRUg=;
	b=gotCM8csGugo8C9XbMZi8JzIyX4WTV2itosFSRBybqW4GEGg72fnglGX1TSOnxrQtK
	wdHJaHAMs1IK8W60Eh+f/ZPGROVSx7rC7I6Qp9O5rnn1b7oypWXw4i8VhDu9n9im/oSj
	NwqKjbesRle8J9dhGRbPmPh6n/aq2cEdBtheAPTWFzv+brqpIH6z1PRPhdpj0slJHwLa
	BlgHfN8O/Q8wjtP0pFjLMq2855m9QVthlcvPd/4kLRcWYWuQmkY91rAxsXDKzwC47E/B
	cbpfk2E0K/ckyU0/+9zFcaWHNxa+jMJ9IgLAn/QcBg0RLCnctmuzN0tpfJQgutDTeSGS
	dntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a4lyJwSKoI8U/gFtBmuuuAyaOBilKL6Nq+zGkYHrRUg=;
	b=ce//GqdnLgCc0xBwUH6+L4O3rprVlnrPY8JVAlKH0WnV1zzgA8klKhzponCZ2bDyzI
	HWyUV/i67b2fhr6hjzQg2Ls+iZkATeA1+8EInQLiKEwme6D9r5rszBEyiiRLVQiS00pN
	/orMrS+wU4MRrhstzLdeTmesD4M3Fe+iCZKRfD3vbPkj1e7Kn5wIROMgHXhP84Mzb0rZ
	FSOE+AF8PVkPOpnCyO4/32PpUnx1bOQrPY9VdOUEFRrPvK3aqtXs3ESIlATrlC/ouTx3
	3SYCTc78F0V/YSCBe6zc3UlYhcYRqQzjbF746vWN3KdINakPUk/Z5LACmC5x8B4M91Ms
	6xhA==
X-Gm-Message-State: ABuFfogBLq8Lqa6stIl/Zf8y0bLfClymGtu243FQRVkz1O5FgNsiGkEE
	7Llv8JuYhQHe1DW22q2+PMjBlRPC05tbhwXeOe8=
X-Google-Smtp-Source: ACcGV614cC5WfaNbLXaa7mWdKBOCDgGK3jyoJmwcs41JTKAmNGqlR5aYJbq5HV3LeTRXjtMp+wxixd7A0t0+fURTybw=
X-Received: by 2002:a37:d11d:: with SMTP id
	s29-v6mr3918521qki.88.1538636658988; 
	Thu, 04 Oct 2018 00:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20181003062422.35229-1-uvv.mail@gmail.com>
	<20181003063500.GA1336@jama>
In-Reply-To: <20181003063500.GA1336@jama>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Date: Thu, 4 Oct 2018 09:04:12 +0200
Message-ID: <CAKHfEaj6kWFN80cRooO3KrCc47nX_4kEcHFD5UaNg6zE7ipU=A@mail.gmail.com>
To: martin.jansa@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] libeigen: allow empty packages
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
X-List-Received-Date: Thu, 04 Oct 2018 07:04:18 -0000
Content-Type: text/plain; charset="UTF-8"

 Hi Martin,
Thanks for your comment. I did see discussion in the mailing list that
RDEPENDS_${PN}-dev is supposed to solve it, but it doesn't. To be fare, I
tried it again now:
- bitbake libeigen -c cleanall
- bitbake ceres-solver -c cleanall
- reverted my ALLOW_EMPTY_${PN} = "1" change
- bitbake my-image

After last step I got:
ERROR: my-image-dev-1.0-r0 do_rootfs: libeigen not found in the feeds (x86
corei7-64 core2-64 x86_64 noarch any all) in
/home/uvv/projects/yocto-x86/build/tmp/deploy/rpm.
ERROR: my-image-dev-1.0-r0 do_rootfs: This is often caused by an empty
package declared in a recipe's PACKAGES variable. (Empty packages are not
constructed unless ALLOW_EMPTY_<pkg> = '1' is used.)
ERROR: my-image-dev-1.0-r0 do_rootfs: Function failed: do_rootfs

If there's another way to solve this, I'm all ears. BTW, ceres-solver
recipe itself has ALLOW_EMPTY_${PN} = "1" already. I believe the reason is
the same as here.

Regards,
Vyacheslav

On Wed, Oct 3, 2018 at 8:35 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, Oct 03, 2018 at 08:24:22AM +0200, Vyacheslav Yurkov wrote:
> > libeigen is header-only library.
> > All headers go into dev package, therefore the main package is empty.
> > Dependency on the dev package doesn't work, so you have to allow
> > empty package for build to succeed for recipes that depend on libeigen
> > (e.g. ceres-solver). Otherwise an error occurs that empty packages
> > are not allowed.
>
> I still don't understand what the issue is, there is already
> RDEPENDS_${PN}-dev = "" and similar for ${PN}-dbg.
>
> Creating empty libeigen package to satisfy dependency from ceres-solver
> doesn't really fix anything (just installs useless empty package on
> target).
>
> > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > ---
> >  meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
> b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
> > index 31a42a9d6..a59320655 100644
> > --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
> > +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
> > @@ -18,3 +18,4 @@ FILES_${PN}-dev = "${includedir}
> ${datadir}/eigen3/cmake ${datadir}/cmake/Module
> >  # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
> >  RDEPENDS_${PN}-dev = ""
> >  RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
> > +ALLOW_EMPTY_${PN} = "1"
> > --
> > 2.17.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

