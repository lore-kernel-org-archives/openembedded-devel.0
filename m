Return-Path: <coldnew.tw@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 58D64718E6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 06:15:03 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lj1so16434094pab.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 22:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2ycof1QjMzTP4NWltKznGG9xdA+XM+7jwZ51pnJaxBA=;
	b=hCpNI1p7OS4x3QNGSOVH2X065xea8xLHzscIcfZ1fp6a4mm4Ocm32t7iRXsh2wH/Pr
	+zfTfBIZhvj6ihA4rA6qyI93/8tZ3NR0TgpWdwrBOEpKSWK1mOGyOv8o69cZFjqQn6Fg
	XRC4v/Q9eA1PwTktipXpjAkOmj7oUwefdcX3oHLDOvn6/MVDGpwyHtpm8SXDa12WEKvU
	5asUiBDRSUcVmFx8ZYCh1YvmO7xRKmRS62aQLQZ5XPC3FAsxKPDCwrotEM0IOxgE8wsW
	Hi3qV0/zOWgxABU33qrUkZNpMF7rVvyE47lpfLZ+UyIJhNTBzTjzgqzaQtculj6ldC71
	jW1g==
X-Received: by 10.66.102.2 with SMTP id fk2mr39926339pab.149.1422339303702;
	Mon, 26 Jan 2015 22:15:03 -0800 (PST)
Received: from localhost.localdomain ([203.70.194.104])
	by mx.google.com with ESMTPSA id s4sm384174pdd.40.2015.01.26.22.15.01
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Jan 2015 22:15:02 -0800 (PST)
From: Yen-Chin Lee <coldnew.tw@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jan 2015 14:14:51 +0800
Message-Id: <1422339291-43625-1-git-send-email-coldnew.tw@gmail.com>
X-Mailer: git-send-email 1.9.3 (Apple Git-50)
Subject: [meta-raspberrypi][PATCH] layer.conf: handle dynamic layer configuration
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
X-List-Received-Date: Tue, 27 Jan 2015 06:15:06 -0000

Using a separate layer specific directory as meta-fsl-arm does with
qt5-layer, this will prevent meta-raspberrypi change layer dependencies
when add qt5 packages.

patch is taken from:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/conf/layer.conf#n20

Signed-off-by: Yen-Chin Lee <coldnew.tw@gmail.com>
---
 conf/layer.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 7bffd4b..71f22b4 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -12,3 +12,7 @@ BBFILE_PRIORITY_raspberrypi = "6"
 # Additional license directories.
 LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
 
+# Let us add layer-specific bbappends which are only applied when that
+# layer is included in our configuration
+BBFILES += "${@' '.join('${LAYERDIR}/%s/recipes*/*/*.bbappend' % layer \
+               for layer in BBFILE_COLLECTIONS.split())}"
-- 
1.9.3 (Apple Git-50)


