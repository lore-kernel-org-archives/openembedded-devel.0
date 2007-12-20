Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1J5Uwa-0001Qf-1o
	for openembedded-devel@openembedded.org; Fri, 21 Dec 2007 00:36:48 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1J5UVN-0004JO-OX
	for openembedded-devel@openembedded.org; Thu, 20 Dec 2007 23:08:41 +0000
Received: from c-76-17-159-23.hsd1.mn.comcast.net ([76.17.159.23])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 20 Dec 2007 23:08:41 +0000
Received: from grante by c-76-17-159-23.hsd1.mn.comcast.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 20 Dec 2007 23:08:41 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Grant Edwards <grante@visi.com>
Date: Thu, 20 Dec 2007 22:51:46 +0000 (UTC)
Message-ID: <fkerm2$nnf$1@ger.gmane.org>
References: <fk9u44$rgn$1@ger.gmane.org>
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: c-76-17-159-23.hsd1.mn.comcast.net
User-Agent: slrn/0.9.8.1 (Linux)
Sender: news <news@ger.gmane.org>
Subject: Re: How do you find a rev of OE that will build?
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
X-List-Received-Date: Thu, 20 Dec 2007 23:36:48 -0000

On 2007-12-19, Grant Edwards <grante@visi.com> wrote:

> I've been following the GettingStarted page trying to build
> task-bask for about a week now, and I always hit errors due to
> failed patches.  Here's the error du jour after doing a
> pull/update about a half hour ago:
>
> [...]
> NOTE: Running task 284 of 976 (ID: 650, /home/grante/quarq/oe/org.openembedded.dev/packages/python/python-native_2.5.1.bb, do_patch)
> NOTE: package python-native-2.5.1: started
> NOTE: package python-native-2.5.1-ml1: task do_patch: started
> NOTE: Applying patch 'bindir-libdir.patch'
> ERROR: Error in executing: 
> ERROR: Exception:__builtin__.CmdError Message:Command Error: exit status: 1  Output:
> Applying patch bindir-libdir.patch
> patching file Makefile.pre.in
> Hunk #1 FAILED at 78.
> 1 out of 1 hunk FAILED -- rejects in file Makefile.pre.in
[...]

I updated today and tried again.  No joy.  python-native_2.5.1
still fails when applying patches with the same error.

Is there a way to tell bitbake to use an older version of the
package -- presuming there are older versions that will build?

Are packages in the .dev branch normally unbuildable for
extended periods of time?  Should I not be trying to build
using the .dev branch?

-- 
Grant Edwards                   grante             Yow! I smell a RANCID
                                  at               CORN DOG!
                               visi.com            



