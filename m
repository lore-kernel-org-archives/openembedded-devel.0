Received: from [128.2.201.16] (helo=jackfruit.srv.cs.cmu.edu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dhuggins@cs.cmu.edu>) id 1LrEc6-0000IP-Sh
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 18:58:05 +0200
Received: from [128.2.222.132] (LIMA-2.SPEECH.CS.CMU.EDU [128.2.222.132])
	by jackfruit.srv.cs.cmu.edu (8.13.6/8.13.6) with ESMTP id
	n37GsVNj019329; Tue, 7 Apr 2009 12:54:31 -0400 (EDT)
Message-ID: <49DB854A.4070908@cs.cmu.edu>
Date: Tue, 07 Apr 2009 12:54:34 -0400
From: David Huggins-Daines <dhuggins@cs.cmu.edu>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: Tom Rini <trini@kernel.crashing.org>
References: <1239117404-2263-1-git-send-email-dhuggins@cs.cmu.edu>
	<20090407164400.GD2195@smtp.west.cox.net>
In-Reply-To: <20090407164400.GD2195@smtp.west.cox.net>
X-Scanned-By: mimedefang-cmuscs on 128.2.201.16
X-SA-Exim-Connect-IP: 128.2.201.16
X-SA-Exim-Mail-From: dhuggins@cs.cmu.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	RDNS_NONE autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] fix GCC 4.3.3 sources in stable/2009 branch
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
X-List-Received-Date: Tue, 07 Apr 2009 16:58:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
>
> First, this is fixed in .dev now, by fixing all of the gcc recipes
> (except for csl ones) to use ${GNU_MIRROR} and updating the checksums
> file.  Second, ftp.gnu.org/gnu is correct as 'pub' is just a symlink to
> '.'.
>   
Yeah, actually, after trying to rebuild, I agree.  Changing bitbake.conf 
is a very bad idea.

However I still think the changes to the gcc recipes and checksums.ini 
should be merged into the stable branch, otherwise it is not possible to 
build any recent versions of GCC (and in particular, thumb support seems 
not to work properly without using 4.3.3)


