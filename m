Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QYlrr-00006W-Ee
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jun 2011 23:18:47 +0200
Received: (qmail invoked by alias); 20 Jun 2011 21:15:14 -0000
Received: from p5B0A3BB3.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.59.179]
	by mail.gmx.net (mp057) with SMTP; 20 Jun 2011 23:15:14 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18TtLJdKX0ToG2xwkoQqLGm5WSlWLFSN2fUthQ6Tn
	UcPScdN+CScBeF
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jun 2011 23:16:47 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201106202316.47662.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: udev 171 caching working propely?
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
X-List-Received-Date: Mon, 20 Jun 2011 21:18:47 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear OE-folks,

Working with lastest classic oe master and angstrom it seems udev caching is not 
working as expected. On *every* boot I get:

>Remounting root file system...
>Caching udev devnodes
>Populating dev cachemv: can't rename '/dev/shm/uname': No such file or directory

I don't know why this change came in but there was a change of storage location 
in Tom's commit few days ago [1]. To me it seems that

1. The files created by udev (init) get lost at remount so udev-cache (cache) is 
unable to find
2. Since this error occures not only at first boot the recipe's 
pkg_postinst_udev_append() seems never being executed. To check I added a simple 
echo 'foo text' 
in this function but 'foo text' is not found in log of first boot.

Suggestions welcome

Cheers

Andreas

[1] 
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=ca688dd2de58dbec865ac7e70fab4d2c373ad822


