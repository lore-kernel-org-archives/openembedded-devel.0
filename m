Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Te4zw-0001OM-6L
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Nov 2012 15:21:52 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2012 06:07:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,184,1355126400"; d="scan'208";a="256639134"
Received: from unknown (HELO helios.localnet) ([10.252.122.249])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2012 06:07:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "yanjun.zhu" <yanjun.zhu@windriver.com>
Date: Thu, 29 Nov 2012 14:07:33 +0000
Message-ID: <1547659.oHFHv4PiYI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-18-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <1353056022-29560-1-git-send-email-yanjun.zhu@windriver.com>
References: <1353056022-29560-1-git-send-email-yanjun.zhu@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] python: fix for Security Advisory - python - CVE-2012-2135
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
X-List-Received-Date: Thu, 29 Nov 2012 14:21:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 16 November 2012 16:53:42 yanjun.zhu wrote:
> The utf-16 decoder in Python 3.1 through 3.3 does not update the
> aligned_end variable after calling the unicode_decode_call_errorhandler
> function, which allows remote attackers to obtain sensitive information
> (process memory) or cause a denial of service (memory corruption and crash)
> via unspecified vectors.
> 
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2135
> 
> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> ---
>  .../python/python/python-2.7.2-CVE-2012-2135.patch |   12 ++++++++++++
>  recipes-devtools/python/python_2.7.2.bbappend      |    1 +
>  2 files changed, 13 insertions(+), 0 deletions(-)
>  create mode 100644
> recipes-devtools/python/python/python-2.7.2-CVE-2012-2135.patch

This patch is also against OE-Core, could you send this to the OE-Core list as 
well?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


