Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1OmR72-0002yw-Pw
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 14:54:25 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Fri, 20 Aug 2010 14:53:52 +0200
X-TM-IMSS-Message-ID: <0fa3b44d00005985@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 0fa3b44d00005985 for
	<jaap.dejong@nedap.com>; Fri, 20 Aug 2010 14:53:52 +0100
Message-ID: <4C6E7ADF.7040401@nedap.com>
Date: Fri, 20 Aug 2010 14:53:51 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100713 Lightning/1.0b1 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C624772.8000607@nedap.com>	<20100811072548.GB7282@mi.fu-berlin.de>	<20100819105518.GL11569@jama>	<20100819121301.GA21426@mi.fu-berlin.de>	<20100819122903.GM11569@jama>	<4C6E29B3.8050801@nedap.com>	<20100820074410.GO11569@jama>
	<4C6E354A.9040906@nedap.com> <4C6E5867.1030703@gmx.net>
In-Reply-To: <4C6E5867.1030703@gmx.net>
X-OriginalArrivalTime: 20 Aug 2010 12:53:52.0420 (UTC)
	FILETIME=[BDBB4640:01CB4066]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: problem building openjdk-6
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
X-List-Received-Date: Fri, 20 Aug 2010 12:54:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The trouble is somewhere else:

ERROR: function do_compile failed
ERROR: log data follows 
(/media/OpenEmbedded/stable-2009/tmp/work/armv5te-angstrom-linux-gnueabi/llvm2.7-2.7-r8/temp/log.do_compile.20297)
| NOTE: make -j5
| Scanning dependencies of target count
| Scanning dependencies of target LLVMHello
| Scanning dependencies of target LLVMSystem
| [  1%] [  1%] Building C object utils/count/CMakeFiles/count.dir/count.c.o
| [  1%] Building CXX object 
lib/Transforms/Hello/CMakeFiles/LLVMHello.dir/Hello.cpp.o
| [  1%] Building CXX object 
lib/System/CMakeFiles/LLVMSystem.dir/Alarm.cpp.o
| [  1%] Building CXX object 
lib/System/CMakeFiles/LLVMSystem.dir/Atomic.cpp.o
| Building CXX object 
lib/System/CMakeFiles/LLVMSystem.dir/Disassembler.cpp.o
| Linking C executable ../../bin/count
| [  1%] Building CXX object 
lib/System/CMakeFiles/LLVMSystem.dir/DynamicLibrary.cpp.o
| [  2%] Building CXX object 
lib/System/CMakeFiles/LLVMSystem.dir/Errno.cpp.o
| [  2%] Built target count
| [  2%] Building CXX object lib/System/CMakeFiles/LLVMSystem.dir/Host.cpp.o
| [  2%] Building CXX object 
lib/System/CMakeFiles/LLVMSystem.dir/IncludeFile.cpp.o
| [  2%] Building CXX object 
lib/System/CMakeFiles/LLVMSystem.dir/Memory.cpp.o
| [  2%] 
/media/OpenEmbedded/stable-2009/tmp/work/armv5te-angstrom-linux-gnueabi/llvm2.7-2.7-r8/llvm-2.7/lib/System/Memory.cpp: 
In static member function 'static void 
llvm::sys::Memory::InvalidateInstructionCache(const void*, size_t)':
| 
/media/OpenEmbedded/stable-2009/tmp/work/armv5te-angstrom-linux-gnueabi/llvm2.7-2.7-r8/llvm-2.7/lib/System/Memory.cpp:67: 
error: '__clear_cache' was not declared in this scope
| [  3%] make[2]: *** 
[lib/System/CMakeFiles/LLVMSystem.dir/Memory.cpp.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| Linking CXX shared module ../../LLVMHello.so
| Building CXX object lib/System/CMakeFiles/LLVMSystem.dir/Mutex.cpp.o
| Building CXX object lib/System/CMakeFiles/LLVMSystem.dir/Path.cpp.o
| [  3%] Built target LLVMHello
| make[1]: *** [lib/System/CMakeFiles/LLVMSystem.dir/all] Error 2
| make: *** [all] Error 2
| FATAL: oe_runmake failed



On 08/20/2010 12:26 PM, Robert Schuster wrote:
> Hi Jaap,
> no the fix is not necessary since stable does not have the
> virtclass-native stuff.
>
> Apart from that adding the jamvm-native 1.5.4 recipe to stable would be
> a good idea.
>
> Regards
> Robert
>
> Am 20.08.2010 09:56, schrieb Jaap de Jong:
>    
>> Thanks Martin,
>>
>> it is translating right now...
>> do_configure for openjdk-6-jre-6b18-1.8-r10.6 passed, so this problem
>> is solved!
>>
>> The same (minor changes) applies to the stable/2009 branch?
>>
>> Jaap
>>
>> On 08/20/2010 09:44 AM, Martin Jansa wrote:
>>      
>>> On Fri, Aug 20, 2010 at 09:07:31AM +0200, Jaap de Jong wrote:
>>>
>>>        
>>>> Hi Martin,
>>>>
>>>>          
>>> Hi Jaap,
>>>
>>>
>>>        
>>>> I've read about your fix on this matter and did a complete new rebuild
>>>> last night, but it still does not translate here.
>>>> Although the error is somewhere else.
>>>>
>>>>          
>>> Yes, I know..
>>>
>>> try again with:
>>> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=aa5fae1ad0f33ca478873ffd1a48fcaefff61b13
>>>
>>>
>>> Regards,
>>>
>>>
>>>        
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>      
>
>    
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>    

