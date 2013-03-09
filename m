Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UEQQx-0004yo-04
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Mar 2013 21:32:00 +0100
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 97634EA040;
	Sat,  9 Mar 2013 21:31:34 +0100 (CET)
Received: by localhost (Postfix, from userid 1000)
	id 005F4A42DD0; Sat,  9 Mar 2013 21:15:35 +0100 (CET)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Mar 2013 21:15:19 +0100
Message-Id: <cover.1362859975.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [2011.03-maintenance][PATCH v3 0/2] Pull request 20130309
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
X-List-Received-Date: Sat, 09 Mar 2013 20:32:10 -0000

Hello,

The patches that come as a follow-up of this message fix an issue
found while building muffinman-image on top of the 2011.03-maintenance
branch, and also add the capability to build a ubi image for the
ben-nanonote machine. This work is intended to be used as a basis for
porting the JLime distribution to oe-core.

These modifications were tested by successfully building
muffinman-image from scratch on a Debian Wheezy host.

Please pull into 2011.03-maintenance branch.

The following changes since commit ff679935b073a89c4e407d259bcc2eea9148fb91:

  opkg-utils: bump SRCREV to latest (2012-10-26 11:11:59 +0200)

are available in the git repository at:

  git://seketeli.fr/~apelete/oe.git muffinman-image-fix

Apelete Seketeli (2):
  gnutls: update SRC_URI
  jlime-2010.1: add capability to build ubi image for ben-nanonote
    machine

 conf/bitbake.conf               |    2 +-
 conf/distro/jlime-2010.1.conf   |    3 ++-
 conf/machine/ben-nanonote.conf  |   12 ++++++++++++
 recipes/gnutls/gnutls.inc       |    2 --
 recipes/gnutls/gnutls_2.10.4.bb |    7 ++++---
 5 files changed, 19 insertions(+), 7 deletions(-)

-- 
1.7.10.4



