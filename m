Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GewJb-0004NY-03
	for openembedded-devel@openembedded.org; Tue, 31 Oct 2006 17:18:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9VGHNl2023649
	for <openembedded-devel@openembedded.org>; Tue, 31 Oct 2006 16:17:23 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23558-02 for <openembedded-devel@openembedded.org>;
	Tue, 31 Oct 2006 16:17:21 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9VGHGH3023640
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 31 Oct 2006 16:17:16 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200610271801.52172.openembedded@hrw.one.pl>
References: <200610271801.52172.openembedded@hrw.one.pl>
Date: Tue, 31 Oct 2006 16:17:16 +0000
Message-Id: <1162311437.5541.39.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: More granular libraries packaging
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
X-List-Received-Date: Tue, 31 Oct 2006 16:18:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-10-27 at 18:01 +0200, Marcin Juszkiewicz wrote:
> One of our strong points is granular packaging. We have extra packages for 
> locales, documentation, development stuff etc. But we can improve it a bit 
> more.
> 
> Many packages has multiple libraries in package. Not everytime it is 
> useful - for example libusb had dependency on libstdc++ just because it 
> had libusbpp in same package as libusb.
> 
> My proposition is - let split each library to separate package. This will 
> enlarge feeds (so ipkg will get hurt more ;( but in some situations can 
> give us smaller rootfs.

In some specific cases, splitting packaging per lib makes a lot of
sense. I'd certainly agree in the case of libusb. I'm not sure splitting
all libs is a good idea though as most libs packages are currently
interdependent and there is nothing to be gained by splitting.

I'm therefore thinking of an opt in class/PACKAGEFUNC to handle this
only in the cases we identify as needing it but others seem to have a
different opinion :)

Richard




