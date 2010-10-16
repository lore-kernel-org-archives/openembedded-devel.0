Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P72T8-0000wm-BW
	for openembedded-devel@openembedded.org; Sat, 16 Oct 2010 10:50:23 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 3E45F1D3616D;
	Sat, 16 Oct 2010 10:49:51 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Oct 2010 10:49:48 +0200
Message-Id: <1287218988-3946-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] oestats-client.bbclass: send USERDISTRO value
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
X-List-Received-Date: Sat, 16 Oct 2010 08:50:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

With this patch it's now possible to see the correct Angstrom distro vers=
ion
in the Tinderbox. Now the distribution value is always 'angstrom', with t=
his
patch it would be more detailed version 'angstrom-2008.1' for example.

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 classes/oestats-client.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/oestats-client.bbclass b/classes/oestats-client.bbcl=
ass
index 4415461..a98c9d1 100644
--- a/classes/oestats-client.bbclass
+++ b/classes/oestats-client.bbclass
@@ -77,7 +77,7 @@ def oestats_start(server, builder, d):
 			'metadata_branch': bb.data.getVar('METADATA_BRANCH', d, True),
 			'metadata_revision': bb.data.getVar('METADATA_REVISION', d, True),
 			'machine': bb.data.getVar('MACHINE', d, True),
-			'distro': bb.data.getVar('DISTRO', d, True),
+			'distro': bb.data.getVar('USERDISTRO', d, True),
 		})
 		if re.match("^\d+$", data): id=3Ddata
 	except:
--=20
1.7.0.4



