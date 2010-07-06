Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OWDxN-0002HU-6e
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 21:37:46 +0200
Received: by fxm12 with SMTP id 12so5392348fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jul 2010 12:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=nFAj/0d9k+Z3EuXqbAkqbFZO907O6Guziqa4jjC/ero=;
	b=vQVz3RLOcw7PkO32jyjcIh5+HNgy3dOgJwBPlYYrRbdT7P+6KXW6JWyFcHHmMclEmI
	+YESOWvD4g0r5MNHvV7zc4UWa2e13cVqyOO16/+dGVpZEz46jQOVBtKa6EnIZQrAzmFz
	QKsQ+4dbf6VbFrL4ysv1GatryiKj5M6wbUrWQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=mEfxE2xNGWxeaN57LDtx5s5ENYy5+9NjkCK3/Slyq9TdkvkzKOefBvne5yodIhMjrB
	HI/GFXUHtGOW4xSnvBjbQRppuFbG7Zrr1DRB/LCHs2kP7uM9slV/0NahwhnlMMw305eK
	kBpzYi8sE3ZyKJNEijnZVpROmJ+QvXwmOEwW4=
Received: by 10.86.80.9 with SMTP id d9mr4226134fgb.70.1278444755190;
	Tue, 06 Jul 2010 12:32:35 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id 11sm198553fas.0.2010.07.06.12.32.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 06 Jul 2010 12:32:34 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OWDsX-0001J5-5e; Tue, 06 Jul 2010 21:32:25 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Phil Blundell <philb@gnu.org>
Date: Tue,  6 Jul 2010 21:32:19 +0200
Message-Id: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH][v3 0/4] honour {MACHINE, DISTRO}_FEATURES for configuration
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
X-List-Received-Date: Tue, 06 Jul 2010 19:37:54 -0000

Hi,

These 4 patches configure busybox and uClibc according to
{MACHINE,DISTRO}_FEATURES. The kernel configury needs the same treatment (so
we can ommit e.g. ipv4 or ipv6 or any networking depending on the FEATURES
that are requested).

A follow-up patch could further improve to take combined-features into account
or add more fine-grained setup (mmu/nommu, float handling variants etc, etc).
Another possible follow-up patch would get rid of 0 byte sized dummy files
that were sprinkled all over the place to accomodate suboptimal configury
handling.

This is a first step towards better configuration WRT available MACHINE
features and/or desirable DISTRO features and is ment as a general improvement
with more opportunities to come.

Since i do not have write-access to oe, i'm asking for ACKs and kindly
ask whoever sees fit to apply this small batch.
Many TIA && cheers,
Bernhard


