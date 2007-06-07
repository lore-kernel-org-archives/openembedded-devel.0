Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1HwN26-00028j-SB
	for openembedded-devel@openembedded.org; Thu, 07 Jun 2007 20:48:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l57Ik3kZ005807
	for <openembedded-devel@openembedded.org>;
	Thu, 7 Jun 2007 19:46:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05504-07 for <openembedded-devel@openembedded.org>;
	Thu,  7 Jun 2007 19:45:59 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l57Ijx2F005800
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 7 Jun 2007 19:45:59 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <045401c7a8fa$ea96f300$6e01a8c0@twilight>
References: <03ec01c7a8bc$95a2f030$6e01a8c0@twilight>
	<200706070839.52842.openembedded@hrw.one.pl>
	<045401c7a8fa$ea96f300$6e01a8c0@twilight>
Date: Thu, 07 Jun 2007 19:45:58 +0100
Message-Id: <1181241958.6086.204.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Need advice on changing kernel.bbclass
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
X-List-Received-Date: Thu, 07 Jun 2007 18:48:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-06-07 at 06:56 -0500, Mike (mwester) wrote:
> Build completed, with this suggestion.  :(  No joy:
> 
> Package: kernel-module-binfmt-misc
> Version: 2.4.22.l2.3r63-r18.5
> Depends: update-modules, kernel-2.4.22-xfs
> Section: kernel
> 
> The kernel modules built remain firm in their conviction that they depend
> upon the kernel, not kernel-image.

I stand by the reasoning for the reasoning for the change as detailed by
the thread mentioned - it did address some underlying problems. It was
assumed anyone rebuilding the modules could release a new kernel package
too hence avoiding this dependency problem.

On the NSLU2, kernel-image-2.4.22-xfs is probably an empty package? as
will be kernel-2.4.22-xfs? Would it be possible to have both 'empty'
packages in the feed? You could always have one have a Depends: on the
other?

Cheers,

Richard







