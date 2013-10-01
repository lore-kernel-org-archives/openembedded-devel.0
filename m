Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 51E766CA93
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 12:38:01 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Oct 2013 05:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1013,1371106800"; d="scan'208";a="368209113"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.120.75])
	by azsmga001.ch.intel.com with ESMTP; 01 Oct 2013 05:37:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Anup Kini <akini@synapticon.com>
Date: Tue, 01 Oct 2013 13:37:44 +0100
Message-ID: <3515829.zzyu314FgW@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-30-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAKS01o=pE_6PiWyk=Xct8ias3xFQ+X2CtLufLGsNeAXgj_wTkg@mail.gmail.com>
References: <CAKS01onnW6h7NvP42gk4eE9k3KVskoTdPsntFD1sKaYt-xJNvA@mail.gmail.com>
	<CAJTo0Lb7+Kdzg-M6N=j0rb0CRAXZ1OWbCrxAkzNXGafWK9Fc+A@mail.gmail.com>
	<CAKS01o=pE_6PiWyk=Xct8ias3xFQ+X2CtLufLGsNeAXgj_wTkg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: unable to compile eglibc_2.18
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
X-List-Received-Date: Tue, 01 Oct 2013 12:38:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 01 October 2013 13:38:56 Anup Kini wrote:
> Hence i used DISTRO_FEATURES += "opengl x11"

To round this off, you cannot use += to set DISTRO_FEATURES in local.conf 
because the default value of DISTRO_FEATURES is set with ?= in the Poky / OE-
Core distro configuration, and that is parsed after local.conf, thus if you set 
it to anything in local.conf the ?= statement containing all of the other 
normal values will not apply. Use _append instead which takes effect at the end 
of parsing, or more appropriately create your own distro configuration to set 
the value.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

