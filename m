Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6287D61F47
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 21:53:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Aug 2013 14:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,962,1367996400"; d="scan'208";a="392344433"
Received: from unknown (HELO helios.localnet) ([10.252.123.18])
	by fmsmga002.fm.intel.com with ESMTP; 26 Aug 2013 14:53:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Aug 2013 22:53:28 +0100
Message-ID: <21550950.hdvkljmBJI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <C76898E3-8DF0-4327-9A24-510259D58C39@gmail.com>
References: <cover.1377257565.git.paul.eggleton@linux.intel.com>
	<1419577.68pc7GzaiK@helios>
	<C76898E3-8DF0-4327-9A24-510259D58C39@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/1] busybox: remove bbappend
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
X-List-Received-Date: Mon, 26 Aug 2013 21:53:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 26 August 2013 14:39:10 Khem Raj wrote:
> On Aug 24, 2013, at 2:47 AM, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
> > On Friday 23 August 2013 10:36:15 Khem Raj wrote:
> >> On Aug 23, 2013, at 4:33 AM, Paul Eggleton
> >> <paul.eggleton@linux.intel.com> wrote:
> >>> This bbappend has effectively been merged into OE-Core, although the
> >>> log buffer size is the busybox default rather than 64K - layers may
> >>> change this either by providing their own /etc/default/busybox-syslog
> >>> file (when using systemd) or modifying the
> >>> CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE option in busybox's build time
> >>> config
> >> 
> >> I think it would be better if we added this option via a kconfig fragment
> >> in OE-Core if DISTRO_FEATURES contained systemd and then remove this from
> >> here. I say this because otherwise size of circular buffer goes back to
> >> 16k from 64k and may not be enough to hold valuable info.
> > 
> > Why is this specific to systemd?
> 
> It probably is not. Otavio added it, so I am CCing him
> however this is default used in many distros, just to keep enough
> messages around while you can affort 64K buffer which is not a huge ask
> these days.

If it's generally useful and not specific to systemd (and it seems it isn't the 
latter) I'd have to say I agree, let's set the default in our busybox 
defconfig.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

