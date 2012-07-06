Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Smz87-00040r-Rv
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jul 2012 05:22:52 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so13355547pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2012 20:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=AmEwWgBHT1G/vEXBtFGHGyxWoMs2zkcNolZa8ZomMiU=;
	b=JmKzsu6t5ArGIyT5fJ2Jldz0kA2inrP93Xu5nxhMZWt4UMA16fupbZV5O6QxayAFYF
	imwX8dnzsZKzj8+Bg5/F5f73sAc5i8RxRotCFYrclM5nUH4rxyYW2G8/i32eOxj7UTd+
	8MpGwdmhB0zL/I8cWSWQyIZdwC3D8NKNKl2azVDnkZa3Vs23QumLl/69ZU1/0VRx+Ees
	YrH29KfnJ0eH7O03yJ+v1eB+0N0WXoyyiqmrK14KisVyjGdw2rIh/vbzyeUnEkWbT+Oa
	p3tnHLOSXwCL7wZuIIeO01aKPY9SPeduJTjBboi0sBpYO0fLEyTi4qUhP84YY5PXE7H2
	Z6xQ==
Received: by 10.68.241.228 with SMTP id wl4mr32850150pbc.51.1341544308667;
	Thu, 05 Jul 2012 20:11:48 -0700 (PDT)
Received: from localhost.localdomain ([94.205.108.162])
	by mx.google.com with ESMTPS id rs4sm20952836pbc.0.2012.07.05.20.11.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 20:11:48 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jul 2012 06:52:30 +0400
Message-Id: <1341543150-25096-4-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341543150-25096-1-git-send-email-elvis.dowson@gmail.com>
References: <1341543150-25096-1-git-send-email-elvis.dowson@gmail.com>
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-openembedded 4/4] lighttpd: Set SYSTEMD_PACKAGES as lighttpd-systemd.
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
X-List-Received-Date: Fri, 06 Jul 2012 03:22:52 -0000

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



