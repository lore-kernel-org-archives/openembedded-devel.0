Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1Jg78J-0000yb-A4
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 01:40:15 +0200
Received: (qmail invoked by alias); 30 Mar 2008 23:40:12 -0000
Received: from BAA089a.baa.pppool.de (EHLO [192.168.178.31]) [77.128.8.154]
	by mail.gmx.net (mp011) with SMTP; 31 Mar 2008 01:40:12 +0200
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX19L/ioqa8dL3jZlf8TCrlc/ZPLr8ro5u7/+dIeXyT
	XdmrsDL7xmVdMA
Message-ID: <47F024DA.5020502@gmx.de>
Date: Mon, 31 Mar 2008 01:40:10 +0200
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080109)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1206911981.4838.12.camel@dax.rpnet.com>
In-Reply-To: <1206911981.4838.12.camel@dax.rpnet.com>
X-Y-GMX-Trusted: 0
Subject: Re: libgcc not being pulled into OABI images
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
X-List-Received-Date: Sun, 30 Mar 2008 23:40:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I tested on my host machine (AMD64) and libgcc is not it NEEDED but is 
installed anyway. So it seems to be no problem that libgcc is not in 
needed. So I investigated libpthread and found out that it tries to 
dlopen libgcc and fails if it can't. Our shlibs code can't detect this 
so libgcc does not get pulled into image. So I suggest something like:

--- packages/glibc/glibc.inc    e9a2a880277298ca08e7f53a4e5c69127415a5ed
+++ packages/glibc/glibc.inc    3aa1e1a80cf9f0f899b5a79b857bfa5427f5d54e
@@ -7,6 +7,8 @@ DEPENDS = "${@['virtual/${TARGET_PREFIX}
 DEPENDS = "${@['virtual/${TARGET_PREFIX}gcc-initial', 
'virtual/${TARGET_PREFIX}gcc']['nptl' in '${GLIBC_ADDONS}']} 
linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
 #RDEPENDS_ldd += " bash"
+# nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
+RDEPENDS += "${@['','libgcc']['ntpl' in '${GLIBC_ADDONS}']}"
 PROVIDES = "virtual/libc ${@['virtual/${TARGET_PREFIX}libc-for-gcc', 
'']['nptl' in '${GLIBC_ADDONS}']}"
 PROVIDES += "virtual/libintl virtual/libiconv"


Is it ok if I comit this (and bump PRs of all packages that use this file?)

Regards,
Thomas


