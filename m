Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1USRjL-0006im-SO
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 14:44:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Apr 2013 05:27:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,492,1363158000"; d="scan'208";a="320406451"
Received: from unknown (HELO helios.localnet) ([10.255.14.28])
	by fmsmga001.fm.intel.com with ESMTP; 17 Apr 2013 05:27:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Date: Wed, 17 Apr 2013 13:27:21 +0100
Message-ID: <2879964.8ENR31Irek@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <516E9198.1090607@communistcode.co.uk>
References: <1366200081-12326-1-git-send-email-ml@communistcode.co.uk>
	<516E9198.1090607@communistcode.co.uk>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv3 1/3] net-snmp: fix failure when starting on system without pci bus
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
X-List-Received-Date: Wed, 17 Apr 2013 12:45:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 17 April 2013 13:12:08 Jack Mitchell wrote:
> On 17/04/13 13:01, Jack Mitchell wrote:
> > From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> > 
> > The snmpd daemon cannot start on platforms without a pci bus:
> > 
> > snmpd[15460]: pcilib: Cannot open /proc/bus/pci
> > snmpd[15460]: pcilib: Cannot find any working access method.
> > 
> > snmpd should not depend on a PCI bus and should simply move on.
> > 
> > Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> > ---
> > 
> >   .../recipes-extended/net-snmp/files/ifmib.patch    | 66
> >   ++++++++++++++++++++++ .../recipes-extended/net-snmp/net-snmp_5.7.1.bb 
> >     |  1 +
> >   2 files changed, 67 insertions(+)
> >   create mode 100644 meta-oe/recipes-extended/net-snmp/files/ifmib.patch
> 
> I've pushed to my github here to try solve the patches failing.
> 
> git://github.com/CommunistCode/meta-oe.git

FWIW, I get the same build failure I got with the old recipe:

| arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-gcc -march=armv5te -marm -mthumb-interwork -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed --sysroot=/home/paul/poky/poky/build/tmp/sysroots/qemuarm -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=linux -o .libs/snmpd .libs/snmpd.o -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  ./.libs/libnetsnmpagent.so ./.libs/libnetsnmpmibs.so /home/paul/poky/poky/build/tmp/work/armv5te-poky-linux-gnueabi/net-snmp/5.7.2-r0/net-snmp-5.7.2/agent/.libs/libnetsnmpagent.so /home/paul/poky/poky/build/tmp/work/armv5te-poky-linux-gnueabi/net-snmp/5.7.2-r0/net-snmp-5.7.2/snmplib/.libs/libnetsnmp.so -lpci -ldl ../snmplib/.libs/libnetsnmp.so -lcrypto -lm
| .libs/snmpd.o: In function `main':
| /home/paul/poky/poky/build/tmp/work/armv5te-poky-linux-gnueabi/net-snmp/5.7.2-r0/net-snmp-5.7.2/agent/snmpd.c:459: undefined reference to `netsnmp_sd_listen_fds'
| collect2: error: ld returned 1 exit status
| make[1]: *** [snmpd] Error 1
| make[1]: Leaving directory `/home/paul/poky/poky/build/tmp/work/armv5te-poky-linux-gnueabi/net-snmp/5.7.2-r0/net-snmp-5.7.2/agent'
| make: *** [subdirs] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see /home/paul/poky/poky/build/tmp/work/armv5te-poky-linux-gnueabi/net-snmp/5.7.2-r0/temp/log.do_compile.4144 for further information)

Not that that should in any way block this patchset from going in since
this hasn't changed, but there does appear to be a problem somewhere :(

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


