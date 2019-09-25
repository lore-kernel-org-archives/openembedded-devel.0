Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id CA6DD7E71C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 23:05:13 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id p10so208278qkg.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 16:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JCEynAVELx2ws1UyNViSMcvdAn0ViUWKsNYlr93j+5Q=;
	b=qExJDWDF1zXK9pU5o54qw0IeXL404eehRGj5b12v8Bum7jMoZTKPbTXsSY2PJ3oYvs
	MwUX5cMubOX+l7VkBHW/Xfqb6GDjVJ9VXvl4VJXBTrXDO7LJCk+mBZwcSe48XSVAqpAp
	qXqzQCWvSh4HIyl3Hsr8o9aUbs+pD5KIS+FJCR50wUCJc5xiu4d6iQxrVdoD4hjjMTf6
	37Sznt2rfas/oOTwqkF2OLh/tLFlWEAKK9JWe7J2wDFuRqnVT+ke2bkbZVSTPdxe+Ffc
	O1XY0R4SnbCtmjbe0q7lo8UNJquhrXo3IBpabgKamQNgwlolZWE1nN6BpdpjVhKkQlDG
	flNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JCEynAVELx2ws1UyNViSMcvdAn0ViUWKsNYlr93j+5Q=;
	b=UkrWrJ9yWk+dQOLGqqAQTuNryKatme8mp/R22eDr+B0MGdcJGR+DsGmNJFwMpZpIW1
	PTYGAFMvtPflTqPfq2B8Wcc2UfgsNpBFJSECjOgVu0D9w61meUPxvqgiAMyTIH4RSS53
	0V4bgDae9gJRyarT+aY3QCfRSaAZZ+VNnX7mn7fWBDHyJEyy0HqTceFV4ulkSOdRq/RO
	aCOlAFaWMji7eJyKUAnd4+5/A0yz0rsdxuYcwkZDDqeT4IxGiHWWmUouLANJB7sBli8A
	BJrxIKwRLbtnEGwD6/zYuSPcjHekQ849+yrTsD7/LmNZHl7MxpdDF+WfrtfO2cNNr2KB
	SMTA==
X-Gm-Message-State: APjAAAXfe32U3LXZYnbG1HA7+7xWPeMdzbXj+MvuDHl8aRzvVCuaRQzZ
	o9yTEe/VK1oTfySpGZ+OUPI42RFExOiuLCKzqAvlED/NdDs=
X-Google-Smtp-Source: APXvYqz5MZ0d4wcSOhjuW1EE8J/D20gOmA2iEVe1lXWoSTrWZIIP1+QSjkDPhcIIuTud/v7P2nwvf40eIPWNYhkN2m4=
X-Received: by 2002:a37:5cc1:: with SMTP id q184mr442883qkb.212.1569452714062; 
	Wed, 25 Sep 2019 16:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190925213619.18725-1-open.source@oleksandr-kravchuk.com>
	<CAMKF1sprQXkEUoG0iDnvNWZddztn9yW9oBnjpC+rJO3FuAcohA@mail.gmail.com>
	<227948c2-11c2-53f4-11f7-f9ef6f33ecf0@oleksandr-kravchuk.com>
In-Reply-To: <227948c2-11c2-53f4-11f7-f9ef6f33ecf0@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2019 16:04:47 -0700
Message-ID: <CAMKF1srjou4f-d+fXU05dR4Azy1h7hPMych=5+4oo+pAg0qKoA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe 1/2] tesseract: update to 4.1.0
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
X-List-Received-Date: Wed, 25 Sep 2019 23:05:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 25, 2019 at 4:02 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> On 25/09/2019 23:39, Khem Raj wrote:
> > On Wed, Sep 25, 2019 at 2:36 PM Oleksandr Kravchuk
> > <open.source@oleksandr-kravchuk.com> wrote:
> >> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> >> ---
> >>  .../{tesseract_git.bb => tesseract_4.1.0.bb}          | 11 ++++++-----
> >>  1 file changed, 6 insertions(+), 5 deletions(-)
> >>  rename meta-oe/recipes-graphics/tesseract/{tesseract_git.bb => tesseract_4.1.0.bb} (57%)
> >>
> >> diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_git.bb b/meta-oe/recipes-graphics/tesseract/tesseract_4.1.0.bb
> >> similarity index 57%
> >> rename from meta-oe/recipes-graphics/tesseract/tesseract_git.bb
> >> rename to meta-oe/recipes-graphics/tesseract/tesseract_4.1.0.bb
> >> index 89d09a0f5..fde3bc180 100644
> >> --- a/meta-oe/recipes-graphics/tesseract/tesseract_git.bb
> >> +++ b/meta-oe/recipes-graphics/tesseract/tesseract_4.1.0.bb
> >> @@ -1,19 +1,20 @@
> >>  SUMMARY = "A commercial quality OCR engine "
> >> +HOMEPAGE = "https://github.com/tesseract-ocr/tesseract"
> >> +BUGTRACKER = "https://github.com/tesseract-ocr/tesseract/issues"
> >>
> >>  LICENSE = "Apache-2.0"
> >> -LIC_FILES_CHKSUM = "file://COPYING;md5=7ea4f9a43aba9d3c849fe5c203a0ed40"
> >> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> >>
> > what changed ?
>
> Original COPYING file basically had a statement that code is licensed
> under Apache 2.0
> (https://github.com/tesseract-ocr/tesseract/commit/618489290536282a59ed7a71381ca083d9a7586a)
>
> The new one, LICENSE contains text of the license.
>

please add such info in commit messages always see
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Describing_license_changes


> >> -BRANCH = "3.05"
> >> -PV = "${BRANCH}.01+git${SRCPV}"
> >> -SRCREV = "215866151e774972c9502282111b998d7a053562"
> >> +BRANCH = "4.1"
> >> +SRCREV = "5280bbcade4e2dec5eef439a6e189504c2eadcd9"
> >>  SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=${BRANCH}"
> >> +
> >>  S = "${WORKDIR}/git"
> >>
> >>  DEPENDS = "leptonica"
> >>
> >>  EXTRA_OECONF += "LIBLEPT_HEADERSDIR=${STAGING_INCDIR}/leptonica"
> >>
> >> -
> >>  inherit autotools pkgconfig
> >>
> >>  FILES_${PN} += "${datadir}/tessdata"
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

