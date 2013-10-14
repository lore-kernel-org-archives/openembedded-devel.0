Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1C7336CC88
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 16:30:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Oct 2013 09:28:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,493,1378882800"; d="scan'208";a="416645294"
Received: from unknown (HELO helios.localnet) ([10.252.120.188])
	by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2013 09:28:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 14 Oct 2013 17:28:03 +0100
Message-ID: <5442709.EOXcNmhYjx@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAAQYJAsvGqFZB7CjEc2txSfCxFuesk8AXqhER_EQAe7rknTe=Q@mail.gmail.com>
References: <1381765192-3697-1-git-send-email-andrea.adami@gmail.com>
	<5529742.8LBZEpu68j@helios>
	<CAAQYJAsvGqFZB7CjEc2txSfCxFuesk8AXqhER_EQAe7rknTe=Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] h3800.conf: fix MACHINE_FEATURES
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
X-List-Received-Date: Mon, 14 Oct 2013 16:30:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 14 October 2013 18:24:38 Andrea Adami wrote:
> On Mon, Oct 14, 2013 at 5:54 PM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > On Monday 14 October 2013 17:39:52 Andrea Adami wrote:
> >> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> >> ---
> >> 
> >>  conf/machine/h3800.conf | 4 +---
> >>  1 file changed, 1 insertion(+), 3 deletions(-)
> >> 
> >> diff --git a/conf/machine/h3800.conf b/conf/machine/h3800.conf
> >> index 0c3cf15..53f3940 100644
> >> --- a/conf/machine/h3800.conf
> >> +++ b/conf/machine/h3800.conf
> >> @@ -2,7 +2,5 @@
> >> 
> >>  #@NAME: Compaq iPAQ 38xx
> >>  #@DESCRIPTION: Machine configuration for the Compaq iPAQ 38xx devices
> >> 
> >> -#this machine will be primarily focussed on the 2.6 port
> >> -MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda usbgadget
> >> screen vfat qvga" -
> >> 
> >>  require conf/machine/h3600.conf
> >> 
> >> +MACHINE_FEATURES += "pcmcia bluetooth"
> > 
> > I don't particularly like this. I'd rather these files stay separate for
> > now.
> > 
> > Cheers,
> > Paul
> 
> I understand but see, the include resets the MACHINE_FEATURES as-it-is...

Oops, I had missed that this file was doing a "require" already. My apologies.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

