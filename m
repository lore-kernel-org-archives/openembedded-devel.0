Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HJdVt-0003Zq-AF
	for openembedded-devel@openembedded.org; Tue, 20 Feb 2007 23:31:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1KMV5NZ012684;
	Tue, 20 Feb 2007 22:31:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11815-05; Tue, 20 Feb 2007 22:31:02 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1KMV0Lb012674
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 20 Feb 2007 22:31:00 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Tue, 20 Feb 2007 22:31:01 +0000
Message-Id: <1172010661.5884.113.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Impending Kexec interface change
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
X-List-Received-Date: Tue, 20 Feb 2007 22:31:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Anyone watching mainline kernels will note that ARM kexec support got
merged and will be in 2.6.21 which is good. The issue is that the
syscall number had to change since the one its using at the moment is a
big hack.

This means we will have to change kexec-tools and at that point it
becomes incompatible with older kernels.

We can wait a bit and change when 2.6.21 is released, or update all our
patches now to use the new proper syscall number and update OE now.

I know the NSLU2 people are users of this and would value their input.

Cheers,

Richard





