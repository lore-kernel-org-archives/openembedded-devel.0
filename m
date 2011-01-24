Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PhNjj-0003Uz-88
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 15:49:43 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtIFAGcgPU1bdWOb/2dsb2JhbACEE5I4jxCrGoM7AYxygSSDOHQEiyA
X-IronPort-AV: E=Sophos;i="4.60,370,1291590000"; d="scan'208";a="800176466"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 24 Jan 2011 15:48:59 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PhNj1-0006W0-Kx
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 15:48:59 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PhNj1-0007ln-Eg
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 15:48:59 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PhNj1-0006L6-4G
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 15:48:59 +0100
From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
	<vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 15:48:57 +0100
Message-Id: <cover.1295880053.git.vjaquez@igalia.com>
X-Mailer: git-send-email 1.7.0.2
MIME-Version: 1.0
Subject: [PATCH 0/2] fixes for binutils 2.21
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
X-List-Received-Date: Mon, 24 Jan 2011 14:49:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These patches focus the same problem: with the binutils upgrade to
2.21 it is required specify the +sec to the march parameter.

The kernel patch is just grabbed from the ubuntu's repository. For the
u-boot I just came up with a translation of those patches.

vmjl

Víctor Manuel Jáquez Leal (2):
  u-boot-sakoman: fix break caused by the new binutils
  linux-omap4: fix break caused by the new binutils

 ...TU-Config-Fix-FTBS-caused-by-new-binutils.patch |   38 ++++++++++++++++++++
 ...0002-Add-AFLAGS-for-sleep44xx-to-fix-FTBS.patch |   26 +++++++++++++
 recipes/linux/linux-omap4_2.6.35.3.bb              |    2 +
 .../fix-break-caused-by-new-binutils.patch         |   31 ++++++++++++++++
 recipes/u-boot/u-boot-sakoman_git.bb               |    1 +
 5 files changed, 98 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-omap4/0001-UBUNTU-Config-Fix-FTBS-caused-by-new-binutils.patch
 create mode 100644 recipes/linux/linux-omap4/0002-Add-AFLAGS-for-sleep44xx-to-fix-FTBS.patch
 create mode 100644 recipes/u-boot/u-boot-sakoman/fix-break-caused-by-new-binutils.patch



