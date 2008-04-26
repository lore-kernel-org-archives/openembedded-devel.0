Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JphsI-0003hU-20
	for openembedded-devel@openembedded.org; Sat, 26 Apr 2008 12:43:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3QAh5rt010704
	for <openembedded-devel@openembedded.org>;
	Sat, 26 Apr 2008 11:43:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10422-10 for <openembedded-devel@openembedded.org>;
	Sat, 26 Apr 2008 11:43:01 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3QAgve9010698
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 26 Apr 2008 11:42:57 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <futm2n$1q9$2@ger.gmane.org>
References: <f96d234e0804241325l64a85878q905dc02eb177266d@mail.gmail.com>
	<1209073881.5108.79.camel@dax.rpnet.com> <futm2n$1q9$2@ger.gmane.org>
Date: Sat, 26 Apr 2008 11:42:56 +0100
Message-Id: <1209206576.5086.8.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: bitbake -c rebuild not running all tasks
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Sat, 26 Apr 2008 10:43:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Sat, 2008-04-26 at 00:30 +0200, Rolf Leggewie wrote:
> Richard Purdie wrote:
> > Please don't use the rebuild command for now, use -c clean and then
> > rerun it. I will think about this problem but its a nasty tricky to
> > solve one.
> 
> how about having "bitbake -c rebuild $target" actually be "bitbake -c
> clean $target;bitbake $target" for the time being as a stop-gap measure?
>  I know you are not a fan of recursive bitbake, but would it be a
> problem in this case?

That breaks our layer separation. At present bitbake knows literally
nothing about what a given task means/does and to teach it that
behaviour it has to special case "rebuild". 

bitbake did used to do this at the task level, running one task after
the other but the way the core changed for many other reasons means it
can't do that. I'm not too happy that rebuild has broken but it is the
only collateral and we did gain a number of other features. I will find
a way to fix it and don't think its a terminal problem, just a hard one.

Yes, you could do something like this with recursive bitbake but that is
a large can of worms which cause infinitely more pain rather than being
stop-gap.

Richard



