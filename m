Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OZnS3-0001U5-Gi
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 18:07:56 +0200
Received: from [192.168.10.100] (95.232.142.62) by smtp209.alice.it
	(8.5.124.08) (authenticated as editempo)
	id 4C1A275901EFC33F for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 18:07:45 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jul 2010 18:07:42 +0200
Message-ID: <1279296462.8615.15.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 82.57.200.105
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [core] initscripts and keymap
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
X-List-Received-Date: Fri, 16 Jul 2010 16:07:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

hi,
in keymaps_1.0.bb:
there is:
RDEPENDS_${PN} = "initscripts console-tools"

which is an issue for the shr distribution.

shr uses initscripts-shr.

Pratically speaking it install initscripts instead of initscripts-shr in
shr-image,which result in having the /etc/init.d/devices which
is,according to mickeyl, an init script for devfs.
if this init script is present(with the corresponding rc links) it get
executed,which causes some devices nodes to lack.
which prevent sound,modem and maybe other driver from working on the
htcdream.

what's the best way to fix it?

mrmoku(which helped me) proposes(in #openmoko-cdevel):
<mrmoku> that should be fixed to be ${IMAGE_INITSCRIPTS} instead
probably
but we're not sure at all that it's the correct variable or solution.

Denis.




