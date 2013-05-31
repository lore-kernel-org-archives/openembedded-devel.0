Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ABE7760959
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 11:14:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2013 04:14:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,778,1363158000"; d="scan'208";a="346129843"
Received: from unknown (HELO helios.localnet) ([10.252.121.185])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2013 04:14:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Xufeng Zhang <xufeng.zhang@windriver.com>
Date: Fri, 31 May 2013 12:14 +0100
Message-ID: <1798099.8KyYg2VTfs@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-22-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <51A86887.1050601@windriver.com>
References: <1369981125-9597-1-git-send-email-xufeng.zhang@windriver.com>
	<1704407.SDREl8D59z@helios> <51A86887.1050601@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <joe.macdonald@windriver.com>
Subject: Re: [OE-devel] [PATCH] ntp: Resolve some abnormal behaviors
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
X-List-Received-Date: Fri, 31 May 2013 11:14:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 31 May 2013 17:08:23 Xufeng Zhang wrote:
> On 05/31/2013 04:34 PM, Paul Eggleton wrote:
> > On Friday 31 May 2013 14:18:45 Xufeng Zhang wrote:
> >> The main changes include:
> >> 1). Add ntp:ntp(user:group) to system.
> >> 2). Running ntpd dameon as ntp:ntp.
> >> 
> >> 
> >> 3). Move relevant files from /usr/bin to /usr/sbin.
> 
> Thanks for your review, Paul!
> 
> > I'm not sure but I think the way this has been done
> > (--with-binsubdir=sbin) is going to bypass the ability to set sbindir in
> > the distro config. If that's the case then I don't think this is a good
> > change, although I appreciate having ntpd in /usr/sbin by default would
> > be more appropriate.
> 
> But currently it's the proper and easy way to do that, right?
> I can think out any better way to do the same job.

I'm not sure of the details of ntp's build system, but perhaps we could patch 
it to use sbindir instead of bindir for the appropriate binaries?
 
> >> 4). Add crypto support.
> > 
> > The support is already there, it's just off by default and that was
> > intentional. Those that need this can easily enable it in their distro
> > config.
>
> I'm not sure why we do that intentional, but shouldn't the package run
> as secure as possible by default?

The main concern is the dependency on OpenSSL that this introduces which many 
users do not want. I suspect it also depends on whether the NTP servers you 
are using support SSL.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

