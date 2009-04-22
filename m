Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LwUZm-0002s3-EN
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 07:00:50 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LwUVP-000CZG-2u
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 08:56:19 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 08:56:14 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <1238399997-6016-1-git-send-email-khimov@altell.ru>
	<20090421204132.GL17629@smtp.west.cox.net>
In-Reply-To: <20090421204132.GL17629@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200904220856.15285.khimov@altell.ru>
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
X-List-Received-Date: Wed, 22 Apr 2009 05:00:50 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 22 April 2009 00:41:32 Tom Rini wrote:
> On Mon, Mar 30, 2009 at 11:59:57AM +0400, Roman I Khimov wrote:
> > Places do_rootfs function before do_install in image creation process.
> >
> > This change allows multiimage builds, when one image depends on another
> > (before that second image creation raced with do_rootfs for the first
> > one) and uses it for some purpose.
> >
> > Multiimage builds are useful in situations like creating an installer
> > image with initramfs (built in OE) and an image of the target FS (also
> > built in OE) or for building virtualized system images to be placed on
> > target FS.
>
> So, the problem we have happen is that opkg (or dpkg or ...) gets into a
> race because >1 image are trying to muck around in ${TMPDIR}/rootfs,
> right?  How does this fix the problem?

The problem was in dependencies between images, currently I have one project 
with 4 images that depends and packs like this

   /-> 2 -> 3
1-+
   \-> 4

What you're talking about is another problem and in another project that I'm 
converting now to OE I'll try to do something like

IMAGE_ROOTFS = "${TMPDIR}/rootfs.${PN}"

to have parallel image builds.


