Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8397324E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 08:14:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5C8Ed0g007007
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Jun 2015 01:14:39 -0700 (PDT)
Received: from [128.224.163.137] (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 12 Jun 2015 01:14:39 -0700
Message-ID: <557A94EB.6090908@windriver.com>
Date: Fri, 12 Jun 2015 16:14:35 +0800
From: Yi Zhao <yi.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
References: <cover.1433403866.git.yi.zhao@windriver.com>	<a55cd1ca790ecc6a173648bc60bf3b37f98a82b0.1433403866.git.yi.zhao@windriver.com>
	<20150611103956.GA2394@jama>
In-Reply-To: <20150611103956.GA2394@jama>
X-Originating-IP: [128.224.163.137]
Subject: Re: [meta-oe][PATCH 1/3] luajit: fix build failure for multilib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jun 2015 08:14:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2015年06月11日 18:39, Martin Jansa 写道:
> On Thu, Jun 04, 2015 at 03:48:11PM +0800, Yi Zhao wrote:
>> Fix libdir in Makefile
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
>> index 48137e3..f3235c9 100644
>> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
>> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
>> @@ -16,8 +16,8 @@ inherit pkgconfig binconfig
>>   BBCLASSEXTEND = "native"
>>   
>>   do_configure_prepend() {
>> -    sed -i -e s:/usr/local:${prefix}:g ${S}/Makefile
>> -    sed -i -e s:/lib$:${base_libdir}:g ${S}/Makefile
>> +    sed -i 's:PREFIX= /usr/local:PREFIX= ${prefix}:g' ${S}/Makefile
>> +    sed -i 's:MULTILIB= lib:MULTILIB= ${base_libdir}:g' ${S}/Makefile
>>   }
> This seems to break qemux86 build
>
> | ==== Successfully installed LuaJIT 2.0.3 to /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr ====
> | rmdir: failed to remove `/home/jenkins/oe/world/shr-core/tmp-glibc/work/x86_64-linux/luajit-native/2.0.3-r0/image/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib/lua/5.*': No such file or directory
> | rmdir: failed to remove `/home/jenkins/oe/world/shr-core/tmp-glibc/work/x86_64-linux/luajit-native/2.0.3-r0/image/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib/lua': No such file or directory
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_install (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/x86_64-linux/luajit-native/2.0.3-r0/temp/log.do_install.31954)
> NOTE: recipe luajit-native-2.0.3-r0: task do_install: Failed
> ERROR: Task 31965 (virtual:native:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb, do_install) failed with exit code '1'
>

Thanks, Martin. I can reproduce it. A patch will be sent later.

Yi


>>   
>>   EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX} \
>> -- 
>> 1.7.9.5
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


