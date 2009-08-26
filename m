Received: from [12.173.51.132] (helo=emailgateway.hillcrestlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1MgKs6-0003pR-4f
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 17:57:14 +0200
X-AuditID: 0a1e000a-b7ba8ae000000dd5-25-4a955721daeb
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A9539AA.3070306@gmail.com>
References: <4A9539AA.3070306@gmail.com>
Date: Wed, 26 Aug 2009 11:39:10 -0400
Message-Id: <1251301150.4493.12.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
Subject: Re: Strange do_patch behaviour
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
X-List-Received-Date: Wed, 26 Aug 2009 15:57:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-08-26 at 19:33 +0600, Dmitry Vinokurov wrote:
> ------------
> And looks like bitbake did nothing except patching, but actually it does 
> (diff between manually and bitbake patched dirs is ~30000 strings, and I 
> decided not to attach it:)) and as a result builded kernel fails with 
> kernel panic. Diff shows, that '.pc' dir is created (and some files in 
> it are forbidden for any access (0000 rights)) and not only it -- some 
> other files like in arch/arm or sound/soc/lpc3xxx/ differs too. Tried to 
> remove tmp/ and rebuild -- same result.
> 
> Could anybody explain this strange behaviour? I thought that patch task 
> should only execute 'patch' command.
> 

Bitbake uses a tool called 'quilt' in order to do the patching, and
quilt creates the .pc directory. Basically, quilt lets you deal with
patches as a stack. If you go into the linux work directory, you should
be able to run quilt commands to manually figure out what OE is patching
here.

'quilt applied' to see what patches are applied
'quilt pop' to pop a patch off the stack
'quilt push' to push a patch onto the stack.

Some Quilt Links:
Very helpful presentation: http://www.coffeebreaks.org/blogs/wp-content/archives/talks/2005/quilt/quiltintro-s5.html
Overview PDF: http://www.suse.de/~agruen/quilt.pdf
Savannah page: http://savannah.nongnu.org/projects/quilt



