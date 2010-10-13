Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P69Wj-0000kZ-0i
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 00:10:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 004BC3149DCD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 00:09:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 7dxdj0pBfso4; Thu, 14 Oct 2010 00:09:52 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id D36013149D3C;
	Thu, 14 Oct 2010 00:09:51 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 13 Oct 2010 22:09:51 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Oct 2010 22:09:41 +0000
Message-Id: <1287007782-1554-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Patches from opendreambox.org #2
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
X-List-Received-Date: Wed, 13 Oct 2010 22:10:26 -0000

Hello developers,

I'm sending an updated patch to fix a conflict with today's
master branch.

It would be nice to receive some more comments on this patch
and on the patches I sent earlier. I've created a bundle in
patchwork which includes all pending patches by the opendreambox
project:

http://patchwork.openembedded.org/bundle/obi/opendreambox/

Those patches are also available from a git repository which
gets rebased from time to time:

http://git.opendreambox.org/?p=obi/openembedded.git;a=shortlog;h=refs/heads/for-upstream

All patches were ported from the opendreambox distribution to
OE's master. They were tested on 32-bit mipsel machines. However,
runtime tests were only done with a slightly older version of OE.

Ultimately, I'd like to merge our distribution into master. To
accomplish that, I'm submitting those patches first, that don't
depend on any distribution or machine.

Speaking of that, our distribution currently contains quite some
lines like this (from gst-plugins.inc)

EXTRA_OECONF_append_opendreambox = "--disable-x"

or patches like this (from dbus.inc):

-DEPENDS = "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"
+DEPENDS = "expat glib-2.0 virtual/libintl"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'no-x11', '', 'libsm libice virtual/libx11', d)}"

I believe that no-x11 doesn't sound like a nice feature, so it
should better be inversed to read x11. This, however, would
require to specify this feature in every distribution supporting
x11. Will such a change possibly get accepted? Can a feature get
enabled by default but disabled selectively by a distribution?

Does the majority of distributions run with or without support
for X11?

Regards,
Andreas

Andreas Oberritter (1):
  module.bbclass: fix dependency on specific kernel

 classes/module.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



