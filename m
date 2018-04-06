Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 446E6747BC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Apr 2018 07:55:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2018 00:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,414,1517904000"; d="scan'208";a="41139398"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 06 Apr 2018 00:55:33 -0700
To: Anuj Mittal <anuj.mittal@intel.com>, akuster808 <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1522850964-2056-1-git-send-email-akuster808@gmail.com>
	<2dbfe46b-f90e-9f4e-d8eb-e93f969fb45e@linux.intel.com>
	<03145566-01b3-e823-d652-902c8735b357@gmail.com>
	<19620545-fffc-8c6d-9300-b958ca28b5dd@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <35823800-fc80-14ce-7ad7-1aa73eaa5f0f@linux.intel.com>
Date: Fri, 6 Apr 2018 10:49:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <19620545-fffc-8c6d-9300-b958ca28b5dd@intel.com>
Subject: Re: [meta-networking][PATCH] wireshark: update to 2.4.6 and add upstream check
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
X-List-Received-Date: Fri, 06 Apr 2018 07:55:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/06/2018 07:48 AM, Anuj Mittal wrote:
>>>> +UPSTREAM_CHECK_REGEX = "wireshark-(?P<pver>2\.4(\.\d+)+)\.tar\.xz"
>>>
>>> Why restrict the version to only 2.4.x ?
>> 2.5.1 is beta.. I don't want to update to it.
> 
> It follows the odd/even versioning with odd being the development releases.
> 
> https://wiki.wireshark.org/Development/ReleaseNumbers
> 
> Perhaps you can use a regex similar to upstream-version-is-even so this
> is future-proof?

Yes, I think you can simply inherit upstream-version-is-even directly.

Alex

