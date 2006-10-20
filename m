Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1Gax7Z-0000yL-2q
	for openembedded-devel@openembedded.org; Fri, 20 Oct 2006 18:21:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9KGEBWp000453
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Oct 2006 17:14:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30418-10 for <openembedded-devel@openembedded.org>;
	Fri, 20 Oct 2006 17:14:09 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9KGE7Y6000445
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Oct 2006 17:14:07 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <E1Gax3g-0008H7-No@linuxtogo.org>
References: <E1Gax3g-0008H7-No@linuxtogo.org>
Date: Fri, 20 Oct 2006 17:14:08 +0100
Message-Id: <1161360848.6639.60.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev package.bbclass: Split into two tasks, one which prepares the packages and then package_write which actually	generates the packages. The two stage approach allows us to avoid circular	dependency issues from classes like debian.bbclass. As the data being	emitted into pkgdata/ changed, you need to either wipe tmp or rerun the	do_package tasks (wipe the do_package stamps). Everything will repackage	anyway due to the new task.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2006 16:21:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-10-20 at 18:17 +0200, rpurdie commit wrote:
> package.bbclass: Split into two tasks, one which prepares the packages
> and then package_write which actually generates the packages. The two
> stage approach allows us to avoid circular dependency issues from
> classes like debian.bbclass. As the data being emitted into pkgdata/
> changed, you need to either wipe tmp or rerun the do_package tasks
> (wipe the do_package stamps). Everything will repackage anyway due to
> the new task.

As koen points out, you need to rerun do_install as well as do_package.

Cheers,

Richard



