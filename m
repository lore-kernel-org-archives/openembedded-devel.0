Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id CA32E6B478
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 07:15:05 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id 17so3624681iea.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 00:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=P7RJyhaYmT3y190o3jbVL/QZYT+mcu34idHK7ZrRSlc=;
	b=d1dqDbBaIL/47RS5PHHhsDFMFMWddlGxBpfIbkfbyDRqwHu8VTTjdDCQdk1NvllAHe
	o4cHiYvtt8eiibvYYtMY04nCrCHmVM8IcYGxbA1/6EOrPG3yjd3ztX3WuKyup6l3I3/N
	UtYoJcqPuwGTf8NO86MkdmsB9wZ/9Flp0G2d0yQS04HUtX9Uxg/5JzVPHM5kf64/geEz
	dV6lx3Pq0c0emrI64a90xNNqTXMj9hGFxlEA1B4LE5QPsCnIQLsr48+lLFbBEfeXqfK2
	YoZHj8lRRPUXxukItAvTAwPRv99bDKtW6LefmApzzYw5e9JpH009YJCx7BlUQeCr24r9
	9kKg==
MIME-Version: 1.0
X-Received: by 10.43.91.10 with SMTP id bk10mr3836570icc.86.1376032506263;
	Fri, 09 Aug 2013 00:15:06 -0700 (PDT)
Received: by 10.50.216.137 with HTTP; Fri, 9 Aug 2013 00:15:06 -0700 (PDT)
In-Reply-To: <CAAqcGHkBfysXdfJMSvLquAAtKJQ14Erfohj9pMTMaa865Ep4yA@mail.gmail.com>
References: <BE65E360-0A4E-432B-9020-A3BCA9E05AF9@gmail.com>
	<CAGNsrLASK8YrYCgibnA-tZR5cecOzr_WW41QjB87b+E1rY-QLw@mail.gmail.com>
	<C3C519DD-1E4E-49C0-8C6C-B50BFFA89A5C@gmail.com>
	<CAAqcGHkBfysXdfJMSvLquAAtKJQ14Erfohj9pMTMaa865Ep4yA@mail.gmail.com>
Date: Fri, 9 Aug 2013 02:15:06 -0500
Message-ID: <CAMKF1sqp4j=_OEW0trRtRkCkVbyODyp1WSH7Zfvh0uBkiuGiJw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Riku Voipio <riku.voipio@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: parsing errors with angstrom/meta-linaro
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
X-List-Received-Date: Fri, 09 Aug 2013 07:15:05 -0000
Content-Type: text/plain; charset=UTF-8

On Thursday, August 8, 2013, Riku Voipio wrote:

> Hi,
>
> The problem is that git.linaro.org is not providing good service and
> often fails to respond to git requests. When bitbake fails to fetch
> the latest git, it is unable to expand AUTOREV, and throws in the
> towel. You can reproduce the issue easily with any recipe that has a
> git:// url and AUTOREV by disconnecting the OE build machine from the
> network.
>
> Could we make AUTOREV to expand to latest version found from
> downloads/git2 in case the git fetch fails?
>
>

I would suggest to not use autorev if git servers are flaky
Secondly for external recipes its bad practice since it defeats
BB_NO_NETWORK
Feature which many use



> Riku
>
>
>
> On 8 August 2013 20:28, Khem Raj <raj.khem@gmail.com <javascript:;>>
> wrote:
> >
> > On Aug 8, 2013, at 9:00 AM, Fathi Boudra <fathi.boudra@linaro.org<javascript:;>>
> wrote:
> >
> >> Hi,
> >>
> >> On 8 August 2013 08:48, Khem Raj <raj.khem@gmail.com <javascript:;>>
> wrote:
> >>> Hi
> >>>
> >>> Often I see this error when parsing angstrom-next, has anyone seen
> something similar or delved into the reason behind
> >>> it ?
> >>>
> >>> NOTE: Started PRServer with DBfile:
> /builds1/angstrom/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 45141, PID:
> 6728
> >>> Parsing recipes...ERROR: ExpansionError during parsing
> /builds1/angstrom/sources/meta-linaro/meta-aarch64/recipes-kernel/linux/
> linux-linaro_git.bb: Failure expanding variable SRCPV, expression was
> ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fetcher
> failure: Fetch command failed with exit code 128, output:
> >>> fatal: read error: Connection reset by peer
> >>>
> >>> ERROR: Command execution failed: Exited with 1
> >>>
> >>> Summary: There were 2 ERROR messages shown, returning a non-zero exit
> code.
> >>
> >> I'm seeing a similar issue[1] on another recipe (libhugetlbfs[2] for
> instance).
> >> It's worth mentioning:
> >> - only on my local machine (it doesn't happen on daily builds using
> >> EC2 instances)
> >> - also from meta-linaro/meta-aarch64
> >> - also code pull from git, using SRCPV/AUTOREV
> >>
> >> [1] Failure expanding variable SRCPV, expression was
> ${@bb.fetch2.get_srcrev(d)}
> >> [2]
> https://git.linaro.org/gitweb?p=openembedded/meta-linaro.git;a=blob;f=meta-aarch64/recipes-extended/libhugetlbfs/libhugetlbfs_2.16.bb;hb=master
> >
> > if I pull out meta-aarch64 from the bblayers all works ok. I don't hit
> this error at all
> > so somethins is fishy with this layer
> >
> >>
> >> Cheers,
> >> Fathi
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org <javascript:;>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

