Received: from [212.242.43.252] (helo=smtp2.cybercity.dk)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <sgh@sgh.dk>)
	id 1Mzdn8-0007gG-Jj for openembedded-devel@lists.openembedded.org;
	Sun, 18 Oct 2009 23:59:57 +0200
Received: from natla.sgh.dk (0x4dd5bf76.adsl.cybercity.dk [77.213.191.118])
	by smtp2.cybercity.dk (Postfix) with ESMTP id EDF64313C25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Oct 2009 23:58:57 +0200 (CEST)
Received: from phoenix.localnet (phoenix.local [192.168.0.226])
	by natla.sgh.dk (Postfix) with ESMTP id 1DD925ADDC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2009 00:29:31 +0200 (CEST)
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Oct 2009 23:58:55 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.32-020632rc5-generic; KDE/4.3.2; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <200910182358.55323.sgh@sgh.dk>
X-SA-Exim-Connect-IP: 212.242.43.252
X-SA-Exim-Mail-From: sgh@sgh.dk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: xorg-xserver/xserver-xorg_1.6.1.bb fails compile
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
X-List-Received-Date: Sun, 18 Oct 2009 21:59:57 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

What happenens with xsever-xorg

| glxdri2.c:72: error: expected ':', ',', ';', '}' or '__attribute__' before 
'*' token
| glxdri2.c:93: error: expected specifier-qualifier-list before '__DRIbuffer'
| glxdri2.c: In function '__glXDRIbindTexImage':
| glxdri2.c:217: error: '__GLXDRIscreen' has no member named 'texBuffer'
| glxdri2.c: In function '__glXDRIscreenCreateContext':
| glxdri2.c:306: error: '__GLXDRIscreen' has no member named 'dri2'
| glxdri2.c: In function '__glXDRIscreenCreateDrawable':
| glxdri2.c:349: error: '__GLXDRIscreen' has no member named 'dri2'
| glxdri2.c: At top level:
| glxdri2.c:355: error: expected '=', ',', ';', 'asm' or '__attribute__' 
before '*' token
| glxdri2.c:388: error: expected '=', ',', ';', 'asm' or '__attribute__' 
before 'loaderExtension'
| glxdri2.c:395: error: 'loaderExtension' undeclared here (not in a function)
| glxdri2.c: In function 'initializeExtensions':
| glxdri2.c:438: error: '__GLXDRIscreen' has no member named 'glx_enable_bits'
| glxdri2.c:439: warning: passing argument 1 of '__glXEnableExtension' from 
incompatible pointer type
| glxdri2.c:445: error: '__GLXDRIscreen' has no member named 'swapControl'
| glxdri2.c:446: warning: statement with no effect
| glxdri2.c:447: error: '__GLXDRIscreen' has no member named 'glx_enable_bits'
| glxdri2.c:448: warning: passing argument 1 of '__glXEnableExtension' from 
incompatible pointer type
| glxdri2.c:449: error: '__GLXDRIscreen' has no member named 'glx_enable_bits'
| glxdri2.c:450: warning: passing argument 1 of '__glXEnableExtension' from 
incompatible pointer type
| glxdri2.c:458: error: '__GLXDRIscreen' has no member named 'texBuffer'
| glxdri2.c:459: warning: statement with no effect
| glxdri2.c: In function '__glXDRIscreenProbe':
| glxdri2.c:498: error: '__GLXDRIscreen' has no member named 'glx_enable_bits'
| glxdri2.c:498: warning: passing argument 1 of '__glXInitExtensionEnableBits' 
from incompatible pointer type
| glxdri2.c:522: error: '__DRI_DRI2' undeclared (first use in this function)
| glxdri2.c:522: error: (Each undeclared identifier is reported only once
| glxdri2.c:522: error: for each function it appears in.)
| glxdri2.c:522: warning: passing argument 1 of 'strlen' from incompatible 
pointer type
| glxdri2.c:522: warning: passing argument 2 of '__builtin_strcmp' from 
incompatible pointer type
| glxdri2.c:522: warning: passing argument 2 of '__builtin_strcmp' from 
incompatible pointer type
| glxdri2.c:522: warning: passing argument 1 of 'strlen' from incompatible 
pointer type
| glxdri2.c:522: warning: passing argument 2 of '__builtin_strcmp' from 
incompatible pointer type
| glxdri2.c:522: warning: passing argument 2 of '__builtin_strcmp' from 
incompatible pointer type
| glxdri2.c:523: error: '__DRI_DRI2_VERSION' undeclared (first use in this 
function)
| glxdri2.c:523: warning: comparison between pointer and integer
| glxdri2.c:524: error: '__GLXDRIscreen' has no member named 'dri2'
| glxdri2.c:524: error: expected ')' before '__DRIdri2Extension'
| glxdri2.c:524: warning: type defaults to 'int' in declaration of 'type name'
| glxdri2.c:524: warning: statement with no effect
| glxdri2.c:528: error: '__GLXDRIscreen' has no member named 'dri2'
| glxdri2.c:535: error: '__GLXDRIscreen' has no member named 'dri2'
| glxdri2.c:535: error: request for member 'createNewScreen' in something not 
a structure or union
| glxdri2.c:539: error: called object '*(const struct __DRIextension 
**)&<erroneous-expression>' is not a function
| glxdri2.c:539: warning: assignment from incompatible pointer type
| glxdri2.c:553: error: '__GLXDRIscreen' has no member named 'glx_enable_bits'
| glxdri2.c:553: warning: passing argument 1 of '__glXGetExtensionString' from 
incompatible pointer type
| glxdri2.c:560: error: '__GLXDRIscreen' has no member named 'glx_enable_bits'
| glxdri2.c:561: warning: passing argument 1 of '__glXGetExtensionString' from 
incompatible pointer type
| make[1]: *** [glxdri2.lo] Error 1
| make[1]: Leaving directory `/home/sgh/svn/OpenEmbedded/build-
ppc/tmp/work/ppce300c3-angstrom-linux/xserver-xorg-2_1.6.1-r12.0/xorg-
server-1.6.1/glx'
| make: *** [install-recursive] Error 1
| FATAL: oe_runmake failed


