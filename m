Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web08.15110.1603299438230676613
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 09:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tDOh/uai;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id y12so3884708wrp.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 09:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=whMCbFjdCGO23vxhkxcpNPYBo/4XVVD0aMKbrFVezhE=;
        b=tDOh/uaifvGt3IQh0isirCsrVOFS78CfljHNXOykzEdoj0yX68GyUCdGgIlZhzbcn6
         6+ot1F3bejUhI69yww6qpINCok9aZ9YZ6cAD8ATmPx6mfAO7+SVv98ewfBF1vSPHZhdC
         L3Ft6gSXy3cezrq3cbY2l5UzSiRnMHKEmms+pxqlinDte9Ar4rrm+gijyY0hTcEZinKt
         guYimCcFacFQ/XUvS8oi8Kz+ub/702RA9gvH85rkIwETp7kKtgLRRMEaY2vIrcR++L4j
         3yp+9ooY1wp2KHPMIfNJh+fDGH48WASNdoOm0f6FLzoYLwbeE7uTv/MSnwnaYvLNo6Mt
         Q9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=whMCbFjdCGO23vxhkxcpNPYBo/4XVVD0aMKbrFVezhE=;
        b=ZgjE3JUYj6Z2JmfadoD1c2TQ2pbbf2AmToebNT924xgcpyfpNt8xNlL9Sy7MG0xvPV
         Cx0YYMU7+oE2ugNYROeWWHD3AMM7cwjbMRx2A9xxgh45VEdSsAeAkNrX/w5i9t/JZwcs
         UIq8yLZqKUvImWXiU+Eougv4XNG1toS4xbBKYGJ6R6DRKQ83tC8iXxXOmzVjYzsMaBBH
         C8ge5XYy3X8C+AOGM5eqaFBJ+3/MRSnPxZDKSkn8PsmlT6ZDbCqKwhFislBHKkM/vLHx
         mZOuGEw3gOth5WGYauzCZ01r2oGV7GQ2hHQ+oKscbbj0iHMCVLs/YNDEB5H3ZvL3Md99
         ZRgQ==
X-Gm-Message-State: AOAM531m1xWym+LC5E6mcYggn7u76k1Ak1128MxrrrGxPSXWoUljn0yN
	r5594hMgoKRvjYXCMrEtKNE=
X-Google-Smtp-Source: ABdhPJwrkWyX1TWOSaUb6ITSu7pe1sSVIeIxC2Kir+qemZlTwTvyvFPrhhqFMWr6HFsfT07wukuX+w==
X-Received: by 2002:a5d:6ca6:: with SMTP id a6mr5839391wra.348.1603299436769;
        Wed, 21 Oct 2020 09:57:16 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id i9sm4427680wma.47.2020.10.21.09.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 09:57:16 -0700 (PDT)
Message-ID: <8a11e1b64ffed9ba2125d9d1a82cd52333c2bdce.camel@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] Add recipe for fsverity-utils
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Oct 2020 17:57:15 +0100
In-Reply-To: <CAMKF1sqRMAYcA950Mtw1zbK1VvsRMjLaQXi2qns5PoWRW_hcJQ@mail.gmail.com>
References: <20201021155656.2841020-1-luca.boccassi@gmail.com>
	 <CAMKF1sqRMAYcA950Mtw1zbK1VvsRMjLaQXi2qns5PoWRW_hcJQ@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-10-21 at 09:35 -0700, Khem Raj wrote:
> On Wed, Oct 21, 2020 at 8:57 AM Luca Bocassi <luca.boccassi@gmail.com> wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > Library and command-line tool to manage the fs-verity
> > feature, introduced in Linux 5.4 and supported in ext4
> > and f2fs filesystems.
> > 
> > https://www.kernel.org/doc/html/latest/filesystems/fsverity.html
> > 
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> >  .../fsverity-utils/fsverity-utils_git.bb      | 29 +++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_git.bb
> > 
> > diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_git.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_git.bb
> > new file mode 100644
> > index 000000000..c0b6fc657
> > --- /dev/null
> > +++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_git.bb
> > @@ -0,0 +1,29 @@
> > +SUMMARY = "Userspace utilities for fs-verity"
> > +DESCRIPTION = "fs-verity is a Linux kernel feature that does transparent \
> > +on-demand integrity/authenticity verification of the contents of read-only \
> > +files, using a hidden Merkle tree (hash tree) associated with the file. The \
> > +mechanism is similar to dm-verity, but implemented at the file level rather \
> > +than at the block device level."
> > +HOMEPAGE = "https://www.kernel.org/doc/html/latest/filesystems/fsverity.html"
> > +SECTION = "console"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=bc974d217b525ea216a336adb73e1220"
> > +
> > +PV = "1.2"
> 
> since its at a release lets use the version scheme in recipe name. So
> call it fsverity-utils_1.2.bb
> and remove setting PV above
> 
> Secondly, add it to the appropriate packagegroup in
> packagegroup-meta-oe.bb recipe as well since its a new recipe.

Ok, done in v2, thanks.
Added to packagegroup-meta-oe-crypto given it implements similar
functionality to veritysetup (which is part of cryptsetup).
Please let me know if there's a better alternative.

-- 
Kind regards,
Luca Boccassi

