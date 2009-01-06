Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LKFBO-0005XK-Io
	for openembedded-devel@openembedded.org; Tue, 06 Jan 2009 17:53:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n06GlWs3000982
	for <openembedded-devel@openembedded.org>; Tue, 6 Jan 2009 16:47:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00766-03 for <openembedded-devel@openembedded.org>;
	Tue,  6 Jan 2009 16:47:28 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n06GlOKL000976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 6 Jan 2009 16:47:25 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <gjvu32$7dh$1@ger.gmane.org>
References: <87r63gseu6.fsf@neumann.lab.ossystems.com.br>
	<gjvu32$7dh$1@ger.gmane.org>
Date: Tue, 06 Jan 2009 16:47:57 +0000
Message-Id: <1231260477.5330.21.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] bitbake git fetcher fix
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Jan 2009 16:54:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, 2009-01-06 at 16:41 +0100, Koen Kooi wrote:
> On 06-01-09 15:12, Otavio Salvador wrote:
> > Hello,
> >
> > I've found a issue when using current GIT fetcher and bellow patch
> > fixes it for me; could someone take a look at it and commit if it does
> > look fine?
> 
> > +        elif tag and tag != "1":
> 
> That looks to be a hack for lazy people that don't specify a SRCREV nor 
> set AUTOREV. Such a fetch failure is intended behaviour.

How about we adopt Poky's slightly more verbose approach of SRCREV ?=
"INVALID" in bitbake.conf?

We check for "INVALID" in bitbake and error if we see it.

Cheers,

Richard



