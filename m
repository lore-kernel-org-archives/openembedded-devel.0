Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 28B327FBAC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 19:24:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Nov 2019 11:24:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,309,1569308400"; d="scan'208";a="230553451"
Received: from bpuehrin-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.43.253])
	by fmsmga004.fm.intel.com with ESMTP; 15 Nov 2019 11:24:49 -0800
To: Leon Anavi <leon.anavi@konsulko.com>, Khem Raj <raj.khem@gmail.com>,
	martin.jansa@gmail.com
References: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
	<f88b8bfe-e3d9-d45c-8187-ad039df89cc0@intel.com>
	<3b9d3a8a-6edc-2c4f-ac81-8f2036f1d064@konsulko.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <eb1ff9ec-1ed5-c4b2-e465-29f340668888@intel.com>
Date: Fri, 15 Nov 2019 19:24:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3b9d3a8a-6edc-2c4f-ac81-8f2036f1d064@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] surf: Add simple web browser
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
X-List-Received-Date: Fri, 15 Nov 2019 19:24:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 15/11/2019 13:30, Leon Anavi wrote:
>>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>>> +INHIBIT_PACKAGE_STRIP = "1"
>>
>> Why?
> These two lines prevent already-stripped QA errors.

The correct fix is to stop the recipe from forcibly stripping, or tell 
it to include debug information in the first place.  The default CFLAGS 
includes -g so the problem is normally the former unless CFLAGS is not 
being respected.

Ross

