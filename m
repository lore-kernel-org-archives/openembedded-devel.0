Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PsMS7-0000dJ-3R
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 22:40:55 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PsMQo-0003z0-I5 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 13:39:34 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 23 Feb 2011 13:39:34 -0800
Received: from [172.30.80.151] ([172.30.80.151]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 23 Feb 2011 14:39:33 -0700
Message-ID: <4D657E89.9050706@mentor.com>
Date: Wed, 23 Feb 2011 14:39:21 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D64BD5E.6040805@dresearch.de>
In-Reply-To: <4D64BD5E.6040805@dresearch.de>
X-OriginalArrivalTime: 23 Feb 2011 21:39:33.0357 (UTC)
	FILETIME=[28D791D0:01CBD3A2]
Subject: Re: net-snmp-svn-r7.0 do_compile failed
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
X-List-Received-Date: Wed, 23 Feb 2011 21:40:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/23/2011 12:55 AM, Steffen Sledz wrote:
> Again a clean build:
>
> OE:hipox sledz@mobil-400-586:~/work/openembedded>  bitbake net-snmp
> ...
>
> Build Configuration:
> BB_VERSION        = "1.12.0"
> METADATA_BRANCH   = "org.openembedded.dev"
> METADATA_REVISION = "8e4bd2f"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "hipox"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "2010.7-test-20110223"
> TARGET_FPU        = "soft"
>
> ...
> libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -Wl,-rpath-link -Wl,/home/sledz/work/OE-testing/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=gnu -mthumb-interwork -mno-thumb -DNETSNMP_ENABLE_IPV6 -isystem/home/sledz/work/OE-testing/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -Ulinux -Dlinux=linux -Wall -Winline -Wstrict-prototypes -Wwrite-strings -Wcast-qual -Wno-char-subscripts -o .libs/snmpd .libs/snmpd.o -Wl,-rpath-link -Wl,/home/sledz/work/OE-testing/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=gnu  -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/agent/.libs -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/agent/helpers/.libs
> -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/snmplib/.libs -L/home/sledz/work/OE-testing/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/snmplib -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/agent/helpers ./.libs/libnetsnmpagent.so helpers/.libs/libnetsnmphelpers.so ./.libs/libnetsnmpmibs.so /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/agent/helpers/.libs/libnetsnmphelpers.so /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/agent/.libs/libnetsnmpagent.so /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/snmplib/.libs/libnetsnmp.so -ldl ../snmplib/.libs/libnetsnmp.so -lcrypto -lssl
> ./.libs/libnetsnmpmibs.so: undefined reference to `pthread_create'
> collect2: ld returned 1 exit status
> make[1]: *** [snmpd] Error 1

Does log.do_configure say anything about pthreads?

-- 
Tom Rini
Mentor Graphics Corporation


