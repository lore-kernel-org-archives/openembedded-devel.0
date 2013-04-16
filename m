Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1US5RH-0000mb-5k
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 14:56:50 +0200
Message-ID: <516D4675.7000806@communistcode.co.uk>
Date: Tue, 16 Apr 2013 13:39:17 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
	<516D2F75.6040002@communistcode.co.uk> <4130879.bHlKN1xLuQ@helios>
In-Reply-To: <4130879.bHlKN1xLuQ@helios>
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
X-List-Received-Date: Tue, 16 Apr 2013 12:56:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/13 13:30, Paul Eggleton wrote:
> On Tuesday 16 April 2013 12:01:09 Jack Mitchell wrote:
>> On 16/04/13 11:53, Paul Eggleton wrote:
>>> This moves most of the remaining networking recipes in meta-oe to
>>> meta-networking, with some additional tidying up.
>> Could we possibly get net-snmp in with this move?
> Whoops, I meant to move that one. However I just tried to build it after
> doing so and it fails during do_compile:
>
> | ../arm-poky-linux-gnueabi-libtool  --mode=link arm-poky-linux-gnueabi-gcc  -march=armv5te  -marm -mthumb-interwork   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed --sysroot=/home/paul/poky/poky/build/tmp/sysroots/qemuarm -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=linux  -o snmpd snmpd.lo  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  libnetsnmpagent.la libnetsnmpmibs.la ../snmplib/libnetsnmp.la -lm
> | arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-gcc -march=armv5te -marm -mthumb-interwork -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed --sysroot=/home/paul/poky/poky/build/tmp/sysroots/qemuarm -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=linux -o .libs/snmpd .libs/snmpd.o -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  ./.libs/libnetsnmpagent.so ./.libs/libnetsnmpmibs.so /home/paul/poky/poky/build/tmp/work/armv5te-poky-linux-gnueabi/net-snmp/5.7.1-r6.4/net-snmp-5.7.1/agent/.libs/libnetsnmpagent.so /home/paul/poky/poky/build/tmp/work/armv5te-poky-linux-gnueabi/net-snmp/5.7.1-r6.4/net-snmp-5.7.1/snmplib/.libs/libnetsnmp.so -lpci -ldl ../snmplib/.libs/libnetsnmp.so -lcrypto -lm
> | .libs/snmpd.o: In function `main':
> | /home/paul/poky/poky/build/tmp/work/armv5te-poky-linux-gnueabi/net-snmp/5.7.1-r6.4/net-snmp-5.7.1/agent/snmpd.c:459: undefined reference to `netsnmp_sd_listen_fds'
> | collect2: error: ld returned 1 exit status
> | make[1]: *** [snmpd] Error 1
> | make[1]: Leaving directory `/home/paul/poky/poky/build/tmp/work/armv5te-poky-linux-gnueabi/net-snmp/5.7.1-r6.4/net-snmp-5.7.1/agent'
> | make: *** [subdirs] Error 1
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see /home/paul/poky/poky/build/tmp/work/armv5te-poky-linux-gnueabi/net-snmp/5.7.1-r6.4/temp/log.do_compile.21614 for further information)
>
> Not sure why this is failing, I doubt the move has anything to do with it
> though.
>
> Cheers,
> Paul
>

Hmmmm, maybe it's something armv5te related as it builds fine on my 
armv7a here...maybe one for another day, although it might get a bit 
more love if it's not hidden away in recipes-extended.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



