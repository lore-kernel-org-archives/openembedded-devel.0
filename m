Received: from [209.85.219.212] (helo=mail-ew0-f212.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MZO5W-0004oN-ML
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Aug 2009 13:58:22 +0200
Received: by ewy8 with SMTP id 8so983085ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Aug 2009 04:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=qxSZ/3wGcbXWD3J5bYkAgsRa2vc6kLSExf55E1nmzSA=;
	b=prr7KTlnxueN6GpnKxYvXlWUYp6dhJWvylZqLUIiLWIC2HMQoK/OC50DAJ3nVrdATz
	0jPeV06SRFU47xa5teqoD5I1rXGy4+POqm9xowKwjJT/uT0aeMeetyTAsH7aCNac/gOE
	9bdN9q+1sZXfpi0leVEbGMf9sgzc+oja9W8m8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=h8zbh78MMOBjgsFgel+ODFpPM+CIv72gcF34FJYFPsVdMkvZ4AVh74PIZiB1cG0Rlq
	eU7Vdo/Tm2IXcVMOe10jy83Ubjt0JdC65Y4vsrNtqTaA0DB4sUoR4qDKyFTWML/PH0nA
	5yeVri1WaiqoDmiphuIt68L0ctkaMExVQOCPA=
Received: by 10.210.68.17 with SMTP id q17mr1276560eba.58.1249645348873;
	Fri, 07 Aug 2009 04:42:28 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 10sm2616109eyd.27.2009.08.07.04.42.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 07 Aug 2009 04:42:28 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Aug 2009 14:42:00 +0300
Message-Id: <1249645320-4423-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] Added rcc (resource compiler) utility setup for QTE toolchain environment.
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
X-List-Received-Date: Fri, 07 Aug 2009 11:58:22 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/meta/meta-toolchain-qte.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/meta/meta-toolchain-qte.bb b/recipes/meta/meta-toolchain-qte.bb
index 70c4087..699f053 100644
--- a/recipes/meta/meta-toolchain-qte.bb
+++ b/recipes/meta/meta-toolchain-qte.bb
@@ -19,6 +19,7 @@ do_populate_sdk_append() {
        echo 'export OE_QMAKE_INCDIR_QT=${prefix}/${TARGET_SYS}/${layout_includedir}/${QT_DIR_NAME}' >> $script
        echo 'export OE_QMAKE_MOC=${prefix}/${layout_bindir}/moc4' >> $script
        echo 'export OE_QMAKE_UIC=${prefix}/${layout_bindir}/uic4' >> $script
+       echo 'export OE_QMAKE_RCC=${prefix}/${layout_bindir}/rcc4' >> $script
 
        # Repack SDK with new environment-setup
        cd ${SDK_OUTPUT}
-- 
1.6.3.3



