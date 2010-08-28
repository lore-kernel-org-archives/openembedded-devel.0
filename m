Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OpRlb-0006ue-9A
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:12:45 +0200
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 53264D1AFE9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 22:06:59 +0200 (CEST)
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id A48E94B004D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 22:06:54 +0200 (CEST)
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 22:06:36 +0200
Message-Id: <1283025996-28435-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1283025996-28435-1-git-send-email-eric@eukrea.com>
References: <4C776F96.2000307@eukrea.com>
	<1283025996-28435-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.10
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] sdk.bbclass: allow virtclass-sdk override
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
X-List-Received-Date: Sat, 28 Aug 2010 20:12:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 classes/sdk.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/classes/sdk.bbclass b/classes/sdk.bbclass
index 198d147..c8fa076 100644
--- a/classes/sdk.bbclass
+++ b/classes/sdk.bbclass
@@ -66,3 +66,5 @@ FILES_${PN}-dbg +=3D "${prefix}/.debug \
                    "
=20
 export PKG_CONFIG_SYSROOT_DIR =3D "${STAGING_DIR_HOST}"
+
+OVERRIDES .=3D ":virtclass-sdk"
--=20
1.6.3.3



