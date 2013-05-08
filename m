Received: from mail-gg0-f172.google.com ([209.85.161.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ua8Tu-0002kT-Os
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 19:48:54 +0200
Received: by mail-gg0-f172.google.com with SMTP id h3so459688gge.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 May 2013 10:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=1WeHrCp8Hl0WDyQO4OclVR1vXps8GJJc5taq23aTf4k=;
	b=kRCXBYMvS8zvigkR5/8FKAxEqsmr8X0pgMJyWvMF10h0v6z6oto9mMPLM2tibls46o
	S0ctZ8D6N0ejrHYd2vCRNFvoghAld0OdBlyn00GE+Ya+J2/bBFOlLVZEYxYl0yhw7xof
	0REsoGJXrIAGob9g1IuAzN1Xb84qW1p+O7SXZh6AYAN6gFCaFGPxctk0+Tcn6xjP7CA6
	OAsSSlAruUcEpP0WZ2BbCINVKRQxqoutH0vaPqkFP3zmUIzVQ6N6css9HOghERDitiE9
	G8bVmYTf1ZuD9Dol08T1oV1ZER1Rxckxq2TGHTZeyQTerrYxlZxWUpktNLcc2K0cd3oJ
	LjHA==
X-Received: by 10.236.68.232 with SMTP id l68mr7394487yhd.24.1368034243530;
	Wed, 08 May 2013 10:30:43 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.151.247])
	by mx.google.com with ESMTPSA id
	t41sm65060137yhh.11.2013.05.08.10.30.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 May 2013 10:30:42 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Wed,  8 May 2013 14:29:08 -0300
Message-Id: <1368034148-3512-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][meta-networking PATCH] cifs-utils: Add runtime recommendation to CIFS kernel module
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
X-List-Received-Date: Wed, 08 May 2013 17:49:00 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Note: This patch has been tested in master and danny. Please
      consider it for master, dylan and danny branches.

 meta-networking/recipes-support/cifs/cifs-utils_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
index 19b60ad..de2786a 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -5,6 +5,7 @@ LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 PV = "5.9"
+PR = "r1"
 
 SRCREV = "353d491dcb5d69d31434abeb962c8e9a49c36867"
 SRC_URI = "git://git.samba.org/cifs-utils.git"
@@ -18,3 +19,5 @@ do_install_append() {
     # is installed to /sbin
     rmdir ${D}${bindir} ${D}${sbindir}
 }
+
+RRECOMMENDS_${PN} = "kernel-module-cifs"
-- 
1.8.1



