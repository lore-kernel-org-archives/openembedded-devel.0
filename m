Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@true.cz>) id 1PtODS-0006fO-ET
	for openembedded-devel@openembedded.org; Sat, 26 Feb 2011 18:46:02 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id A87811D360AA;
	Sat, 26 Feb 2011 18:44:13 +0100 (CET)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Date: Sat, 26 Feb 2011 18:44:14 +0100
Message-Id: <1298742255-23389-2-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1298742255-23389-1-git-send-email-ynezz@true.cz>
References: <1298742255-23389-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
Subject: [PATCH] minimal-uclibc: add xattr to distro features to fix build failure of libcap2
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
X-List-Received-Date: Sat, 26 Feb 2011 17:46:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

cap_file.c:8:23: fatal error: sys/xattr.h: No such file or directory

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 conf/distro/minimal-uclibc.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/minimal-uclibc.conf b/conf/distro/minimal-uclibc=
.conf
index bc9615b..ca4253a 100644
--- a/conf/distro/minimal-uclibc.conf
+++ b/conf/distro/minimal-uclibc.conf
@@ -35,7 +35,7 @@ require conf/distro/minimal.conf
 # FEATURE SELECTION
 ########################################################################=
#####
 # We want images supporting the following features (for task-base)
-DISTRO_FEATURES =3D "nfs smbfs wifi ppp alsa ext2 vfat pcmcia usbgadget =
usbhost pci"
+DISTRO_FEATURES =3D "nfs smbfs wifi ppp alsa ext2 vfat pcmcia usbgadget =
usbhost pci xattr"
 # Following feature is for ARM and E500 based machines
 DISTRO_FEATURES +=3D "eabi"
 # pam is needed on uclibc if using shadow=20
--=20
1.7.0.4



