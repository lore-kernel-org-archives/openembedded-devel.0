Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US5It-000059-Ne
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 14:48:27 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Apr 2013 05:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,485,1363158000"; d="scan'208";a="319008764"
Received: from unknown (HELO helios.localnet) ([10.255.14.4])
	by orsmga002.jf.intel.com with ESMTP; 16 Apr 2013 05:30:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 13:30:34 +0100
Message-ID: <4130879.bHlKN1xLuQ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <516D2F75.6040002@communistcode.co.uk>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
	<516D2F75.6040002@communistcode.co.uk>
MIME-Version: 1.0
Subject: Re: [meta-networking, meta-oe][PATCH 0/9] Move networking recipes to meta-networking
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
X-List-Received-Date: Tue, 16 Apr 2013 12:48:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 16 April 2013 12:01:09 Jack Mitchell wrote:
> On 16/04/13 11:53, Paul Eggleton wrote:
> > This moves most of the remaining networking recipes in meta-oe to
> > meta-networking, with some additional tidying up.
> 
> Could we possibly get net-snmp in with this move?

Whoops, I meant to move that one. However I just tried to build it after
doing so and it fails during do_compile:

| ../arm-poky-linux-gnueabi-libtool  --mode=link arm-poky-linux-gnueabi-gcc  -march=armv5te  -marm -mthumb-interwork   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed --sysroot=/home/paul/poky/poky/build/tmp/sysroots/qemuarm -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=linux  -o snmpd snmpd.lo  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  libnetsnmpagent.la libnetsnmpmibs.la ../snmplib/libnetsnmp.la -lm
| arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-gcc -march=armv5te -marm -mthumb-interwork -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed --sysroot=/home/paul/poky/poky/build/tmp/sysroots/qemuarm -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=linux -o .libs/snmpd .libs/snmpd.o -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  ./.libs/libnetsnmpagent.so ./.libs/libnetsnmpmibs.so /home/paul/poky/poky/build/tmp/work/armv5te-poky-linux-gnueabi/net-snmp/5.7.1-r6.4/net-snmp-5.7.1/agent/.libs/libnetsnmpagent.so /home/paul/poky/poky/build/tmp/work/armv5te-poky-linux-gnueabi/net-snmp/5.7.1-r6.4/net-snmp-5.7.1/snmplib/.libs/libnetsnmp.so -lpci -ldl ../snmplib/.libs/libnetsnmp.so -lcrypto -lm
| .libs/snmpd.o: In function `main':
| /home/paul/poky/poky/build/tmp/work/armv5te-poky-linux-gnueabi/net-snmp/5.7.1-r6.4/net-snmp-5.7.1/agent/snmpd.c:459: undefined reference to `netsnmp_sd_listen_fds'
| collect2: error: ld returned 1 exit status
| make[1]: *** [snmpd] Error 1
| make[1]: Leaving directory `/home/paul/poky/poky/build/tmp/work/armv5te-poky-linux-gnueabi/net-snmp/5.7.1-r6.4/net-snmp-5.7.1/agent'
| make: *** [subdirs] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see /home/paul/poky/poky/build/tmp/work/armv5te-poky-linux-gnueabi/net-snmp/5.7.1-r6.4/temp/log.do_compile.21614 for further information)

Not sure why this is failing, I doubt the move has anything to do with it
though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


