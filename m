Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 15D417F87A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 12:41:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Nov 2019 04:41:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,322,1569308400"; d="scan'208";a="196485893"
Received: from unknown (HELO blackadder.local) ([10.252.49.82])
	by orsmga007.jf.intel.com with ESMTP; 19 Nov 2019 04:41:27 -0800
To: openembedded-devel@lists.openembedded.org
References: <20191119121609.19869-1-nick83ola@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <1d110b29-23c2-12ea-68cb-32f465be8be9@intel.com>
Date: Tue, 19 Nov 2019 12:41:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191119121609.19869-1-nick83ola@gmail.com>
Subject: Re: [meta-python][PATCH] python3-importlib-metadata: fix class-target overriding default dependencies
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
X-List-Received-Date: Tue, 19 Nov 2019 12:41:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 19/11/2019 12:16, Nicola Lunghi wrote:
> -RDEPENDS_${PN}_class-target += "python3-misc"
> -RDEPENDS_${PN}_class-nativesdk += "python3-misc"
> +RDEPENDS_${PN}_append_class-target = " python3-misc"
> +RDEPENDS_${PN}_append_class-nativesdk = " python3-misc"

I believe all of the overrides are redundant now.  Try just 
RDEPENDS_${PN} += "python3-misc" and check the native build is still 
successful.

Ross

