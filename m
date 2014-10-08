Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id A5EA960167;
	Wed,  8 Oct 2014 14:54:21 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id gq15so8513794lab.26
	for <multiple recipients>; Wed, 08 Oct 2014 07:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=NV3wKd+Yvl+IgKl0locIj5C36W+TrbyUQ/pOeZk4HHM=;
	b=UJE8WNomF/BmN5kTxXdaho80I9pBF6+hDL/B3Q5Gofn+bK9wnE5Q8UzsGu2XdypAH5
	jyqT03YKDPezb4wVqUEagw8dfswePuuhMLNH2eYRmv7hVWLL/sUah4i9rBZcdc20FIKG
	doh13A3bZSFpGP2sK/MvT+pCQmYLkT1h+vtZMDhIiOGoyEbYcH76a9+qMElyjvfhpexj
	XWvD0IN4w4p22PNAhMLzhCQVbntLs/gHpHnClIi/LJkIvQA46lDXyTgxTbduNDdutlMx
	e+sz0isVQm9yT5bG7by1+2OE57MhNNSvRiDIZ28gPHGFEEJSrScGIQNUtxvmMNMH7AHa
	ZApQ==
X-Received: by 10.152.197.2 with SMTP id iq2mr11845959lac.87.1412780062717;
	Wed, 08 Oct 2014 07:54:22 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.97.200 with HTTP; Wed, 8 Oct 2014 07:54:02 -0700 (PDT)
In-Reply-To: <CAJTo0LbmRCab4DjtOwZ92mg_ZUeE0Asic8+KVtQW3y-_j8JjcA@mail.gmail.com>
References: <CAJTo0LacXy5_wf39pX9z078RD0vU0BpvWsNTdZqcr6dMobpXWw@mail.gmail.com>
	<CAJTo0LbmRCab4DjtOwZ92mg_ZUeE0Asic8+KVtQW3y-_j8JjcA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 8 Oct 2014 07:54:02 -0700
X-Google-Sender-Auth: iY2yaKnhbu7r_3-ZYxmMoYyp-JE
Message-ID: <CABcZANm1swqtnS4ncw75+sJH=Zkm7iuaNnKRjpk=eTCY8hUF_g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] RFC: automatic -dbg splitting
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
X-List-Received-Date: Wed, 08 Oct 2014 14:54:23 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 7, 2014 at 3:25 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 11 June 2014 20:10, Burton, Ross <ross.burton@intel.com> wrote:
> > I know there are recipes floating around that have multiple -dbg
> > packages, but I can't see a great rationale for that.  I also can't
> > see a reason why you'd want debug objects/sources outside of the -dbg
> > package, or something that wasn't a debug object or source inside the
> > -dbg package.
>
> So last night I resurrected this patch and did an oe-core world build
> with a small change to clear FILES_${PN}-dbg before automatically
> populating it.  The results were interesting and invalidated my two
> assumptions:
>
> 1) Adding files that are not debug symbols or sources to -dbg packages
> is done: both gcc and glib add Python code for gdb to execute and the
> -dbg package is the obvious location for it.
>
> 2) A recipe having multiple -dbg packages is sensible for eg Qt4,
> which if all the debug information is put into a single package
> results in a 367M package, expanding to 1.1G on disk.
>
> So I've a proposed change to the logic:
> * If there are multiple names in PACKAGES that match *-dbg, then don't
> do automatic debug packaging
> * The default value for FILES_PN-dbg in bitbake.conf should be empty,
> and recipes can extend it as required (e.g. gdb Python scripts) with
> the automatic debug packaging extending FILES_PN-dbg.


For what it's worth, this behavior seems quite sane to me.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

