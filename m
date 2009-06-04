Received: from [209.85.220.220] (helo=mail-fx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MCDqD-0006IR-I2
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 16:22:49 +0200
Received: by fxm20 with SMTP id 20so787461fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2009 07:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=/VylBeYdC9usHEn1tvqGEjufJjwjeJwvIbDCrilmrcw=;
	b=gpLVGBroNMc/HcfkF+jsmN0Vue2uykQ3/ai9Es7Om6ekp9QAn7Tv5ffqMEjPwAXcuO
	lcYUHJvmj9pdyBtGLDAlOO85bH2jsKntKpyQPZZKvOCekmxkyjIJHn/Y3F1sM9FvuVO7
	sMBDojL6xa2NJDalLrppVPqURdwFTG9hnDOFA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=niQXTMaraqGNuiIfsMN681tKtW/Uo8ZeA8gCo+ay9TsZq5NRz0rVtxp/j+rkJVccs2
	ZJD/ScAMfr9cpYZX3KA2C5yHUSCFynodJSwBhAwB+O+nY4pVjzbFWgu40mQyxmoud62l
	m6Gq090BPIx0Zk2mu/gGOLIwsZ2STGPd3TLTQ=
Received: by 10.103.8.17 with SMTP id l17mr1402993mui.125.1244124823962;
	Thu, 04 Jun 2009 07:13:43 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id j9sm4473841mue.21.2009.06.04.07.13.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Jun 2009 07:13:43 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2009 17:13:40 +0300
Message-Id: <1244124820-13930-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
Subject: [PATCH] guile-native: added missing gettext-native dependency
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
X-List-Received-Date: Thu, 04 Jun 2009 14:22:49 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/guile/guile-native_1.8.5.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/guile/guile-native_1.8.5.bb b/recipes/guile/guile-native_1.8.5.bb
index e73616e..bf21c6a 100644
--- a/recipes/guile/guile-native_1.8.5.bb
+++ b/recipes/guile/guile-native_1.8.5.bb
@@ -1,6 +1,6 @@
 SECTION = "unknown"
 LICENSE = "GPL"
-DEPENDS = "gmp-native"
+DEPENDS = "gmp-native gettext-native"
 SRC_URI = "http://ftp.gnu.org/pub/gnu/guile/guile-${PV}.tar.gz \
            file://configure-fix.patch;patch=1 \
 "
-- 
1.6.3.1



