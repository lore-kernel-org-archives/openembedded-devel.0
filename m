Received: from out3.smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjensen@gmx.de>) id 1QvzGP-0004D8-8O
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 00:16:05 +0200
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 355F420B2B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2011 18:05:42 -0400 (EDT)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute4.internal (MEProxy); Tue, 23 Aug 2011 18:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:to:subject:message-id
	:mime-version:content-type; s=smtpout; bh=MpGHNgxhnUWuXELDhDB2aW
	4ter4=; b=cSfPtLKeP42FYPdSg2ll0SAaXLw+jAKOJ3eaTo6XcgHnv41623PG02
	t99vP6zcurTiX80m9RjlW3emktYB8ksuN1NZFoXo3s6QlfnYjeZaBzVOZtn60YhY
	8NNAqRY/GM8MBQFnaZxyuQSUI+Pi+PtNya4bWMTFoyy6QaP2TnbAg=
X-Sasl-enc: DVTZbdu7SO9Zv1bEcNiIoEhxEWMIAoE7qHbRIyxpI/7Q 1314137141
Received: from newslug (hnvr-4dbb2273.pool.mediaWays.net [77.187.34.115])
	by mail.messagingengine.com (Postfix) with ESMTPSA id A44AD41F49A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2011 18:05:41 -0400 (EDT)
Date: Wed, 24 Aug 2011 00:11:39 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <alpine.LNX.2.00.1108232320390.6141@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
Subject: bitbaking aufs
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
X-List-Received-Date: Tue, 23 Aug 2011 22:16:05 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

Hej!

I would like to use a layered filesystem in our ppc603e-based machine: the 
rootfs built from openembedded would be read-only, any customizations go 
to a writable filesystem and should the need occur to start fresh all I 
need is a mechanism to remove the contents of the writable filesystem.

In openembedded (2011.03) there is unionfs and aufs 
(http://aufs.sourceforge.net/), aufs is more actively developed so I would 
like to use that.  Unfortunately the recipe in oe uses aufs1 which does 
not support current kernels.  Could change that to aufs2.2 but 
aufs2 now has two seperated repos (patched kernel or source plus patches = 
"standalone") and I'm in doubt how to proceed.  Especially as aufs_cvs.bb 
contains some CONFIG_xxx voodo.

My intention is to use the "standalone" repo and "inherit module" from oe 
but how do I apply kernel patches in this case?  The kernel resides in 
${TMPDIR}/sysroots, do I patch that???  Or do I have to apply those 
patches during kernel build?  I could extract them from git and add them 
to the kernel recipe for my machine but this doesn't feel right,

I think, I need some advice how to best get aufs2.2 building.  And a good 
example for a "inherit module" recipe using sysroot kernel source might 
help.  Which should I use as example for aufs?

Best regards,
    Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


