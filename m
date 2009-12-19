Received: from vs148181.vserver.de ([62.75.148.181])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Florian.Mayer@mayer-electronics.de>)
	id 1NM6O4-00016K-Dp for openembedded-devel@lists.openembedded.org;
	Sat, 19 Dec 2009 21:58:55 +0100
Received: from [62.224.48.196] (helo=[192.168.100.22])
	by vs148181.vserver.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <Florian.Mayer@mayer-electronics.de>)
	id 1NM6MK-0001Ws-Pl for openembedded-devel@lists.openembedded.org;
	Sat, 19 Dec 2009 20:57:04 +0000
Message-ID: <4B2D3E19.6010402@mayer-electronics.de>
Date: Sat, 19 Dec 2009 21:56:57 +0100
From: "Florian Mayer (Mayer Electronics)" <Florian.Mayer@mayer-electronics.de>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B2B7131.6020604@mayer-electronics.de>
In-Reply-To: <4B2B7131.6020604@mayer-electronics.de>
X-SA-Exim-Connect-IP: 62.75.148.181
X-SA-Exim-Mail-From: Florian.Mayer@mayer-electronics.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: init becomes a zombie process on ARM device
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
X-List-Received-Date: Sat, 19 Dec 2009 20:58:55 -0000
X-Groupsio-MsgNum: 15132
Content-Type: multipart/mixed; boundary="------------030604030201030306020602"

--------------030604030201030306020602
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Florian Mayer (Mayer Electronics) schrieb:
> Hello folks,
>
> I am currenty trying to build a working system for a chineese mini 
> computer based on a Samsung S3C2440 SOC. I got a patched kernel source 
> tree (based on 2.6.18.2) from my hardware supplier, no separate patch. 
> The machine is called SBZ2440 which is not in the official kernel 
> tree. I managed to compile the kernel inside OE (creating a machine 
> definition based on the smdk2440.conf and at2440evb.conf file (the 
> AT2440EVB is from the same manufacturer in China) and a bitbake 
> recipe.) The selfmade kernel boots up fine.
> When it loads the root fs (currently over NFS) I get a quite strange 
> behavior: the init process zobiefies after running the rcS script. 
> Nearly all tasks started by the init scripts are zobies too. The only 
> thing running is dropbear (SSH server), I get no login on RS-232 
> because init crashes  before starting a getty. I can login via dropbear.
> UDEV need over two minutes for initializing, after this the /dev 
> folder is empty and udev a zombie. It does not work either. I disabled 
> it in my NFS root filesystem to exclude it as error source with no 
> effect.
> The NFS itself is not the source of trouble, it has the right 
> permissions, it is exported with the no_root_squash option, nothing in 
> the logs etc.
> A btw: I use the stable_2009 branch.
> Any ideas for this???
>
> Regards
> Florian Mayer
> Mayer Electronics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   
Hello,

I found out why the system behaves such strange (thanks to Florian Boor 
for pulling me in the right direction). In my constellation thumb 
interworking does not work. glibc is arm compiled, the rest is thumb 
format. To test it I added

ARM_INSTRUCTION_SET="arm"
THUMB_INTERWORK="no"

to my machine configuration. But that did not help!

Both variables are overwritten in 
openembedded/conf/dist/include/angstrom.inc. So I commented it out in 
that file and voila, the result boots correctly. Is there a more elegant 
way to solve this? Perhaps allow to configure this in the machine conf?


Regards
Florian Mayer

--------------030604030201030306020602
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


--------------030604030201030306020602--
