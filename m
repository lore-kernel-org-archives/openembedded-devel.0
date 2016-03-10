Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7046FF9B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 19:51:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 10 Mar 2016 11:51:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,317,1455004800"; d="scan'208";a="931203462"
Received: from scheong2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.99])
	by orsmga002.jf.intel.com with ESMTP; 10 Mar 2016 11:51:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jaap de Jong <jaap.dejong@nedap.com>
Date: Fri, 11 Mar 2016 08:51:09 +1300
Message-ID: <1507870.p7hB2N9V0b@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.3-300.fc23.x86_64; KDE/4.14.17; x86_64; ;
	)
In-Reply-To: <56E14046.8090203@mlbassoc.com>
References: <56E13B20.8010902@nedap.com> <56E14046.8090203@mlbassoc.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, Gary Thomas <gary@mlbassoc.com>
Subject: Re: Updating configuration files, how to
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
X-List-Received-Date: Thu, 10 Mar 2016 19:51:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 10 Mar 2016 10:37:10 Gary Thomas wrote:
> On 2016-03-10 10:15, Jaap de Jong wrote:
> > I am wondering what the best approach is for creating 'standard' packages
> > with updated configuration files. As an example: I want to have a package
> > with an updated /etc/network/interfaces file to reflect my systems
> > hardware. Should I create a init-ifupdown_1.0.bbappend recipe with the
> > updated file? What other options do I have?
> > What are you guys using for this?
> > And how about the package name in such a case. Append something to its
> > name?
>
> I use a init-ifupdown_1.0.bbappend in my target machine (BSP) layer,
> this way these settings only affect the particular machine(s).

FYI in recent versions (jethro / 2.0+) you can use "recipetool appendfile" to 
create these bbappends easily. You don't even have to know which recipe is 
packaging them.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

