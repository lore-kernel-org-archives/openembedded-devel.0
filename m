Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PoeIZ-0001mO-J7
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Feb 2011 16:55:43 +0100
Received: (qmail invoked by alias); 13 Feb 2011 15:54:35 -0000
Received: from p5DE48C50.dip.t-dialin.net (EHLO localhost.localdomain)
	[93.228.140.80]
	by mail.gmx.net (mp069) with SMTP; 13 Feb 2011 16:54:35 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+bGmJbFpab1nS0bRcuKxuufxsQoVpd58IK5uDDbV
	SyUX3L/uUVI77h
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Feb 2011 16:50:17 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
MIME-Version: 1.0
Message-Id: <201102131650.17611.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] insane.bbclass: fix the check for bad RPATH
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
X-List-Received-Date: Sun, 13 Feb 2011 15:55:43 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi OE folks,

Yesterday I merged latest head into my working branch and started a fresh build for xfce46-image. I get

ERROR: QA Issue with db: package db contains bad RPATH /home/Superandi/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib in file /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/db-5.0.21-r3/packages-split/db/usr/lib/libdb-5.0.so
ERROR: QA Issue with db: package db contains bad RPATH /home/Superandi/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib in file /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/db-5.0.21-r3/packages-split/db/usr/lib/libdb-5.0.so
ERROR: QA Issue with db-bin: package db-bin contains bad RPATH /home/Superandi/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib in file /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/db-5.0.21-r3/packages-split/db-bin/usr/bin/db_checkpoint
ERROR: QA Issue with db-bin: package db-bin contains bad RPATH /home/Superandi/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib in file /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/db-5.0.21-r3/packages-split/db-bin/usr/bin/db_checkpoint
...
FATAL: QA run found fatal errors. Please consider fixing them.
ERROR: Error in executing python function in: /home/Superandi/data/OpenEmbedded/gumstix-oe/recipes/db/db_5.0.21.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Function do_package_qa failed

Without having further checks I think commit 14f7dd0965f14a09169dc5a2df18ff0b06f8bad5 causes this behaviour.

What makes me wondering:

- even in case I use the -k option the build aborts at the same position. Is that intended?
- Commit 6aa31074adaccffcfd3080e8390065ab5abda2a6 brings up many undetected RPATH cases which have to be fixed. With the current situation it is not possible to check which there are.

How about creating a list (I know Frans did already - but I think it was before the latest RPATH commit) listing the packages with QA errors / the type of QA error / and (to prevent double efforts)  a person willing to take care. (Although I know nobody uses it :-) I take a look for clutter-box2d which has RPATH error)

Or is there something ongoing I have missed?

Andreas


