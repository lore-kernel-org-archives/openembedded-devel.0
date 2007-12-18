Received: from [64.233.182.189] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J4e08-0004gt-CZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2007 16:04:56 +0100
Received: by nf-out-0910.google.com with SMTP id h3so1270355nfh.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2007 06:59:59 -0800 (PST)
Received: by 10.86.74.15 with SMTP id w15mr3708020fga.9.1197989998708;
	Tue, 18 Dec 2007 06:59:58 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id y18sm8858745fkd.2007.12.18.06.59.56
	(version=SSLv3 cipher=OTHER); Tue, 18 Dec 2007 06:59:57 -0800 (PST)
Date: Tue, 18 Dec 2007 17:05:16 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1211397506.20071218170516@gmail.com>
To: "pHilipp Zabel" <philipp.zabel@gmail.com>
In-Reply-To: <74d0deb30712180638y20795870o9e1d0b688298658f@mail.gmail.com>
References: <E1J4SUo-0006ZZ-Ov@linuxtogo.org>
	<74d0deb30712180217q5cb2c911l8a61567b5511b9d@mail.gmail.com>
	<978793792.20071218133500@gmail.com>
	<74d0deb30712180638y20795870o9e1d0b688298658f@mail.gmail.com>
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 18 Dec 2007 15:04:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello pHilipp,

Tuesday, December 18, 2007, 4:38:45 PM, you wrote:

> On Dec 18, 2007 12:35 PM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
>> Hello pHilipp,
>>
>> Tuesday, December 18, 2007, 12:17:27 PM, you wrote:
>>
>> > On Dec 18, 2007 3:47 AM, pfalcon commit
>> > <openembedded-commits@lists.openembedded.org> wrote:
>> >> PDA-like machines with card slots: Enable "vfat" feature.
>> >> * FAT-formatted cards are commodity, it's expectable them to be supported OOB.
>>
>> > A machine feature "vfat" sounds strange. I think machine features
>> > should be about the hardware capabilities.
>>
>>   Yep, with this common sense in mind I quickly replied to Rod that
>> introducing it wouldn't help with "bloating" issue. Well, it instead
>> COMBINED feature.

> Combined or not, I think vfat has no place in the machine features list.
> The same goes for ext2 IMHO, and having hdparm in task-base-ext2 is even worse.
> Shouldn't there be a MACHINE_FEATURE hdd or ide/ata/pata/sata/scsi instead?
> The problem is that there is no easy way to ask for "X in
> MACHINE_FEATURE and Y in DISTRO_FEATURE". COMBINED_FEATURES obviously
> only supports "X in both".

  LOL. I did say I don't want to open up this Pandora box now ;-).
I'll leave this for you and Rod, he for example thinks that task-base
is in perfect shape ;-).

[]

> So now that we have the easy method implemented, let's strive for a correct one.
> I'd say vfat as other file systems should be a distro-only feature,
> cardslot (or "removablestorage") a machine-only one:

> "vfat" in DISTRO_FEATURES and "cardslot" in MACHINE_FEATURES --> task-base-vfat
> "ext2" in DISTRO_FEATURES and ("cardslot" in MACHINE_FEATURES or "hdd"
> in MACHINE_FEATURES) --> task-base-ext2 (without the hdparm
> dependency)
> "hdd" in MACHINE_FEATURES --> hdparm
> etc.

  Yeah! And we should add Prolog interpreter to do those inferences!
No, Prolog sucks, let's add Lisp. Let's do some AI in OE!

  Seriously, why don't we leave that for some new year and clean up
real dirtiness now and polish frontyard instead?

  And if you ask for discussion, then I hope idea behind the irony
above is clear: all that would add entities without real necessity and
our ability to handle them. What was the aim of task-base
introduction? To build images both full-featured and efficient in
terms size. Does this work? Yes, and as pointed out by Koen, we actually
should start to look for bigger inefficiencies as the image content
list is already not too bad.


> regards
> Philipp


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



