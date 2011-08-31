Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QylZh-000475-Mr
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 16:15:31 +0200
Received: by vwe42 with SMTP id 42so596401vwe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 07:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=sfm/VmyDMM/NF1j6DPJEGEyg6QkOVOHBXlb7ky3JY/Q=;
	b=NP4PTQXCLPk/WFqoc8P3IUDIm7ktmf7EQkMRLEViij0CUyH4rpeFeyo4TjUd/GUckC
	fFWvMnZqm/ZB7KjCdrNfOoz5qt13QkF6rdhJa8zxMtBeiXmBrGdlptUTl2crECtgOTxZ
	BBAbXjAq1jyjR7fQMJKd5VquSzAyrA++iLb54=
MIME-Version: 1.0
Received: by 10.220.107.5 with SMTP id z5mr68613vco.176.1314799831842; Wed, 31
	Aug 2011 07:10:31 -0700 (PDT)
Received: by 10.220.188.65 with HTTP; Wed, 31 Aug 2011 07:10:31 -0700 (PDT)
In-Reply-To: <j3lba3$7a9$1@dough.gmane.org>
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<20110831115548.GB3273@chargestorm.se>
	<j3l8ni$kr3$1@dough.gmane.org>
	<201108311327.01907.paul.eggleton@linux.intel.com>
	<62BBB5B2-363D-49EA-AD5D-B67123C0F908@dominion.thruhere.net>
	<20110831124339.GA19917@chargestorm.se>
	<j3lba3$7a9$1@dough.gmane.org>
Date: Wed, 31 Aug 2011 16:10:31 +0200
Message-ID: <CACW_hTZ1TVELWXaD3SnnMixMud-4MD85L1RmhpwBuV3LQR=V1g@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: `PR = "r0"`: Add or not to add?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Aug 2011 14:15:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/8/31 Koen Kooi <koen@dominion.thruhere.net>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 31-08-11 14:43, Anders Darander schreef:
>

[...]

>
> Just curious (and it might convince me and others) what issues have PR =
> "r0" caused in .dev?

The most recent one in .dev was xorg .inc files. Some recipes had PR, some
> didn't, and some had INC_PR. In this specific case there should have been
> only one PR (or INC_PR) in the .inc.
>
> And of course the good old "add PR=r0 to the .inc, making older recipes go
> backwards" thing.
>
> In OE-core/meta-oe the most recent annoyance were the gcc recipes, which
> now
> finally have a centrally managed PR.
>
> No situation is perfect, but my *personal* experience is that not adding
> PR=r0 is *less* annoying than adding it.
>
> The big difference between classic OE and the OE-core way is that things
> are
> a lot cleaner to start with, so PR=r0 might be safer to use, but I'd like
> to
> err on the side of caution.
>
> If you all feel really strongly about PR=r0 I'd advice you to send patches
> to add it to recipes that need it in OE-core and after those get accepted
> send patches for the recipes in meta-oe.
>
>
inc files are to some extend evil. If an .inc file changes all recipes
depending on it should be rebuild and retested. In an ideal world this
happens, in a real world not.
Also if there is only one version of a recipe .inc does not really bring
much. It mostly complicates things as one now has two places to look at.
(apart from the fact that they allow introducing errors like the PR=r0 in
inc file).
Of course there are places where inc files have their merits. Excellent
example is gcc. However on quite some places they are not too useful (if I
recall the oe-core policy is to   (ideally) have only one or at most two
versions of a recipe)

Frans

