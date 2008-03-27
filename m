Received: from [212.27.42.30] (helo=smtp4-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1Jf10R-0003Fz-Gc
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 23:55:35 +0100
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 52F183EA0FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2008 23:55:35 +0100 (CET)
Received: from sharky.jerryweb.org (vau75-7-82-234-248-119.fbx.proxad.net
	[82.234.248.119])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 37F703EA0FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2008 23:55:35 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 1B433278371
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2008 23:57:38 +0100 (CET)
Message-ID: <47EC2661.90702@bolloretelecom.eu>
Date: Thu, 27 Mar 2008 23:57:37 +0100
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.9) Gecko/20080109 Thunderbird/2.0.0.9 Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1206638249.4514.57.camel@dax.rpnet.com>
	<fsgsaq$nqf$1@ger.gmane.org>
In-Reply-To: <fsgsaq$nqf$1@ger.gmane.org>
Subject: Re: ipkg/opkg offical response
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
X-List-Received-Date: Thu, 27 Mar 2008 22:55:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Richard Purdie schreef:
> 
> | * Adding do_deploy to packaged-staging's knowledge. This is best done
> | with the patch for kernel.bbclass that thesing was been working on. I've
> | made some suggestions for tweaks (looking at the version already in
> | poky) and suggested he commits it after that.
> 
> That patch broke uImage kernels *real bad*, I just pushed a fix for it.

I have pushed an additional fix for the changes to kernel.bbclass.
The DEPENDS added by kernel.bbclass (u-boot-mkimage-native) conflicted
with the one added by linux.inc (u-boot-mkimage-openmoko-native).

I changed the DEPENDS to u-boot-mkimage-openmoko-native in
kernel.bbclass and removed the DEPENDS from linux.inc. The assumption
here is that u-boot-mkimage-openmoko-native is a strict superset of
u-boot-mkimage-native.

Cheers,
Jeremy


