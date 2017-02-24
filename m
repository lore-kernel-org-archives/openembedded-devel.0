Return-Path: <amarnath.valluri@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EAAE473115
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 07:50:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 23 Feb 2017 23:50:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,200,1484035200"; d="scan'208";a="52211114"
Received: from irdmzpr05.ir.intel.com (HELO [163.33.54.155]) ([163.33.54.155])
	by orsmga002.jf.intel.com with ESMTP; 23 Feb 2017 23:50:58 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <1487840743-23198-1-git-send-email-amarnath.valluri@intel.com>
	<1487840743-23198-9-git-send-email-amarnath.valluri@intel.com>
	<20170223211402.GB3038@jama>
From: Amarnath Valluri <amarnath.valluri@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <a8b32c58-9d18-baaf-3259-37a1c29a869a@intel.com>
Date: Fri, 24 Feb 2017 09:51:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170223211402.GB3038@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 8/9] multipath-tools: Replace 'lib' with ${nonarch_base_libdir} for placing udev rules.
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
X-List-Received-Date: Fri, 24 Feb 2017 07:51:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 23.02.2017 23:14, Martin Jansa wrote:
> On Thu, Feb 23, 2017 at 11:05:42AM +0200, Amarnath Valluri wrote:
>> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
>> ---
>>   meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
>> index effd92e..0cc53fb 100644
>> --- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
>> +++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
>> @@ -40,7 +40,7 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
>>   EXTRA_OEMAKE = 'MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} \
>>                   OPTFLAGS="${CFLAGS}" \
>>                   LIB=${base_libdir} libdir=${base_libdir}/multipath \
>> -                unitdir=/lib/systemd/system \
>> +                unitdir/=${systemd_system_unitdir} \
> is the / before = intentional?
No, it must be a typo, I will resubmit the patch. Thanks for reviewing.

- Amarnath

