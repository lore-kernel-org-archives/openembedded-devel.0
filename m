Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1513F78207
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 21:41:04 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id s127so3433794ywg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 14:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/p/Je8LgBXrUBQzlokQxws1oMT3QjYxX4JlDx0b8dyM=;
	b=lp8apV4gJpih5F18kTCPhJHN4aziYbdhncOECqEjoslZFb7sHX3LUzGjkyT/E9S5Si
	DpUU3TSh6H9kF6iRzeQ/MdI6FgUDi/y8RV+UUSzY6Mz69pTi5RYTYATXuvI1FfeDsy4k
	wgV0NmieUbZLSYbfp8iMBX2gVxUZjV1Q3YEwesqGQPA1J/C3x4YjKCwogZvj83cu9/9d
	iHiqQGnBny1lCRWphlOzyZjtpwZojPg96KPRoNf7DXlMfEfFvMtNki1/K2gSWJa4spqt
	S5yVzIQfFV9OQII4fZOPrEsvvR+iWSwl9yQ7THy4kgGMHImtiZUBwhEV04WjIKaKqZwp
	IZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/p/Je8LgBXrUBQzlokQxws1oMT3QjYxX4JlDx0b8dyM=;
	b=UNkfMBmzGNIpZLZ7xYBH2PFw2I8/0YvBqjx8g34ffsP4ZDPDrpOklm0nKFEiKbQvqZ
	hKJSjeWBKbVpizCggzZV16MzmS5V3RFggzrVnWB9IuX3tEIt1CFbqw2H/WftvKz3qwgF
	vrdkZrzN34z+3VIMC5agppWGvxDGq4he8EVuMmnuZruWtW8YK2+j6/kI393dAoC2YvMV
	CpDr0f7WL/Q3veZCQBw0IUlSroPnX0nfkGbpV6ONejydW1iIMwiCYRrOQE8Q8Wq/ZHWZ
	LB1EwiYFPbxbT0ekTjWStcFgjbRAtLk95B9exHg7+htyWVLYL/CvcDYl9tu/DqXtHmn+
	9x3Q==
X-Gm-Message-State: AKS2vOyq0qgfwCvnaaK6cfD6PATHcHdm1QVTjvnMXZIN9smW8cSv5EGg
	D9STeX81enme/wyq7a5Qm8adNfnnGg==
X-Received: by 10.129.55.149 with SMTP id e143mr7318230ywa.33.1498254065966;
	Fri, 23 Jun 2017 14:41:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Fri, 23 Jun 2017 14:41:05 -0700 (PDT)
In-Reply-To: <20170623211933.GB28053@denix.org>
References: <1497932912-30016-1-git-send-email-liu.ming50@gmail.com>
	<20170622191849.GS28053@denix.org> <20170623211933.GB28053@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 23 Jun 2017 23:41:05 +0200
Message-ID: <CA+chaQeXfn18+4zHth7_enazNF9hh3idLT+V7YvJLPH+5p5cQw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Ming Liu <liu.ming50@gmail.com>
Subject: Re: [meta-qt5] [PATCH] qttools: DEPENDS on icu
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
X-List-Received-Date: Fri, 23 Jun 2017 21:41:05 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, I've seen both e-mails. I'm waiting for response from author, then
I'll revert it in master and pyro branches.

On Fri, Jun 23, 2017 at 11:19 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> Martin,
>
> Were you able to look into this yet? I didn't copy you directly at first,
> so
> not sure if you missed it...
>
>
> On Thu, Jun 22, 2017 at 03:18:49PM -0400, Denys Dmytriyenko wrote:
> > On Tue, Jun 20, 2017 at 06:28:32AM +0200, liu.ming50@gmail.com wrote:
> > > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> > >
> > > This fixes a following QA issue:
> > > | QA Issue: nativesdk-qtbase-tools rdepends on nativesdk-libicui18n,
> but it isn't a build dependency.
> > > | QA Issue: nativesdk-qtbase-tools rdepends on nativesdk-libicuuc, but
> it isn't a build dependency.
> > > | QA Issue: nativesdk-qtbase-tools rdepends on nativesdk-libicudata,
> but it isn't a build dependency.
> >
> > It seems there's inconsistency here between errors above referring to
> > nativesdk-qtbase-tools and the change below made to qttools instead of
> > qtbase!
> >
> > I wonder if this fix was not included by the author:
> >
> > https://github.com/meta-qt5/meta-qt5/commit/
> ff073f04109900fc07bf81e2f1df63c626caf342
> >
> > Just to double-check, I just built nativesdk-qttools using meta-qt5 w/o
> this
> > patch and I don't see the above QA errors.
> >
> > --
> > Denys
> >
> >
> > > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> > > ---
> > >  recipes-qt/qt5/qttools_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/
> qttools_git.bb
> > > index 5c0f51c..1108390 100644
> > > --- a/recipes-qt/qt5/qttools_git.bb
> > > +++ b/recipes-qt/qt5/qttools_git.bb
> > > @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = " \
> > >
> > >  inherit ptest
> > >
> > > -DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
> > > +DEPENDS += "qtbase qtdeclarative qtxmlpatterns icu"
> > >
> > >  SRC_URI += " \
> > >      file://run-ptest \
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

