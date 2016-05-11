Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A7C5A60249
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 01:33:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4B1XsnP010768
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 May 2016 18:33:54 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 18:33:54 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1462896891.git.hongxu.jia@windriver.com>
	<20160510211057.GE5675@jama>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <57328BFA.90609@windriver.com>
Date: Wed, 11 May 2016 09:33:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <20160510211057.GE5675@jama>
Cc: koen.kooi@linaro.org, openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH V5 0/5] efivar: upgrade to 0.23
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
X-List-Received-Date: Wed, 11 May 2016 01:33:56 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2016 05:10 AM, Martin Jansa wrote:
> On Tue, May 10, 2016 at 12:19:34PM -0400, Hongxu Jia wrote:
>> Changed in V5:
>> - Fix unknown option while gold linker used
> Still fails in world builds:
>
> http://errors.yoctoproject.org/Errors/Details/62248/
>
> i586-oe-linux-gcc  -m32 -march=i586 --sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/efivar/0.23-r0=/usr/src/debug/efivar/0.23-r0 -fdebug-prefix-map=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux= -fdebug-prefix-map=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86=  -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/efivar/0.23-r0/git/src/include/efivar/  -specs=/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/efivar/0.23-r0/git/gcc.specs  -L.  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed     -o efivar efivar.c -lefivar -ldl -lpopt
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/i586-oe-linux/gcc/i586-oe-linux/5.3.0/ld: fatal error: -f/--auxiliary may not be used without -shared
> collect2: error: ld returned 1 exit status

Oh, sorry, the fix was not include:
- Use 'pie' to replace 'PIE'

//Hongxu


>
>> Changed in V4:
>> - Fix one failed with:
>> | install -d -m 755 efivar/0.23-r0/image/usr/lib/pkgconfig/
>> | install -m 644 efivar.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
>> ;  install -m 644 efiboot.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
>> ;
>> | install: cannot stat 'efivar.pc': No such file or directory
>> | install: cannot stat 'efiboot.pc': No such file or directory
>> | make[1]: *** [install] Error 1
>> | make[1]: Leaving directory `efivar/0.23-r0/git/src'
>> | make: *** [install] Error 2
>> | ERROR: oe_runmake failed
>>
>> //Hongxu
>>
>> The following changes since commit a6c172e2713f0018c5ebac0f957cff28b7ac2630:
>>
>>    poppler: add --std=c++11 to fix build with Qt 5.7 (2016-05-06 12:40:28 +0200)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib hongxu/fix-efivar
>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-efivar
>>
>> Hongxu Jia (3):
>>    efivar: fix do_install failed
>>    efibootmgr: sync with upstream while efivar upgraded to 0.23
>>    efivar: fix unknown option while gold linker used
>>
>> Koen Kooi (2):
>>    efivar: update to 0.23
>>    efibootmgr: update and unblacklist
>>
>>   .../recipes-extended/efibootmgr/efibootmgr_0.12.bb | 14 ++---
>>   .../efibootmgr/files/ldflags.patch                 | 17 ------
>>   .../efivar/0001-efivar-fix-for-cross-compile.patch | 28 +++++----
>>   .../efivar/efivar/0002-disable-static-build.patch  | 33 ++++++++++
>>   .../efivar/0003-efivar-fix-for-cross-compile.patch | 44 ++++++++++++++
>>   .../0004-fix-unknow-option-for-gold-linker.patch   | 40 ++++++++++++
>>   ...ptions-not-supported-by-lower-version-gcc.patch | 71 ----------------------
>>   .../efivar/{efivar_0.21.bb => efivar_0.23.bb}      | 29 ++++-----
>>   8 files changed, 155 insertions(+), 121 deletions(-)
>>   delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/ldflags.patch
>>   create mode 100644 meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
>>   create mode 100644 meta-oe/recipes-extended/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
>>   create mode 100644 meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
>>   delete mode 100644 meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch
>>   rename meta-oe/recipes-extended/efivar/{efivar_0.21.bb => efivar_0.23.bb} (46%)
>>
>> -- 
>> 2.8.1
>>


