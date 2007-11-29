Received: from [67.19.73.58] (helo=pug.o-hand.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <richard@openedhand.com>) id 1IxopZ-0001kJ-Rr
	for openembedded-devel@openembedded.org; Thu, 29 Nov 2007 20:13:50 +0100
Received: from [192.168.1.15] (tim.rpsys.net [194.106.48.114])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id 3820B10CE50E;
	Thu, 29 Nov 2007 14:35:10 -0500 (EST)
From: Richard Purdie <richard@openedhand.com>
To: poky@o-hand.com
In-Reply-To: <d543f5920711290953x75c79b84gbb5bfdce83bfc324@mail.gmail.com>
References: <d543f5920711290953x75c79b84gbb5bfdce83bfc324@mail.gmail.com>
Date: Thu, 29 Nov 2007 19:10:31 +0000
Message-Id: <1196363431.6917.29.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [poky] Syntax for requiring a dependency task's deploy phase	to be finished
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
X-List-Received-Date: Thu, 29 Nov 2007 19:13:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-11-29 at 11:53 -0600, Matt Hoosier wrote:
> I'm trying to build a kernel containing an initramfs linked directly
> into the kernel binary. This is inspired by the recent discussion
> here: building a minimal image with IMAGE_FSTYPE set to cpio.
> 
> I need to be sure that by the time the kernel's do_compile task
> executes, the minimal image has been deploy to ${DEPLOY_DIR}/image.
> What's the right way to write this dependency?

If I understand correctly you want something like

do_compile[depends] += "minimal-image:do_deploy"

inside the kernel recipe where "minimal-image" is the name of the image
recipe.

Cheers,

Richard




