Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmkp9-0001II-JO
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:38:35 +0100
Received: by mail-ea0-f180.google.com with SMTP id f13so2505803eai.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Pt58KG2sJ8VfWwrmpqbFgHZxDSosNt3hbUIWqTbSCjQ=;
	b=hYesn2Wzrlh4LgixNg780e9EKiQy+SFRd1Kp05DMRz4qdBc/d94xjwEHY1CrVqAqty
	nREZOHmjxF4FVV1VmsRtgJ+sNh1BObOG0vKyQ/Y1YeP3enXZ2suryMetwwqLCXm+KCQt
	+N03iRba0ivCdzg9umUScacw+ONlaPelqvzxUoXhUhXHJ0bYh5+GuNO2Isg4E0S1Vqhp
	RmCvnj+L8qXuObdCBzEG4F7MCfnW2E1kxXd6mirgDEvozB9uBOQCzSPIJ83qW7YHKdzF
	qOfGQrqXA+vhTQYMM2CR8cpjW4kVSjDXHIGN+bMYZYLk9sc3SEkVvQf8hmqpM+p27RcL
	8ckA==
X-Received: by 10.14.205.198 with SMTP id j46mr48112556eeo.27.1356265427104;
	Sun, 23 Dec 2012 04:23:47 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f49sm34557713eep.12.2012.12.23.04.23.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:23:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:37 +0100
Message-Id: <c69abe07376055e301e79d2d9f0430fd700b1c9a.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/30] gpm: disable -Werror
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
X-List-Received-Date: Sun, 23 Dec 2012 12:38:35 -0000

* 1.99.7 has a lot of issues, maybe we should bump PE and go to stable 1.20.7

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/gpm/gpm_1.99.7.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
index 38cd2c3..a8af6ab 100644
--- a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
+++ b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
@@ -33,6 +33,11 @@ INITSCRIPT_PARAMS = "defaults"
 # cc1: all warnings being treated as errors
 CFLAGS += "-Wno-extra -Wno-error=unused-but-set-parameter -Wno-error=unused-but-set-variable"
 
+# twiddler is WIP in 1.99.7 and probably not worth fixing (a lot of changes in gpm-2-dev after 1.99.7
+# gpm-1.99.7/src/drivers/twid/twiddler.c:503:14: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
+# /gpm-1.99.7/src/mice.c:221:5: error: (near initialization for 'mice[32].init') [-Werror]
+CFLAGS += "-Wno-error=int-to-pointer-cast -Wno-error"
+
 do_install () {
     oe_runmake 'ROOT=${D}' install
     install -m 0644 src/headers/gpm.h ${D}${includedir}
-- 
1.8.0.2



