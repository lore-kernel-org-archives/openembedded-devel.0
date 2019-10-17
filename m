Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id BE52F79C7C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 22:04:34 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id d1so4099232ljl.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 15:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DIVtzab9/C8orq/LNkCKoq3U1ZYFIx/MvAmOwkjs/VY=;
	b=Te2mP4T0VOgUauBINc9/PvSVPaYRRhAkTZK4iC6thgqkMByg34UHD9PWk8yyZ0alP9
	mS38XXcRkTD5B7jyZ/0xBa6ijyypfJoGm68hpofCJz1P+XocXidmiE4j6rKuHm1rZnrv
	6p3oiE+5tvtEftXOcbnx0njEJFACB8y9Eqn5gxnT1MFtesmW+7IMkLRyfqKtDJ6VNhng
	ZruiMNdnX1plmpaRXzG/Feu5a1Q3eeOxFQ/h+UBngVgRub1XTrqHTGjuqFbec5ALJMM2
	/PRQQQN7Uz9d8B1Oz1wu3iPOzWMXcjQXt7sOPPCU+YYj20hGsJEZLkphR/Swyt8RW+0N
	r7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DIVtzab9/C8orq/LNkCKoq3U1ZYFIx/MvAmOwkjs/VY=;
	b=PoX9pNhOL5ComTWYUAhyM6w6hMut2CUyTWASRtVdGNRSd0bWUT8f6eRu6vBtBh2Ss6
	WJzIKvy5Rtdyb1DYljzU3jBcozL9PDalsBt+XLj2LQY0nHK6yWb4+Qspfe59ALzDs4wJ
	SRUuEDeQY1fJGt7bBfDF4UsfkfYTXi+bHMT830DzMf+eVYbkSrr0DfjDkO11Biellg1p
	y7vAeL+Ztkx9EPbp7m2TA6pfGRSL7flrBUQVrVrOPluPLJbDIpD2BudXSIsZXWEwMzxR
	fMoAIkAlFi3psmUJEfYI9GtzBtzQn+7eg5gf6zBcPmkdbncOQC8if+kqNRCbk7Ddh1Fb
	YFxA==
X-Gm-Message-State: APjAAAWbGAxIALxjXoXC7s1uFyyJZ4cwUfk2XYTgKn+ozXZUXNKEmfle
	RGvNcjj1wd716r5nBcwJtM7ZFmxZAQV/m041GDs=
X-Google-Smtp-Source: APXvYqzqen3XkLOiH3OlJ+9ad/46R52BMGaCt3WbH8/gUCqyPGa9t/Not33XGY5FmpaUQO52D4M3/kkZXhe/DbrGA0k=
X-Received: by 2002:a2e:82cd:: with SMTP id n13mr3960682ljh.156.1571349875204; 
	Thu, 17 Oct 2019 15:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191016155844.20847-1-alistair.francis@wdc.com>
	<CAMKF1spRe3J0sAW0ScbAoivkFemfXAQy5VNtyNUda4d4mmY_PQ@mail.gmail.com>
In-Reply-To: <CAMKF1spRe3J0sAW0ScbAoivkFemfXAQy5VNtyNUda4d4mmY_PQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 17 Oct 2019 14:59:25 -0700
Message-ID: <CAKmqyKPLv4njUSfgjx8xuMTeeRJ0VfyMFTwCwdywrbSwAUMUsw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2 1/5] python3-pako: Initial commit of version 0.2.3
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
X-List-Received-Date: Thu, 17 Oct 2019 22:04:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 17, 2019 at 5:49 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fails to package
>
> https://errors.yoctoproject.org/Errors/Details/273941/

v3 sent which fixes this failure.

Alistair

>
> On Wed, Oct 16, 2019 at 9:03 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  .../recipes-devtools/python/python3-pako_0.2.3.bb        | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb b/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
> > new file mode 100644
> > index 000000000..24efa44e3
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
> > @@ -0,0 +1,9 @@
> > +SUMMARY = "The universal package manager library"
> > +HOMEPAGE = "https://github.com/MycroftAI/pako"
> > +LICENSE = "Apache-2.0"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
> > +
> > +SRC_URI[md5sum] = "8eb7077075091c50e4b8a9f939607277"
> > +SRC_URI[sha256sum] = "6be55fd8c5a2a6f02974f37438c1c47a3d9e764ce81c9d0a1a8c9a1815a59778"
> > +
> > +inherit pypi setuptools3
> > --
> > 2.23.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

