Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HPR91-00020V-CH
	for openembedded-devel@openembedded.org; Thu, 08 Mar 2007 23:31:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l28MVTqT002529
	for <openembedded-devel@openembedded.org>; Thu, 8 Mar 2007 22:31:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02085-06 for <openembedded-devel@openembedded.org>;
	Thu,  8 Mar 2007 22:31:27 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l28MVOAk002519
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 8 Mar 2007 22:31:24 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200703082126.20092.christopher.lang@plus.cablesurf.de>
References: <1173131731.5842.140.camel@localhost.localdomain>
	<1173277608.5826.15.camel@localhost.localdomain>
	<200703082046.06419.christopher.lang@plus.cablesurf.de>
	<200703082126.20092.christopher.lang@plus.cablesurf.de>
Date: Thu, 08 Mar 2007 22:31:25 +0000
Message-Id: <1173393085.5805.51.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Bitbake Request for Testing of bitbake 1.8
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
X-List-Received-Date: Thu, 08 Mar 2007 22:31:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-03-08 at 21:26 +0100, Christopher Lang wrote:
> adding: 
> 
> GLIBC_ADDONS = "nptl"
> GLIBC_EXTRA_OECONF = "--with-tls"
> 
> to the machine file fixes issues (2) and (3).

Thats the correct fix for an x86 machine.

Can you show the log output without the -v option so I can try and see
what you mean by (1)?

> > Using the "generic" distro and bb 1.8 there are some messages that "do not
> > look good":
> >
> > (1) doesn't seem to make sense (3x glibc)
> > (2) glibc 2.5 IS available
> > (3) circular dependency
> >
> > see full bitbake -v output (annotated with (x) ) as well as distro/machine
> > configuration below.

Cheers,

Richard



