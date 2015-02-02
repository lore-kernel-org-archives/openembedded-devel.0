Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C69560017
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2015 18:37:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 02 Feb 2015 10:32:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,507,1418112000"; d="scan'208";a="671629208"
Received: from bbodonog-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.158])
	by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2015 10:37:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: akuster808 <akuster808@gmail.com>
Date: Mon, 02 Feb 2015 18:37:05 +0000
Message-ID: <1594702.qEiaZcIpbc@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <54CFC2ED.7040704@gmail.com>
References: <54CFC2ED.7040704@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: --should-not-have-used-
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
X-List-Received-Date: Mon, 02 Feb 2015 18:37:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Armin,

On Monday 02 February 2015 10:33:17 akuster808 wrote:
> I am now seeing an issue in one of my recipes during configure.
> 
> --should-not-have-used-/usr/bin/pcap-config
> 
> 
> Is this indicating an issue with my recipe or with pcap?
> 
> binconfig-disabled.bbclass comments is not very helpful.

Here is a brief description of the change from our migration guide:

http://www.yoctoproject.org/docs/1.7/ref-manual/ref-manual.html#migration-1.7-binary-configuration-scripts-disabled

Short answer: change the software your recipe is building to use pkg-config
instead of pcap-config.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

