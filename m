Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <vjensen@gmx.de>) id 1QwA5T-0001Oc-U7
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 11:49:32 +0200
Received: (qmail 23153 invoked by uid 0); 24 Aug 2011 09:38:04 -0000
Received: from 145.253.169.210 by www050.gmx.net with HTTP;
	Wed, 24 Aug 2011 11:38:02 +0200 (CEST)
Date: Wed, 24 Aug 2011 11:38:02 +0200
From: "Vitus Jensen" <vjensen@gmx.de>
In-Reply-To: <201108241102.05565.ml@vdm-design.de>
Message-ID: <20110824093802.194230@gmx.net>
MIME-Version: 1.0
References: <alpine.LNX.2.00.1108232320390.6141@asterix.crazy-teaparty.dyndns.org>
	<201108241102.05565.ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #705530
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX19I6NQuIRRINAAfcZ8e8YOa+106q34gDGE+tSS9Bs
	WZeIVdi6UxcXEM0h1GHVrqeGZMRHW2ZE6Bvg== 
X-GMX-UID: H7c9Ia1zMydhAK2WYGplv+tjaGRhZpoG
Subject: Re: bitbaking aufs
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
X-List-Received-Date: Wed, 24 Aug 2011 09:49:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 24 Aug 2011 11:02:05 +0200 Thomas Zimmermann wrote:
> On Wednesday, August 24, 2011 00:11:39 Vitus Jensen wrote:
> > Hej!
> > 
> > I would like to use a layered filesystem in our ppc603e-based machine:
> > the rootfs built from openembedded would be read-only, any
> > customizations go to a writable filesystem and should the need
> > occur to start fresh all I
> > need is a mechanism to remove the contents of the writable filesystem.
> > 
> > In openembedded (2011.03) there is unionfs and aufs
> > (http://aufs.sourceforge.net/), aufs is more actively developed so
> > I would like to use that.  Unfortunately the recipe in oe uses
> > aufs1 which does
> > not support current kernels.  Could change that to aufs2.2 but
> > aufs2 now has two seperated repos (patched kernel or source plus
> > patches = "standalone") and I'm in doubt how to proceed.
> > Especially as aufs_cvs.bb contains some CONFIG_xxx voodo.
> > 
> > My intention is to use the "standalone" repo and "inherit module"
> > from oe
> > but how do I apply kernel patches in this case?  The kernel resides in
> > ${TMPDIR}/sysroots, do I patch that???  Or do I have to apply those
> > patches during kernel build?  I could extract them from git and add
> > them to the kernel recipe for my machine but this doesn't feel right,
...

> You have to patch the kernel to export a lot of symbols for aufs2.
> So you have  to rebuild the kernel anyway. And then i think it
> would be the easiest way if you integrate it into your kernel
> directly. Like described in the README section 3.1.
> 
> In my opinion a standalone aufs recipe is not possible, because the
> kernel needs to be patched and you have to use the specific branch
> for your kernel version.

In this case (and in the meantime I came to the same conclusion) it is easiest to use the already patched kernel tree from aufs.sourceforge, create a linux-aufs_2.6.36.bb and use that for my device.  Or have a second look to union-mount (http://valerieaurora.org/union/) and build a recipe for that tree.

Thank you for your viewpoints, they helped.
  Vitus

-- 
NEU: FreePhone - 0ct/min Handyspartarif mit Geld-zurück-Garantie!		
Jetzt informieren: http://www.gmx.net/de/go/freephone


