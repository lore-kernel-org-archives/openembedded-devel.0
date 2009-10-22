Received: from [74.125.78.145] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N0riy-0002bq-4a
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 09:04:43 +0200
Received: by ey-out-1920.google.com with SMTP id 26so38861eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2009 00:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=mZxFLU3bpLw8GH0mmRJ6kGslP2tClF/RPfyigExZZ1g=;
	b=OYwDCTgtH5n69WH/EvT5O+76nW2Ow8XB3lfX8yxZJXn2H6vwYStyPC6ThaYYZvRLFr
	dE0JM9f7Kr86HS0E1GPvY1vITRgwG8Hy0QnX66j/XCRkVjoFTAioZtbY8KW5ohSqPCi/
	GYlp3zz2wfmGee9grCgEr5GagwK5dy3CI7Kl8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Amnt5VGZlOb+t3DYNTcQbL9bFFF3Vj+XddyxOhPwbdC8v6WrJ/XmuCBp6VxeYiHQ83
	npZnL3XfXII2oIkmU8LsbS7uBrAA/ykc9+EUehX2LVLU7Ks7Mgow+w6xXuzVHhwQH9vq
	SIfyAviMUgmn+G4c5jZbwolkiHa0cswDO3cIc=
Received: by 10.216.85.194 with SMTP id u44mr3074065wee.65.1256195020092;
	Thu, 22 Oct 2009 00:03:40 -0700 (PDT)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x6sm2175682gvf.1.2009.10.22.00.03.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 22 Oct 2009 00:03:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2009 00:03:31 -0700
Message-Id: <1256195011-30524-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 74.125.78.145
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] serial-forward.bb: Fix missing GNU_HASH QA Error.
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
X-List-Received-Date: Thu, 22 Oct 2009 07:04:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/serial-utils/serial-forward.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/serial-utils/serial-forward.bb b/recipes/serial-utils/serial-forward.bb
index f5c1b17..b03fc59 100644
--- a/recipes/serial-utils/serial-forward.bb
+++ b/recipes/serial-utils/serial-forward.bb
@@ -3,11 +3,11 @@ AUTHOR = "Holger 'Zecke' Freyther'"
 LICENSE = "GPL"
 SECTION = "console/devel"
 PV = "1.0.1+gitr${SRCREV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia.git/;protocol=git"
 S = "${WORKDIR}/git/tools/serial_forward"
-
+EXTRA_OEMAKE = "CC="${CC} ${LDFLAGS}""
 do_compile() {
     cd ${S}
     oe_runmake
-- 
1.6.3.3



