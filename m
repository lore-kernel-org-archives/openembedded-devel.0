Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P2NNk-0002QX-5W
	for openembedded-devel@openembedded.org; Sun, 03 Oct 2010 14:09:32 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 6086C1D363F9;
	Sun,  3 Oct 2010 14:02:04 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Oct 2010 14:01:58 +0200
Message-Id: <1286107318-10285-4-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1286107318-10285-1-git-send-email-ynezz@true.cz>
References: <1286107318-10285-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] linux-2.6.27: don't use as default kernel for ts72xx
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
X-List-Received-Date: Sun, 03 Oct 2010 12:09:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/linux/linux_2.6.27.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/linux/linux_2.6.27.bb b/recipes/linux/linux_2.6.27.b=
b
index 7014958..fdcd8b7 100644
--- a/recipes/linux/linux_2.6.27.bb
+++ b/recipes/linux/linux_2.6.27.bb
@@ -7,7 +7,7 @@ DEFAULT_PREFERENCE =3D "-1"
 DEFAULT_PREFERENCE_boc01 =3D "1"
 DEFAULT_PREFERENCE_progear =3D "1"
 DEFAULT_PREFERENCE_simpad =3D "-1"
-DEFAULT_PREFERENCE_ts72xx =3D "1"
+DEFAULT_PREFERENCE_ts72xx =3D "-1"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2;name=3Dkernel \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.45.bz2;=
apply=3Dyes;name=3Dstablepatch \
--=20
1.7.0.4



