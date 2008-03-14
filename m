Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1JaIAs-0004nS-UK
	for openembedded-devel@openembedded.org; Fri, 14 Mar 2008 23:14:56 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20080314221230.XSOM17893.fed1rmmtao102.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 14 Mar 2008 18:12:30 -0400
Received: from opus ([68.230.58.230]) by fed1rmimpo01.cox.net with bizsmtp
	id 1ACD1Z00S4y2VvG0000000; Fri, 14 Mar 2008 18:12:14 -0400
Date: Fri, 14 Mar 2008 15:12:29 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080314221229.GX30966@smtp.west.cox.net>
References: <200801131718.55872.risto@wapice.com>
	<478A2F3A.4090402@balister.org>
MIME-Version: 1.0
In-Reply-To: <478A2F3A.4090402@balister.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.13 (2006-08-11)
X-SA-Exim-Connect-IP: 68.230.241.44
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: large uImage size
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
X-List-Received-Date: Fri, 14 Mar 2008 22:14:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 13, 2008 at 10:33:14AM -0500, Philip Balister wrote:
> Risto Pajula wrote:
> >Hello.
> >
> >I am getting very large kernel image size (~4,5 MB) when using the 
> >cross-compiler built with a recent version of openembedded. Normal kernel 
> >image size is around 1,5 MB. The large kernel image size only happens when 
> >building the kernel outside the openembedded build environment, when 
> >building with the normal OE build (bitbake minimal-image) the resulting 
> >kernel image size is normal.
> 
> The newer version of binutils does this. This patch should solve the 
> problem. I put this copy in linux/linux-davinci. I believe it has been 
> sent upstream ...

Old message, I know.  But, the upstream answer is a little different and
is:
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=1e621a8e3752367d4aae78a8ab00a18fb2793f34

-- 
Tom Rini


