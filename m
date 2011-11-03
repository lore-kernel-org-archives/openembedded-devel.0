Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RLuJS-0001g0-GX
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 11:14:23 +0100
Received: by ggnj1 with SMTP id j1so1082344ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2011 03:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=HTqsQ8xjTz5ki7W8YCt/cBcxchrEiKL1VsIXnGFd0XI=;
	b=Eve/0MhHslCrBg63npEisiVeBmeBLJK2TxYSB0K+RagBYm6KjFrq9w4jJZTf66I9Hl
	+d9IR/0d6/7XG+IsB06UGwu64aQda2bES/Zw1X910MEq67YrbRRxNNck1xfTI7mWjLBq
	tzDyJpNtyvexUwIBCaupdBNKGUOHQEJrO1lls=
MIME-Version: 1.0
Received: by 10.150.144.4 with SMTP id r4mr8583059ybd.98.1320314893499; Thu,
	03 Nov 2011 03:08:13 -0700 (PDT)
Received: by 10.150.216.19 with HTTP; Thu, 3 Nov 2011 03:08:13 -0700 (PDT)
In-Reply-To: <j8tmm7$jfd$2@dough.gmane.org>
References: <1318807611-16837-1-git-send-email-andrea.adami@gmail.com>
	<1318807611-16837-2-git-send-email-andrea.adami@gmail.com>
	<2904446.7I7DN7edGu@helios> <j8tjq1$o2$1@dough.gmane.org>
	<CAAQYJAt5ApbYCi9f_mNgAN7WjEEZZyAdgPkfhwxjVsePf+VaqA@mail.gmail.com>
	<j8tmm7$jfd$2@dough.gmane.org>
Date: Thu, 3 Nov 2011 11:08:13 +0100
Message-ID: <CAAQYJAssViG3WZmX8Cphv=asYG7gfbu6wy0+-7QZ7FS1ihXwhA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-handheld][PATCH 2/3] udev: add bbappend and disable device cache as default.
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
X-List-Received-Date: Thu, 03 Nov 2011 10:14:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 3, 2011 at 10:25 AM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 03-11-11 10:09, Andrea Adami schreef:
> > On Thu, Nov 3, 2011 at 9:36 AM, Koen Kooi
> > <koen@dominion.thruhere.net>wrote:
> >
> > Op 02-11-11 22:00, Paul Eggleton schreef:
> >>>> On Monday 17 October 2011 01:26:50 Andrea Adami wrote:
> >>>>> * For some reasons when the cache is created root can still be ro
> >>>>> * and as solution you would be obliged to add 'rw' to your
> >>>>> commandline. * There are patches in openembedded-classic to
> >>>>> correct this * (and those are still pending for meta-oe). * Until
> >>>>> a solution is found disable the creation of the device cache on
> >>>>> boot.
> >>>>>
> >>>>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com> ---
> >>>>> recipes-core/udev/udev/default      |    4 ++++
> >>>>> recipes-core/udev/udev_173.bbappend |    1 + 2 files changed, 5
> >>>>> insertions(+), 0 deletions(-) create mode 100644
> >>>>> recipes-core/udev/udev/default create mode 100644
> >>>>> recipes-core/udev/udev_173.bbappend
> >>>>>
> >>>>> diff --git a/recipes-core/udev/udev/default
> >>>>> b/recipes-core/udev/udev/default new file mode 100644 index
> >>>>> 0000000..ba2867e --- /dev/null +++
> >>>>> b/recipes-core/udev/udev/default @@ -0,0 +1,4 @@ +# Default for
> >>>>> /etc/init.d/udev + +# Uncomment this out to enable device cache
> >>>>> +#DEVCACHE="/etc/dev.tar" diff --git
> >>>>> a/recipes-core/udev/udev_173.bbappend
> >>>>> b/recipes-core/udev/udev_173.bbappend new file mode 100644 index
> >>>>> 0000000..72d991c --- /dev/null +++
> >>>>> b/recipes-core/udev/udev_173.bbappend @@ -0,0 +1 @@
> >>>>> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >>>>
> >>>> I think this is going to cause problems for distros such as
> >>>> Angstrom that enable this layer without always using it. Can we
> >>>> just disable the dev cache for the machines in meta-handheld?
> >
> > Or get with the program and use udev 174 with systemd, no need for a
> > device cache in that case!
> >
> > regards,
> >
> > Koen
> >
> >
> >> Sure, this is the future...but for now oe-core doesn't implement
> >> systemd as default.
>
> Nor does it have udev 173. You can't argue that oe-core doesn't have
> something that's in meta-oe when you're already relying on meta-oe.
>

Heh, I'm 'unfortunately' obliged to include meta-oe even if I want to build
a core-image-minimal for the machines in meta-handheld.

The problem is there are two sets of udev recipes! There should be one,
only one layer containing core packages.

I understand this is problematic and that Angstrom is already testing
systemd, still we should focus and find a concrete proposal for merging
with oe-core asap!

Cheers
Andrea

