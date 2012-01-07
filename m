Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RjMfP-0001Ao-IL
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 04:09:59 +0100
Received: (qmail invoked by alias); 07 Jan 2012 03:02:32 -0000
Received: from p5B0A1340.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.19.64]
	by mail.gmx.net (mp019) with SMTP; 07 Jan 2012 04:02:32 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+ev7cFR46e8yblCM31CmMT4+aSQlDHYh0F4M8AVG
	UQA1+PcJ1YssAq
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 7 Jan 2012 04:03:39 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201201070403.39356.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Howto break circular dependencies for gvfs / gnome-disk-utility / nautilus
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
X-List-Received-Date: Sat, 07 Jan 2012 03:09:59 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

I have tested by manual rebuilding/installation: To make thunar-volman properly 
mount removable devices, gvfs-gdu-volume-monitor ( gdu = gnome-disk-utility ) is 
required. For a build from scratch gvfs configure disables this because it can 
not find gnome-disk-utility. As mentioned in a comment of gvfs recipe, gnome-
disk-utility can not be added to DEPENDS because of circular dependencies:

nautillus depends gvfs
gvfs depends gnome-disk-utility
gnome-disk-utility depends nautilus

The only possible solution for this I see right now is to add a dummy build: 
E.g: Within gvfs-recipe before configuring gnome-disk-utilty is configured / 
compiled and installed. After install all stuff from gnome-disk-utilty is removed 
and gnome-disk-utilty is only made RDEPENDS. Since this is a very dirty hack 
which causes extra maintenance when gnome-disk-utilty version changes:

Does anybody have a better solution to break the circular dependency without 
causing plugins/libs missing?

All suggestions welcome :)

Andreas


