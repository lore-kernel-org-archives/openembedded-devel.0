Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3C98860655
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 08:35:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 31 May 2013 01:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,777,1363158000"; d="scan'208";a="346158820"
Received: from unknown (HELO helios.localnet) ([10.252.121.185])
	by orsmga002.jf.intel.com with ESMTP; 31 May 2013 01:35:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Xufeng Zhang <xufeng.zhang@windriver.com>
Date: Fri, 31 May 2013 09:34:58 +0100
Message-ID: <1704407.SDREl8D59z@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-22-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1369981125-9597-1-git-send-email-xufeng.zhang@windriver.com>
References: <1369981125-9597-1-git-send-email-xufeng.zhang@windriver.com>
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
X-List-Received-Date: Fri, 31 May 2013 08:35:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 31 May 2013 14:18:45 Xufeng Zhang wrote:
> The main changes include:
> 1). Add ntp:ntp(user:group) to system.
> 2). Running ntpd dameon as ntp:ntp.

> 3). Move relevant files from /usr/bin to /usr/sbin.

I'm not sure but I think the way this has been done (--with-binsubdir=sbin) is 
going to bypass the ability to set sbindir in the distro config. If that's the 
case then I don't think this is a good change, although I appreciate having 
ntpd in /usr/sbin by default would be more appropriate.

> 4). Add crypto support.

The support is already there, it's just off by default and that was 
intentional. Those that need this can easily enable it in their distro config.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

