Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JBzve-0006Ed-VO
	for openembedded-devel@openembedded.org; Mon, 07 Jan 2008 22:54:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m07Lllhh025578;
	Mon, 7 Jan 2008 21:47:47 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25345-06; Mon,  7 Jan 2008 21:47:43 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m07Lle6B025570
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 7 Jan 2008 21:47:40 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1199738665.4680.66.camel@localhost.localdomain>
References: <1068494393.20080104031751@gmail.com>
	<1199663243.4658.71.camel@localhost.localdomain>
	<116173998.20080107221856@gmail.com>
	<1199738665.4680.66.camel@localhost.localdomain>
Date: Mon, 07 Jan 2008 21:47:39 +0000
Message-Id: <1199742459.4680.69.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Another weird case of PACKAGES_DYNAMIC and task deps, it	seems
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
X-List-Received-Date: Mon, 07 Jan 2008 21:54:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-01-07 at 20:44 +0000, Richard Purdie wrote:
> My money is on:
> 
> DEPENDS_collie += "bc-native"
> 
> in linux-rp.inc. Try removing that...

Confirmed and fixed in 00610b176af0e4f4563f78fb71dc1219c777d13e.

Let me stress once again, += and overrides do not do what you expect. It
adds "bc_native" to the variable named "DEPENDS_collie", not "DEPENDS".

DEPENDS_append_collie = " bc-native" 

is a very different thing and corrects this problem...

Cheers,

Richard



