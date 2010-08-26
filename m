Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1Ooayn-00031h-OK
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 13:50:51 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Thu, 26 Aug 2010 13:50:20 +0200
X-TM-IMSS-Message-ID: <2e4fc5740001c26e@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 2e4fc5740001c26e for
	<jaap.dejong@nedap.com>; Thu, 26 Aug 2010 13:50:25 +0100
Message-ID: <4C7654FB.4050506@nedap.com>
Date: Thu, 26 Aug 2010 13:50:19 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100713 Lightning/1.0b1 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 26 Aug 2010 11:50:20.0488 (UTC)
	FILETIME=[DC1F1C80:01CB4514]
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: llvm cmake error
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
X-List-Received-Date: Thu, 26 Aug 2010 11:50:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I have some strange behavior while building openjdk-6 for ipx4xxbe
Any ideas are welcome!

Jaap

  
$ MACHINE=ixp4xxbe bitbake openjdk-6
//
ERROR: function do_configure failed
ERROR: log data follows
(/media/OpenEmbedded/unstable/tmp/work/armv5teb-angstrom-linux-gnueabi/llvm2.7-2.7-r8/temp/log.do_configure.31516)
| /media/OpenEmbedded/unstable/tmp/work/armv5teb-angstrom-linux-gnueabi/llvm2.7-2.7-r8/temp/run.do_configure.31516:
line 625: cmake_do_configure: command not found
NOTE: Task failed: /media/OpenEmbedded/unstable/tmp/work/armv5teb-angstrom-linux-gnueabi/llvm2.7-2.7-r8/temp/log.do_configure.31516
ERROR: TaskFailed event exception, aborting
ERROR: Build of /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/llvm/llvm2.7_2.7.bb do_configure failed
ERROR: Task 488 (/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/llvm/llvm2.7_2.7.bb, do_configure) failed
ERROR: '/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/llvm/llvm2.7_2.7.bb' failed



