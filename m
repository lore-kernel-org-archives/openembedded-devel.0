Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U8Cwm-0007wG-IA
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 17:55:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1KGcuga001019
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 08:38:56 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 20 Feb 2013 08:38:56 -0800
Message-ID: <5124FC05.40403@windriver.com>
Date: Wed, 20 Feb 2013 10:38:29 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1360707747-8128-1-git-send-email-jeffrey.honig@windriver.com>
	<511B6EA1.5020806@communistcode.co.uk>
In-Reply-To: <511B6EA1.5020806@communistcode.co.uk>
Cc: Jeffrey C Honig <Jeffrey.Honig@windriver.com>
Subject: Re: [PATCH] hiawatha: ennsure C flags are passed to builds.
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
X-List-Received-Date: Wed, 20 Feb 2013 16:55:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/13/13 4:44 AM, Jack Mitchell wrote:
> On 12/02/13 22:22, Jeffrey C Honig wrote:
>> [ CQID: WIND00403568 ]
>>
>> Hiawatha was overriding existing C flags instead of prepending warning flags.
>> This caused build failures on multilibs because the C compiler could not find
>> the proper sysroot.
>>
>> Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
>> ---
>>    recipes-httpd/hiawatha/files/cmake.patch |   16 ++++++++++++++++
>>    recipes-httpd/hiawatha/hiawatha_8.6.bb   |    3 +++
>>    2 files changed, 19 insertions(+)
>>    create mode 100644 recipes-httpd/hiawatha/files/cmake.patch
>>
>> diff --git a/recipes-httpd/hiawatha/files/cmake.patch b/recipes-httpd/hiawatha/files/cmake.patch
>> new file mode 100644
>> index 0000000..f597781
>> --- /dev/null
>> +++ b/recipes-httpd/hiawatha/files/cmake.patch
>> @@ -0,0 +1,16 @@
>> +It is necessary to include the original CMAKE_C_FLAGS to insure that
>> +the sysroot is passed to the compiler, instead of just setting warning
>> +options.  Otherwise we'll get problem croos compiling in some
>> +circumstances.
>> +
>> +--- a/CMakeLists.txt	2012-10-31 14:16:45.000000000 -0400
>> ++++ b/CMakeLists.txt	2013-02-12 14:07:04.297058345 -0500
>> +@@ -2,7 +2,7 @@
>> + project(Hiawatha C)
>> +
>> + # Compiler
>> +-set(CMAKE_C_FLAGS "-Wall -Wextra")
>> ++set(CMAKE_C_FLAGS "-Wall -Wextra ${CMAKE_C_FLAGS}")
>> + set(CMAKE_BUILD_TYPE "RelWithDebInfo")
>> +
>> + # Options
>> diff --git a/recipes-httpd/hiawatha/hiawatha_8.6.bb b/recipes-httpd/hiawatha/hiawatha_8.6.bb
>> index 837354b..d46a525 100644
>> --- a/recipes-httpd/hiawatha/hiawatha_8.6.bb
>> +++ b/recipes-httpd/hiawatha/hiawatha_8.6.bb
>> @@ -4,9 +4,12 @@ LICENSE = "GPLv2"
>>    LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>>    DEPENDS = "libxml2 libxslt"
>>
>> +PR = "r1"
>> +
>>    SECTION = "net"
>>
>>    SRC_URI = "http://hiawatha-webserver.org/files/${BPN}-${PV}.tar.gz \
>> +           file://cmake.patch \
>>               file://hiawatha-init"
>>
>>    SRC_URI[md5sum] = "372ea9e8329ed36e4fb781fdc1a6734c"
>
> What's the upstream status on this? If you email Hugo (the developer)
> directly he usually responds within a few hours and will pull the
> changes into the next release.

I'm following up for Jeff.  He has contacted Hugo and the above patch has been 
included upstream.

--Mark

> Regards,
> Jack.
>



