Received: from [217.150.241.29] (helo=smtp1.nine.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mailinglist@miromico.ch>) id 1KsdMw-00025i-RE
	for openembedded-devel@openembedded.org; Wed, 22 Oct 2008 15:03:28 +0200
Received: from [192.168.1.190] (77-58-151-240.dclient.hispeed.ch
	[77.58.151.240]) by smtp1.nine.ch (Postfix) with ESMTP id BC439968188
	for <openembedded-devel@openembedded.org>;
	Wed, 22 Oct 2008 15:02:55 +0200 (CEST)
Message-ID: <48FF2411.1030605@miromico.ch>
Date: Wed, 22 Oct 2008 15:01:05 +0200
From: Alex Raimondi <mailinglist@miromico.ch>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: Openembedded for AVR32
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
X-List-Received-Date: Wed, 22 Oct 2008 13:03:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi, 

Does OE for AVR32 really work? 

I had a working version about two month ago from the monotone repository. 

For about three weeks we try to get it running from the latest monotone repository and after the 
transition to git from the latest git. 

Just as of this morning I grabbed a fresh new clone from the git repository. 

OE does compile (minimal-image). But I can't boot the image. 

This is what I found out. 

** Kernel **
OE Kernel does boot. We included a newer version (2.6.25.10) into OE with our own patches. This version does boot as well. 
Tested on ATNGW100 and our own hardware.

** rootfs **
Rootfs is mounted via NFS. From the server logs I can see, that the filesystem actually is mounted. See the last lines from my bootlog:

------
at32ap700x_rtc at32ap700x_rtc.0: setting system clock to 1970-01-01 00:00:00 UTC
 (0)                                                                            
Sending DHCP requests ., OK                                                     
eth0: link up (10/Half)                                                         
IP-Config: Got DHCP answer from 192.168.1.1, my address is 192.168.1.151        
IP-Config: Complete:                                                            
     device=eth0, addr=192.168.1.151, mask=255.255.255.0, gw=192.168.1.1,       
     host=dhcppc1, domain=, nis-domain=(none),                                  
     bootserver=192.168.1.1, rootserver=192.168.1.150, rootpath=                
Looking up port of RPC 100003/2 on 192.168.1.150                                
Looking up port of RPC 100005/1 on 192.168.1.150                                
VFS: Mounted root (nfs filesystem).                                             
Freeing init memory: 76K (90000000 - 90013000)                                  
init[1]: segfault at 00000008 pc 2aaac620 sp 7f931f40 ecr 24                    
init has generated signal 11 but has no handler for it                          
Kernel panic - not syncing: Attempted to kill init!                             
-------

There is always a signal 11 in init (seg fault). 

** init ** 
We tried different init. 
 - OE default sysvinit => segfault
 - Busybox init => segfault
 - No init => kernel tries to load sh => segfault
 - Our own "hello world" app (compiled outside of OE) => segfault

Can anyone confirm that OE for AVR32 does work?
How can we debug and fix this problem?

Thanks 

Alex




