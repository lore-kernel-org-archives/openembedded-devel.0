Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f176.google.com (mail-yb0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8C38877E4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 14:24:41 +0000 (UTC)
Received: by mail-yb0-f176.google.com with SMTP id b81so899100yba.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 07:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3/n5HWUHtRyfEwiXmEGBKMAZni70EP6/mO53h/aQL4c=;
	b=trCdqVu5xCHR594Qy5LQMHXrJr83CB3D6LN/cOn5mtWB3funyqyLwplajrU/qWCTwN
	ir3DicSY5PnnaqGUrcTyiidDT0U6xeRkAD/6Z+R7dHlUcwtYfFNQUofnGEsZ/D+vDwer
	rWTEDBhVvsLvhAafXowXc/P4SlhGqiT44Gd4eWOGxbvF3CfDvCB3gNjcc45L5d6bMWxg
	R/C+S4E9nsSXhdYsBReRg0TTBL1jrXd+VaDA80/zKoSa0+lLx3XByyepl6HGP3k3EhU/
	p5WB7+/nq087GoT35tEC2mzZi/px0bmsimrKpvO9NROAJhk0EpHwHp8r6Kwr4V64Ul0A
	x9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3/n5HWUHtRyfEwiXmEGBKMAZni70EP6/mO53h/aQL4c=;
	b=fykUQhpI62RdAEatBYXu5OiAoGkueH+NYexqovwrmodxcpy9EwYXEufjVWLFXyqzbD
	04M/cPfHHaLgJarHhp/i0xDHTLPix2InbfAk1OzkpbmoxOd3hfEiLHl//lxmEZb/+eNa
	LMgCRYANuvY/G/Z+AGFZKfw4OaCnpC/30Dznlop+55O51TlSuWzg1+gmuwJbrMweRrs3
	3F2bC5o+DZINDK+o562Fmu7mVME+RlyJyfW2WzQhTIvAtprWcNuDlm0yPxHUKFPB9rp8
	wYd2XPgC4SqpVeyEV2/4DUoNAIhzrexHsWP3oa+TVlcEs0fAHqDOdWRejcWFa+89S3wy
	ENoQ==
X-Gm-Message-State: AKS2vOx9+btVii74Nk6dkHsgoNe6HTD7r4Rh+KNCw51EPfE86KbtfHft
	wMGK9SFaYqSrgqYww778BB2OcDMLmw==
X-Received: by 10.37.228.70 with SMTP id b67mr361804ybh.28.1498487082357; Mon,
	26 Jun 2017 07:24:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Mon, 26 Jun 2017 07:24:41 -0700 (PDT)
In-Reply-To: <CAMKF1sq6vXcOZDA7+4vaV5ixhFUPRs72fzssa0h6i6VkNu+iDw@mail.gmail.com>
References: <20170626053446.37959-1-raj.khem@gmail.com>
	<20170626053446.37959-5-raj.khem@gmail.com>
	<CAMKF1sq6vXcOZDA7+4vaV5ixhFUPRs72fzssa0h6i6VkNu+iDw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Jun 2017 16:24:41 +0200
Message-ID: <CA+chaQdgkooaK3k_K=KVRQ+NK8S6-=WbGO8OfP7LCcg0BgY8GQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 5/7] hwloc: Inherit pkgconfig
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
X-List-Received-Date: Mon, 26 Jun 2017 14:24:41 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

thanks for info, for some reason I haven't seen hwloc failing without
pkgconfig before.

So when it failed to apply without the PACKAGECONFIG one, I just dropped it
assuming that it's not needed now.

Will try to remember to cherry-pick this next time I'm updating master-next.

Regards,

On Mon, Jun 26, 2017 at 4:22 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Hi Martin
>
>
> I see that you did not pick this into master-next but this patch is
> independent
> of the other patch where you have comments to address. Although they
> address same package this patch is not depening on that patch, however
> that patch does depend on this one. So you can cherry pick this one
> regardless.
>
> On Sun, Jun 25, 2017 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > Fixes
> > | checking for LIBXML2... cannot check without pkg-config
> > | configure: WARNING: --enable-libxml2 requested, but libxml2 was not
> found
> > | configure: error: Cannot continue
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> > index 16cd507e6..1194af0d2 100644
> > --- a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> > +++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> > @@ -11,7 +11,7 @@ SRC_URI = "https://www.open-mpi.org/
> software/${PN}/v1.11/downloads/${BP}.tar.bz2
> >  SRC_URI[md5sum] = "96c34136ff416d2b13a7821c27477bed"
> >  SRC_URI[sha256sum] = "95d80286dfe658a3f79e2ac9069878
> 2bb36e5504f4bac1bba2394ba14dbbad24"
> >
> > -inherit autotools
> > +inherit autotools pkgconfig
> >
> >  DEPENDS += "ncurses udev zlib"
> >  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux',
> 'libselinux', '', d)}"
> > --
> > 2.13.1
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

