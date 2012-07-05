Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SmsWA-00058n-6J
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 22:19:14 +0200
Received: by pbbrq2 with SMTP id rq2so12876005pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2012 13:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=AmEwWgBHT1G/vEXBtFGHGyxWoMs2zkcNolZa8ZomMiU=;
	b=FUYbQ8w3A8RbrzWF3TDr2k2G7DgbqlUXe4hr/xZCzS7K7Tl3m17TfjOWcrcjeaNcNI
	4Z1ZSlDlmImm1W5W3RmoufsxMz0Plx8PTBTEf6TITyyvzNM6sHCoo2EABDA9hsW1tnHJ
	y8nic0nMq4cNlgndemFeDVvu/XbhXuzOykbyc0xZkNrGH0NpDd0tB1flIh4LrA9tkePH
	QaxVUEYJUj+FbPVOVU48n9ZfjepA6gYqltPk5vcle2GuW6Wg8Q8ukMqfDSal8waB6dok
	Msm1jSgqCCfUiCxmZw8bVPy07FVCVbYhuFpKh2ZfU/I442Et33QuN2YnQmOumdYxwFXq
	8sBw==
Received: by 10.68.237.105 with SMTP id vb9mr30601331pbc.103.1341518888440;
	Thu, 05 Jul 2012 13:08:08 -0700 (PDT)
Received: from localhost.localdomain ([94.205.108.162])
	by mx.google.com with ESMTPS id gg1sm4385674pbc.64.2012.07.05.13.08.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 13:08:07 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jul 2012 00:08:00 +0400
Message-Id: <1341518880-31605-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-openembedded] lighttpd: Set SYSTEMD_PACKAGES as lighttpd-systemd.
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
X-List-Received-Date: Thu, 05 Jul 2012 20:19:14 -0000

This commit fixes WARNING:
/tool/yocto/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb:
it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 .../lighttpd/lighttpd_1.4.31.bbappend              |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
index 1341405..b02f35c 100644
--- a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
+++ b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
@@ -6,5 +6,5 @@ inherit systemd
 
 SRC_URI += "file://lighttpd.service"
 
-SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "lighttpd.service"
-- 
1.7.9.5



