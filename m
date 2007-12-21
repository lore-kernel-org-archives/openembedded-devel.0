Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1J5iSs-0001QR-Lq
	for openembedded-devel@openembedded.org; Fri, 21 Dec 2007 15:03:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBLDvni6032737;
	Fri, 21 Dec 2007 13:57:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32514-06; Fri, 21 Dec 2007 13:57:46 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBLDvhtm032727
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Fri, 21 Dec 2007 13:57:43 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <6010564518.20071221131621@gmail.com>
References: <476B7A8D.4070603@gmx.net>
	<1198230789.4636.25.camel@localhost.localdomain>
	<476B9470.2020607@gmx.net> <6010564518.20071221131621@gmail.com>
Date: Fri, 21 Dec 2007 13:57:42 +0000
Message-Id: <1198245462.4636.60.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Robert Schuster <theBohemian@gmx.net>
Subject: Re: RFC: feature request - wrap sources
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
X-List-Received-Date: Fri, 21 Dec 2007 14:03:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-12-21 at 13:16 +0200, Paul Sokolovsky wrote:
> Friday, December 21, 2007, 12:24:48 PM, you wrote:
> > Richard Purdie schrieb:
> >> On Fri, 2007-12-21 at 09:34 +0100, Robert Schuster wrote:
> >> Would it not be simpler just to specify an attribute like unpacksubdir
> >> which you could set to ${PN}-${PV}?
> > Specifying the directory to be created would be nice. However one of my
> > idea was that by using such a mechanism S would be correct.
> 
> > Would it be possible to automatically set S to ${WORKDIR}/<anything> if
> > unpacksubdir=<anything> is used? If so we could have genericity and
> > saving boilerplate code. :)
> 
>   Why, instead, S has default value of "${WORKDIR}/${P}", so just fit
> unpacksubdir up to that. And that unpacksubdir is yet stuff to implement
> AFAIU.

This was my intent although I perhaps didn't make it very clear. If you
specify "unpacksubdir=${P}" (P = ${PN}-${PV}) the default for WORKDIR
would just work and wouldn't need to be changed.

Cheers,

Richard



