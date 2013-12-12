Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD766C732
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2013 12:18:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Dec 2013 04:18:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,877,1378882800"; d="scan'208";a="448909605"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.252])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2013 04:18:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chong.Lu@windriver.com
Date: Thu, 12 Dec 2013 12:18:43 +0000
Message-ID: <3205539.QQKxxM1edb@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1386669781-26578-1-git-send-email-Chong.Lu@windriver.com>
References: <1386669781-26578-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH meta-webserver] modphp: enable endian check
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
X-List-Received-Date: Thu, 12 Dec 2013 12:18:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chong,

On Tuesday 10 December 2013 18:03:01 Chong.Lu@windriver.com wrote:
> From: Chong Lu <Chong.Lu@windriver.com>
> 
> Previously, modphp estimates endian on host rather than checks it on
> target. If the host is little-endian and the target is big-endian,
> modphp claims that endian is little. As a result, a memory location
> that it is not allowed to access when calling libphp5.so module on
> target. It will occur segmentation fault.
> This patch enables endian check support for modphp.
> 
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>

Merged, with a minor tweak to add the value to the end of the existing 
EXTRA_OECONF value rather than using +=. Thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

