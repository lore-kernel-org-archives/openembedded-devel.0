Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rbsfw-0001SH-Es
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Dec 2011 12:43:36 +0100
Received: by yhoo47 with SMTP id o47so3195666yho.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2011 03:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=2xgQqP43skEgEMgRwZcABFUFzw2Svz3W+ueaUw/VeC8=;
	b=mFnmDB501M1yQUgfs7j+9JFxwlB0zJphymMFipBjuHVQzgO5bq+05rNAjWANgxSsXh
	v3yXuty/4BMBjxz4buRh+rXN44OdKdxflC22WAQdrr/5pkAOdxVWcJJBu8FLagrSBv31
	TLHcCXSuSB/9XnDIKon1XvlERloxq72mz5D3Q=
Received: by 10.236.91.84 with SMTP id g60mr17085570yhf.90.1324121795840;
	Sat, 17 Dec 2011 03:36:35 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i32sm28493387anm.6.2011.12.17.03.36.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Dec 2011 03:36:35 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Dec 2011 11:36:24 +0000
Message-Id: <1d3684a1c514356d83172e54cdd7852d04af5ed1.1324121762.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324121762.git.otavio@ossystems.com.br>
References: <cover.1324121762.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] pcsc-lite: ccid downgraded to a runtime recommendation
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
X-List-Received-Date: Sat, 17 Dec 2011 11:43:36 -0000

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



