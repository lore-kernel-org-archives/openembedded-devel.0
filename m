Return-Path: <maxim.uvarov@linaro.org>
X-Greylist: delayed 432 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 May 2014 08:57:56 UTC
Received: from mail-qg0-f46.google.com (unknown [209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1F29D6FAB6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 08:57:56 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id q108so16864424qgd.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 01:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=SCbhSdhcqySxATYbyVZ/ISoWZAlqlIqP7KzP+0/28+g=;
	b=Y4wR6f9RK/Q0N2XDHpse0iPXYGhX5YvB6ZZeVwkIDZ7vHvyDs4dZEK5lYhpQn8RNXG
	DXZtR82VsvN/ac0ZWwANBK/o2qyaucXYjpO3n4eSDzkHgzfl1wd9ooZ4lXPdQHzJ/wh6
	mwdXAA9P1FncOjWdOvu9zB2feR7I/bTUm82QvSN+JpK00zQiKiTXrLkmLbg3cgfqTZrW
	r3p6awLdQ/QTmXpQxzHcMAxmiIX/QAxPFP80oOYzGZQck06uNkO3KEPA7+RFE3yT+f8T
	X1tTokXtgibdasJmvtg1Aapqqg1aVF7ogYj/PZoFz8CuHPHQoVozRusXpvHVEhHnaDuE
	QfLg==
X-Gm-Message-State: ALoCoQltSnsTHKLVcf3hRaezuI4Ug8iWghHWECdExE3MjfsdIXir9IrjU8JiNnz1PSVbS10Kd6lv
MIME-Version: 1.0
X-Received: by 10.224.20.72 with SMTP id e8mr49865756qab.86.1401267045351;
	Wed, 28 May 2014 01:50:45 -0700 (PDT)
Received: by 10.229.112.73 with HTTP; Wed, 28 May 2014 01:50:45 -0700 (PDT)
In-Reply-To: <lm3vld$94k$1@ger.gmane.org>
References: <1401196396-2009-1-git-send-email-maxim.uvarov@linaro.org>
	<20140527142106.GB2426@jama> <5384A14C.70900@linaro.org>
	<20140527194816.GC2426@jama> <lm3vld$94k$1@ger.gmane.org>
Date: Wed, 28 May 2014 12:50:45 +0400
Message-ID: <CAD8XO3a8bvr=mCk7Zgmn=PkXhcuu5DFd2ZmReR1AqFb+OE7rPA@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] daq fix compilation
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
X-List-Received-Date: Wed, 28 May 2014 08:57:58 -0000
Content-Type: text/plain; charset=UTF-8

thanks, will send v2.

Maxim.


On 28 May 2014 10:27, Koen Kooi <koen@dominion.thruhere.net> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Martin Jansa schreef op 27-05-14 21:48:
> > On Tue, May 27, 2014 at 06:29:32PM +0400, Maxim Uvarov wrote:
> >> On 05/27/2014 06:21 PM, Martin Jansa wrote:
> >>> On Tue, May 27, 2014 at 05:13:16PM +0400, Maxim Uvarov wrote:
> >>>> preset paths to remove that error:
> >>>> /meta-oe/recipes-connectivity/daq/daq_2.0.2.bb ./config.log:cc1:
> >>>> warning: include location "/usr/local/include" is unsafe for
> >>>> cross-compilation [-Wpoison-system-directories]
> >>>>
> >>>> Also this patch add required libdnet dependency.
> >>>>
> >>>> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org> ---
> >>>> meta-oe/recipes-connectivity/daq/daq_2.0.2.bb | 5 ++++- 1 file
> >>>> changed, 4 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> >>>> b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb index
> >>>> 4e85194..dcf38fc 100644 ---
> >>>> a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb +++
> >>>> b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb @@ -5,7 +5,7 @@
> >>>> LIC_FILES_CHKSUM =
> >>>> "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
> >>>>
> >>>> PARALLEL_MAKE = ""
> >>>>
> >>>> -DEPENDS = "libpcap libpcre" +DEPENDS = "libpcap libpcre libdnet"
> >>>>
> >>>> SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
> >>>> file://disable-run-test-program-while-cross-compiling.patch " @@
> >>>> -15,6 +15,9 @@ SRC_URI =
> >>>> "http://fossies.org/linux/misc/daq-${PV}.tar.gz \ # daq/daq/latest
> >>>> lost dependency on  libdnet libmnl libnetfilter-queue libnfnetlink
> >>>> EXTRA_OECONF += "--disable-nfq-module --disable-ipq-module"
> >>>>
> >>>> +# never look to /usr/local lib while cross compiling +EXTRA_OECONF
> >>>> += "--includedir=/usr/include --with-libpcap-includes=/usr/lib
> >>>> --with-dnet-includes=/usr/lib"
>
> Apart from Martins comments:
>
> s,/usr/include,${includedir}, s,/usr/lib,${libdir],s
>
> >>> Does it look into /usr on host now?
> >>
> >> yes and it compiles after that change.
> >
> > Because you don't have dnet headers in /usr, right? Shouldn't it point to
> > sysroot libdir/includedir paths to prevent any host libraries/headers to
> > sneak in?
> >
> > Or better explicitly disable/enable dnet with PACKAGECONFIG?
> >
> >> Maxim.
> >>>
> >>>> SRC_URI[md5sum] = "865bf9b750a2a2ca632591a3c70b0ea0"
> >>>> SRC_URI[sha256sum] =
> >>>> "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51f605309beac269a8"
> >>>>
> >>>> -- 1.8.5.1.163.gd7aced9
> >>>>
> >>>> -- _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>
> >>>
> >>
> >> -- _______________________________________________ Openembedded-devel
> >> mailing list Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFThYHsMkyGM64RGpERAtiuAKC9mKMO+TzYJ0Z42mCUa3vI2NP+oQCffCv4
> Wo1+U3SJNrRsNMAUepC9mQs=
> =DMBJ
> -----END PGP SIGNATURE-----
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

