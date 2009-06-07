Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1MDITI-0000jV-Gp
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 15:31:36 +0200
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id 168F9547D9; Sun,  7 Jun 2009 15:22:12 +0200 (CEST)
Date: Sun, 7 Jun 2009 15:22:12 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090607132212.GA20762@fh-wedel.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: glibc-initial-2.3.2 build failes (wrong patch)
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
X-List-Received-Date: Sun, 07 Jun 2009 13:31:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

 I just pulled from the git and started a rebuild, found that
glibc-initial-2.3.2 no longer builds on my system (nylon,
mtx-1). It looks like the wrong patch is picked for applying:

| NOTE: Applying patch 'hppa-syscall.patch' (org.openembedded.dev/recipes/glibc/glibc-2.3.2/hppa-syscall.patch)
| NOTE: Applying patch 'glibc23-errno-hack.patch' (org.openembedded.dev/recipes/glibc/glibc-2.3.2/glibc23-errno-hack.patch)
| NOTE: Applying patch '90_glibc232-statvfs.patch' (org.openembedded.dev/recipes/glibc/glibc-2.3.2/90_glibc232-statvfs.patch)
| NOTE: Applying patch '90_glibc232-timezones.patch' (org.openembedded.dev/recipes/glibc/glibc-2.3.2/90_glibc232-timezones.patch)
| NOTE: Applying patch 'arm-memcpy.patch' (org.openembedded.dev/recipes/glibc/glibc-2.4/arm-memcpy.patch)
| NOTE: Applying patch 'arm-longlong.patch' (org.openembedded.dev/recipes/glibc/glibc-2.4/arm-longlong.patch)
| ERROR: Error in executing: /var/src/OE/org.openembedded.dev/recipes/glibc/glibc-initial_2.3.2.bb
| ERROR: Exception:<class 'CmdError'> Message:Command Error: exit status: 1  Output:
| Applying patch arm-longlong.patch
| can't find file to patch at input line 3
| Perhaps you used the wrong -p or --strip option?
| The text leading up to this was:
| --------------------------
| |--- glibc-2.4/stdlib/longlong.h.ark    2006-03-11 22:49:27.000000000 +0100
| |+++ glibc-2.4/stdlib/longlong.h        2006-03-11 22:55:12.000000000 +0100

I cannot find any reason why arm-memcpy.patch and arm-longlong.patch
from the glibc-2.4 directory are used while both files are available
in glibc-2.3.2. Any idea anyone?

Cheers,

M'bert

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Ed, the greatest WYGIWYG editor of all.


