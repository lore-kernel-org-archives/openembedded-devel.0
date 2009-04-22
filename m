Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LwTCM-0003Wa-BB
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 05:32:34 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIH00EPCGA1RIN3@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	21 Apr 2009 22:27:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A7B176B83A8; Tue,
	21 Apr 2009 23:27:36 -0400 (EDT)
Date: Tue, 21 Apr 2009 23:27:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090422032736.GB11408@denix.org>
References: <1238399997-6016-1-git-send-email-khimov@altell.ru>
	<c384c5ea0904211352o406880cbp2846efd6e0125038@mail.gmail.com>
	<87eivlef8t.fsf@neumann.lab.ossystems.com.br>
MIME-version: 1.0
In-reply-to: <87eivlef8t.fsf@neumann.lab.ossystems.com.br>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] image.bbclass: reorder do_rootfs
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
X-List-Received-Date: Wed, 22 Apr 2009 03:32:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 21, 2009 at 08:52:50PM -0300, Otavio Salvador wrote:
> Hello Leon,
> 
> Leon Woestenberg <leon.woestenberg@gmail.com> writes:
> 
> > On Mon, Mar 30, 2009 at 9:59 AM, Roman I Khimov <khimov@altell.ru> wrote:
> >> Places do_rootfs function before do_install in image creation process.
> >>
> >> This change allows multiimage builds, when one image depends on another (before
> >> that second image creation raced with do_rootfs for the first one) and uses
> >> it for some purpose.
> >>
> >> Multiimage builds are useful in situations like creating an installer image
> >> with initramfs (built in OE) and an image of the target FS (also built in OE)
> >> or for building virtualized system images to be placed on target FS.
> >> ---
> >
> > This looks *very* useful.
> >
> > However, this might break stuff as it is intrusive. So HEADS UP everyone! :-)
> 
> [...]
> 
> Mind to explain how it can break things?

On the other hand - mind to explain how it can be so very useful? :) Any real 
word examples?

-- 
Denys


