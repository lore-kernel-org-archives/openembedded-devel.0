Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M1pOw-0006BK-Bs
	for openembedded-devel@openembedded.org; Thu, 07 May 2009 00:15:42 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M1pJ6-0006KJ-J9
	for openembedded-devel@openembedded.org; Wed, 06 May 2009 22:09:40 +0000
Received: from 64.101.21.60 ([64.101.21.60])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 06 May 2009 22:09:40 +0000
Received: from msundius by 64.101.21.60 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 06 May 2009 22:09:40 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Michael Sundius <msundius@sundius.com>
Date: Wed, 6 May 2009 22:09:29 +0000 (UTC)
Message-ID: <loom.20090506T220347-812@post.gmane.org>
References: <loom.20090506T211326-740@post.gmane.org>
	<b6ebd0a50905061444r2d012f65t67fe8af4663a6ae5@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 64.101.21.60 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.15) Gecko/20080702 Fedora/2.0.0.15-1.fc8 Firefox/2.0.0.15)
Sender: news <news@ger.gmane.org>
Subject: Re: Development and Open Embedded
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
X-List-Received-Date: Wed, 06 May 2009 22:15:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Chris Larson <clarson <at> kergoth.com> writes:


> > I'm wondering if anyone has done such a thing as creating a
> > recipe that forgoes the "fetch" task and point the ${S} to
> > a local devel tree.. then adds an extra onto the make command
> > to place the object in another directory (maybe ${O})...
> >

> I have a little class somewhere around here that did that.  Killed
> fetch/unpack/patch, set S to ${TOPDIR}, set O to
> ${TOPDIR}/obj-${HOST_SYS} or so, redirect WORKDIR to
> ${TOPDIR}/somethingorother, etc.  It works very well.  You can then
> add the recipe from the source tree to your BBFILES, or add your
> development area to COLLECTIONS or so, and it mostly just works.
> Cleaning up something like that would be a huge boon to the
> application and kernel developer use cases, which are sadly not well
> satisfied in current openembedded.


I'm happy to help clean it up try it out etc for kernel and other
stuff. We're told here by our boss that giving back is good, so I'm
happy to do it if you don't mind sharing the code and giving me a
head start.

mike




