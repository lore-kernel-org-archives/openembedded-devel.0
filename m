Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1Hc7ks-0000E9-R1
	for openembedded-devel@openembedded.org; Fri, 13 Apr 2007 00:27:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3CMR0Wo016105;
	Thu, 12 Apr 2007 23:27:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15575-09; Thu, 12 Apr 2007 23:26:57 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3CMQsQe016085
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Thu, 12 Apr 2007 23:26:54 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Marcin Juszkiewicz <openembedded@hrw.one.pl>
In-Reply-To: <200704122035.03980.openembedded@hrw.one.pl>
References: <200703042228.03665.openembedded@hrw.one.pl>
	<200704122035.03980.openembedded@hrw.one.pl>
Date: Thu, 12 Apr 2007 23:26:54 +0100
Message-Id: <1176416815.5838.157.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org,
	Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>,
	Koen Kooi <koen@linuxtogo.org>
Subject: Re: RFC: Task-base rewrite
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
X-List-Received-Date: Thu, 12 Apr 2007 22:27:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-04-12 at 20:35 +0200, Marcin Juszkiewicz wrote:
> New version attached is based on task-base r23. 
> 
> Packages.small is result of build for progear/angstrom combination (with 
> some changes to both configs - added some features).
> 
> What this version gives:
> 
> - each feature gets own package,
> - task-boot contain ONLY stuff needed to boot
> - task-distro-base contain distro addons
> - task-machine-base contain machine specific addons
> - task-base depend on all needed task-* packages
> - ability to choose SSH daemon (dropbear, openssh, none) by distro
> - ability to choose /dev/ manager (udev, devfsd, mdev) by distro
> - ability to choose getty provider (tinylogin by default) by distro
> 
> With this version it is easier to create smaller rootfs - for example 
> image with ONLY bluetooth support is "task-boot + task-base-bluetooth".
> 
> Do some tests, post opinions - I think that this will be nice improvement 
> of task-base.

I agree with it and it gets my approval FWIW :)

Cheers,

Richard



