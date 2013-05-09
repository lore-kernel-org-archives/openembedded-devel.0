Received: from mail-gh0-f182.google.com ([209.85.160.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UaT0q-0006Tg-1F
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 May 2013 17:44:11 +0200
Received: by mail-gh0-f182.google.com with SMTP id z15so665761ghb.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 May 2013 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=fSgvA+pOrXB5l9X1P3JUH/vgIP+cAZMPICLXvgS1Xlk=;
	b=kRlAvjPsPPY1zXPvG6HSf5HmnhgN8UXrQ+7R6XtqQDIk8xnC1zFF468mX8e9K71fnL
	pgpYi1kYRmlhVlYFaFsgGbb1pkHbgIBPlx6UuNkPlAv37vuI1r7ay7TXQtPKIcIJ8mvz
	/q8/H9aUkrBfSUWw7TAkwJWq+GZdtdeHB2MIW4M1NOldgr1BL1UDEpUh9YUkViKctGez
	IdQ0y1W9NjI5B7K07X0+p7Lkv8bsanQf+q7dTOsOC/MIImglHNMT5Sw4cMm+nDrYg5ue
	Uo+H8P4Tjui+cnpz5TB9YrXVj4zoQxG0s8xJlOnWMxSiKnOFqVSpfLwQWH6mw9Jp+Cs1
	Kp8g==
X-Received: by 10.236.161.102 with SMTP id v66mr9652596yhk.162.1368113163327; 
	Thu, 09 May 2013 08:26:03 -0700 (PDT)
Received: from localhost.localdomain ([187.23.151.247])
	by mx.google.com with ESMTPSA id j27sm4525542yhf.18.2013.05.09.08.26.01
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 09 May 2013 08:26:02 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 May 2013 12:25:45 -0300
Message-Id: <1368113145-17108-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH] samba: Add usershare directory to the package
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
X-List-Received-Date: Thu, 09 May 2013 15:44:14 -0000

Change-Id: I0d9ad638c62cca929cded60752dbf75fc100017f
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-connectivity/samba/samba.inc      |    3 +++
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index 3ee43ad..f9a54a2 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -92,6 +92,9 @@ do_install_append() {
 
 	rmdir ${D}${base_sbindir}
 	sed -i -e '1s,#!.*perl,#!${USRBINPATH}/env perl,' ${D}${bindir}/findsmb
+
+	# usershare mount place
+	mkdir -p ${D}${localstatedir}/lib/samba/usershares
 }
 
 
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index 35d20c5..917c826 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -3,7 +3,7 @@ require samba-basic.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI += "\
     file://config-h.patch \
-- 
1.7.2.5



