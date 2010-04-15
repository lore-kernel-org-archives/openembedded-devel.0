Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1O2MTo-0003oO-1P
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 12:39:28 +0200
Received: by mail-ww0-f47.google.com with SMTP id 18so546727wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 03:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=hlRhCmxq0XUEUHbGb6hC/zv4Mc2Q4lUqQEH/yn6X+eg=;
	b=qHcYsfqY3sW6MPhq4ZpeZsf4ovS9T1UYW3VZ3Wq8auCZLpiv9brSl4Rwui+RqKod4s
	qpUBXrM1Ryo3+WWYRevletaxMT6kMyuI4VNy1gy85u7F1s3xMIP5E2jBrCIwFuGVUhS2
	ZOgGkWFF/lyfaRNG8v3D8qPwF8GlGl1xZLAqQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NnrvLtH2FMqsej3VsQ72qTs4SuZbCE9MzT65kYRHZo+0JGxA3OG1l/gNLkUiOt4X8X
	JygwPjCpVD7155kqeu23F+xpm6sVDbbvSfgoMDP5PDrk+xtTHgihPAOYmAkYfQ/v4EJJ
	dF/63ZMIqU9bMpgaNAMDdkewK4KdqFYUGg6Uw=
Received: by 10.216.165.5 with SMTP id d5mr6333416wel.143.1271327761282;
	Thu, 15 Apr 2010 03:36:01 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id r29sm10730675wbv.21.2010.04.15.03.36.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 15 Apr 2010 03:36:00 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Apr 2010 12:35:50 +0200
Message-Id: <1271327750-29247-3-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <1271327750-29247-1-git-send-email-koen@openembedded.org>
References: <1271327750-29247-1-git-send-email-koen@openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k-kooi@ti.com>
Subject: linux-davinci git: add hack for hawkboard machine ID
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
X-List-Received-Date: Thu, 15 Apr 2010 10:39:28 -0000

From: Koen Kooi <k-kooi@ti.com>

Signed-off-by: Koen Kooi <k-kooi@ti.com>
---
diff --git a/recipes/linux/linux-davinci_git.bb b/recipes/linux/linux-davinci_git.bb
index ee28d90..87f6824 100644
--- a/recipes/linux/linux-davinci_git.bb
+++ b/recipes/linux/linux-davinci_git.bb
@@ -85,3 +85,10 @@ SRC_URI_append_da850-omapl138-evm = "file://logo_linux_clut224.ppm \
 SRC_URI_append_hawkboard          = "file://logo_linux_clut224.ppm \
                                      file://da850_omapl138_opp456mhz.patch;patch=1 \
                                      file://patch_hawk.diff;patch=1"
+
+
+do_configure_prepend_hawkboard() {
+	sed -i s:2157:2495:g ${S}/arch/arm/tools/mach-types
+}
+
+


