Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6F39960609
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Aug 2013 09:47:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Aug 2013 02:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,946,1367996400"; d="scan'208";a="367783119"
Received: from junemccl-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.246])
	by orsmga001.jf.intel.com with ESMTP; 24 Aug 2013 02:47:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Aug 2013 10:47:35 +0100
Message-ID: <1419577.68pc7GzaiK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <0A0D83CF-8BD1-46F8-BCE7-214E5F634E6E@gmail.com>
References: <cover.1377257565.git.paul.eggleton@linux.intel.com>
	<da4ddacdf801a6744fbdd2081bcc41586ec326ac.1377257565.git.paul.eggleton@linux.intel.com>
	<0A0D83CF-8BD1-46F8-BCE7-214E5F634E6E@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sat, 24 Aug 2013 09:47:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 23 August 2013 10:36:15 Khem Raj wrote:
> On Aug 23, 2013, at 4:33 AM, Paul Eggleton <paul.eggleton@linux.intel.com> 
> wrote:
> > This bbappend has effectively been merged into OE-Core, although the
> > log buffer size is the busybox default rather than 64K - layers may
> > change this either by providing their own /etc/default/busybox-syslog
> > file (when using systemd) or modifying the
> > CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE option in busybox's build time
> > config
> 
> I think it would be better if we added this option via a kconfig fragment
> in OE-Core if DISTRO_FEATURES contained systemd and then remove this from
> here. I say this because otherwise size of circular buffer goes back to 16k
> from 64k and may not be enough to hold valuable info.

Why is this specific to systemd?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

