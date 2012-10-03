Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJPPS-0001Vm-02
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 15:54:46 +0200
Received: by yenm2 with SMTP id m2so2132715yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 06:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=sQHUDkzzMb1QVAHDAGBLKa63el5KTfdxHVIm3jdt9us=;
	b=wZDydPqEUtoZjiGJHITT7/YEcc2bfIb4HlmPluFuYaSUoYfeqDs7f0URMbbKcP88Jg
	fhT47qFJuL4Plce4uZcS+w1/uHZshzDp0JXRmMLwWP/AmwA/6RVWqDkYc5GmYj0Eosiz
	xLUWso8ZWBoqp52zx3IUGqeGmoneCp3ZHpuTP4crFasUR/I0pBSfCUYdoTVL02aaUr43
	T3hpTrMHpAkBNI7x29r2PSjyfZFkek2Ar0VU5eWSqzjymUC4bSI2Xfa1G+XmDQn+851X
	QK7majVt4ddHx8yUGBEjgtBn0Idw3NPpifyA3Xzvs3ykVT9fVixk1zNn2EMY6tJ3BQKt
	hMnw==
Received: by 10.236.131.69 with SMTP id l45mr1824596yhi.46.1349271705957;
	Wed, 03 Oct 2012 06:41:45 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id l16sm3906857anm.6.2012.10.03.06.41.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 06:41:45 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2012 10:41:32 -0300
Message-Id: <1349271693-6378-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349271693-6378-1-git-send-email-otavio@ossystems.com.br>
References: <1349271693-6378-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/4] libcec: Update to 1.9.0 version
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
X-List-Received-Date: Wed, 03 Oct 2012 13:54:46 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-extended/libcec/libcec_git.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb b/meta-oe/recipes-extended/libcec/libcec_git.bb
index 142b2e2..8b1f086 100644
--- a/meta-oe/recipes-extended/libcec/libcec_git.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "USB CEC Adaptor communication Library"
 HOMEPAGE = "http://libcec.pulse-eight.com/"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=185ead350fec5fc223da0f65f9a802af"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5e8e16396992369f73f3d28875f846da"
 
-DEPENDS = "udev"
+DEPENDS = "udev lockdev"
 
-PR = "r1"
-PV = "1.4.0"
-SRCREV = "2db8981f49fbd167ddbbf19c1fbadd064abc332a"
+PV = "1.9.0"
+
+SRCREV = "9884e9ffc5293de5bb9092db1ed581f213a678df"
 SRC_URI = "git://github.com/Pulse-Eight/libcec.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



