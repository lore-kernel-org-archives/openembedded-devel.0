Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 099066DB56
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 22:21:14 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c4so2840941eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 14:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JXjH5UOS400CIqeNPMvhxUvL7vVAgeAlHa4CIgvgbr4=;
	b=i68OK69/yxAxPGNxvdS8LLlsKZHHVpHGopBVP3oS3QtPQN6ihkycCCm+9q5C7GXj40
	wTgtw4lYCSHCUeTD1VSJCs684TFtOsXNPFbm+1G3nWCINyhfTNidFv7wqhT651xnmzw9
	mfmJaoBcrmNlWWEi3+Yx5zAsGc2VZ42CvXj/gSyB4Ru17Nnqa8KGwFhMsLHojlzzIzfp
	ZU8gkm9oDvZPlC6XkoM6BvtzWqSPLcib9TjIOSXOtChFasNiZOiOz4WUiV+mdmQfxWzw
	07BiF6/fnFud+26/QACq6yqKG2IX+6rYqODuYuc1dH5H+nHIzTXoASPyQv8MrqCeDV/h
	onAQ==
X-Received: by 10.14.106.197 with SMTP id m45mr6674210eeg.45.1384813276646;
	Mon, 18 Nov 2013 14:21:16 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j46sm42051237eew.18.2013.11.18.14.21.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 14:21:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2013 23:21:11 +0100
Message-Id: <1384813274-7231-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1384813274-7231-1-git-send-email-Martin.Jansa@gmail.com>
References: <1384813274-7231-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/6] gateone: Drop allarch
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
X-List-Received-Date: Mon, 18 Nov 2013 22:21:15 -0000

* runtime dependencies are TUNE_PKGARCH causing do_package_write_*
  task to have different signature for MACHINEs with different
  TUNE_PKGARCH

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/gateone/gateone_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index 85c32cc..ac5aa5b 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/liftoff/GateOne.git \
 
 S = "${WORKDIR}/git"
 
-inherit distutils allarch python-dir systemd update-rc.d
+inherit distutils python-dir systemd update-rc.d
 
 export prefix = "${localstatedir}/lib"
 
-- 
1.8.4.3


