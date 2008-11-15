Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L1SnL-0004H4-Ts
	for openembedded-devel@openembedded.org; Sat, 15 Nov 2008 22:35:07 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L1SlA-0000Kx-QY
	for openembedded-devel@openembedded.org; Sat, 15 Nov 2008 21:32:53 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 15 Nov 2008 21:32:52 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 15 Nov 2008 21:32:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 15 Nov 2008 22:32:46 +0100
Message-ID: <gfnf5u$r3j$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081114 Shredder/3.0b1pre
Sender: news <news@ger.gmane.org>
Subject: e-wm broken after yesterdays upgrade
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
X-List-Received-Date: Sat, 15 Nov 2008 21:35:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I just built and installed the updated e-wm and it refuses to start:

[..]
ESTART: 0.20785 [0.00140] - ipc
INFO: E_IPC_SOCKET=/tmp/enlightenment-root/disp-:0.0-4494
ESTART: 0.21292 [0.00507] - font
ESTART: 0.21494 [0.00202] - theme
ESTART: 0.25406 [0.03912] - splash
ESTART: 0.25430 [0.00024] - test file format support
<<<< Enlightenment Error >>>>
Enlightenment found Evas can't load PNG files. Check Evas has PNG
loader support.

E17: Begin shutdown procedure!

But I have:

root@omap3evm:/var# opkg list_installed | grep evas-loader 
 

libevas-loader-eet - 2:0.9.9.043+svnr37324-r3.1 -
libevas-loader-jpeg - 2:0.9.9.043+svnr37324-r3.1 -
libevas-loader-png - 2:0.9.9.043+svnr37324-r3.1 -

Stracing enlightenment_start.oe gives:

open("/usr/lib/libecore_evas.so.0", O_RDONLY) = 3
open("/usr/lib/libecore_imf_evas.so.0", O_RDONLY) = 3
open("/usr/lib/libevas.so.0", O_RDONLY) = 3
open("/usr/lib/evas/modules/engines", 
O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 6
open("/usr/lib/evas/modules/loaders", 
O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 6
open("/usr/lib/evas/modules/savers", 
O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 6
open("/usr/lib/evas/modules/engines/buffer/linux-gnueabi-arm/module.so", 
O_RDONLY) = 12
open("/usr/lib/evas/modules/engines/software_generic/linux-gnueabi-arm/module.so", 
O_RDONLY) = 12

So it doesn't even try to open the evas loader!

Could the people that touched e-wm please make it work again?

regards,

Koen



