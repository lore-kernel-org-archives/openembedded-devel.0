Return-Path: <net147@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 05CB26AD31
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jul 2013 12:01:48 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb1so2958385pad.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jul 2013 05:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8aPRoyYLmy1JeLCAr9oarK0GZM8VHPCmgxJ8S8KLRmM=;
	b=OcZh5vQY7Sifjf016upi81DANzbRWBmDvNNR2PMjqhTUZZrQhh+dfuewBgojWID5mD
	QvCPvlIesLYwL2KXSvo8CL1afpPFnyZC+1owPEKfAogqw0KTAl8EhudKsFMwAvymr0Ca
	DWtzS/jDu4ONBG2OJR74ZYM1OlsP4tWUDr5SXZwIubJgZ4P6yb2ZxwAWPt4LZWUhqY7n
	ZCA+A52REvVZ0hT9TdRBku9RY+cZATlzTxnzMULGIxDg5MLQYmznQz4k71ZP9dUiwb4/
	Oy7AlUgqItdo57HSFjClgcuhgfTrU46Z5koHVQXfYYv2BgBwx6VX2LNADvXzJyAb0euU
	DyXA==
X-Received: by 10.68.203.103 with SMTP id kp7mr13317375pbc.165.1373112109133; 
	Sat, 06 Jul 2013 05:01:49 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	kq2sm13072376pab.19.2013.07.06.05.01.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 05:01:48 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Jul 2013 22:17:26 +1000
Message-Id: <1373113046-2544-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] gdm: remove /var/run from package
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
X-List-Received-Date: Sat, 06 Jul 2013 12:01:48 -0000

The /var/run/gdm and /var/run/gdm/greeter directories are created by
the daemon if they don't exist. The /var/run directory is already
created by base-files.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index da12ab8..04ecb19 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -60,6 +60,9 @@ do_install_append() {
 
     chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
     chmod 0750 ${D}${localstatedir}/lib/gdm
+
+    rm -rf "${D}${localstatedir}/run"
+    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
 }
 
 FILES_${PN} += "${datadir}/icon* \
-- 
1.8.3.2


