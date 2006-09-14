Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GNr85-0001lE-BV
	for openembedded-devel@openembedded.org; Thu, 14 Sep 2006 15:19:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8EDG4Me020759
	for <openembedded-devel@openembedded.org>;
	Thu, 14 Sep 2006 14:16:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20691-02 for <openembedded-devel@openembedded.org>;
	Thu, 14 Sep 2006 14:16:03 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8EDG0qH020753
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 14 Sep 2006 14:16:01 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <20060914130233.GA10260@fh-wedel.de>
References: <20060914130233.GA10260@fh-wedel.de>
Date: Thu, 14 Sep 2006 14:16:01 +0100
Message-Id: <1158239761.5399.1.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: postinst jobs and "exit 1"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Sep 2006 13:19:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2006-09-14 at 15:02 +0200, Martin Dietze wrote:
>  lots of packages start their postinst jobs like this:
> 
> | test -z "$D" || exit 1
> 
> When creating firmware images using recent OE recipes (nylon
> distro and mtx-2 hardware), this seems to cause problems,
> either bitbake complains about "exit 1" in the log file when
> doing the rootfs or lots of postinst jobs are not run after
> installing the image. 
> 
> Is the above test deprecated and should be replaced by
> something not exit'ing at all? If yes, who is going to adapt
> all the existing packages still doing this?

Packages do this if the postinst should run on the device and should not
be during do_rootfs. If the postinst can be safely run during postinst,
you wouldn't have a line like this.

Based on that are there any specific examples giving cause for concern?

Regards,

Richard



