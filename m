Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3AED36098B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 12:26:16 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 May 2014 05:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,879,1392192000"; d="scan'208";a="434992597"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.156])
	by azsmga001.ch.intel.com with ESMTP; 21 May 2014 05:26:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 21 May 2014 13:26:07 +0100
Message-ID: <2602664.DGhhEWxdj3@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.4-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050BA1C915E0@COSNADEXC23.usr.ingenico.loc>
References: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<6870056.jNAsUvdqdq@peggleto-mobl5.ger.corp.intel.com>
	<8672BB614B4CCA40A6B3BDD6FD82050BA1C915E0@COSNADEXC23.usr.ingenico.loc>
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH 2/4] libav: add version 10.1
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
X-List-Received-Date: Wed, 21 May 2014 12:26:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 21 May 2014 12:14:26 Matthieu CRAPET wrote:
> I can understand the "maintenance" point of view. I've watched closely to
> the build system of the 3 versions, it's quite the same. 9.x adds more
> switches than 0.8.x and 10.x adds more switches than 9.x. As libav.inc is
> common, it deserves it. I've compiled the 3 versions with multiple
> (package)configs, and as far as tested, nothing is broken. Why not dropping
> 9.x a and keep 10.x (plus 0.8.x of course)?

The major version bumps are not just about additional switches though. If you 
look at upstream-tracker.org [1] you can see that there were API/ABI-breaking 
changes between 9 and 10 (and the libav project's version 10 announcement [2] 
confirms this). The question is, for what we build in OE that depends upon 
libav are these changes significant or not? If they are, are corresponding 
upgrades available that are compatible with libav 10?
 
Cheers,
Paul

[1] http://upstream-tracker.org/versions/libav.html
[2] https://libav.org/news.html#10final

-- 

Paul Eggleton
Intel Open Source Technology Centre

