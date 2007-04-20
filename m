Received: from [80.122.23.18] (helo=admproxy.stiftadmont.local)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <patrick.steiner@a1.net>) id 1Helwp-0003fp-75
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2007 07:46:19 +0200
Received: from admproxy.stiftadmont.local (localhost [127.0.0.1])
	by postfix.imss70 (Postfix) with ESMTP id 9D5741DC5CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2007 07:45:55 +0200 (CEST)
Received: from admex.ora.local (admex [10.2.0.60])
	by admproxy.stiftadmont.local (Postfix) with ESMTP id 920001DC5B6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2007 07:45:55 +0200 (CEST)
Received: from [10.2.1.9] ([10.2.1.9]) by admex.ora.local with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 20 Apr 2007 07:46:45 +0200
Message-ID: <462853A9.6020309@a1.net>
Date: Fri, 20 Apr 2007 07:46:17 +0200
From: Patrick Steiner <patrick.steiner@a1.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070302)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
References: <200704192334.00169.patrick.steiner@a1.net>
	<432beae0704191642m79afc9aaia85466716ee744af@mail.gmail.com>
In-Reply-To: <432beae0704191642m79afc9aaia85466716ee744af@mail.gmail.com>
X-OriginalArrivalTime: 20 Apr 2007 05:46:45.0434 (UTC)
	FILETIME=[47B809A0:01C7830F]
X-TM-AS-Product-Ver: IMSS-7.0.0.1640-3.8.0.1026-15126.002
X-TM-AS-Result: No--19.356-5.0-4-1
X-imss-scan-details: No--19.356-5.0-4-1;No--19.356-5.0-4-1
Subject: Re: strange build errors after (Checking Package:...)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Apr 2007 05:46:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Justin Patrin wrote:
> On 4/19/07, Patrick Steiner <patrick.steiner@a1.net> wrote:
>> hi,
>>
>> i have some problems with latest OE (bitbake)
>>
>> i currently try to build a gpephone image but i get some errors on every
>> package.
>>
>> NOTE: Running task 321 of 3196 (ID:
>> 1373, /home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb,
>> do_qa_configure)
>> NOTE: package libxdmcp-1.0.2: started
>> NOTE: package libxdmcp-1_1.0.2-r0: task do_qa_configure: started
>> NOTE: Checking sanity of the config.log file
>> NOTE: package libxdmcp-1_1.0.2-r0: task do_qa_configure: completed
>> NOTE: package libxdmcp-1.0.2: completed
>> NOTE: Running task 322 of 3196 (ID:
>> 1366, /home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb,
>> do_compile)
>> NOTE: package libxdmcp-1.0.2: started
>> NOTE: package libxdmcp-1_1.0.2-r0: task do_compile: started
>> NOTE: package libxdmcp-1_1.0.2-r0: task do_compile: completed
>> NOTE: package libxdmcp-1.0.2: completed
>> NOTE: Running task 323 of 3196 (ID:
>> 1367, /home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb,
>> do_install)
>> NOTE: package libxdmcp-1.0.2: started
>> NOTE: package libxdmcp-1_1.0.2-r0: task do_install: started
>> NOTE: package libxdmcp-1_1.0.2-r0: task do_install: completed
>> NOTE: package libxdmcp-1.0.2: completed
>> NOTE: Running task 324 of 3196 (ID:
>> 1371, /home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb,
>> do_package)
>> NOTE: package libxdmcp-1.0.2: started
>> NOTE: package libxdmcp-1_1.0.2-r0: task do_package: started
>> NOTE: Couldn't find shared library provider for libc.so.6
>> NOTE: Couldn't find shared library provider for libc.so.6
>> NOTE: couldn't find pkgconfig module 'xproto' in any package
>> NOTE: DO PACKAGE QA
>> NOTE: Checking Package: libxdmcp-dbg
>> ERROR: Can not check RPATH scanelf not found
>> ERROR: Error in executing:
>> ERROR: Exception:exceptions.SystemExit Message:1
>> ERROR: Printing the environment of the function
>> ERROR: Error in executing:
>> ERROR: Exception:exceptions.SystemExit Message:1
>> ERROR: Printing the environment of the function
>> ERROR: Error in executing:
>> ERROR: Exception:exceptions.SystemExit Message:1
>> ERROR: Printing the environment of the function
>> ERROR: Error in executing:
>> ERROR: Exception:exceptions.SystemExit Message:1
>> ERROR: Printing the environment of the function
>> ERROR: Build
>> of /home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb
>> do_package failed
>> ERROR: Task 1371
>> (/home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb,
>> do_package) failed
>> ERROR: '/home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb'
>> failed
>>
>>
>> if i restart bitbake gpephone-image the package works an another one exits
>> with this error. has anyone a ideas what happens?
>>
>> here is my oe build config:
>> OE Build Configuration:
>> BB_VERSION     = "1.8.0"
>> OE_REVISION    = "<unknown>"
>> TARGET_ARCH    = "arm"
>> TARGET_OS      = "linux-gnueabi"
>> MACHINE        = "htctornado"
>> DISTRO         = "angstrom"
>> DISTRO_VERSION = "test-20070419"
>> TARGET_FPU     = "soft"
>>
>> regards,
>>
>>  patrick (law)
>>
>
> Sounds to me like a missing native dep on whatever package scanelf comes from
hi i think this was the problem i did bitbake pax-utils-native now it works

i think this should be added as default dependency, also the sha256sum 
stuff...

thanks

patrick


