Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2086B215
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 20:48:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Jul 2013 13:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,687,1367996400"; d="scan'208";a="372028709"
Received: from unknown (HELO helios.localnet) ([10.252.122.95])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2013 13:48:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>, rongqing.li@windriver.com
Date: Wed, 17 Jul 2013 21:48:17 +0100
Message-ID: <12162896.r64JGkun5K@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <20130717184315.GA31259@windriver.com>
References: <1373979075-15576-1-git-send-email-rongqing.li@windriver.com>
	<20130717184315.GA31259@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] Upgrade vsftpd to 3.0.0
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
X-List-Received-Date: Wed, 17 Jul 2013 20:48:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 17 July 2013 14:43:16 Joe MacDonald wrote:
> This adds (unconditional) support for tcp-wrappers and makes it a
> requirement for the upgraded vsftp.  Is this something we could make
> conditional based on tcp-wrappers being present?  Or does anyone think
> this is something worth doing?  tcp-wrappers is coming from oe-core and
> I don't have any systems where the new requirement would be a problem,
> but does anyone else have a system they'd want vsftp without
> tcp-wrappers?

We've recently added tcp-wrappers to a number of recipes in OE-Core; at the 
time there was a discussion about a possible follow-up to add a 
DISTRO_FEATURES item to disable it system-wide. I guess whether or not it's 
worth it depends on what the overhead of having it enabled is.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

