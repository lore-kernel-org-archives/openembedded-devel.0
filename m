Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LwMqw-0004vu-HS
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 22:46:02 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090421204133.DKP27308.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 16:41:33 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id iLhY1b00X4dMFYL04LhZMT; Tue, 21 Apr 2009 16:41:33 -0400
X-Authority-Analysis: v=1.0 c=1 a=cjLNA8OfJ9QA:10 a=ZxtmPpjDU2cA:10
	a=J7kNMFXqg7cm_wJ7gF4A:9 a=0ZzfA6lg4TxEIOwOg8QA:7
	a=iM-In8J0MtGXo_SeoqWx_87AlWgA:4
X-CM-Score: 0.00
Date: Tue, 21 Apr 2009 13:41:32 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090421204132.GL17629@smtp.west.cox.net>
References: <1238399997-6016-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1238399997-6016-1-git-send-email-khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
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
X-List-Received-Date: Tue, 21 Apr 2009 20:46:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 30, 2009 at 11:59:57AM +0400, Roman I Khimov wrote:

> Places do_rootfs function before do_install in image creation process.
> 
> This change allows multiimage builds, when one image depends on another (before
> that second image creation raced with do_rootfs for the first one) and uses
> it for some purpose.
> 
> Multiimage builds are useful in situations like creating an installer image
> with initramfs (built in OE) and an image of the target FS (also built in OE)
> or for building virtualized system images to be placed on target FS.

So, the problem we have happen is that opkg (or dpkg or ...) gets into a
race because >1 image are trying to muck around in ${TMPDIR}/rootfs,
right?  How does this fix the problem?

-- 
Tom Rini


