Return-Path: <msteveharrison@gmail.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by mail.openembedded.org (Postfix) with ESMTP id 71D316D33A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 08:12:03 +0000 (UTC)
Received: by mail-vb0-f54.google.com with SMTP id q12so1117931vbe.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TkNI8Yjy6iN8exaC0SCWcNaiDAt5dT1MBx28jgN+aPA=;
	b=avzWX66UAAh5bH0pdvrBFKwQ9wjppw5zxZ3garnw9r83tXuSXjFFjHtwPUacP/eHrz
	J2LiZZ+Wqyjrg8tzr61/v9TfOXj7bkNtcwYbId7hgMbHeVzhM1oUzsbHwLeTkOIBcoaX
	7lIiM9upTn7ebRf/zJwUWu6xscjN08KIXi7Nbv3vjFu4m2vmqYQj15KETt8+dYFSVS/3
	wNOLNxUpEOUmgM7/+YyXkcgN3oDwShZA7scg8REvCSC0fNCSdiwDrRIUsOifz6tcg+Ue
	y2OXaH7NLH07f0kLIFPaG7AFu4NQVGBbFDA/ZUpIWPK/K3x0eIIO3IgWJIp1QiG8Salb
	s/Iw==
MIME-Version: 1.0
X-Received: by 10.58.38.200 with SMTP id i8mr769694vek.6.1382602325027; Thu,
	24 Oct 2013 01:12:05 -0700 (PDT)
Received: by 10.220.75.72 with HTTP; Thu, 24 Oct 2013 01:12:04 -0700 (PDT)
In-Reply-To: <5268CEB6.7030401@balister.org>
References: <CAGJTLJ6MLtO_neHZq7QoER7Vs4JCLnfXZbxHeKhtV53V2+PDkw@mail.gmail.com>
	<52685AB2.2060606@balister.org>
	<CAGJTLJ5z=8Wjj2WOzid3MuaJEErc_Qja93bk5Uponw-aXwcxQA@mail.gmail.com>
	<5268CEB6.7030401@balister.org>
Date: Thu, 24 Oct 2013 01:12:04 -0700
Message-ID: <CAGJTLJ6Sszu7NjAWLf4bW=mxxWq7=Rhvqc5=-fSQ5_Ftq6eEnA@mail.gmail.com>
From: Stephen Harrison <msteveharrison@gmail.com>
To: Philip Balister <philip@balister.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Issues Building Numpy
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
X-List-Received-Date: Thu, 24 Oct 2013 08:12:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Great, I tried uninstalling those libraries and it seems to resolve the
problem!


On Thu, Oct 24, 2013 at 12:39 AM, Philip Balister <philip@balister.org>wrote:

> On 10/24/2013 12:29 AM, Stephen Harrison wrote:
> > Hi,
> >
> > Yes I do have these libraries installed on the build machine. Are you
> > saying I need to uninstall them?
>
> Or fix the numpy build to not find them on the build machine :)
>
> Philip
>
> >
> >
> >
> >
> > On Wed, Oct 23, 2013 at 4:24 PM, Philip Balister <philip@balister.org
> >wrote:
> >
> >> Do you have atlas, blas etc installed on the build machine. As I recall
> >> the numpy recipe is weak and tends to finds things installed on the
> >> build machine.
> >>
> >> Philip
> >>
> >> On 10/23/2013 08:22 PM, Stephen Harrison wrote:
> >>> Hi,
> >>>
> >>> I am trying to build an image for the Zedboard (ARM) platform. I can't
> >> seem
> >>> to build the Numpy package and I can't quite understand why.
> >>>
> >>> I've attached the compile log. I've noticed there are many complaints
> >> about
> >>> ATLAS, BLAS etc not being available and other errors about executables
> >>> being in the wrong format.
> >>>
> >>> Any help would be much appreciated.
> >>>
> >>> Regards,
> >>>
> >>> Stephen
> >>>
> >>>
> >>>
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
>

