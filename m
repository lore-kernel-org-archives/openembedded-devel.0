Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA9A7517E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 06:29:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Apr 2018 23:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,426,1517904000"; d="scan'208";a="41804307"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 08 Apr 2018 23:29:56 -0700
To: akuster808 <akuster808@gmail.com>, Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-devel@lists.openembedded.org
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
	<1523170729-26321-25-git-send-email-akuster808@gmail.com>
	<b6171aed-e4eb-a7e5-a370-913f38217f19@intel.com>
	<cf99d40e-6d18-8bde-2e50-44bc8bc9673f@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <17407ef8-be82-13c4-5482-2a3211f4d767@linux.intel.com>
Date: Mon, 9 Apr 2018 09:23:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <cf99d40e-6d18-8bde-2e50-44bc8bc9673f@gmail.com>
Subject: Re: [meta-oe][PATCH 25/37] mongodb: refresh patches
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
X-List-Received-Date: Mon, 09 Apr 2018 06:29:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/08/2018 06:46 PM, akuster808 wrote:
>> Looks like this has been fixed upstream and this patch should be removed
>> instead.
> Thanks for the feed back. v2 shortly.

Armin, I have to stress again: do read the outcome of devtool's patch 
refresh, for every recipe. You should not rely on it blindly and send 
out the patches in a hurry just so that warnings can go away. Devtool is 
not perfect, it can mangle the patches in undesriable ways, and it also 
does not detect when the patch should simply be removed as it introduces 
a change for the second time.

Alex

