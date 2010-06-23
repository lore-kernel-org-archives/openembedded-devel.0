Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1ORX5j-0003lP-Iy
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 23:02:40 +0200
Received: from [192.168.1.12] (c-76-115-42-183.hsd1.or.comcast.net
	[76.115.42.183])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id B3405308D6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 16:57:46 -0400 (EDT)
Message-ID: <4C227543.3050502@zenlinux.com>
Date: Wed, 23 Jun 2010 13:57:39 -0700
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9pre) Gecko/20100217 Lightning/1.0b1 Shredder/3.0.3pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: B3405308D6.1875C
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: RFC: Should do_runstrip be removed for kernel packages?
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
X-List-Received-Date: Wed, 23 Jun 2010 21:02:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I've noticed for many kernel builds in OE/Poky that there are non-fatal 
runstrip errors being generated during the do_pacakge stage of the build.

This is happening because a handful of utility binaries (in arch/boot/ 
and scripts/) are being compiled for the host architecture, and then 
strip for the target architecture is being run. When these architectures 
don't match, runstrip complains and generates these errors.

Currently in Poky we are maintaining a blacklist of these binaries and 
deleting them in do_install:

http://git.pokylinux.org/cgit.cgi/poky/commit/?id=698dab01098816e4894beb4b3dad556f045c074d

This is a hack that I'd like to keep as temporary as possible.

I'm curious though if it is even common to perform do_runstrip for 
kernel packages? What are the use cases that require this? If there are 
none, then I'm inclined to simply disable do_runstrip in kernel.bbclass.

Another option - less elegant, but better than the current hack - might 
be to use a variable to disable runstrip and set that within the kernel 
recipe files.

Thoughts or other ideas?

Scott

-- 
Scott Garman
sgarman at zenlinux dot com


