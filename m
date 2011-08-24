Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@vdm-design.de>) id 1Qw9Wt-0000js-FF
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 11:13:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 3D402309C022
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 11:02:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at hsp-52.hspserver.com
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id of8brtca6ykt
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 11:02:06 +0200 (CEST)
Received: from rikrok.localnet (hsaggate.physik.uni-bonn.de [131.220.167.59])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTPSA id 05705309C025
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 11:02:06 +0200 (CEST)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Aug 2011 11:02:05 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.37.6-0.5-desktop; KDE/4.6.0; i686; ; )
References: <alpine.LNX.2.00.1108232320390.6141@asterix.crazy-teaparty.dyndns.org>
In-Reply-To: <alpine.LNX.2.00.1108232320390.6141@asterix.crazy-teaparty.dyndns.org>
MIME-Version: 1.0
Message-Id: <201108241102.05565.ml@vdm-design.de>
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
X-List-Received-Date: Wed, 24 Aug 2011 09:13:47 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday, August 24, 2011 00:11:39 Vitus Jensen wrote:
> Hej!
> 
> I would like to use a layered filesystem in our ppc603e-based machine: the
> rootfs built from openembedded would be read-only, any customizations go
> to a writable filesystem and should the need occur to start fresh all I
> need is a mechanism to remove the contents of the writable filesystem.
> 
> In openembedded (2011.03) there is unionfs and aufs
> (http://aufs.sourceforge.net/), aufs is more actively developed so I would
> like to use that.  Unfortunately the recipe in oe uses aufs1 which does
> not support current kernels.  Could change that to aufs2.2 but
> aufs2 now has two seperated repos (patched kernel or source plus patches =
> "standalone") and I'm in doubt how to proceed.  Especially as aufs_cvs.bb
> contains some CONFIG_xxx voodo.
> 
> My intention is to use the "standalone" repo and "inherit module" from oe
> but how do I apply kernel patches in this case?  The kernel resides in
> ${TMPDIR}/sysroots, do I patch that???  Or do I have to apply those
> patches during kernel build?  I could extract them from git and add them
> to the kernel recipe for my machine but this doesn't feel right,
> 
> I think, I need some advice how to best get aufs2.2 building.  And a good
> example for a "inherit module" recipe using sysroot kernel source might
> help.  Which should I use as example for aufs?
> 
> Best regards,
>     Vitus

You have to patch the kernel to export a lot of symbols for aufs2. So you have 
to rebuild the kernel anyway. And then i think it would be the easiest way if 
you integrate it into your kernel directly. Like described in the README 
section 3.1.

In my opinion a standalone aufs recipe is not possible, because the kernel 
needs to be patched and you have to use the specific branch for your kernel 
version.

Regards
Thomas


