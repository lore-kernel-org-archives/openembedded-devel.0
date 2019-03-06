Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7ACD37BEEC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:16:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x265GFGC023900
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Mar 2019 21:16:15 -0800 (PST)
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 5 Mar 2019 21:16:14 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <20190306033908.173027-1-kai.kang@windriver.com>
	<e887e9d9-62fb-20fb-f753-4567b197ba20@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <7e344437-fa22-0312-c211-c250f9f5ff2f@windriver.com>
Date: Wed, 6 Mar 2019 13:15:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <e887e9d9-62fb-20fb-f753-4567b197ba20@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] leveldb: fix compile errors for mips with DEFAULTTUNE mips
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
X-List-Received-Date: Wed, 06 Mar 2019 05:16:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/3/6 上午11:49, Khem Raj wrote:
>
>
> On 3/5/19 7:39 PM, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It fails to compile leveldb for qemumips with DEFAULTTUNE 'mips':
>>
>> | {standard input}: Assembler messages:
>> | {standard input}:8004: Error: opcode not supported on this processor:
>>    mips1 (mips1) `sync'
>> | {standard input}:10296: Error: opcode not supported on this processor:
>>    mips1 (mips1) `sync'
>> | make: *** [out-shared/db/db_bench.o] Error 1
>>
>> Asm instruction 'sync' is called in platform-specific function
>> MemoryBarrier() which is used by AtomicPointer(). Comment out the
>> definition of MemoryBarrier() for mips to avoid the errors. And turn to
>> use AtomicPointer() based on C++11 <atomc>.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   ...fine-function-MemoryBarrier-for-mips.patch | 43 +++++++++++++++++++
>>   meta-oe/recipes-dbs/leveldb/leveldb_git.bb    |  1 +
>>   2 files changed, 44 insertions(+)
>>   create mode 100644 
>> meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBarrier-for-mips.patch
>>
>> diff --git 
>> a/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBarrier-for-mips.patch 
>> b/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBarrier-for-mips.patch 
>>
>> new file mode 100644
>> index 000000000..fc7743030
>> --- /dev/null
>> +++ 
>> b/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBarrier-for-mips.patch
>> @@ -0,0 +1,43 @@
>> +It fails to compile leveldb for qemumips with default tune 'mips':
>> +
>> +| {standard input}: Assembler messages:
>> +| {standard input}:8004: Error: opcode not supported on this processor:
>> +  mips1 (mips1) `sync'
>> +| {standard input}:10296: Error: opcode not supported on this 
>> processor:
>> +  mips1 (mips1) `sync'
>> +| make: *** [out-shared/db/db_bench.o] Error 1
>> +
>> +Asm instruction 'sync' is called in platform-specific function
>> +MemoryBarrier() which is used by AtomicPointer(). Comment out the
>> +definition of MemoryBarrier() for mips to avoid the errors. And turn to
>> +use AtomicPointer() based on C++11 <atomic>.
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +---
>> + port/atomic_pointer.h | 10 +++++-----
>> + 1 file changed, 5 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/port/atomic_pointer.h b/port/atomic_pointer.h
>> +index 1c4c7aa..7025ac3 100644
>> +--- a/port/atomic_pointer.h
>> ++++ b/port/atomic_pointer.h
>> +@@ -113,11 +113,11 @@ inline void MemoryBarrier() {
>> + #define LEVELDB_HAVE_MEMORY_BARRIER
>> +
>> + // MIPS
>> +-#elif defined(ARCH_CPU_MIPS_FAMILY) && defined(__GNUC__)
>> +-inline void MemoryBarrier() {
>> +-  __asm__ __volatile__("sync" : : : "memory");
>> +-}
>> +-#define LEVELDB_HAVE_MEMORY_BARRIER
>> ++//#elif defined(ARCH_CPU_MIPS_FAMILY) && defined(__GNUC__)
>> ++//inline void MemoryBarrier() {
>> ++//  __asm__ __volatile__("sync" : : : "memory");
>> ++//}
>> ++//#define LEVELDB_HAVE_MEMORY_BARRIER
>> +
>
> this is punishing all mips o32 variants.

How about only apply the patch when DEFAULTTUNE is 'mips', such as 
something looks like:

python ()  {

     if d.getVar('DEFAULTTUNE') == 'mips':

         d.appendVar('SRC_URI', ' 
file://do-not-define-function-MemoryBarrier-for-mips.patch')

}


Regards,
Kai

>
>> + #endif
>> +
>> diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb 
>> b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
>> index 8fec89c6f..10988726a 100644
>> --- a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
>> +++ b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
>> @@ -11,6 +11,7 @@ SRC_URI = "git://github.com/google/${BPN}.git \
>> file://0001-build_detect_platform-Check-for-__SSE4_2__.patch \
>>              file://0002-makefile-build-SHARED_MEMENVLIB.patch \
>>              file://0001-Makefile-Fix-parallel-build.patch \
>> + file://do-not-define-function-MemoryBarrier-for-mips.patch \
>>              "
>>     S = "${WORKDIR}/git"
>>
>

-- 
Kai Kang


