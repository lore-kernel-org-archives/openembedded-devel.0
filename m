Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NxoUQ-0001hb-8e
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 23:33:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o32LU0cL006317
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Apr 2010 22:30:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05515-08 for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Apr 2010 22:29:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o32LTrj7006311
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Apr 2010 22:29:53 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hp4s4q$40a$1@dough.gmane.org>
References: <1270135981.4993.128.camel@rex>  <hp4s4q$40a$1@dough.gmane.org>
Date: Fri, 02 Apr 2010 22:29:52 +0100
Message-ID: <1270243792.4993.180.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Fri, 02 Apr 2010 21:33:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-04-02 at 15:40 +0200, Koen Kooi wrote:
> While testing (rebased on top of this mornings OE, bitbake master) I'm
> getting messages like this:
> 
> //OE/angstrom-dev/sysroots/x86_64-linux/usr/lib/python2.6/lib-dynload/strop.so:
> RPATH=/OE/angstrom-dev/sysroots/x86_64-linux/usr/lib
> //OE/angstrom-dev/sysroots/x86_64-linux/usr/lib/python2.6/lib-dynload/strop.so:
> new RPATH: $ORIGIN/../../../../usr/lib
> open: Permission denied
> elf_open: Invalid argument
> 
> Are those messages from chrpath and can they be ignored?

The first messages are from the class and are safe to ignore. The
permission denied suggests something was added to staging that was
readonly? Can you check the permissions
on //OE/angstrom-dev/sysroots/x86_64-linux/usr/lib/python2.6/lib-dynload/strop.so and see if that is the case. It would make sense for that code to check for read only and handle that case, restoring the permissions afterwards.

I won't get to it this weekend but I will make sure its fixed on Tuesday
if you can confirm that is the problem.

Cheers,

Richard



