Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1P8Zu7-00028s-BI
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 16:44:39 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Wed, 20 Oct 2010 16:43:59 +0200
X-TM-IMSS-Message-ID: <11d9a21c00005bef@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 11d9a21c00005bef for
	<jaap.dejong@nedap.com>; Wed, 20 Oct 2010 16:43:59 +0100
Message-ID: <4CBF002E.7020407@nedap.com>
Date: Wed, 20 Oct 2010 16:43:58 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100922 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CBEB7E8.5020109@nedap.com>	<AANLkTikBiKGuQYXCdi_QMirA7_AjQn9b0A0CWtmkMu90@mail.gmail.com>
	<29F88E4E-18CC-4CD2-8A76-5C78ED4EDAC7@nikom.net>
In-Reply-To: <29F88E4E-18CC-4CD2-8A76-5C78ED4EDAC7@nikom.net>
X-OriginalArrivalTime: 20 Oct 2010 14:43:59.0573 (UTC)
	FILETIME=[3B199050:01CB7065]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building gcc-cross-initial for armv5te
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
X-List-Received-Date: Wed, 20 Oct 2010 14:44:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Running on ubuntu 10.10

Not sure what you mean with the second part of your question.

	bitbakegcc-cross-initial

gives the same error.

Started from scratch (no tmp dir)



On 10/20/2010 03:26 PM, Nik wrote:
> What os are you compiling on?  Can you run the cross compile gcc from the command line and get the no input files message?
>
> Sent from my iPhone
>
> On Oct 20, 2010, at 7:25 AM, Frans Meulenbroeks<fransmeulenbroeks@gmail.com>  wrote:
>
>> 2010/10/20 Jaap de Jong<jaap.dejong@nedap.com>:
>>>   building gcc-cross-initial for armv5te fails:
>>>
>>>    ///
>>>    | checking for arm-angstrom-linux-gnueabi-ranlib...
>>>    arm-angstrom-linux-gnueabi-ranlib
>>>    | checking for arm-angstrom-linux-gnueabi-strip...
>>>    arm-angstrom-linux-gnueabi-strip
>>>    | checking whether ln -s works... yes
>>>    | checking for arm-angstrom-linux-gnueabi-gcc...
>>>
>>> /media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/xgcc
>>>
>>> -B/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/
>>>    -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb
>>>
>>> -isystem/media/OpenEmbedded/unstable/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/include
>>>
>>> -B/media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-angstrom-linux-gnueabi/bin/
>>>
>>> -B/media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-angstrom-linux-gnueabi/lib/
>>>    -isystem
>>>
>>> /media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-angstrom-linux-gnueabi/include
>>>    -isystem
>>>
>>> /media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-angstrom-linux-gnueabi/sys-include
>>>
>>> --sysroot=/media/OpenEmbedded/unstable/tmp/sysroots/armv5te-angstrom-linux-gnueabi
>>>    | checking for suffix of object files... configure: error: in
>>>
>>> `/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libgcc':
>>>    | configure: error: cannot compute suffix of object files: cannot
>>>    compile
>>>    | See `config.log' for more details.
>>>    | make[1]: *** [configure-target-libgcc] Error 1
>>>    | make[1]: Leaving directory
>>>
>>> `/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom-linux-gnueabi'
>>>    | make: *** [all] Error 2
>>>    | FATAL: oe_runmake failed
>>>    NOTE: Task failed:
>>>
>>> /media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/temp/log.do_compile.1864
>>>    ERROR: TaskFailed event exception, aborting
>>>    ERROR: Build of
>>>
>>> /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/gcc/gcc-cross-initial_4.5.bb
>>>    do_compile failed
>>>    ERROR: Task 6228
>>>
>>> (/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/gcc/gcc-cross-initial_4.5.bb,
>>>    do_compile) failed
>>>    NOTE: Waiting for 2 active tasks to finish
>>>    NOTE: 1:
>>>
>>> /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/classpath/classpath-native_0.98.bb,
>>>    do_install (1885)
>>>    NOTE: 2:
>>>
>>> virtual:native:/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/xorg-lib/libx11_1.3.99.902.bb,
>>>    do_install (1886)
>>>    NOTE: Waiting for 1 active tasks to finish
>>>    NOTE: 1:
>>>
>>> /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/classpath/classpath-native_0.98.bb,
>>>    do_install (1885)
>>>    NOTE: Tasks Summary: Attempted 888 tasks of which 888 didn't need to
>>>    be rerun and 1 failed.
>>>    ERROR:
>>>
>>> '/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/gcc/gcc-cross-initial_4.5.bb'
>>>    failed
>>>
>>>
>>> Checking
>>>
>>> tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom-linux-gnueabi/gcc/config.log
>>>
>>> reveals:
>>>
>>>    configure:4791: checking whether compiler driver understands Ada
>>>    configure:4814: result: no
>>>    configure:4851: checking how to run the C preprocessor
>>>    configure:4921: result: gcc -E
>>>    configure:4941: gcc -E  conftest.c
>>>    configure:4941: $? = 0
>>>    configure:4955: gcc -E  conftest.c
>>>    conftest.c:11: fatal error: ac_nonexistent.h: No such file or directory
>>>    compilation terminated.
>>>
>>>
>>> Not sure if it has anything to do with it.
>>> I can't find ac_nonexistent.h, but perhaps this is intended looking at the
>>> filename...
>>> Any help is appreciated!
>>> Jaap
>>> _______________________________________________
>> With the testing-next branch things build fine with me
>> (ditro slugos, machine nslu2le  and nslu2be)
>>
>> Frans
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


