Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1A89D7ED9A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 02:31:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jul 2019 19:31:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,472,1557212400"; d="scan'208";a="176694967"
Received: from optimus-prime.png.intel.com (HELO [172.30.199.130])
	([172.30.199.130])
	by orsmga002.jf.intel.com with ESMTP; 09 Jul 2019 19:31:17 -0700
To: Liwei Song <liwei.song@windriver.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <1562291023-261126-1-git-send-email-liwei.song@windriver.com>
	<32b2fbe7-f358-474a-d71a-2eb82e9b834e@intel.com>
	<5D1EB004.8080305@windriver.com>
From: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>
Message-ID: <db14fa8f-8fd7-34b0-6e53-3e6aa0062c41@intel.com>
Date: Wed, 10 Jul 2019 10:33:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5D1EB004.8080305@windriver.com>
Subject: Re: [meta-oe][PATCH v2] pm-graph: package the pm-graph files
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
X-List-Received-Date: Wed, 10 Jul 2019 02:31:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/5/19 10:03 AM, Liwei Song wrote:
> 
> 
> On 07/05/2019 10:01 AM, Saini, Naveen Kumar wrote:
>>
>>
>> On 7/5/19 9:43 AM, Liwei Song wrote:
>>> package /usr/lib/pm-grap and /bin/* files created by pm-graph
>>> to aviod "Files were installed but not shipped in any package"
>>> error.
>>>
>>> Signed-off-by: Liwei Song <liwei.song@windriver.com>
>>> ---
>>>    meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
>>> index ea12e054d3ab..00301298309e 100644
>>> --- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
>>> +++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
>>> @@ -18,3 +18,6 @@ do_install() {
>>>    }
>>>      RDEPENDS_${PN} += "python-core python-threading python-datetime python-subprocess python-compression"
>>> +
>>> +FILES_${PN} += "${nonarch_libdir}/pm-graph \
>> This too not required. Please have a look at
>> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/conf/bitbake.conf
>>
>> Could you share your error !
> 
> The error I got:
> ERROR: pm-graph-5.3-r0 do_package: QA Issue: pm-graph: Files/directories were installed but not shipped in any package:
>    /usr/lib
>    /usr/lib/pm-graph
>    /usr/lib/pm-graph/sleepgraph.py
>    /usr/lib/pm-graph/bootgraph.py
>    /usr/lib/pm-graph/config
>    /usr/lib/pm-graph/config/cgskip.txt
>    /usr/lib/pm-graph/config/freeze-callgraph.cfg
>    /usr/lib/pm-graph/config/freeze.cfg
>    /usr/lib/pm-graph/config/freeze-dev.cfg
>    /usr/lib/pm-graph/config/standby-callgraph.cfg
>    /usr/lib/pm-graph/config/standby.cfg
>    /usr/lib/pm-graph/config/standby-dev.cfg
>    /usr/lib/pm-graph/config/suspend-callgraph.cfg
>    /usr/lib/pm-graph/config/suspend.cfg
>    /usr/lib/pm-graph/config/suspend-dev.cfg
>    /usr/lib/pm-graph/config/suspend-x2-proc.cfg
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> pm-graph: 16 installed and not shipped files. [installed-vs-shipped]
> ERROR: pm-graph-5.3-r0 do_package: Fatal QA errors found, failing task.
> ERROR: pm-graph-5.3-r0 do_package:
> ERROR: pm-graph-5.3-r0 do_package: Function failed: do_package

Hmm.. what is ${BASELIB} variable value?

Are you using latest code?

I do not see this error. Below configuration I am using for multilib build:

require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"


> 
> 
> Thanks,
> Liwei.
>>> +"
>>>
>>
>>

