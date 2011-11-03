Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RLtan-0006ff-Vc
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 10:28:14 +0100
Received: by ggnj1 with SMTP id j1so1052832ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2011 02:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=wtG7J0+3qD/amdnqOeb4W1NSf80f7u1fFX24W/o+A9U=;
	b=BWjolynnps84kMShm/K6Eft/N2fQGiNxc9Bva+Lacwu478JsmJybzG3dcFbuXaSgts
	+IPcYYYwZ6nzaxKHBCuNFMM+kMiCNVYFd0eLy8BKWL1kSdmeeD9AQBKkDFFoF8I7Ua+f
	iMdo72y/mcc3g5WqZqatPgx4cgNQN6Px+N1PU=
MIME-Version: 1.0
Received: by 10.150.69.4 with SMTP id r4mr8543686yba.53.1320312124918; Thu, 03
	Nov 2011 02:22:04 -0700 (PDT)
Received: by 10.150.216.19 with HTTP; Thu, 3 Nov 2011 02:22:04 -0700 (PDT)
In-Reply-To: <CAAQYJAt5ApbYCi9f_mNgAN7WjEEZZyAdgPkfhwxjVsePf+VaqA@mail.gmail.com>
References: <1318807611-16837-1-git-send-email-andrea.adami@gmail.com>
	<1318807611-16837-2-git-send-email-andrea.adami@gmail.com>
	<2904446.7I7DN7edGu@helios> <j8tjq1$o2$1@dough.gmane.org>
	<CAAQYJAt5ApbYCi9f_mNgAN7WjEEZZyAdgPkfhwxjVsePf+VaqA@mail.gmail.com>
Date: Thu, 3 Nov 2011 10:22:04 +0100
Message-ID: <CAAQYJAv=30cuGTS0rS6bYC=xMjcmxReDH=uyeV+ehBUCbuAaBA@mail.gmail.com>
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
X-List-Received-Date: Thu, 03 Nov 2011 09:28:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 3, 2011 at 10:09 AM, Andrea Adami <andrea.adami@gmail.com>wrote:

> On Thu, Nov 3, 2011 at 9:36 AM, Koen Kooi <koen@dominion.thruhere.net>wrote:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 02-11-11 22:00, Paul Eggleton schreef:
>> > On Monday 17 October 2011 01:26:50 Andrea Adami wrote:
>> >> * For some reasons when the cache is created root can still be ro *
>> >> and as solution you would be obliged to add 'rw' to your commandline.
>> >> * There are patches in openembedded-classic to correct this * (and
>> >> those are still pending for meta-oe). * Until a solution is found
>> >> disable the creation of the device cache on boot.
>> >>
>> >> Signed-off-by: Andrea Adami <andrea.adami@gmail.com> ---
>> >> recipes-core/udev/udev/default      |    4 ++++
>> >> recipes-core/udev/udev_173.bbappend |    1 + 2 files changed, 5
>> >> insertions(+), 0 deletions(-) create mode 100644
>> >> recipes-core/udev/udev/default create mode 100644
>> >> recipes-core/udev/udev_173.bbappend
>> >>
>> >> diff --git a/recipes-core/udev/udev/default
>> >> b/recipes-core/udev/udev/default new file mode 100644 index
>> >> 0000000..ba2867e --- /dev/null +++ b/recipes-core/udev/udev/default @@
>> >> -0,0 +1,4 @@ +# Default for /etc/init.d/udev + +# Uncomment this out
>> >> to enable device cache +#DEVCACHE="/etc/dev.tar" diff --git
>> >> a/recipes-core/udev/udev_173.bbappend
>> >> b/recipes-core/udev/udev_173.bbappend new file mode 100644 index
>> >> 0000000..72d991c --- /dev/null +++
>> >> b/recipes-core/udev/udev_173.bbappend @@ -0,0 +1 @@
>> >> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>> >
>> > I think this is going to cause problems for distros such as Angstrom
>> > that enable this layer without always using it. Can we just disable the
>> > dev cache for the machines in meta-handheld?
>>
>> Or get with the program and use udev 174 with systemd, no need for a
>> device
>> cache in that case!
>>
>> regards,
>>
>> Koen
>>
>
> Sure, this is the future...but for now oe-core doesn't implement systemd
> as default.
>
> Until then, I think we should have sane defaults allowing to build with
> just oe-core + meta-oe + meta-handheld even without distro layers.
>
> Regards
>
> Andrea
>


Oh, I forgot to say that's unfortunate oe-core is still on udev_164.
Probably they have been scared by the note "# udev 169 and up require
kernel 2.6.36 for ARM:"

Is this still a problem? Maybe we should insist on the oe-core list and try
to unify the recipes.

Regards

Andrea

