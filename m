Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BC6E274FC0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Apr 2018 04:48:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 21:48:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,413,1517904000"; d="scan'208";a="31460514"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.16.247])
	([10.221.16.247])
	by orsmga008.jf.intel.com with ESMTP; 05 Apr 2018 21:48:34 -0700
To: akuster808 <akuster808@gmail.com>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
References: <1522850964-2056-1-git-send-email-akuster808@gmail.com>
	<2dbfe46b-f90e-9f4e-d8eb-e93f969fb45e@linux.intel.com>
	<03145566-01b3-e823-d652-902c8735b357@gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <19620545-fffc-8c6d-9300-b958ca28b5dd@intel.com>
Date: Fri, 6 Apr 2018 12:48:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <03145566-01b3-e823-d652-902c8735b357@gmail.com>
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
X-List-Received-Date: Fri, 06 Apr 2018 04:48:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/05/2018 03:23 AM, akuster808 wrote:
> 
> 
> On 04/04/2018 09:28 AM, Alexander Kanavin wrote:
>> On 04/04/2018 05:09 PM, Armin Kuster wrote:
>>
>>> +UPSTREAM_CHECK_REGEX = "wireshark-(?P<pver>2\.4(\.\d+)+)\.tar\.xz"
>>
>> Why restrict the version to only 2.4.x ?
> 2.5.1 is beta.. I don't want to update to it.

It follows the odd/even versioning with odd being the development releases.

https://wiki.wireshark.org/Development/ReleaseNumbers

Perhaps you can use a regex similar to upstream-version-is-even so this
is future-proof?

> 
>> (also including .xz at the end may not be a good idea if upstream
>> decides to use a different compressor)
> thanks input.
> 
> - armin
>>
>> Alex
> 


