Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MDGbL-0004Yb-FQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 13:31:50 +0200
Received: from 212-139-89-247.dynamic.dsl.as9105.com ([212.139.89.247]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1MDGSH-0000VI-A3; Sun, 07 Jun 2009 12:22:25 +0100
From: Phil Blundell <pb@reciva.com>
To: Elvis Dowson <elvis.dowson@mac.com>
In-Reply-To: <1F1DD9C5-164F-4137-88B5-FD9C7F60BCDC@mac.com>
References: <4E17E8CF-AA3B-4929-BC22-B9B28A757035@mac.com>
	<1244367963.4151.5.camel@lenovo.internal.reciva.com>
	<618E409A-94E7-486B-B6CF-6D2F01FF08B6@mac.com>
	<1244369313.4151.9.camel@lenovo.internal.reciva.com>
	<94920284-2A1B-4EFC-83A0-F445BFDE92B9@mac.com>
	<1244371661.4151.14.camel@lenovo.internal.reciva.com>
	<1F1DD9C5-164F-4137-88B5-FD9C7F60BCDC@mac.com>
Date: Sun, 07 Jun 2009 12:22:23 +0100
Message-Id: <1244373743.4151.24.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Subject: Re: linux-omap3_git.bb	doesn't	work	when	copied	to	user.collection
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
X-List-Received-Date: Sun, 07 Jun 2009 11:31:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Just to be clear, the file I mentioned below (and the one which is
mentioned in the error message you quoted originally) is not
in /usr/share/sources/git so it wouldn't have been deleted along with
the other bits.  Did you remove this file as well?

Assuming yes, it seems that this file must be getting corrupted (or
generated wrongly in the first place) for some reason.  In that case I
think you'll just have to trace back through the bitbake logs to see
what's happening.

p.

On Sun, 2009-06-07 at 15:11 +0400, Elvis Dowson wrote:
> Hi Phil,
> 		Yes, I deleted the entire /usr/share/sources/git folder. Still same  
> error. Tried deleting both /usr/share/sources/git  and /tmp and ran  
> the bitbake comman, still fails.
> 
> Any suggestions on how to fix this?
> 
> If I download a snapshot and temporarily put it there, what name  
> should I give it?
> 
> Elvis
> 
> 
> On Jun 7, 2009, at 2:47 PM, Phil Blundell wrote:
> 
> > Apparently /usr/share/sources/
> > git_git.kernel.org.pub.scm.linux.kernel.git.tmlind.linux-
> > omap-2.6.git.tar.gz is corrupt.  Have you tried deleting that file as
> > well?
> >
> > p.
> >



