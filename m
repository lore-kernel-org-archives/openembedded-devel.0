Received: from vs148181.vserver.de ([62.75.148.181])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Florian.Mayer@mayer-electronics.de>)
	id 1NMOeW-0007Ez-2f for openembedded-devel@lists.openembedded.org;
	Sun, 20 Dec 2009 17:29:07 +0100
Received: from [62.224.48.196] (helo=[192.168.100.22])
	by vs148181.vserver.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <Florian.Mayer@mayer-electronics.de>)
	id 1NMOck-0004hV-Q7 for openembedded-devel@lists.openembedded.org;
	Sun, 20 Dec 2009 16:27:14 +0000
Message-ID: <4B2E505C.3040302@mayer-electronics.de>
Date: Sun, 20 Dec 2009 17:27:08 +0100
From: "Florian Mayer (Mayer Electronics)" <Florian.Mayer@mayer-electronics.de>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B2B7131.6020604@mayer-electronics.de>	<4B2D3E19.6010402@mayer-electronics.de>
	<200912192350.39349.marcin@juszkiewicz.com.pl>
In-Reply-To: <200912192350.39349.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 62.75.148.181
X-SA-Exim-Mail-From: Florian.Mayer@mayer-electronics.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Xfbdev crashes
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
X-List-Received-Date: Sun, 20 Dec 2009 16:29:07 -0000
X-Groupsio-MsgNum: 15144
Content-Type: multipart/mixed; boundary="------------010206020903040104090102"

--------------010206020903040104090102
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Hello folks,

If I try to start an Xserver I get the following error:

root@arm-test:~# /etc/X11/Xserver
tslib: /dev/input/touchscreen0
exec Xfbdev -br -pn  -mouse tslib
_XSERVTransSocketOpenCOTSServer: Unable to open socket for inet6
_XSERVTransOpen: transport open failed for inet6/faytech_touchpc:0
_XSERVTransMakeAllCOTSServerListeners: failed to open listener for inet6
Warning: mode not found, using default
error opening security policy file /usr/lib/xserver/SecurityPolicy
[tslib/TslibEnable] no device path given, trying /dev/input/touchscreen0

Backtrace (1 deep):
0: Xfbdev [0x45848]

Fatal server error:
Segmentation fault caught

*** glibc detected *** Xfbdev: munmap_chunk(): invalid pointer: 
0x000fd664 ***
Aborted


The hardware is s3c2440 based, the framebuffer seem to work, the penguin 
is shown on startup as well as the Angstrom splash screen.

Any ideas for this?

Regards
Florian Mayer
Mayer Electronics

--------------010206020903040104090102
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


--------------010206020903040104090102--
