Return-Path: <mmcclain@uplogix.com>
Received: from s05-gw003.mycloudmailbox.com (s05-gw003.mycloudmailbox.com
	[199.244.76.203])
	by mail.openembedded.org (Postfix) with ESMTP id 249CA744F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 17:16:55 +0000 (UTC)
Received: from S05-MBX04-11.S05.local (unknown [10.30.33.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by s05-gw003.mycloudmailbox.com (Postfix) with ESMTPS id
	41mZgD42SPzVqPR; Thu,  9 Aug 2018 13:16:56 -0400 (EDT)
Received: from sprocket.local (10.30.32.129) by S05-MBX04-11.S05.local
	(10.30.33.98) with Microsoft SMTP Server (TLS) id 15.0.1367.3;
	Thu, 9 Aug 2018 13:16:55 -0400
To: "Maxin B. John" <maxin.john@intel.com>, =?UTF-8?Q?Andr=c3=a9_Draszik?=
	<git@andred.net>
References: <20170930022455.137406-1-fupan.li@windriver.com>
	<6464289341266dc9d8b146f788f07aac3af57c2a.camel@andred.net>
	<20180809111952.GA13716@mbabyjoh-desk.ger.corp.intel.com>
From: Matthew McClain <mmcclain@uplogix.com>
Message-ID: <80895c2d-a930-902f-c6d7-e83cb98fe579@uplogix.com>
Date: Thu, 9 Aug 2018 12:16:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809111952.GA13716@mbabyjoh-desk.ger.corp.intel.com>
X-Originating-IP: [10.30.32.129]
X-ClientProxiedBy: S05-CAS009.S05.local (10.30.32.59) To
	S05-MBX04-11.S05.local (10.30.33.98)
X-RoutingAgent: Treated
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] openjdk-8-common: Fix the issue of building failed adlc on host with gcc < 6
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
X-List-Received-Date: Thu, 09 Aug 2018 17:16:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 8/9/18 6:19 AM, Maxin B. John wrote:
> On Thu, Aug 09, 2018 at 12:04:01PM +0100, André Draszik wrote:
>> Hi Maxin,
>>
>> You reverted this patch, do you remember what the problem was? It looks
>> useful, and I believe a solution similar to this one is actually needed...
> IIRC, this patch caused build error on one machine with gcc version 5.1.1.

I'm interested in the correct solution for this too.
I'm building on top of CentOS 7 which uses GCC 4.8.5.
I've currently got variables like the following in a .bbappend to get
around building adlc which uses the system's compiler.

TARGET_CFLAGS = " -fno-lifetime-dse"
TARGET_CXXFLAGS = " -fno-lifetime-dse"

I read as much as I could find on the meta-java list before I settled on
this.

http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/106599.html

Erkka Kääriä:
 > Adlc is a native tool that openjdk builds and uses during its build 
process.
 > Bitbake however passes target machine specific CFLAGS and CXXFLAGS 
because we
 > are crosscompiling openjdk for the target architecture. This can 
cause issues,
 > if these flags contains values, that work for the Yocto provided 
crosscompiler
 > but not for the system compiler.
 >
 > As an example, compilation will fail on Ubuntu 14.04 if
 > -fstack-protector-strong is specified in the distro security flags. 
Ubuntu
 > 14.04 ships with GCC 4.8, whereas this flag is only supported by GCC 
4.9+.

http://lists.openembedded.org/pipermail/openembedded-devel/2017-May/112703.html

Khem Raj:
 > see if you can check -fno-lifetime-dse options is supported in Makefiles
 > before using the option, that way you can ensure that its only used with
 > compilers which support it

I don't think this was ever acted upon.

Thanks,
Matthew

>> On Fri, 2017-09-29 at 19:24 -0700, fupan.li@windriver.com wrote:
>>> From: Fupan Li <fupan.li@windriver.com>
>>>
>>> The patch recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-adlc-
>>> flags.patch
>>> had tried to fix this issue, and it tried to filter out the
>>> TARGET_FLAGS/TARGET_
>>> CXXFLGAS, but for the flags such as "-fno-lifetime-dse" was added to
>>> CFLAGS/CXXFLAGS,
>>> directly, thus that patch failed to filter it out.
>>>
>>> To fix this issue, it's better to add those GCC version specific flags to
>>> BUILD_CFLAGS/
>>> BUILD_CXXFLAGS and TARGET_CFLAGS/TARGET_CXXFLAGS separatedly, thus that
>>> patch can work
>>> as expected.
>>>
>>> Signed-off-by: Fupan Li <fupan.li@windriver.com>
>>> ---
>>>   recipes-core/openjdk/openjdk-8-common.inc | 36 ++++++++++++++++++++----
>>> -------
>>>   1 file changed, 24 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-
>>> core/openjdk/openjdk-8-common.inc
>>> index 83828e1..c609232 100644
>>> --- a/recipes-core/openjdk/openjdk-8-common.inc
>>> +++ b/recipes-core/openjdk/openjdk-8-common.inc
>>> @@ -231,27 +231,39 @@ FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-
>>> pointer-checks"
>>>   # version is and only add the flags that are appropriate for that GCC
>>>   # version.
>>>   
>>> -def version_specific_cflags(d):
>>> +def version_specific_cflags(d, toolchain):
>>>       extraflags = None
>>>       version = None
>>>   
>>> -    if bb.data.inherits_class('native', d):
>>> -        from subprocess import Popen, PIPE
>>> +    from subprocess import Popen, PIPE
>>> +    cmd = d.expand('%s -dumpversion' % toolchain ).split()
>>> +    cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
>>> +    version = cc.communicate()[0].decode('utf-8')[0]
>>>   
>>> -        cmd = d.expand('${CC} -dumpversion').split()
>>> -        cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
>>> -        version = cc.communicate()[0].decode('utf-8')[0]
>>> +    if version.isdigit():
>>> +        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
>>> +        return extraflags
>>> +    return ''
>>> +
>>> +python __anonymous() {
>>> +    if bb.data.inherits_class('native', d):
>>> +        toolchain = d.getVar('CC', True)
>>> +        extraflags = version_specific_cflags(d, toolchain)
>>> +        d.appendVar("CFLAGS", ' ' + extraflags)
>>> +        d.appendVar("CXXFLAGS", ' ' + extraflags)
>>>       else:
>>>           # in the cross case, trust that GCCVERSION is correct. This won't
>>>           # work if the native toolchain is Clang, but as of this writing
>>> that
>>>           # doesn't work anyway.
>>>           version = d.getVar('GCCVERSION', expand=True)[0]
>>> -
>>> -    if version.isdigit():
>>>           extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
>>> -        return extraflags
>>> -    return ''
>>> +        d.appendVar("TARGET_CFLAGS", ' ' + extraflags)
>>> +        d.appendVar("TARGET_CXXFLAGS", ' ' + extraflags)
>>> +
>>> +        toolchain = d.getVar('BUILD_CC', True)
>>> +        extraflags = version_specific_cflags(d, toolchain)
>>> +        d.appendVar("BUILD_CFLAGS", ' ' + extraflags)
>>> +        d.appendVar("BUILD_CXXFLAGS", ' ' + extraflags)
>>> +}
>>>   
>>> -CFLAGS_append = " ${@version_specific_cflags(d)}"
>>> -CXXFLAGS_append = " ${@version_specific_cflags(d)}"
>>>   CXX_append = " -std=gnu++98"
>>> -- 
>>> 2.11.0
>>>


