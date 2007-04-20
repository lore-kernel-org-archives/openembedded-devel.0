Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HepSH-0004Pm-8R
	for openembedded-devel@openembedded.org; Fri, 20 Apr 2007 11:31:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3K9V1o8007691
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Apr 2007 10:31:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07303-08 for <openembedded-devel@openembedded.org>;
	Fri, 20 Apr 2007 10:30:58 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3K9UsGq007683
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Apr 2007 10:30:54 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <462853A9.6020309@a1.net>
References: <200704192334.00169.patrick.steiner@a1.net>
	<432beae0704191642m79afc9aaia85466716ee744af@mail.gmail.com>
	<462853A9.6020309@a1.net>
Date: Fri, 20 Apr 2007 10:30:54 +0100
Message-Id: <1177061454.5842.7.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: strange build errors after (Checking Package:...)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Apr 2007 09:31:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-04-20 at 07:46 +0200, Patrick Steiner wrote:
> Justin Patrin wrote:
> > On 4/19/07, Patrick Steiner <patrick.steiner@a1.net> wrote:
> > Sounds to me like a missing native dep on whatever package scanelf comes from
> hi i think this was the problem i did bitbake pax-utils-native now it works
> 
> i think this should be added as default dependency, also the sha256sum 
> stuff...

It should be a dependency by default. Was this with bitbake 1.8.0? Does
1.8.1 from svn work any better? 

To check, look at the task-depends.dot file saved by "bitbake something
-g" and see if pax-utils-native is mentioned as a dependency for
do_package tasks...

I just checked here and it seems to be working for me with 1.8.1.

Cheers,

Richard



