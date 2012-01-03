Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Ri5em-0001EC-9G
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Jan 2012 15:48:04 +0100
Received: (qmail invoked by alias); 03 Jan 2012 14:40:43 -0000
Received: from p5B0A12EF.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.18.239]
	by mail.gmx.net (mp062) with SMTP; 03 Jan 2012 15:40:43 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+yDcY/hnaywcla6UrzS5bpiEgH6rka7bM9P703N6
	NMJnOBxwnbSvtA
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jan 2012 15:41:47 +0100
Message-Id: <1325601709-13917-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 0/2] cleanup gettext for meta-xfce
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
X-List-Received-Date: Tue, 03 Jan 2012 14:48:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Up to now gettext was not properly included to meta-xfce. The issue came up
when building from scratch and receiving the following error for ristretto:

| util.c: In function 'rstto_launch_help':
| util.c:36:35: error: 'LC_MESSAGES' undeclared (first use in this function)
| util.c:36:35: note: each undeclared identifier is reported only once for each function it appears in
| make[3]: *** [ristretto-util.o] Error 1
| make[3]: Leaving directory `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/ristretto-0.3.0-r0/ristretto-0.3.0/src'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/ristretto-0.3.0-r0/ristretto-0.3.0/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/ristretto-0.3.0-r0/ristretto-0.3.0'
| make: *** [all] Error 2
| + die 'oe_runmake failed'

Andreas Müller (2):
  xfce.bbclass: inherit gettext
  libxfce4ui: remove gettext from DEPENDS since xfce.bbclass takes care

 meta-xfce/classes/xfce.bbclass                     |    2 +-
 .../recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.4.4



