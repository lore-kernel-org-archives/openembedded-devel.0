Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUvcq-0004Ut-0b
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 09:59:56 +0200
Received: by wgbdr1 with SMTP id dr1so1319073wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 00:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=qidd8kcsCe6u9R3PdaR19Lxoa0mpkSIkG0L9EjLFXTM=;
	b=uPLnneIax5X2Ok7SJAnUnp0510LKEG+N6o2Mrm6aseKzJmXoOCWIsizHfeqe1klQpt
	SZuqZ5XzUcPDGxx/NTY6bkFoGSOixItcM6QNfUur805ucz55arpITXNwiE4BPkBNVPwZ
	iXIE39nhCL2y0nT9t4TVb+Ec8n0et+cfS9m+D8KabEWh/IjvV6gBt9jXB8phKoRnn6G7
	K0TrSDDTNvLLv2I90p1YJhsyZZHcW9AqlWjZ9sDmt5TEOnuchUyg77P8QnxMd/JxgtNA
	TS5wcrRkm90SXgR4isPjMfNOkAAQg2XmYH2VbBFqORLOMsW2BoKBE+xMFF+J265Ltd5q
	eGAA==
Received: by 10.216.134.41 with SMTP id r41mr988972wei.13.1337240993951;
	Thu, 17 May 2012 00:49:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fn2sm18436227wib.0.2012.05.17.00.49.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 00:49:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2012 09:49:47 +0200
Message-Id: <1337240987-16555-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-systemd][PATCH] meta-systemd: fixup BBFILE_PATTERN override
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
X-List-Received-Date: Thu, 17 May 2012 07:59:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/conf/layer.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-systemd/conf/layer.conf b/meta-systemd/conf/layer.conf
index d07d2ad..9caec69 100644
--- a/meta-systemd/conf/layer.conf
+++ b/meta-systemd/conf/layer.conf
@@ -15,7 +15,7 @@ BBPATH .= ":${LAYERDIR}"
 BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "systemd-layer"
-BBFILE_PATTERN_systemd := "^${LAYERDIR}/"
+BBFILE_PATTERN_systemd-layer := "^${LAYERDIR}/"
 
 # Define the priority for recipes (.bb files) from this layer,
 # choosing carefully how this layer interacts with all of the
-- 
1.7.8.6



