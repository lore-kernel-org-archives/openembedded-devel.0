Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GtX72-00081j-NN
	for openembedded-devel@openembedded.org; Sun, 10 Dec 2006 23:25:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBAMO7Cb011347;
	Sun, 10 Dec 2006 22:24:07 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11197-04; Sun, 10 Dec 2006 22:24:05 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBAMNxRo011336
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sun, 10 Dec 2006 22:23:59 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0612081523k416385a5mf40fc87f9f8a24bc@mail.gmail.com>
References: <c384c5ea0612081523k416385a5mf40fc87f9f8a24bc@mail.gmail.com>
Date: Sun, 10 Dec 2006 22:24:01 +0000
Message-Id: <1165789441.5604.39.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: {PACKAGE,TARGET_{,PACKAGE_,EXTRA_}}ARCH blues
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
X-List-Received-Date: Sun, 10 Dec 2006 22:25:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2006-12-09 at 00:23 +0100, Leon Woestenberg wrote:
> In my case, an IXP4xx target, with big-endian ARCH_BYTE_SEX I have this:
> 
> from conf/machine/ixp4xx.conf sets:
> 
> TARGET_ARCH = armeb
> TARGET_PACKAGE_ARCH = armv5teb
> 
> conf/machine/ixp4xx.conf then sets (overrides):
> PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5e armv5te ixp4xx${ARCH_BYTE_SEX}"
> 
> conf/bitbake.conf then sets PACKAGE_ARCHS to this:
> 
> PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS}
> ${MACHINE}"
[...]
> end I end up with a full set of 'armv5teb' packages, which fail to
> install to my image.
> 
> I can work around this by twiddling with the variable definitions and
> settings, but I rather want to discuss what is the proper fix here?
> 
> Should PACKAGE_EXTRA_ARCH be appended by TARGET_PACKAGE_ARCH?

conf/machine/include/ixp4xx.conf is the only file in my openembedded
directory which references this "TARGET_PACKAGE_ARCH" variable so its an
ixp4xx issue. The name sounds very confused so I'd suggest just getting
rid of it and set PACKAGE_EXTRA_ARCHS to contain everything you need. An
example might be:

PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5e armv5te{ARCH_BYTE_SEX} ixp4xx{ARCH_BYTE_SEX}"

which probably isn't right but you get the idea. 

Someone familiar with what the ixp builds should be doing should really
look at this. I've cc'd rwhitby who should know the right person to deal
with this.

This machine might not want PACKAGE_ARCHS containing ${MACHINE} so it
might want to override that...

Regards,

Richard





