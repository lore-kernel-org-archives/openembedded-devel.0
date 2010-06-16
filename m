Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1OOndq-0005qi-DQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 10:06:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 7C26BA5279
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 09:02:03 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 30ahZhxOyRUv
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 09:02:02 +0100 (BST)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id F002CA525C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 09:02:01 +0100 (BST)
Date: Wed, 16 Jun 2010 09:02:00 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100616090200.5c23b895@xora-desktop.xora.org.uk>
In-Reply-To: <4C187CF6.5010401@gmx.net>
References: <4C187CF6.5010401@gmx.net>
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] add ubuntu patch which adds atomic builtin support to gcc 4.3.[3 but also other microversions]
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
X-List-Received-Date: Wed, 16 Jun 2010 08:06:34 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Jun 2010 09:27:50 +0200
Robert Schuster <thebohemian@gmx.net> wrote:

> Hi,
> Angstrom's default GCC is 4.3.3 for ARM. Unfortunately that version
> lacks atomic intrinsics support for the very same architecture
> (__sync_synchronize and friends). The support is available from 4.4.x
> onwards but a patch exists in Ubuntu's GCC that adds the intrinsics to
> the earlier GCC version. I would like add that patch to our GCC 4.3.x
> (all of them so there is not suddenly a feature missing when one
> changes from one microversion to another). This has the potential for
> drastic effects on other recipes because a lot of programs (e.g.
> pulseaudio, llvm) check for the availability of the intrinsics and
> make use of them in that case.
> 
> I ask for comments here because I would also like to see this change
> move into OE stable later on. (The use case is to get OpenJDK with the
> Shark JIT compiler [llvm-based] to run on the bug20 hardware).
> 
> Regards,
> Robert

This sounds like it would require a DISTRO_PR bump on the Angstrom side
which I am fine with, but we need to synchronize so there are enough
Angstrom developers to re-fill the feeds on bump day.

Otherwise I think this is a very good idea.

Graeme


