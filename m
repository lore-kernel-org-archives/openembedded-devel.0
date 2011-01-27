Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PiMWv-0002Dz-JZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 08:44:33 +0100
Received: by bwz10 with SMTP id 10so2087346bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 23:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=qmCsW9gy1Y0NZboMzN3t34A3Wb5MyhWuxuPGYlycr9k=;
	b=s19El5c2advlRQoJiUUalQaI23HAYOlJ3Wn7LHmAcNaRKOKfceIWA2zqmDwRB2cq72
	W8+14E7U4zzGM5ANHDU5ptHd4aP3HFszlosSLy6Advgf8HzHFT2axjowCH5OjRFieVSn
	KKKTqLwQdsNAeEQ7uvl3qcm1Cx+10pR3uFDfc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=MQjzhNtGXE46zcpH8PDsYiE8kbkVjiK/uL2BH7QQb1xm2ylubsIKWVg6J/U9ZkXUPS
	R5L+NkfnlU12iw8Zd6Dezbp/8PnjvcAJ96KuW2LMNyk5ZRrSA7bGYTmJX6FiMzNUlENF
	Kmng54vI8NqbWYXI7gCcIea556l8QADshxALo=
Received: by 10.204.117.77 with SMTP id p13mr1256035bkq.19.1296114226363;
	Wed, 26 Jan 2011 23:43:46 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q18sm7920600bka.15.2011.01.26.23.43.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 23:43:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jan 2011 08:44:07 +0100
Message-Id: <1296114247-11702-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc3
In-Reply-To: <1296114247-11702-1-git-send-email-Martin.Jansa@gmail.com>
References: <1296114247-11702-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] xbiff: upgrade from 1.0.2 to 1.0.3
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
X-List-Received-Date: Thu, 27 Jan 2011 07:44:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/xorg-app/xbiff_1.0.2.bb |    7 -------
 recipes/xorg-app/xbiff_1.0.3.bb |    7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 recipes/xorg-app/xbiff_1.0.2.bb
 create mode 100644 recipes/xorg-app/xbiff_1.0.3.bb

diff --git a/recipes/xorg-app/xbiff_1.0.2.bb b/recipes/xorg-app/xbiff_1.0.2.bb
deleted file mode 100644
index 66cd182..0000000
--- a/recipes/xorg-app/xbiff_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw xbitmaps libxext"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1d4ad06725f9dc4b877ecd210b7b1607"
-SRC_URI[archive.sha256sum] = "7c21763a90599ad627739804ba76dd33516b76cce440294e1154bf680eca60f7"
diff --git a/recipes/xorg-app/xbiff_1.0.3.bb b/recipes/xorg-app/xbiff_1.0.3.bb
new file mode 100644
index 0000000..5ac26d2
--- /dev/null
+++ b/recipes/xorg-app/xbiff_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw xbitmaps libxext libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f38a0c63c2a7ed6fb9d6f8884785b5c9"
+SRC_URI[archive.sha256sum] = "aa1db4f31f7afcfe131bda7ff6e380ff7de41cf1a7009464783043c817c47ce8"
-- 
1.7.4.rc3



