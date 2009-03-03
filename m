Received: from [206.46.173.17] (helo=vms173017pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LeMSb-0004Bk-OX
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 05:42:29 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KFW00CT7Y7JRX9G@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	02 Mar 2009 22:38:13 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CF5BB6B83B5; Mon,
	02 Mar 2009 23:38:06 -0500 (EST)
Date: Mon, 02 Mar 2009 23:38:06 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090303043806.GA26643@denix.org>
References: <200903021515.46131.e.robertson.svg@gmail.com>
MIME-version: 1.0
In-reply-to: <200903021515.46131.e.robertson.svg@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: sysvinit runlevels
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
X-List-Received-Date: Tue, 03 Mar 2009 04:42:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 02, 2009 at 03:15:46PM -0600, E Robertson wrote:
> Hi,
> I'm building a busybox based distro using busybox init. I notice sysvinit run 
> levels unexpectedly showed up my rootfs. Is this normally what it does and I 
> need to explicitly remove them? 

AFAIK, runlevels are coming with initscripts package, not sysvinit - you can 
overwrite that with IMAGE_INITSCRIPTS variable. But then you'd have to manage 
startup scripts yourself, as many recipes hook into update-rc.d through 
INITSCRIPT_PARAMS.

> Also, I couldn't find the "?=" operation in the bitbake manual so I assumed it 
> a condition statement and is overridden of the variable is defined, it this 
> true?

Theodore A. Roth is kind enough to help with the documentation. Earlier today 
he sent the patch to the bitbake mailing list with the following text:

Setting a default value (?=)
A ?= "aval"
If A is set before the above is called, it will retain it's
previous value. If A is unset prior to the above call, A will be
set to aval.

-- 
Denys


