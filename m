Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier.martin@vista-silicon.com>) id 1Pn6Vc-0001ln-37
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 10:38:48 +0100
Received: by mail-ww0-f43.google.com with SMTP id 17so6659183wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 01:37:47 -0800 (PST)
Received: by 10.227.157.19 with SMTP id z19mr8122145wbw.189.1297244267234;
	Wed, 09 Feb 2011 01:37:47 -0800 (PST)
Received: from localhost.localdomain (58.50.18.95.dynamic.jazztel.es
	[95.18.50.58])
	by mx.google.com with ESMTPS id u9sm109430wbg.0.2011.02.09.01.37.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Feb 2011 01:37:46 -0800 (PST)
From: Javier Martin <javier.martin@vista-silicon.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Feb 2011 10:37:15 +0100
Message-Id: <1297244237-9508-6-git-send-email-javier.martin@vista-silicon.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1297244237-9508-1-git-send-email-javier.martin@vista-silicon.com>
References: <1297244237-9508-1-git-send-email-javier.martin@vista-silicon.com>
Subject: [PATCH 5/7] Add custom fw_env.conf for Visstrim_M10 boards.
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
X-List-Received-Date: Wed, 09 Feb 2011 09:38:48 -0000


Signed-off-by: Javier Martin <javier.martin@vista-silicon.com>
---
 recipes/u-boot/files/visstrim_m10/fw_env.config |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 recipes/u-boot/files/visstrim_m10/fw_env.config

diff --git a/recipes/u-boot/files/visstrim_m10/fw_env.config b/recipes/u-boot/files/visstrim_m10/fw_env.config
new file mode 100644
index 0000000..0778c32
--- /dev/null
+++ b/recipes/u-boot/files/visstrim_m10/fw_env.config
@@ -0,0 +1,9 @@
+# Configuration file for fw_(printenv/saveenv) utility.
+# Up to two entries are valid, in this case the redundant
+# environment sector is assumed present.
+# Notice, that the "Number of sectors" is ignored on NOR.
+
+# MTD device name       Device offset   Env. size       Flash sector size       Number of sectors
+/dev/mtd7		0x0		0x8000		0x8000
+/dev/mtd8		0x0		0x8000		0x8000
+
-- 
1.7.0.4



