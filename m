Return-Path: <marc.ferland@gmail.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0810F6E5FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 May 2017 15:32:20 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id r185so29965652itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 May 2017 08:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ngQFEdb+ayxSOS4KIgQUIlR1NjHKniwiPDmV8QQxXU4=;
	b=frseLujioikhC1qZbZHrm1Yio7PaMp3jVD+zUpKdHpSbBmtigEwxK4wTJYiNJZ1whf
	Be5D9uuo82BwGpAVw2dEWO729hSDD88KUZhbncsFLlZ8iT5+dfnxSA0SVWaI9V885j4Y
	aiMJMWoDK7lvgs2mqXRspa6GjuS2ifhaF3PzY5AuJLrPN7gdJpzE9T82T7RoxjB9gnud
	j3n18xE2gUCcLiDtqtf8ilhudMHXimgGeC3j13aBtY1OnLTuTNLOPbSCZouUwUHTCUSI
	abo+40TeOEi9MQN/Os0Vby4LoEKRPqHBoJH+kQiTD0drkQFBq5GBtxPuTNeq3gBpqdBd
	Kafw==
X-Gm-Message-State: AN3rC/4IM5DwrkPVkJpqUEydIodelnv3LbZpgmed2VjQ7K7tvTemgPnq
	ciYAPlVsmWf72w==
X-Received: by 10.36.124.85 with SMTP id a82mr6030787itd.90.1493652741809;
	Mon, 01 May 2017 08:32:21 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	a141sm3906313itc.28.2017.05.01.08.32.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 May 2017 08:32:21 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 May 2017 11:32:08 -0400
Message-Id: <1493652728-13236-1-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-prettytable: fix files permissions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 May 2017 15:32:21 -0000

Got this runtime error:

IOError: [Errno 13] Permission denied: '/usr/lib/python2.7/site-packages/prettytable-0.7.2-py2.7.egg-info/PKG-INFO'

After some investigation, it looks like the pypi package is the culprit
as almost all the files in the tar.gz are set to 600 instead of 644.

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb b/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
index f63457e..6f4390e 100644
--- a/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 inherit setuptools
 
 do_install_append() {
-    perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
+    perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
     for f in $perm_files; do
         chmod 644 "${f}"
     done
-- 
2.7.4


