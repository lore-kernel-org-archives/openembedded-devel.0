Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Shv2C-0005iN-GZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 05:59:48 +0200
Received: by pbbrq2 with SMTP id rq2so2899525pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 20:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=asv5x8Q8Zo5B/UGIuocj7D9Q1/yIyvT3uIFGhWg1ETQ=;
	b=bAoyaZhEtZ4Eqo0deubHIzxmLVDxeM1wUIjAIymkaCHbRqJS7zxAkBGFox8ZXwIClA
	7j5SpZ4LDXowLlnfz1Nc2aw3Bg9D8t6WON4GVwhexyIj9whR3HZkXVkWJRiDeAynOKy+
	L3t0rtmmql1EUyBYdOYM/uGzemXJ5S/RbfSkQy4pTseJwD25hwnoYqfrZnV/qYuHndlP
	iOHtBqyZ9Z7x0ka0OItokzZzMIg4GZuX9SEq38u0QKGgnoV7T3K9LyOAIbfGICV3IU7u
	y+lE6ykMsagUDczfuO87dPFKWpUKhMo8Xrs4r755pPvaPtWdvJr5UxeDuNwy3StFhl4i
	1pvg==
Received: by 10.68.220.39 with SMTP id pt7mr5905794pbc.40.1340336940980;
	Thu, 21 Jun 2012 20:49:00 -0700 (PDT)
Received: from localhost.localdomain ([94.205.109.242])
	by mx.google.com with ESMTPS id
	ny10sm37620996pbb.38.2012.06.21.20.48.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 20:48:59 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2012 05:48:51 +0200
Message-Id: <1340336931-7978-1-git-send-email-elvis.dowson@gmail.com>
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
X-List-Received-Date: Fri, 22 Jun 2012 03:59:48 -0000

This commit fixes WARNING:
/tool/yocto/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb:
it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 .../lighttpd/lighttpd_1.4.30.bbappend              |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
index 1341405..b02f35c 100644
--- a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
+++ b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
@@ -6,5 +6,5 @@ inherit systemd
 
 SRC_URI += "file://lighttpd.service"
 
-SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "lighttpd.service"
-- 
1.7.9.5



