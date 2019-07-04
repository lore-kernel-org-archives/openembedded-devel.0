Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 91E1D6BC7E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2019 10:30:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jul 2019 03:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,450,1557212400"; d="scan'208";a="184971644"
Received: from optimus-prime.png.intel.com (HELO [172.30.199.130])
	([172.30.199.130])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2019 03:30:16 -0700
To: openembedded-devel@lists.openembedded.org
References: <1562232055-238768-1-git-send-email-liwei.song@windriver.com>
From: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>
Message-ID: <c136bc02-35be-44d8-6382-b8c8239dcbc4@intel.com>
Date: Thu, 4 Jul 2019 18:31:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1562232055-238768-1-git-send-email-liwei.song@windriver.com>
Subject: Re: [meta-oe][PATCH] pm-graph: package the pm-graph files
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
X-List-Received-Date: Thu, 04 Jul 2019 10:30:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/4/19 5:20 PM, Liwei Song wrote:
> +FILES_${PN} = "${nonarch_libdir}/pm-graph \
> +               ${bindir}/sleepgraph \
> +               ${bindir}/bootgraph \
> +"

FILES_${PN} inherits ${bindir} & ${libdir} by default. So it is not 
required.