Bernhard Reutner-Fischer (4):
  busybox: configure according to {MACHINE,DISTRO}_FEATURES
  busybox: picking IPv6 per default is not up to the package
  uClibc: redo configuration
  uclibc: add 0.9.31

 conf/distro/include/sane-toolchain-uclibc.inc      |    7 +
 conf/distro/include/sane-toolchain.inc             |    3 +-
 conf/distro/include/uclibc.inc                     |    8 +
 recipes/busybox/busybox-1.15.3/micro/defconfig     |    2 +-
 recipes/busybox/busybox-config.inc                 |   28 +++
 recipes/busybox/busybox.inc                        |   37 +++
 recipes/uclibc/bfin-uclibc_svn.bb                  |    2 +-
 recipes/uclibc/uclibc-0.9.31/a780/uClibc.machine   |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/akita/uClibc.machine  |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/arm/uClibc.machine    |   69 ++++++
 recipes/uclibc/uclibc-0.9.31/armeb/uClibc.machine  |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/armv4t/uClibc.machine |   69 ++++++
 .../uclibc/uclibc-0.9.31/armv5te/uClibc.machine    |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/armv6/uClibc.machine  |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/armv7a/uClibc.machine |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/avr32/uClibc.machine  |   54 +++++
 recipes/uclibc/uclibc-0.9.31/bfin/uClibc.machine   |  192 +++++++++++++++
 recipes/uclibc/uclibc-0.9.31/c7x0/uClibc.machine   |   70 ++++++
 .../uclibc/uclibc-0.9.31/cm-x270/uClibc.machine    |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/collie/uClibc.machine |   70 ++++++
 .../uclibc/uclibc-0.9.31/dht-walnut/uClibc.machine |   54 +++++
 recipes/uclibc/uclibc-0.9.31/efika/uClibc.machine  |   53 +++++
 recipes/uclibc/uclibc-0.9.31/ep93xx/uClibc.machine |   69 ++++++
 .../uclibc-0.9.31/gumstix-connex/uClibc.machine    |   70 ++++++
 .../uclibc-0.9.31/gumstix-verdex/uClibc.machine    |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/h2200/uClibc.machine  |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/h3600/uClibc.machine  |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/h3800/uClibc.machine  |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/h3900/uClibc.machine  |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/h4000/uClibc.machine  |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/h5000/uClibc.machine  |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/hx4700/uClibc.machine |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/iwmmxt/uClibc.machine |   70 ++++++
 .../uclibc/uclibc-0.9.31/ixp4xxbe/uClibc.machine   |   70 ++++++
 .../uclibc/uclibc-0.9.31/kilauea/uClibc.machine    |   55 +++++
 recipes/uclibc/uclibc-0.9.31/mipsel/uClibc.machine |   63 +++++
 .../uclibc-0.9.31/mpc8313e-rdb/uClibc.machine      |   53 +++++
 .../uclibc-0.9.31/mpc8315e-rdb/uClibc.machine      |   53 +++++
 .../uclibc-0.9.31/mpc8323e-rdb/uClibc.machine      |   54 +++++
 recipes/uclibc/uclibc-0.9.31/n1200/uClibc.machine  |   53 +++++
 .../uclibc/uclibc-0.9.31/om-gta01/uClibc.machine   |   69 ++++++
 recipes/uclibc/uclibc-0.9.31/palmld/uClibc.machine |   70 ++++++
 .../uclibc/uclibc-0.9.31/palmz31/uClibc.machine    |   70 ++++++
 .../uclibc/uclibc-0.9.31/palmz72/uClibc.machine    |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/poodle/uClibc.machine |   70 ++++++
 .../uclibc/uclibc-0.9.31/qemumips/uClibc.machine   |   63 +++++
 .../uclibc/uclibc-0.9.31/qemux86/uClibc.machine    |   68 ++++++
 .../uclibc/uclibc-0.9.31/sequoia/uClibc.machine    |   53 +++++
 recipes/uclibc/uclibc-0.9.31/simpad/uClibc.machine |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/spitz/uClibc.machine  |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/titan/uClibc.machine  |   52 ++++
 recipes/uclibc/uclibc-0.9.31/uClibc.distro         |  150 ++++++++++++
 recipes/uclibc/uclibc-0.9.31/uClibc.machine.armv4t |   69 ++++++
 .../uclibc/uclibc-0.9.31/uClibc.machine.armv5te    |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/uClibc.machine.iwmmxt |   70 ++++++
 .../uclibc/uclibc-0.9.31/uClibc.machine.strongarm  |   70 ++++++
 recipes/uclibc/uclibc-0.9.31/wrap/uClibc.machine   |   73 ++++++
 recipes/uclibc/uclibc-0.9.31/x86/uClibc.machine    |   72 ++++++
 recipes/uclibc/uclibc-config.inc                   |  111 +++++++++
 recipes/uclibc/uclibc-initial_0.9.30.2.bb          |   12 +-
 recipes/uclibc/uclibc-initial_0.9.30.bb            |    5 +-
 recipes/uclibc/uclibc-initial_0.9.31.bb            |   26 ++
 recipes/uclibc/uclibc-initial_git.bb               |    6 +-
 recipes/uclibc/uclibc-old.inc                      |  186 +++++++++++++++
 recipes/uclibc/uclibc.inc                          |  247 ++++++++++----------
 recipes/uclibc/uclibc_0.9.28.bb                    |    2 +-
 recipes/uclibc/uclibc_0.9.29.bb                    |    2 +-
 recipes/uclibc/uclibc_0.9.30.1.bb                  |    2 +-
 recipes/uclibc/uclibc_0.9.30.bb                    |    2 +-
 recipes/uclibc/uclibc_0.9.31.bb                    |   30 +++
 recipes/uclibc/uclibc_git.bb                       |    1 -
 71 files changed, 4159 insertions(+), 150 deletions(-)
 create mode 100644 recipes/busybox/busybox-config.inc
 create mode 100644 recipes/uclibc/uclibc-0.9.31/a780/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/akita/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/arm/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/armeb/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/armv4t/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/armv5te/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/armv6/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/armv7a/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/avr32/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/bfin/uClibc.config
 create mode 100644 recipes/uclibc/uclibc-0.9.31/bfin/uClibc.distro
 create mode 100644 recipes/uclibc/uclibc-0.9.31/bfin/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/c7x0/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/cm-x270/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/collie/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/dht-walnut/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/efika/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/ep93xx/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/gumstix-connex/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/gumstix-verdex/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/h2200/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/h3600/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/h3800/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/h3900/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/h4000/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/h5000/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/hx4700/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/iwmmxt/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/ixp4xxbe/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/kilauea/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/mipsel/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/mpc8313e-rdb/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/mpc8315e-rdb/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/mpc8323e-rdb/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/n1200/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/om-gta01/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/palmld/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/palmz31/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/palmz72/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/poodle/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/qemumips/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/qemux86/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/sequoia/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/simpad/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/spitz/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/titan/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/uClibc.config
 create mode 100644 recipes/uclibc/uclibc-0.9.31/uClibc.distro
 create mode 100644 recipes/uclibc/uclibc-0.9.31/uClibc.machine.armv4t
 create mode 100644 recipes/uclibc/uclibc-0.9.31/uClibc.machine.armv5te
 create mode 100644 recipes/uclibc/uclibc-0.9.31/uClibc.machine.iwmmxt
 create mode 100644 recipes/uclibc/uclibc-0.9.31/uClibc.machine.strongarm
 create mode 100644 recipes/uclibc/uclibc-0.9.31/wrap/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-0.9.31/x86/uClibc.machine
 create mode 100644 recipes/uclibc/uclibc-config.inc
 create mode 100644 recipes/uclibc/uclibc-initial_0.9.31.bb
 create mode 100644 recipes/uclibc/uclibc-old.inc
 create mode 100644 recipes/uclibc/uclibc_0.9.31.bb



