Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2561660602
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 20:34:18 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id s29so10842671lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 13:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=3PzwgGef8nmJ5mlydDSN9DJg3itnHXKqkUIc1ODN0FI=;
	b=hnAxR9wlvw6kvey4lekX/FHEhfij7quyujyu5Rb9eYvbAxvwZD9JhoT0SYWJorRPEQ
	S3C4AFzvypEAq+IiPZ2RlMwK4qA3aAjW2kK9rK6ZM+EqiWJ7PmAu7rvTwFZacibvQXu0
	ovPR9qNWEDRaVQ9fK8Nwasyw4VTabW28e8LQhx4uH9UMwbzAF5A6/z9LXAT1naiTLXLq
	jp8xJOb+vkgwgBdA7623smxdQu+NuQe70mAhVWBcUhKW+msdiNBHIGzH7SVPp9o647cn
	LqY6eZv+aXwsu+Vdrd9D+VVlMPvv3S8cBE64rAy0fdr3sfeIwd63yFGbImfdyGkM9Rqy
	yOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=3PzwgGef8nmJ5mlydDSN9DJg3itnHXKqkUIc1ODN0FI=;
	b=GGj7anKujyZ3lIcJE7K2oPgKRZxTr17IJDdP+cN8yfQw4mMCbxbzOI6EvZ6NvwgZIi
	r5r29Jf7UKG5W+hMT8RBPznXn601+q+A4aVoWKpniiqrzD4zPzwM/cnRc6Amr72SLFLb
	+O1sbDuAehw+bvK5OxpNCOg42zZzsjgK14CKxpBzbLSGI/iKHs7QYYa+2bBjzd2RGKTK
	j6KNhU5VBBgTPkOJ1vTQ9sLIiiYURd01mwEBprMPt4qctFH1QAgfOquIOb2ttAuRvNdW
	ISCn8ZdQf90/cYA59q0ZDAllF9db5iBT1pKOtPiGNhfi6wN/UFKB4/nO9rTChWiK0+tF
	woYQ==
X-Gm-Message-State: AA6/9RnFX31eV3STTys84U7CbRJCan/OgndEOXg/UvxUUT8780KRTHRo4UUkhl4vCae/LKNrtWKFP4TlGQ4t6w==
X-Received: by 10.28.54.193 with SMTP id y62mr14972465wmh.96.1474922058872;
	Mon, 26 Sep 2016 13:34:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.130.68 with HTTP; Mon, 26 Sep 2016 13:34:18 -0700 (PDT)
In-Reply-To: <CAMKF1so4gZ9zYqS17E-xRq0U-bu27aiv6v_EiR2zc3OqCgDSYg@mail.gmail.com>
References: <1474634029-22896-1-git-send-email-mike.looijmans@topic.nl>
	<CAMKF1srhhYfYO69noEU30+66yDX8cLNbEB7tpJhkubKwjPoevw@mail.gmail.com>
	<57E69552.9040209@topic.nl>
	<CAMKF1so4gZ9zYqS17E-xRq0U-bu27aiv6v_EiR2zc3OqCgDSYg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Sep 2016 22:34:18 +0200
Message-ID: <CA+chaQcftFerFC0S9_+XwsZqZ6EAMtdfOjGj5yjoy2mut9wO0Q@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] phytool: Add recipe
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
X-List-Received-Date: Mon, 26 Sep 2016 20:34:21 -0000
Content-Type: text/plain; charset=UTF-8

2 more issues:

WARNING: phytool-1.0.1-r0 do_populate_lic: Could not copy license file
phytool/1.0.1-r0/git/COPYING to
phytool/1.0.1-r0/license-destdir/phytool/COPYING: [Errno 2] No such
file or directory: 'phytool/1.0.1-r0/git/COPYING'
ERROR: phytool-1.0.1-r0 do_populate_lic: QA Issue: phytool:
LIC_FILES_CHKSUM points to an invalid file:
phytool/1.0.1-r0/git/COPYING [license-checksum]
NOTE: recipe phytool-1.0.1-r0: task do_populate_lic: Succeeded
...

NOTE: recipe phytool-1.0.1-r0: task do_package_qa: Started
ERROR: phytool-1.0.1-r0 do_package_qa: QA Issue: No GNU_HASH in the
elf binary: 'phytool/1.0.1-r0/packages-split/phytool/usr/bin/phytool'
[ldflags]
ERROR: phytool-1.0.1-r0 do_package_qa: QA Issue: No GNU_HASH in the
elf binary: 'phytool/1.0.1-r0/packages-split/phytool/usr/bin/phytool'
[ldflags]
ERROR: phytool-1.0.1-r0 do_package_qa: QA run found fatal errors.
Please consider fixing them.
ERROR: phytool-1.0.1-r0 do_package_qa: Function failed: do_package_qa


On Mon, Sep 26, 2016 at 9:31 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Sep 24, 2016 at 8:01 AM, Mike Looijmans <mike.looijmans@topic.nl>
> wrote:
> > On 23-09-16 20:33, Khem Raj wrote:
> >>
> >> On Fri, Sep 23, 2016 at 5:33 AM, Mike Looijmans <
> mike.looijmans@topic.nl>
> >> wrote:
> >>>
> >>> A nice tool to directly read, write and interpret ethernet PHY data.
> >>> Very useful when debugging PHY or MDIO problems, which ethtool does
> >>> not do.
> >>>
> >>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> >>> ---
> >>>   meta-networking/recipes-support/phytool/phytool.bb | 14
> ++++++++++++++
> >>>   1 file changed, 14 insertions(+)
> >>>   create mode 100644 meta-networking/recipes-support/phytool/
> phytool.bb
> >>>
> >>> diff --git a/meta-networking/recipes-support/phytool/phytool.bb
> >>> b/meta-networking/recipes-support/phytool/phytool.bb
> >>> new file mode 100644
> >>> index 0000000..9d541b7
> >>> --- /dev/null
> >>> +++ b/meta-networking/recipes-support/phytool/phytool.bb
> >>> @@ -0,0 +1,14 @@
> >>> +SUMMARY = "PHY interface tool for Linux"
> >>> +LICENSE = "GPLv2"
> >>> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae1
> 9f"
> >>> +
> >>> +PV = "1.0.1"
> >>> +SRCREV = "1a3ea62a218206e9faf3b27fb5d01c85692024c8"
> >>> +SRC_URI = "git://github.com/wkz/phytool.git"
> >>> +
> >>> +S = "${WORKDIR}/git"
> >>> +
> >>> +do_install() {
> >>> +       install -d ${D}${prefix}/bin
> >>
> >>
> >> perhaps use base_bindir here
> >
> >
> > The makefile installs to $PREFIX/bin so I deliberately put the same
> folder
> > in the recipe (the makefile doesn't create the directory). If anyone
> changes
> > $bindir the install will fail.
>
> I see the logic,  if you dont want to use bitbake variables then perhaps
> its
> good to add a comment to explain why it was not done
>
> >
> >>
> >>> +       oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' install
> >>> +}
> >>> --
> >>> 1.9.1
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> > --
> > Mike Looijmans
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
>

