Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 05DC97580A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:21:45 +0000 (UTC)
Received: by igbzc4 with SMTP id zc4so16544712igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vNZKPRiSwehLRznvlH9HnyPNB51YUZTGuV9sDCg5JEE=;
	b=IfoVTMb/5UOeyx6F3GohUI/ZgCghIoQFmSaiVkbl2P33c14TKqW/p3OVyhZehUDrTc
	AyvEi5c9rL2nEFUh3bCnpD0c0v8vc9uhsqyIRyYGJCidFzwEP7j6QKMEtDNkydkeJyDN
	YIojQUEnBVL04XrLaep9l5gpv14xLfYpaHwyoytfXMDuy8DQdOtgHo2sJmMvpRZ0sKRL
	oXmG5CmS1legZJ0CbOq9UskoVfi06pNbw6onajgD1wiGi5AqT7c5yASvsoKiKhAM2L9d
	6E42eQoHnXXtBtMjInC5jdcAXtcLzyAhjInFJV99y8dW9OcjsEuvNwuylJl7gGaObNCj
	9vWg==
X-Received: by 10.50.49.46 with SMTP id r14mr36550252ign.45.1433445706957;
	Thu, 04 Jun 2015 12:21:46 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	je10sm9950529igb.15.2015.06.04.12.21.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 12:21:45 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:21:06 -0700
Message-Id: <1433445666-7207-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433445666-7207-1-git-send-email-armccurdy@gmail.com>
References: <1433445666-7207-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 7/7] mariadb.inc: use x86 over-ride instead of i586
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jun 2015 19:21:46 -0000

Support i686 without needing to duplicate the i586 over-ride.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 00fa965..5a1cde4 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -174,7 +174,7 @@ FILES_libmysqlclient-dbg = "${libdir}/plugin/.debug/ \
 # Avoid warnings about ha_xtradb.so.0.0.0 and ha_innodb_plugin.so.0.0.0
 # which are intentionally non-PIC on 32-bit x86 (see e.g.
 # storage/xtradb/plug.in in the source)
-INSANE_SKIP_libmysqlclient_append_i586 = " textrel"
+INSANE_SKIP_libmysqlclient_append_x86 = " textrel"
 
 FILES_libmysqlclient-r = "${libdir}/libmysqlclient_r.so.*"
 FILES_libmysqlclient-r-dev = "\
-- 
1.9.1


