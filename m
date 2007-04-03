Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <thommycheck@gmx.de>) id 1HYsYA-0007FO-24
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2007 01:36:30 +0200
Received: (qmail invoked by alias); 03 Apr 2007 23:36:23 -0000
Received: from BAA1b38.baa.pppool.de (EHLO [192.168.178.22]) [77.128.27.56]
	by mail.gmx.net (mp032) with SMTP; 04 Apr 2007 01:36:23 +0200
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX18gm4Zdgm4gX9b2CUOrzXLdJ0xw6a51rKVj89i21O
	qCbAx5jKVOPpY4
Message-ID: <4612E50B.90909@gmx.de>
Date: Wed, 04 Apr 2007 01:36:43 +0200
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Icedove 1.5.0.10 (X11/20070307)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1HYepp-00068Z-NQ@linuxtogo.org> <4612854C.5050904@gmx.de>
	<46128B3C.6090108@dominion.kabel.utwente.nl>
In-Reply-To: <46128B3C.6090108@dominion.kabel.utwente.nl>
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] org.oe.dev linux-libc-headers: add 2.6.20	from Poky
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2007 23:36:30 -0000
Content-Type: multipart/mixed; boundary="------------040106040307030306010302"

--------------040106040307030306010302
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


>> Wouldn't it be better do do something like 
>> http://bugs.openembedded.org/attachment.cgi?id=1172?
>>     
>
> No, since I want 2.6.20, not 2.6.18
But woudn't it be better to patch the kernel Kconfig files to provide 
additional header files when invoking "make headers_install". The 
attached patch does that for 2.6.18. But it should also work with newer 
kernels. That way other architectures can also distribute the same 
header files without storing them in OE.

--------------040106040307030306010302
Content-Type: text/x-patch;
 name="arm-asm-headers.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="arm-asm-headers.patch"

--- linux-2.6.18/include/asm-arm/Kbuild	2006-09-20 05:42:06.000000000 +0200
+++ linux-2.6.18.mod/include/asm-arm/Kbuild	2007-02-19 19:02:40.000000000 +0100
@@ -1 +1,2 @@
 include include/asm-generic/Kbuild.asm
+unidef-y += procinfo.h

--------------040106040307030306010302--
