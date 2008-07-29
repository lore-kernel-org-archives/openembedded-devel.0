Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KNr1n-0005za-7V
	for openembedded-devel@openembedded.org; Tue, 29 Jul 2008 17:22:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6TFKf4X008383
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Jul 2008 16:20:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08043-08 for <openembedded-devel@openembedded.org>;
	Tue, 29 Jul 2008 16:20:30 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6TFKURT008370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Jul 2008 16:20:30 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <f96d234e0807290811w76f58c6t8420d56d1b5b9533@mail.gmail.com>
References: <f96d234e0807290811w76f58c6t8420d56d1b5b9533@mail.gmail.com>
Date: Tue, 29 Jul 2008 16:20:30 +0100
Message-Id: <1217344830.5482.12.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: multiple entries in PREMIRRORS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 29 Jul 2008 15:22:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, 2008-07-29 at 11:11 -0400, Cliff Brake wrote:
> But, if I define a new class:
> 
> bec-mirrors.bbclass:
> 
> PREMIRRORS_append () {
> ftp://.*/.*/	http://dev.bec-systems.com/oesources/
> http://.*/.*/	http://dev.bec-systems.com/oesources/
> http://downloads.sleepycat.com/db-4.3.29.tar.gz
> http://dev.bec-systems.com/oesources/db-4.3.29.tar.gz
> }
> 
> and put the following in *.conf:
> INHERIT += "bec-mirrors"
> 
> it works fine.
> 
> What is the difference?  Why do multiple lines work fine in a
> PREMIRRORS_append, but not directly assigning a variable?  I started
> tracing through the code, but its bouncing back and forth between
> bbclass and bitbake code, so I'm asking first :-)

There are two different parsers, one for .conf files and one
for .bbclass and .bb files although they share code and are
interconnected. Some syntax isn't valid in .conf files and I suspect
this is one of those cases. Poky has its mirrors in a .bbclass as we hit
similar issues.

Cheers,

Richard



