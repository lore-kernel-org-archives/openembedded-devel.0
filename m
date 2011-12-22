Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RdiUt-00039z-GO
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Dec 2011 14:15:47 +0100
Received: by ghrr17 with SMTP id r17so3566830ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2011 05:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=2xgQqP43skEgEMgRwZcABFUFzw2Svz3W+ueaUw/VeC8=;
	b=rexohfDOPwCfCQ9jpxWmcvm+RUi94bHPejt4Z1oi8ED3lPoj0o0UhSCW5M0zlScsuH
	YBwrzJXDMJxBfzVefd4H13hCaUXxlP5djpM3yg70GVhxrOK2wkSc7HUQEgMQnKc/3aby
	Nvee3XAxrG6bIEuH7acAD4r5M4gSVgNukAa3M=
Received: by 10.101.97.12 with SMTP id z12mr4492352anl.84.1324559320065;
	Thu, 22 Dec 2011 05:08:40 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm14603838yhk.1.2011.12.22.05.08.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 05:08:39 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2011 13:08:22 +0000
Message-Id: <c7e25083df03207e5a245c99d856e6334661450d.1324559278.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324559278.git.otavio@ossystems.com.br>
References: <cover.1324559278.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1324559278.git.otavio@ossystems.com.br>
References: <cover.1324559278.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/3] pcsc-lite: ccid downgraded to a runtime recommendation
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
X-List-Received-Date: Thu, 22 Dec 2011 13:15:47 -0000

ccid adds more smart-card readers support but it is not a requirement
for pcsc-lite to work thus we change it to a recommendation instead of
a hard dependency.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb   |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
index de980ff..a4f3fcc 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "http://pcsclite.alioth.debian.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c8e551349dc346258274f0007679e149"
 DEPENDS = "udev"
-RDEPENDS += "ccid"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "https://alioth.debian.org/frs/download.php/3533/pcsc-lite-${PV}.tar.bz2"
 
@@ -23,4 +22,6 @@ S = "${WORKDIR}/pcsc-lite-${PV}"
 
 PACKAGES =+ "${PN}-lib"
 
+RRECOMMENDS_${PN} = "ccid"
+
 FILES_${PN}-lib = "${libdir}/lib*${SOLIBS}"
-- 
1.7.2.5



