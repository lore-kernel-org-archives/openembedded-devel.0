Received: from [209.85.134.188] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1J4dfY-0004O4-Gm
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2007 15:43:40 +0100
Received: by mu-out-0910.google.com with SMTP id w8so3775863mue.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2007 06:38:45 -0800 (PST)
Received: by 10.82.157.6 with SMTP id f6mr791336bue.1.1197988725106;
	Tue, 18 Dec 2007 06:38:45 -0800 (PST)
Received: by 10.82.120.17 with HTTP; Tue, 18 Dec 2007 06:38:45 -0800 (PST)
Message-ID: <74d0deb30712180638y20795870o9e1d0b688298658f@mail.gmail.com>
Date: Tue, 18 Dec 2007 15:38:45 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: "Paul Sokolovsky" <pmiscml@gmail.com>
In-Reply-To: <978793792.20071218133500@gmail.com>
MIME-Version: 1.0
References: <E1J4SUo-0006ZZ-Ov@linuxtogo.org>
	<74d0deb30712180217q5cb2c911l8a61567b5511b9d@mail.gmail.com>
	<978793792.20071218133500@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev PDA-like machines with card slots: Enable "vfat" feature.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2007 14:43:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Dec 18, 2007 12:35 PM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
> Hello pHilipp,
>
> Tuesday, December 18, 2007, 12:17:27 PM, you wrote:
>
> > On Dec 18, 2007 3:47 AM, pfalcon commit
> > <openembedded-commits@lists.openembedded.org> wrote:
> >> PDA-like machines with card slots: Enable "vfat" feature.
> >> * FAT-formatted cards are commodity, it's expectable them to be supported OOB.
>
> > A machine feature "vfat" sounds strange. I think machine features
> > should be about the hardware capabilities.
>
>   Yep, with this common sense in mind I quickly replied to Rod that
> introducing it wouldn't help with "bloating" issue. Well, it instead
> COMBINED feature.

Combined or not, I think vfat has no place in the machine features list.
The same goes for ext2 IMHO, and having hdparm in task-base-ext2 is even worse.
Shouldn't there be a MACHINE_FEATURE hdd or ide/ata/pata/sata/scsi instead?
The problem is that there is no easy way to ask for "X in
MACHINE_FEATURE and Y in DISTRO_FEATURE". COMBINED_FEATURES obviously
only supports "X in both".

> >  Unfortunately I don't have
> > a proposal for a good name, but I'd prefer something like "cardslot"
> > or some better generic term for SD/CF/MemoryStick/etc. capability.
> > Then the distro can decide whether that means to add vfat support or
> > ext2 or gnome-volume-manager or some fancy card formatting GUI app.
>
> It's of course not about just name, but about feature processing
> logic.

Good.

> Current COMBINED_FEATURES mechanism is at least very easy to
> understand and provides great deal of detailed flexibility.

So now that we have the easy method implemented, let's strive for a correct one.
I'd say vfat as other file systems should be a distro-only feature,
cardslot (or "removablestorage") a machine-only one:

"vfat" in DISTRO_FEATURES and "cardslot" in MACHINE_FEATURES --> task-base-vfat
"ext2" in DISTRO_FEATURES and ("cardslot" in MACHINE_FEATURES or "hdd"
in MACHINE_FEATURES) --> task-base-ext2 (without the hdparm
dependency)
"hdd" in MACHINE_FEATURES --> hdparm
etc.

regards
Philipp


