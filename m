Received: from [128.2.201.16] (helo=jackfruit.srv.cs.cmu.edu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dhuggins@cs.cmu.edu>) id 1LuYkJ-0006cL-BV
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 23:03:48 +0200
Received: from [128.2.222.132] (LIMA-2.SPEECH.CS.CMU.EDU [128.2.222.132])
	by jackfruit.srv.cs.cmu.edu (8.13.6/8.13.6) with ESMTP id
	n3GKxisv018677; Thu, 16 Apr 2009 16:59:44 -0400 (EDT)
Message-ID: <49E79C40.1050801@cs.cmu.edu>
Date: Thu, 16 Apr 2009 16:59:44 -0400
From: David Huggins-Daines <dhuggins@cs.cmu.edu>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: Tom Rini <trini@kernel.crashing.org>
References: <1239912183-25085-1-git-send-email-dhuggins@cs.cmu.edu>
	<1239912183-25085-2-git-send-email-dhuggins@cs.cmu.edu>
	<20090416205436.GL17629@smtp.west.cox.net>
In-Reply-To: <20090416205436.GL17629@smtp.west.cox.net>
X-Scanned-By: mimedefang-cmuscs on 128.2.201.16
X-SA-Exim-Connect-IP: 128.2.201.16
X-SA-Exim-Mail-From: dhuggins@cs.cmu.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,RDNS_NONE autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] fix do_install for MinGW gcc-canadian-sdk
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
X-List-Received-Date: Thu, 16 Apr 2009 21:03:48 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
>
> Is this using the distro / machine you mentioned before?  This should
> all be fine and we just end up making a 'C:' dir.  I'm very curious here
> as at some point prior to pushing canadian stuff originally I had the
> same patch, but on trying to confirm I needed it, I suddenly didn't need
> it anymore.
>
>   
Yeah - I can send you the distro, machine, and local.conf if you like, 
or publish my git repository. I am using these extra definitions in 
local.conf for building the MinGW SDK:

SDK_ARCH = "i686"
SDK_OS = "mingw32"
SDK_EXEEXT = ".exe"
OVERRIDES .= ":sdk-mingw32"



