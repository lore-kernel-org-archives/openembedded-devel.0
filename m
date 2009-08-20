Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Me05U-00016Z-8g
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 07:21:24 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KON004KVSQS2TWD@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	20 Aug 2009 00:04:05 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8B7E714AF5F; Thu,
	20 Aug 2009 01:04:04 -0400 (EDT)
Date: Thu, 20 Aug 2009 01:04:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090820050404.GI32010@denix.org>
References: <4A8CD3A8.900@gmail.com>
MIME-version: 1.0
In-reply-to: <4A8CD3A8.900@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: bitbake ignores DEFAULT_PREFERENCE
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
X-List-Received-Date: Thu, 20 Aug 2009 05:21:24 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Aug 20, 2009 at 10:40:08AM +0600, Dmitry Vinokurov wrote:
> Hello,
>
> I want to port OE to LPC3250 board and now I'm trying to build 
> helloworld-image.
>
> I've created lpc3250.conf in conf/machine:
> TARGET_ARCH = "arm"
> PACKAGE_EXTRA_ARCHS = "armv5te"
> TARGET_CC_ARCH = "-fsigned-char -mfpu=vfp -mfloat-abi=softfp"
>
> Then I've added DEFAULT_PREFERENCE_lpc3250 = "1" to 
> 'recipes/linux/linux_2.6.27.bb', but 'bitbake -v helloworld-image' 
> downloads 2.6.23 kernel all the same. Re-reading all recipes database make 
> no sense.
>
> Could anybody advise, how this can be solved? I need to use exactly 2.6.27 
> kernel as I know that it definitely works.

Are you sure it downloads 2.6.23 to build your kernel and not the 
linux-libc-headers? Check the dependencies and what it's going to build by 
executing "bitbake <target> -g" and then poking into depends.dot...

Otherwise you can try setting PREFERRED_VERSION_virtual/kernel = "2.6.23" to 
override DEFAULT_PREFERENCE...

-- 
Denys


