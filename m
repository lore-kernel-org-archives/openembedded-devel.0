Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D1A927863E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 09:01:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Aug 2017 02:02:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,382,1498546800"; d="scan'208";a="124141579"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 16 Aug 2017 02:01:59 -0700
To: Jason Wessel <jason.wessel@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20170815192424.129143-1-jason.wessel@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <fdf8f2ef-eb85-391d-b5f7-61dc01b6a419@linux.intel.com>
Date: Wed, 16 Aug 2017 11:58:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170815192424.129143-1-jason.wessel@windriver.com>
Subject: Re: [meta-oe][PATCH] mailx: Force mailx to build with openssl10
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
X-List-Received-Date: Wed, 16 Aug 2017 09:02:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/15/2017 10:24 PM, Jason Wessel wrote:
> The latest changes in oe-core switch to using openssl 1.1.  The
> SSLv3_client_method and RAND_egd functions are removed in the openssl
> 1.1. This causes mailx to fail to compile.
> 
> For now we can use openssl10 in the same manner that openssh is doing.
> At the point in time that openssl10 goes away the code for openssl in
> mailx will have to be altered.

Please note the following (from mailx removal commit in oe-core):

     This recipe was carried only for LSB compatibility,
     with upstream being defunct for a long time; if there is a need
     for a modern, supported implementation of mail/mailx, then
     s-nail (http://sdaoden.eu/code.html) or mailutils 
(http://mailutils.org/)    should be used.

So when openssl 1.0 goes away, it's better to package either of these two.


Alex

