Received: from mail-yh0-f42.google.com ([209.85.213.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UE2Y8-0001Px-Hv
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Mar 2013 20:01:48 +0100
Received: by mail-yh0-f42.google.com with SMTP id w49so314532yhw.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Mar 2013 10:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=vAz9DqZvAgmz+BWIXxerbMK8CJiKaQSIvdviSHOA5HE=;
	b=e38D5xzkiQhjP+2VgIyiUc5O6bZJViIm4fm4ovgQCDl8GbYzJ8S6lyWE8NPh6p3FDd
	9jCRRjrSK4N6RIklmiQaUU655JQrX0bFQkpH2wHMneIAaa98s2gCYhb3aQKS7abHInbr
	eLgN4Dk47fCdaR0bqHhWnA5O3g4Tdu8re6MpqBbSre3Yb8+6Rucv5Z9ppuC63zpi/w12
	GItiCx9iyelz0IT0LPMpJK4fykAauHrjnBUpms2Ip5YdCWxPhFF6VJG2xYuUr+tYX80K
	MZepZMFQ6iBa5vIKKHF3sFbzsvDVsC18Cgh2t3k75uReRuNTCq8p4NaKfeF/aZdxbtO+
	MojA==
X-Received: by 10.236.115.66 with SMTP id d42mr2576652yhh.156.1362768313087;
	Fri, 08 Mar 2013 10:45:13 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id e8sm9259201yhh.16.2013.03.08.10.45.10
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Mar 2013 10:45:12 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  8 Mar 2013 15:50:37 -0300
Message-Id: <1362768637-29343-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] polkit: Remove authentication override as it is handled in OE-Core
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
X-List-Received-Date: Fri, 08 Mar 2013 19:01:49 -0000

OE-Core now handles the detection of authentication so we don't need
to do it here. The bbappend file is kept to provide the upgrade path
only, or the revision would go backwards.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-extended/polkit/polkit_0.104.bbappend | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
index ea82e37..ceb2b6b 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
+++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
@@ -1,8 +1 @@
-PRINC := "${@int(PRINC) + 4}"
-
-POLKITAUTH ??= "consolekit"
-
-PACKAGECONFIG += "${POLKITAUTH}"
-PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
-# there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to RDEPENDS
-PACKAGECONFIG[consolekit] = ",,,consolekit"
+PRINC := "${@int(PRINC) + 5}"
-- 
1.8.1



