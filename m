Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1SPrkB-0004f3-I2
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 10:50:35 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0;
	Thu, 3 May 2012 10:40:49 +0200
X-TM-IMSS-Message-ID: <14cd46f1001c94ca@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 14cd46f1001c94ca ;
	Thu, 3 May 2012 10:40:50 +0200
Message-ID: <4FA2448C.6050401@nedap.com>
Date: Thu, 3 May 2012 10:40:44 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120412 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4FA226C0.80407@nedap.com>
	<CAMKF1sr1DGqUtxsCxSmqAXmkM+k36GTyj1551zEZ4dJMss2SgQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr1DGqUtxsCxSmqAXmkM+k36GTyj1551zEZ4dJMss2SgQ@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: llvm fails to build
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
X-List-Received-Date: Thu, 03 May 2012 08:50:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Thanks!
That helps a lot!!
Unfortunately I'm not familiar with submitting the patch... (shame on 
me! You may sent me a link for the howto)
However this is the patch I used

    diff --git a/llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp
    b/llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp
    index 274f816..a4e7eee 100644
    --- a/llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp
    +++ b/llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp
    @@ -19,6 +19,7 @@
      #include "llvm/Support/ErrorHandling.h"
      #include "llvm/System/DynamicLibrary.h"
      #include "llvm/Config/config.h"
    +#include <unistd.h>
      using namespace llvm;

      // AtExitHandlers - List of functions to call when the program exits,

Thanks again,
Jaap

On 05/03/2012 09:26 AM, Khem Raj wrote:
> On Wed, May 2, 2012 at 11:33 PM, Jaap de Jong<jaap.dejong@nedap.com>  wrote:
>> Hi all,
>>
>> trying to compile openjdk-6, it fails with:
>>
>> |
>> /media/OpenEmbedded/oe-core/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/llvm2.8-2.8-r0/llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp:
>> In constructor '{anonymous}::StatSymbols::StatSymbols()':
>> |
>> /media/OpenEmbedded/oe-core/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/llvm2.8-2.8-r0/llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp:69:67:
>> error: 'lseek64' was not declared in this scope
>> | make[2]: ***
>> [lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/Intercept.cpp.o] Error 1
>> | make[2]: Leaving directory
>> `/media/OpenEmbedded/oe-core/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/llvm2.8-2.8-r0/llvm-2.8/build'
>> | make[1]: *** [lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/all] Error 2
>> | make[1]: *** Waiting for unfinished jobs....
>>
>> I'm using master branches.
>> Is this a known issue?
>> Any ideas how to solve?
> you are using gcc 4.7 I guess. Fix is to add #include<unistd.h>  in
> Intercept.cpp
> if that works then submit it to meta-java
>> Thanks,
>> Jaap
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

