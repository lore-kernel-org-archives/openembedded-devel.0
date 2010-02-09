Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NeeEx-0005UU-K7
	for openembedded-devel@openembedded.org; Tue, 09 Feb 2010 01:46:10 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 4BC721D360EC;
	Tue,  9 Feb 2010 01:43:37 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Feb 2010 01:43:32 +0100
Message-Id: <1265676216-9722-3-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1265676216-9722-2-git-send-email-ynezz@true.cz>
References: <1265676216-9722-1-git-send-email-ynezz@true.cz>
	<1265676216-9722-2-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux 2.6.24: moving ts72xx to 2.6.27 as default kernel so change DEFAULT_PREFERENCE
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
X-List-Received-Date: Tue, 09 Feb 2010 00:46:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/linux/linux_2.6.24.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux_2.6.24.bb b/recipes/linux/linux_2.6.24.b=
b
index 31a8a04..9aca4c7 100644
--- a/recipes/linux/linux_2.6.24.bb
+++ b/recipes/linux/linux_2.6.24.bb
@@ -7,12 +7,12 @@ DEFAULT_PREFERENCE_mpc8313e-rdb =3D "1"
 DEFAULT_PREFERENCE_simpad =3D "1"
 DEFAULT_PREFERENCE_atngw100 =3D "1"
 DEFAULT_PREFERENCE_at32stk1000 =3D "1"
-DEFAULT_PREFERENCE_ts72xx =3D "1"
+DEFAULT_PREFERENCE_ts72xx =3D "-1"
 DEFAULT_PREFERENCE_hipox =3D "1"
 DEFAULT_PREFERENCE_cs-e9302 =3D "1"
 DEFAULT_PREFERENCE_smartq5 =3D "1"
=20
-PR =3D "r34"
+PR =3D "r35"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.24.tar.=
bz2 \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.7.bz2;p=
atch=3D1 \
--=20
1.6.0.4



