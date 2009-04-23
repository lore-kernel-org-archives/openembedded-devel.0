Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LwneK-0001MZ-Nd
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 03:22:48 +0200
Received: by qw-out-1920.google.com with SMTP id 9so285072qwj.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 18:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=zj+7Z+Sjbv44JI3mAj//wrOyl21BBjd1820HgT6HQAM=;
	b=ZNovCJmwyjq4pJ6KLM23fQchqbILYVUxdN8fGR4htBLFQNllDR5WBitnKUW3yzkySj
	LD8fMIz4e3dC4hTRgnPLsnW6iJPABlGIqaI/jEc9+13j3W2Jkzqro/nYSJhzv/bsc2KT
	yuTztgGlZBzb73x1T5aAat/z2Gzda2MC8DR4o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=UCsuj9NaXDFYw+g6e2fcHrMFZlO2tifymuWThyjv7mlcH1WxpGk4ubSi16i5ZAVmNF
	h6rKQT7pet4WXgExaQRJUzOllp39dzDiQxlMVF+9q0UrxV1R571l2zhgU5f5AVoJa/Ar
	WYIpbeMY5sOyEOQh6hXyWposnsxIF3SsZ4LdE=
Received: by 10.220.91.148 with SMTP id n20mr849056vcm.68.1240449493921;
	Wed, 22 Apr 2009 18:18:13 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 5sm1775826ywl.42.2009.04.22.18.18.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 22 Apr 2009 18:18:13 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 9D714610081; Wed, 22 Apr 2009 22:17:54 -0300 (BRT)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 22:17:40 -0300
Message-Id: <1240449461-26116-6-git-send-email-otavio@debian.org>
X-Mailer: git-send-email 1.6.2.1.303.g63699
In-Reply-To: <1240449461-26116-5-git-send-email-otavio@debian.org>
References: <1240449461-26116-1-git-send-email-otavio@debian.org>
	<1240449461-26116-2-git-send-email-otavio@debian.org>
	<1240449461-26116-3-git-send-email-otavio@debian.org>
	<1240449461-26116-4-git-send-email-otavio@debian.org>
	<1240449461-26116-5-git-send-email-otavio@debian.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 5/6] qmake2.bbclass: add OE_QMAKE_QDBUSXML2CPP var
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
X-List-Received-Date: Thu, 23 Apr 2009 01:22:49 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@debian.org>
---
 classes/qmake2.bbclass       |    1 +
 recipes/qt4/files/linux.conf |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/classes/qmake2.bbclass b/classes/qmake2.bbclass
index f0a7931..cbc71d1 100644
--- a/classes/qmake2.bbclass
+++ b/classes/qmake2.bbclass
@@ -10,6 +10,7 @@ export OE_QMAKE_UIC = "${STAGING_BINDIR_NATIVE}/uic4"
 export OE_QMAKE_UIC3 = "${STAGING_BINDIR_NATIVE}/uic34"
 export OE_QMAKE_MOC = "${STAGING_BINDIR_NATIVE}/moc4"
 export OE_QMAKE_RCC = "${STAGING_BINDIR_NATIVE}/rcc4"
+export OE_QMAKE_QDBUSXML2CPP = "${STAGING_BINDIR_NATIVE}/qdbusxml2cpp4"
 export OE_QMAKE_QMAKE = "${STAGING_BINDIR_NATIVE}/qmake2"
 export OE_QMAKE_LINK = "${CXX}"
 export OE_QMAKE_CXXFLAGS = "${CXXFLAGS}"
diff --git a/recipes/qt4/files/linux.conf b/recipes/qt4/files/linux.conf
index 3471c6f..b96de12 100644
--- a/recipes/qt4/files/linux.conf
+++ b/recipes/qt4/files/linux.conf
@@ -28,6 +28,7 @@ QMAKE_MOC             = $(OE_QMAKE_MOC)
 QMAKE_UIC             = $(OE_QMAKE_UIC)
 QMAKE_UIC3            = $(OE_QMAKE_UIC3)
 QMAKE_RCC             = $(OE_QMAKE_RCC)
+QMAKE_QDBUSXML2CPP    = $(OE_QMAKE_QDBUSXML2CPP)
 
 QMAKE_AR              = $(OE_QMAKE_AR) cqs
 QMAKE_OBJCOPY         = objcopy
-- 
1.6.2.1.303.g63699



