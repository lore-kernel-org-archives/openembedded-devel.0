Received: from vs148181.vserver.de ([62.75.148.181])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Florian.Mayer@mayer-electronics.de>)
	id 1NLc6D-0006TP-Lr for openembedded-devel@lists.openembedded.org;
	Fri, 18 Dec 2009 13:38:28 +0100
Received: from [62.224.59.25] (helo=[192.168.100.22])
	by vs148181.vserver.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <Florian.Mayer@mayer-electronics.de>)
	id 1NLbfE-0006km-9i for openembedded-devel@lists.openembedded.org;
	Fri, 18 Dec 2009 12:10:32 +0000
Message-ID: <4B2B7131.6020604@mayer-electronics.de>
Date: Fri, 18 Dec 2009 13:10:25 +0100
From: "Florian Mayer (Mayer Electronics)" <Florian.Mayer@mayer-electronics.de>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 62.75.148.181
X-SA-Exim-Mail-From: Florian.Mayer@mayer-electronics.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: init becomes a zombie process on ARM device
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
X-List-Received-Date: Fri, 18 Dec 2009 12:38:28 -0000
X-Groupsio-MsgNum: 15127
Content-Type: multipart/mixed; boundary="------------070902080906040004090504"

--------------070902080906040004090504
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hello folks,

I am currenty trying to build a working system for a chineese mini 
computer based on a Samsung S3C2440 SOC. I got a patched kernel source 
tree (based on 2.6.18.2) from my hardware supplier, no separate patch. 
The machine is called SBZ2440 which is not in the official kernel tree. 
I managed to compile the kernel inside OE (creating a machine definition 
based on the smdk2440.conf and at2440evb.conf file (the AT2440EVB is 
from the same manufacturer in China) and a bitbake recipe.) The selfmade 
kernel boots up fine.
When it loads the root fs (currently over NFS) I get a quite strange 
behavior: the init process zobiefies after running the rcS script. 
Nearly all tasks started by the init scripts are zobies too. The only 
thing running is dropbear (SSH server), I get no login on RS-232 because 
init crashes  before starting a getty. I can login via dropbear.
UDEV need over two minutes for initializing, after this the /dev folder 
is empty and udev a zombie. It does not work either. I disabled it in my 
NFS root filesystem to exclude it as error source with no effect.
The NFS itself is not the source of trouble, it has the right 
permissions, it is exported with the no_root_squash option, nothing in 
the logs etc.
A btw: I use the stable_2009 branch.
Any ideas for this???

Regards
Florian Mayer
Mayer Electronics

--------------070902080906040004090504
Content-Type: text/x-vcard; charset=utf-8;
 name="Florian_Mayer.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Florian_Mayer.vcf"

begin:vcard
fn:Florian Mayer (Mayer Electronics)
n:Mayer;Florian
adr:;;Hohenzollernstr. 20;Messkirch;;88605;Deutschland
email;internet:Florian.Mayer@mayer-electronics.de
title:Dipl. Ing. (BA)
tel;work:++49 (0) 7575/924940
tel;cell:++49 (0) 176/22209624
version:2.1
end:vcard


--------------070902080906040004090504--
