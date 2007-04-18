Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HeHhB-00074e-6n
	for openembedded-devel@openembedded.org; Wed, 18 Apr 2007 23:28:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3ILS8Vc022108
	for <openembedded-devel@openembedded.org>;
	Wed, 18 Apr 2007 22:28:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21975-03 for <openembedded-devel@openembedded.org>;
	Wed, 18 Apr 2007 22:28:06 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3ILS4Sm022101
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 18 Apr 2007 22:28:04 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <E1HeHMY-0002hi-3M@linuxtogo.org>
References: <E1HeHMY-0002hi-3M@linuxtogo.org>
Date: Wed, 18 Apr 2007 22:28:05 +0100
Message-Id: <1176931685.5845.31.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev nylon images: added support for	experimental mtx-3a machine
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
X-List-Received-Date: Wed, 18 Apr 2007 21:28:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-04-18 at 23:06 +0200, MartinDietze commit wrote:
> nylon images: added support for experimental mtx-3a machine
> 
> Author: MartinDietze@openembedded.org
> Branch: org.openembedded.dev
> Revision: 3036f05f449df8719f3d3581c29195dc5c2e09d1
> ViewMTN: http://monotone.openembedded.org/revision.psp?id=3036f05f449df8719f3d3581c29195dc5c2e09d1
> Files:
> 1
> packages/images/nylon-image-base.bb
> packages/images/nylon-image-standard.bb
> Diffs:

> --- packages/images/nylon-image-base.bb	1255705fdb6fd798f6d00869aa56dc09c6dc98c5
> +++ packages/images/nylon-image-base.bb	901d2b38da9398bc61d942764277e48032ff0d29
> @@ -1,15 +1,15 @@
> -inherit image
> -inherit nylon-image
> -LICENSE = "MIT"
> +inherit image_ipk 
> +inherit nylon_image
> +LICENSE = MIT


This breaks things since it is image.bbclass and nylon-image.bbclass
in .dev and you've removed quoting on LICENSE breaking the new bitbake
parser :-(

Richard





