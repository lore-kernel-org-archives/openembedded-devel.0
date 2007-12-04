Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1IzZ2Q-0000Se-Ut
	for openembedded-devel@openembedded.org; Tue, 04 Dec 2007 15:46:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB4EgmWq012703
	for <openembedded-devel@openembedded.org>; Tue, 4 Dec 2007 14:42:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12559-04 for <openembedded-devel@openembedded.org>;
	Tue,  4 Dec 2007 14:42:45 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB4EgiOd012697
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 4 Dec 2007 14:42:44 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1869419485.20071204133718@vanille-media.de>
References: <1196552859.6697.28.camel@localhost.localdomain>
	<443804680.20071204021110@vanille-media.de>
	<1196759359.4817.1.camel@localhost.localdomain>
	<1869419485.20071204133718@vanille-media.de>
Date: Tue, 04 Dec 2007 14:42:42 +0000
Message-Id: <1196779362.4817.24.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Packaged Staging, nearly a reality!
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
X-List-Received-Date: Tue, 04 Dec 2007 14:46:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-12-04 at 13:37 +0100, Michael 'Mickey' Lauer wrote:
> Ok, sorry for the false alarm.
> 
> Actually it turns out to be a dependency problem. Yesterday I felt
> adventurous and bumped PARALLEL_MAKE and BB_MULTIPLE_THREADS both from 4 to
> 8, but immediately forgot about it.
> 
> Then everything python started to freak out. So I guess there is some
> missing / wrong task dependencies. Can you recommend a good way to
> debug that?

"bitbake python-pyxml -g" and then look through the task-depends.dot
file. These do contain the dependency data but its not the most readable
file format, better ways of viewing the output welcome...

I do have some prototype graphical code that views this output which
also isn't ideal but is a nice excuse to play with bitbake trunk, I'll
see if I can find time to make the commitable in the next few days
too...

Cheers,

Richard



