Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1L75rP-000234-Q5
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Dec 2008 11:18:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 47C651405344;
	Mon,  1 Dec 2008 11:11:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jVfVTu5Emtfi; Mon,  1 Dec 2008 11:11:54 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id 17EE9140533C;
	Mon,  1 Dec 2008 11:11:53 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: Dmitry <dbaryshkov@gmail.com>
In-Reply-To: <bc64b4640811301810y1f4fa910p704d089b40be1278@mail.gmail.com>
References: <1227919728-4878-1-git-send-email-dbaryshkov@gmail.com>
	<20081129213201.21d91e2d@zaurus>
	<bc64b4640811301810y1f4fa910p704d089b40be1278@mail.gmail.com>
Date: Mon, 01 Dec 2008 11:15:13 +0100
Message-Id: <1228126513.3835.12.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] zaurus-updater: add support for home partition	reflashing
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
X-List-Received-Date: Mon, 01 Dec 2008 10:19:02 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Dmitry wrote:
> 2008/11/29 Stanislav Brabec wrote:
> >
> > Note that on models with HDD it will not do what is expected.
> > It will format 2nd NAND partition, but /home is on /dev/hda2.
> 
> I don't know what it will format actually. Does the NAND have the "home"-labeled
> partition on those devices?

On SL-C3000 it probably does not.
On SL-C3100 it has and int contains Sharp ROM /home.
On SL-C3200 it has and it is broken due to bad partitioning table in
kernel. Not easy to fix, as kernel cannot differentiate between SL-C3100
and SL-C3200 yet.

Imaging tool just now creates two images: flash and HDD. HDD
uses /dev/hda2 as /home, flash uses NAND as /home. AFAIK nobody tests
flash image.

> > 1. Decrease number of reserved sectors while formatting the HDD. 5% is
> > far too much of space unusable for packages installation. I have 5%
> > free, but unable to run applications using /tmp. I propose 0% (or only
> > a few blocks).
> 
> You can use tune2fs at any time, IIRC, can't you?

Yes, you can. This operation is possible even on mounted device. But
tune2fs is not part of the default image, and you need additional
reboot. I guess that reserved sectors don't have a real meaning on
Zaurus.

> > 2. Support for langpacks. OE does not create langpack yet, but it would
> > be nice to be able to flash localized system.
> 
> As a Russian user, it's definitely +1.

Its support would be only a first step. Creating them is a more
complicated task.

> > 3. I am using post-flash customization using a combination of additional
> > files and patches. It would be nice to have something like that
> > directly as an updater feature.
> 
> It may be nice to have smth. like:
> 
> [snip]
> if [ -x post-updater-hook.sh ]
> then
>   . post-updater-hook.sh
> fi
> [snip]

Yes, it looks flexible. If the hook script will return 1, shell can be
launched.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



