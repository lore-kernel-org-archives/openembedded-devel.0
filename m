Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TdeQT-0003ox-MK
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 11:00:29 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Nov 2012 01:45:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,177,1355126400"; d="scan'208";a="173476537"
Received: from unknown (HELO helios.localnet) ([10.252.122.248])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Nov 2012 01:44:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "yanjun.zhu" <yanjun.zhu@windriver.com>
Date: Wed, 28 Nov 2012 09:44:57 +0000
Message-ID: <2179675.GOD3EuFAz2@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <1354070578-5401-1-git-send-email-yanjun.zhu@windriver.com>
References: <1354070578-5401-1-git-send-email-yanjun.zhu@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libproxy: Fix for CVE-2012-4504
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 10:00:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi there,

On Wednesday 28 November 2012 10:42:58 yanjun.zhu wrote:
> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
> 
> Reference:https://code.google.com/p/libproxy/source/detail?r=853
> 
> Stack-based buffer overflow in the url::get_pac function in url.cpp
> in libproxy 0.4.x before 0.4.9 allows remote servers to have an
> unspecified impact via a large proxy.pac file.
> 
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4504
> 
> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> ---
>  recipes-support/libproxy/libproxy_0.4.7.bbappend          |  5 +++++
>  .../libproxy/patches/libproxy-0.4.7-CVE-2012-4504.patch   | 15

Thanks for submitting this, but this is not the correct mailing list for 
patches against OE-Core. Could you please apply this patch to OE-Core master 
and then re-send the result to openembedded-core@lists.openembedded.org?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


