Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1Gthhf-0000e4-9G
	for openembedded-devel@openembedded.org; Mon, 11 Dec 2006 10:44:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBB9gatf009286;
	Mon, 11 Dec 2006 09:42:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09029-07; Mon, 11 Dec 2006 09:42:34 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBB9gTd2009276
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 11 Dec 2006 09:42:29 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org,
	"Michael K. Edwards" <medwards.linux@gmail.com>
In-Reply-To: <f2b55d220612061129k102c45f1ye80c6197edfef72f@mail.gmail.com>
References: <f2b55d220612061129k102c45f1ye80c6197edfef72f@mail.gmail.com>
Date: Mon, 11 Dec 2006 09:42:28 +0000
Message-Id: <1165830148.5633.9.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: softfloat calling conventions in ARM gcc 4.x
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
X-List-Received-Date: Mon, 11 Dec 2006 09:44:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2006-12-06 at 11:29 -0800, Michael K. Edwards wrote:
> I've been using crosstool as a framework for building ARM linux
> cross-compile toolchains with a fair amount of success, but there are
> certainly some tricks and traps.  OpenEmbedded toolchains have
> impressed some of the crosstool participants, and I'm starting to look
> at them now.  I'm pleased to see that EABI support is stabilizing, and
> expect to use it for most ARM builds in the future.  However, I
> anticipate needing to run existing OABI binaries on the system, and
> some of those have been built with soft FP.
> 
> It seems that there have long been some patches needed for soft-float
> toolchains, which have not been applied to GCC upstream for good and
> sufficient reason.  The patch at
> http://www.handhelds.org/hypermail/oe-commits/54/5483.html contains
> one variant of these changes for a gcc 4.2 snapshot. 

Admittedly, the gcc 4.x OpenEmbedded toolchains have been developed
mainly by pulling together knowledge from other places. Our advantage
for toolchain development over others is that the resulting OE images
really stress toolchains so we've been likely to find bugs and then find
the fixes to address those bugs. We are a bit short of toolchain experts
working on OE atm though and I'm not sure we have anyone with the
knowledge to answer your questions. I could attempt some answers but I'm
not 100% sure so its perhaps best you check it out properly...

> I plan to actually test these things and report back to the
> OpenEmbedded, crossgcc, and linux-arm-toolchain lists.  But even
> thorough testing is no substitute for a description of the theory of
> operations; so any comments from people who know what they are doing
> are welcome.

Please do report back. If you can see any problems with the toolchain,
comments, patches and other feedback is more than welcome.

Regards,

Richard






