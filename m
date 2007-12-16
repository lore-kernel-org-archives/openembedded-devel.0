Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1J42W7-0006Ak-CH
	for openembedded-devel@openembedded.org; Mon, 17 Dec 2007 00:03:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBGMwgZA013122
	for <openembedded-devel@openembedded.org>; Sun, 16 Dec 2007 22:58:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12671-10 for <openembedded-devel@openembedded.org>;
	Sun, 16 Dec 2007 22:58:33 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBGMwWgj013106
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 16 Dec 2007 22:58:32 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <487953198.20071217003111@gmail.com>
References: <164348748.20071215043923@gmail.com>
	<200712162148.14183.openembedded@haerwu.biz>
	<487953198.20071217003111@gmail.com>
Date: Sun, 16 Dec 2007 22:58:31 +0000
Message-Id: <1197845911.4653.54.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] ANGSTROM_MODE -> SYSTYPE
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
X-List-Received-Date: Sun, 16 Dec 2007 23:03:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-12-17 at 00:31 +0200, Paul Sokolovsky wrote:
>    So, renaming ANGSTROM_MODE to DISTRO_LIBC is obviously move in the
> right direction, but let's consider if we're ready to move on wider front
> at the same time. I personally already have in my tree changes which
> allow to just check out OE and bitbake, have bitbake on the path,
> create a build dir in well-known location, and then type
> 
> DISTRO=angsrom SYSTYPE=uclibc MACHINE=h4000 bitbake initramfs-bootmenu-image
> 
> or
> 
> DISTRO=angsrom MACHINE=hx4700 bitbake x11-image
> 
> or
> 
> DISTRO=generic-uclibc-opt MACHINE=wdmybook bitbake nano
> 
> or
> 
> DISTRO=openwrt-sdk MACHINE=brcm24 bitbake nano
> 
> 
> And voila. No config file copying and editing. No
> obscure environment variable setting. No wrapper scripts. No
> Makefiles. It just works.

I'm not convinced about this :(. Why?

The appearance of a standard DISTRO_LIBC variable implies that "glibc"
and "uclibc" options are always going to work. What if the distro
doesn't support one of them? Is a bug report about some parameter passed
to this variable not working for a given distro valid?

The point is that all this configuration is distro specific. It should
be up to the distro to decide what kind of users it wishes to cater for
and how to enable those users to use OE. 

If Angstrom wants single variable configuration (or triplet variable
configuration with MACHINE, DISTRO, DISTRO_MODE/whatever) then thats
fine. Rolling that out onto every other distro breaks the distro
abstraction though.

If you want to add some common code which handles such a variable
variable that is also fine. I just worry about making it a generic and
mandatory variable, I think it should remain distro specific (and hence
up to the maintainers of a given distro).

Cheers,

Richard




