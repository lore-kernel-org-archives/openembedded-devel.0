Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.10757.1619003921647732051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 04:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m7xx9Mf2;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id u21so62970307ejo.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Apr 2021 04:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xX3i4geqOhMW50gP/RETqMTQSJp7WbC/59nzKVC/lOw=;
        b=m7xx9Mf26vbS1qBh3vl1B/N22r3Yi0ZaSxSgrMvqpmyZEO8feVmnqDuT4AqDLHybh3
         12+B0FwcEwynn7ipxecBPj6HFcpewMq9Vme9B1LzY1OlgN9R3jnZQR/ELbXHEw5ibM8U
         ddG0TPgH+PjHnE9iyaydCz1j57+ZMlDw/+nr1Ti4D2OqdW/1IRSAqqbcO2F665x9X3c9
         cCNPBWuWPcDXzfTS0kuaDMYnYqFGcF26pLElJREJYcuY4na85NyZafhERUG7N/4/b/E/
         NexuXNcbYu2J7iqV3iQNs1YmU88NeCvscXLjEVB2dtpvFtCKROPGDHtinviupFAKKvnC
         b+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xX3i4geqOhMW50gP/RETqMTQSJp7WbC/59nzKVC/lOw=;
        b=P+Zz0WhlnDgjMITp/TmTiPa6XmzySMk3F3flLt7VEDDNvPZ4cuQaY7K0zT8/UI4ts3
         YEghVBMM/O16jEQdfU7Kc1yiLnxSbvx3oH4NWZdhAsPI/hCh2b33jdJQgGhSt0+08njo
         bwNtaYdVmaNTtHcNPKCXJwf+meknHq0hplIOlkZNkRK7CSFn25ba0jmtXUZesGNxZwwi
         xMeNM3+6wlUrPDMMk08NeUHaASQECqumOVZdW0Hv4jxF/fRAOE/aDQ7xVaDSMxr8M+gV
         2QuxiWlUlu9VBB73AeGArc4VkAkrdYOgk1rtB/7laitYX/U8Kj9lc52lqK4AlYaxGlGx
         +yDg==
X-Gm-Message-State: AOAM531Px63t5lTNu9//s0Wvp4K7lgzdPVLO/tlQWUbLRvyGq1CEb4vg
	5qjow1DjMz6d5hlWiTD/RUQ=
X-Google-Smtp-Source: ABdhPJy37zKDOA63tEx+veXjNG/GD2gSKQe9xq72k8HUivWbdMhEtUGqryNxEaLye3G6IRYnphH5GA==
X-Received: by 2002:a17:906:6801:: with SMTP id k1mr17724895ejr.137.1619003920131;
        Wed, 21 Apr 2021 04:18:40 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f22sm2098046ejr.35.2021.04.21.04.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 04:18:39 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 Apr 2021 13:18:39 +0200
To: Naveen Saini <naveen.kumar.saini@intel.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] tbb: upgrade 2020.3 -> 2021.2.0
Message-ID: <20210421111839.nkrxhzsh7ldst3a4@jama>
References: <20210407062210.5883-1-naveen.kumar.saini@intel.com>
 <CAMKF1srrwWUT0q-0q6zS+=bv5pLZc25zLuhROfd5CZpW4YUu=g@mail.gmail.com>
 <CAMKF1sqndeKvqZwu_UNp40EmtVVzbKhZynK8U=-xt+Pe=rBLww@mail.gmail.com>
 <020d1d4733fb4804bd53191b9a54887f@intel.com>
MIME-Version: 1.0
In-Reply-To: <020d1d4733fb4804bd53191b9a54887f@intel.com>
X-Groupsio-MsgNum: 90968
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qospcipfyqcdafb3"
Content-Disposition: inline

--qospcipfyqcdafb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 08, 2021 at 06:51:17AM +0000, Naveen Saini wrote:
> > > On Tue, Apr 6, 2021 at 11:10 PM Naveen Saini
> > > <naveen.kumar.saini@intel.com> wrote:
> > > >
> > > > Switched to cmake build tool.
> > > >
> > > > Rebased some patches due to directory re-structuring.
> > > > Dropped patches, which are not required anymore.
> > > >
> > > > Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> > > > rename from meta-oe/recipes-support/tbb/tbb_2020.3.bb
> > > > rename to meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
> > > > index 8e0094b31..357fbba34 100644
> > > > --- a/meta-oe/recipes-support/tbb/tbb_2020.3.bb
> > > > +++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
> > > > @@ -5,37 +5,24 @@ DESCRIPTION = "Parallelism library for C++ - runtime
> > files \
> > > >      and threading mechanism for performance and scalability."
> > > >  HOMEPAGE = "https://software.intel.com/en-us/tbb"
> > > >  LICENSE = "Apache-2.0"
> > > > -LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> > > > -BRANCH = "tbb_2020"
> > > > -SRCREV = "eca91f16d7490a8abfdee652dadf457ec820cc37"
> > > > +LIC_FILES_CHKSUM =
> > "file://LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327"
> > > > +BRANCH = "onetbb_2021"
> > > > +SRCREV = "2dba2072869a189b9fdab3ffa431d3ea49059a19"
> > > >  SRC_URI = "git://github.com/oneapi-
> > src/oneTBB.git;protocol=https;branch=${BRANCH} \
> > > > -           file://cross-compile.patch \
> > > > -           file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
> > > > -           file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
> > > > -           file://tbb.pc \
> > > > -           file://improve-reproducibility.patch \
> > > > +            file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
> > > > +            file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
> > > >  "
> > > >
> > > >  S = "${WORKDIR}/git"
> > > > -PE = "1"

Why did you drop PE? Please send follow-up patch to restore it to fix:

ERROR: tbb-2021.2.0-r0 do_packagedata: QA Issue: Package version for package tbb-dbg went backwards which would break package feeds (from 1:2020.3-r0 to 0:2021.2.0-r0) [version-going-backwards]
ERROR: tbb-2021.2.0-r0 do_packagedata: QA Issue: Package version for package tbb-dev went backwards which would break package feeds (from 1:2020.3-r0 to 0:2021.2.0-r0) [version-going-backwards]
ERROR: tbb-2021.2.0-r0 do_packagedata: QA Issue: Package version for package tbb-doc went backwards which would break package feeds (from 1:2020.3-r0 to 0:2021.2.0-r0) [version-going-backwards]
ERROR: tbb-2021.2.0-r0 do_packagedata: QA Issue: Package version for package tbb-locale went backwards which would break package feeds (from 1:2020.3-r0 to 0:2021.2.0-r0) [version-going-backwards]
ERROR: tbb-2021.2.0-r0 do_packagedata: QA Issue: Package version for package tbb-src went backwards which would break package feeds (from 1:2020.3-r0 to 0:2021.2.0-r0) [version-going-backwards]
ERROR: tbb-2021.2.0-r0 do_packagedata: QA Issue: Package version for package tbb-staticdev went backwards which would break package feeds (from 1:2020.3-r0 to 0:2021.2.0-r0) [version-going-backwards]
ERROR: tbb-2021.2.0-r0 do_packagedata: QA Issue: Package version for package tbb went backwards which would break package feeds (from 1:2020.3-r0 to 0:2021.2.0-r0) [version-going-backwards]

Regards,

--qospcipfyqcdafb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYIAKDQAKCRA3VSO3ZXaA
HMQOAJ9g1UAVOWxJtBgskBdoE+hWu3DSrACfQZ+GY4YA8a6Fm9ePVnETPzEmvig=
=pEFL
-----END PGP SIGNATURE-----

--qospcipfyqcdafb3--
