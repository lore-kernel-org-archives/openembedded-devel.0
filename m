Received: from [194.100.190.193] (helo=brando.wapice.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <risto@wapice.com>) id 1JE4bT-0001Qk-Dn
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Jan 2008 16:18:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by brando.wapice.com (Postfix) with ESMTP id CB411F7C003
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2008 17:18:00 +0200 (EET)
X-Virus-Scanned: amavisd-new at wapice.com
Received: from brando.wapice.com ([127.0.0.1])
	by localhost (brando.wapice.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FClVtBw4cyC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2008 17:17:56 +0200 (EET)
Received: from [192.168.60.166] (unknown [192.168.60.166])
	by brando.wapice.com (Postfix) with ESMTP id 0E125F7C002
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2008 17:17:56 +0200 (EET)
From: Risto Pajula <risto@wapice.com>
Organization: Wapice Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Jan 2008 17:18:55 +0200
User-Agent: KMail/1.9.6 (enterprise 20070904.708012)
MIME-Version: 1.0
Message-Id: <200801131718.55872.risto@wapice.com>
Subject: large uImage size
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
X-List-Received-Date: Sun, 13 Jan 2008 15:19:35 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

I am getting very large kernel image size (~4,5 MB) when using the 
cross-compiler built with a recent version of openembedded. Normal kernel 
image size is around 1,5 MB. The large kernel image size only happens when 
building the kernel outside the openembedded build environment, when building 
with the normal OE build (bitbake minimal-image) the resulting kernel image 
size is normal.

This has however changed in some point of OE development. If I use an old OE 
snapshot and build the crosscompiler with it the resulting kernel image even 
when building outside OE environment is normal. (Both however use gcc 4.1.2).

I have tried to figure what is different in the environment when building the 
kernel within OE and outside it but any of the environment variables and etc. 
have not solved the problem.

Does anybody know any changes in the OE which could cause this different 
behaviour in the gcc cross-compiler built with it?

Machine: at91sam9263-ek.
The kernel compilation ouside OE: 
make ARCH=arm 
CROSS_COMPILE=/PATH_TO_OE_BUILD_DIR/tmp/cross/bin/arm-angstrom-linux-gnueabi- 
uImage

I want to build the development kernel outside of openembedded framewok for 
various reasons but use OE crosscompiler. So any help or suggestions for 
figuring out why this happens would be appreciated.

BR.
Risto


