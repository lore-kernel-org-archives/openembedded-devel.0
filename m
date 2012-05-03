Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1SPpl5-0001Kt-Ne
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 08:43:23 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0;
	Thu, 3 May 2012 08:33:37 +0200
X-TM-IMSS-Message-ID: <1458d2ee001c8c59@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 1458d2ee001c8c59 ;
	Thu, 3 May 2012 08:33:38 +0200
Message-ID: <4FA226C0.80407@nedap.com>
Date: Thu, 3 May 2012 08:33:36 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120412 Thunderbird/11.0.1
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: llvm fails to build
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
X-List-Received-Date: Thu, 03 May 2012 06:43:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

trying to compile openjdk-6, it fails with:

| 
/media/OpenEmbedded/oe-core/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/llvm2.8-2.8-r0/llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp: 
In constructor '{anonymous}::StatSymbols::StatSymbols()':
| 
/media/OpenEmbedded/oe-core/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/llvm2.8-2.8-r0/llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp:69:67: 
error: 'lseek64' was not declared in this scope
| make[2]: *** 
[lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/Intercept.cpp.o] Error 1
| make[2]: Leaving directory 
`/media/OpenEmbedded/oe-core/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/llvm2.8-2.8-r0/llvm-2.8/build'
| make[1]: *** [lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/all] Error 2
| make[1]: *** Waiting for unfinished jobs....

I'm using master branches.
Is this a known issue?
Any ideas how to solve?

Thanks,
Jaap


