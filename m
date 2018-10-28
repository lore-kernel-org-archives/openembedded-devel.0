Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 96A947198F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Oct 2018 07:29:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 42jTr81MFfz3v;
	Sun, 28 Oct 2018 08:29:12 +0100 (CET)
Date: Sun, 28 Oct 2018 09:29:11 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181028072911.GV24921@localhost>
References: <20181028013029.29734-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20181028013029.29734-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libssh: Do not use thumb-1 ISA on armv5
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
X-List-Received-Date: Sun, 28 Oct 2018 07:29:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Oct 27, 2018 at 06:30:29PM -0700, Khem Raj wrote:
> Fixes
> TOPDIR/build/tmpfs/work/armv5te-yoe-linux-gnueabi/libssh/0.8.4-r0/git/src/channels.c:2632:1:
> sorry, unimplemented: -fstack-check=specific for Thumb-1
>...
> +ARM_INSTRUCTION_SET_armv5 = "arm"
>...

This is then also required for armv4 and many armv6 CPUs.

The usual pattern for that appears to be:
ARM_INSTRUCTION_SET_armv4 = "arm"
ARM_INSTRUCTION_SET_armv5 = "arm"
ARM_INSTRUCTION_SET_armv6 = "arm"

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


