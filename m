Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1360B73179
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 18:25:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jan 2016 10:25:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,326,1449561600"; d="scan'208";a="898289064"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jan 2016 10:25:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen.kooi@linaro.org>
Date: Fri, 22 Jan 2016 07:25:04 +1300
Message-ID: <4721149.thKUQa4jfA@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <1453376040-25632-1-git-send-email-koen.kooi@linaro.org>
References: <1453376040-25632-1-git-send-email-koen.kooi@linaro.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] various: delete leftovers from qt4 recipes that break parsing due to missing classes
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
X-List-Received-Date: Thu, 21 Jan 2016 18:25:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 21 Jan 2016 12:34:00 Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  ...erinterface.cpp-add-sys-socket.h-as-inclu.patch |  41 ---
>  .../0002-qconsole-writethread-gcc-4.5-fixes.patch  |  40 ---
>  .../qcanobserver/qcanobserver/candemo.xml          |  40 ---
>  .../qt-creator/fix.missing.cpuid.h.patch           | 384
> --------------------- .../qt-creator/qbs_transformer_product.patch       | 
> 93 -----
>  meta-oe/recipes-qt/qtserialport/qtserialport.inc   |  48 ---
>  6 files changed, 646 deletions(-)

Not that we wouldn't want to remove these, but how were you getting parse 
issues just by these files being present? None of them would be noticed by 
BitBake unless they were explicitly included.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

