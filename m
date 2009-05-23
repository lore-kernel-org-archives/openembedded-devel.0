Received: from [83.222.19.8] (helo=mail.asoft.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1M7y3j-0004B3-Hr
	for openembedded-devel@openembedded.org; Sat, 23 May 2009 22:43:11 +0200
Received: from localhost.localdomain ([62.205.175.245]) (authenticated bits=0)
	by mail.asoft.ru (8.13.4/8.13.4) with ESMTP id n4NKZK4p015936
	for <openembedded-devel@openembedded.org>;
	Sun, 24 May 2009 00:35:21 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@openembedded.org
Date: Sun, 24 May 2009 00:35:14 +0400
Message-Id: <1243110920-18111-1-git-send-email-mad_soft@inbox.ru>
X-Mailer: git-send-email 1.6.0.6
X-Greylist: Sender succeeded SMTP AUTH authentication, not delayed by
	milter-greylist-2.0.2 (mail.asoft.ru [0.0.0.0]);
	Sun, 24 May 2009 00:35:22 +0400 (MSD)
Subject: [PATCH] Netsurf browser 2.1
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
X-List-Received-Date: Sat, 23 May 2009 20:43:12 -0000

Today (well, yesterday) Netsurf 2.1 has been released, so I guess it's the
right time to submit this work for review. Recipes were tested for
compilation with Angstrom distro and then compiled netsurf 2.1
binary was tested on hx4700 (previous version 2.0 was tested also on
h2200 - although usage on QVGA have some problems, it's not impossible)

Here's obligatory screenshots:
http://mad.is-a-geek.org/netsurf/

Dmitry Artamonow (6):
  checksums.ini: add checksums for netsurf-2.1 and related libs
  libnsbmp: add recipe for version 0.0.1
  libnsgif: add recipe for version 0.0.1
  libparserutils: add recipe for version 0.0.1
  hubbub: add recipe for version 0.0.1
  netsurf: add recipe for version 2.1

 conf/checksums.ini                             |   20 +++++++
 recipes/netsurf/hubbub_0.0.1.bb                |   28 ++++++++++
 recipes/netsurf/libnsbmp_0.0.1.bb              |   24 +++++++++
 recipes/netsurf/libnsgif_0.0.1.bb              |   24 +++++++++
 recipes/netsurf/libparserutils_0.0.1.bb        |   36 +++++++++++++
 recipes/netsurf/netsurf-2.1/Makefile.config    |    9 +++
 recipes/netsurf/netsurf-2.1/debugxml_fix.patch |   64 ++++++++++++++++++++++++
 recipes/netsurf/netsurf-2.1/fix_makefile.patch |   12 +++++
 recipes/netsurf/netsurf-2.1/netsurf.desktop    |   10 ++++
 recipes/netsurf/netsurf-2.1/netsurf.png        |  Bin 0 -> 9329 bytes
 recipes/netsurf/netsurf_2.1.bb                 |   32 ++++++++++++
 11 files changed, 259 insertions(+), 0 deletions(-)
 create mode 100644 recipes/netsurf/hubbub_0.0.1.bb
 create mode 100644 recipes/netsurf/libnsbmp_0.0.1.bb
 create mode 100644 recipes/netsurf/libnsgif_0.0.1.bb
 create mode 100644 recipes/netsurf/libparserutils_0.0.1.bb
 create mode 100644 recipes/netsurf/netsurf-2.1/Makefile.config
 create mode 100644 recipes/netsurf/netsurf-2.1/debugxml_fix.patch
 create mode 100644 recipes/netsurf/netsurf-2.1/fix_makefile.patch
 create mode 100644 recipes/netsurf/netsurf-2.1/netsurf.desktop
 create mode 100644 recipes/netsurf/netsurf-2.1/netsurf.png
 create mode 100644 recipes/netsurf/netsurf_2.1.bb



