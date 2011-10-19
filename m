Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RGceS-0005OO-Hv
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 22:22:13 +0200
Received: from iph2.telenor.se (iph2.telenor.se [195.54.127.133])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id 84E65EB8AB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 22:16:15 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AlIaANsvn05T4zkNPGdsb2JhbAAMOKkcAQEBATeCIAEBAQEDAQEBNRMBIgoRCxEDAQIBCRYPCQMCAQIBFQEbDAgTBgIBAYgEqCEBjWmIGwSRZIIakVk
X-IronPort-AV: E=Sophos;i="4.69,374,1315173600"; d="scan'208";a="497447109"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.57.13])
	by iph2.telenor.se with ESMTP; 19 Oct 2011 22:16:06 +0200
Message-ID: <4E9F3005.5040203@telia.com>
Date: Wed, 19 Oct 2011 22:16:05 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1319037014-29473-1-git-send-email-ulf_samuelsson@telia.com>
	<1319037014-29473-2-git-send-email-ulf_samuelsson@telia.com>
	<4E9EF092.3080300@gmail.com>
In-Reply-To: <4E9EF092.3080300@gmail.com>
Subject: Re: [PATCH 2/3] Use linux2 when configuring python-2.6.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Oct 2011 20:22:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-10-19 17:45, Khem Raj skrev:
> On 10/19/2011 8:10 AM, ulf_samuelsson@telia.com wrote:
>> From: Ulf Samuelsson<ulf_samuelsson@telia.com>
>>
>> Signed-off-by: Ulf Samuelsson<ulf.samuelsson@telia.com>
>>
>> ---
>>   ...64-bit-host.-Use-linux2-instead-of-linux3.patch |   40 
>> ++++++++++++++++++++
>>   recipes/python/python_2.6.6.bb                     |    1 +
>>   2 files changed, 41 insertions(+), 0 deletions(-)
>>   create mode 100644 
>> recipes/python/python-2.6.6/0001-Support-64-bit-host.-Use-linux2-instead-of-linux3.patch
>>
>> diff --git 
>> a/recipes/python/python-2.6.6/0001-Support-64-bit-host.-Use-linux2-instead-of-linux3.patch 
>> b/recipes/python/python-2.6.6/0001-Support-64-bit-host.-Use-linux2-instead-of-linux3.patch 
>>
>> new file mode 100644
>> index 0000000..46ce713
>> --- /dev/null
>> +++ 
>> b/recipes/python/python-2.6.6/0001-Support-64-bit-host.-Use-linux2-instead-of-linux3.patch
>> @@ -0,0 +1,40 @@
>> +From 3fbd3d4aa2f9b0aaa806ec9f19dc589a0928ef0c Mon Sep 17 00:00:00 2001
>> +From: Ulf Samuelsson<ulf_samuelsson@telia.com>
>> +Date: Wed, 19 Oct 2011 15:46:32 +0200
>> +Subject: [PATCH] Support 64 bit host. Use linux2 instead of linux3
>
>
> can you explain why this change is needed.

I tried building on Ubuntu 11.10 x64 and Python, openssl and binutils fails.
openssl I backported as recommended, and I then found the buildroot
patch after some searching.

Here is the comment from the Buildroot patch:

When compiling Python on a host running Linux 3.0, the sys.platform
constant is set at "linux3". A lot of code (inside the interpreter
itself, its build system and third party apps and libraries) relies on
it to be linux2 on a Linux system.

This leads to the build of the target python package to break.

This behaviour has been reported on the Python bugtracker but is not
fixed yet.


---
After I applied the three patches in the patchset,
I managed to complete the build without errors.

>
>> +
>> +Imported from the Buildroot project.
>> +
>> +Signed-off-by: Ulf Samuelsson<ulf.samuelsson@telia.com>
>> +---
>> + configure    |    1 +
>> + configure.in |    1 +
>> + 2 files changed, 2 insertions(+), 0 deletions(-)
>> +
>> +diff --git a/configure b/configure
>> +index d0731c3..dc8d029 100755
>> +--- a/configure
>> ++++ b/configure
>> +@@ -2814,6 +2814,7 @@ then
>> +     darwin*) MACHDEP="darwin";;
>> +     atheos*) MACHDEP="atheos";;
>> +         irix646) MACHDEP="irix6";;
>> ++    linux*)    MACHDEP="linux2";;
>> +     '')    MACHDEP="unknown";;
>> +     esac
>> + fi
>> +diff --git a/configure.in b/configure.in
>> +index 609d8f2..8b8b77c 100644
>> +--- a/configure.in
>> ++++ b/configure.in
>> +@@ -264,6 +264,7 @@ then
>> +     darwin*) MACHDEP="darwin";;
>> +     atheos*) MACHDEP="atheos";;
>> +         irix646) MACHDEP="irix6";;
>> ++    linux*)    MACHDEP="linux2";;
>> +     '')    MACHDEP="unknown";;
>> +     esac
>> + fi
>> +--
>> +1.7.5.4
>> +
>> diff --git a/recipes/python/python_2.6.6.bb 
>> b/recipes/python/python_2.6.6.bb
>> index eacc5c2..ae057a2 100644
>> --- a/recipes/python/python_2.6.6.bb
>> +++ b/recipes/python/python_2.6.6.bb
>> @@ -18,6 +18,7 @@ SRC_URI = "\
>>     file://python-module-rpath-fix.patch \
>>     file://sitecustomize.py \
>>     file://pkgconfig-support.patch \
>> +  file://0001-Support-64-bit-host.-Use-linux2-instead-of-linux3.patch \
>>   "
>>   SRC_URI[md5sum] = "cf4e6881bb84a7ce6089e4a307f71f14"
>>   SRC_URI[sha256sum] = 
>> "134c5e0736bae2e5570d0b915693374f11108ded63c35a23a35d282737d2ce83"
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



