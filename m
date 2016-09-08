Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD5C65CBA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Sep 2016 22:36:43 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id w12so212517wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2016 15:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ReR3V/ykRxJLASrwIG4CWRYNdDnTF92eq7Td+aW6IKc=;
	b=LLNWnap6A/E00lDIBfEvNi0hWNRXzMQBqqjwZelsJZdqm3tVM/733eKFtYpqclEmiX
	keAY8gDcqE2ZEBIkFB1rhMDCjhhsdrgWvLFb+J3/FdixBwX3B07shipDUwTfE2MXFJ5i
	gUzGuZcV+2AoBTjhO+RqB+5vMwAIqdGDlbAX9wMqX7gOx9XIz0IHxhQ+lSKF9qmk1A7q
	r5S52AqDNkkvyb4UExG5PSgopn1WspVg0tr1yH6epNSYiMI3RBkxuKCguBRj/xZTt7ji
	yZrUggJgZOJQytAme6Wvqt40Y0qzMiR2Y4/2ETHDDjh7hCYaZ8vYFPiG1+Mz7yHWWsWV
	fjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ReR3V/ykRxJLASrwIG4CWRYNdDnTF92eq7Td+aW6IKc=;
	b=lMu+v3mD9oJwDFIpvwbFBA23pICYq90sPq+19p15QI7hA1XrGYO1w2tFKOk53yI+uD
	NUpx6WPF2c8cuzCMXIYEqIrmq+dmV7vV7jlrRDZ5Em1R5gR5ySOqMVeT56jTbf8ZwnAq
	kEpR7c7aNZP7LYChgOVUBVCCovNfQW4W4ZYdZ9YbBTnFSZJdX3cJ09/WWXowtzVV5wQN
	eUT2w3q+pnkpjCHAL0kVAM+1kcu0gDaQEosC01fOldw04NIqN2krIQkNBPT8YG7sirim
	PcouETgvgIzvYbb3ONsYb8XtpPzbH/xtMF0QnZ4RyyMSVotgAEMTghYSJw4A3s0FtNFp
	xnWw==
X-Gm-Message-State: AE9vXwMkAIJUC+4ZbJVJfCbM/nE6iFqWb+Dtx89C7U0RSNwbEM66J6S/g8dO4YNAjYew6Q==
X-Received: by 10.194.172.42 with SMTP id az10mr174613wjc.178.1473374203097;
	Thu, 08 Sep 2016 15:36:43 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3574.dip0.t-ipconnect.de.
	[91.10.53.116]) by smtp.googlemail.com with ESMTPSA id
	d62sm267938wmd.7.2016.09.08.15.36.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Sep 2016 15:36:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2016 00:36:21 +0200
Message-Id: <1473374183-3022-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/3] geany: update to 1.28
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
X-List-Received-Date: Thu, 08 Sep 2016 22:36:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/geany/{geany_1.27.bb => geany_1.28.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany_1.27.bb => geany_1.28.bb} (76%)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.27.bb b/meta-oe/recipes-devtools/geany/geany_1.28.bb
similarity index 76%
rename from meta-oe/recipes-devtools/geany/geany_1.27.bb
rename to meta-oe/recipes-devtools/geany/geany_1.28.bb
index 15b21da..da97090 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.27.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.28.bb
@@ -10,8 +10,8 @@ SRC_URI = " \
     http://download.geany.org/${BP}.tar.bz2 \
     file://0001-configure.ac-remove-additional-c-test.patch \
 "
-SRC_URI[md5sum] = "7c23f835f45def89d10884c1343fa29e"
-SRC_URI[sha256sum] = "846ff699a5944c5c3c068ae0199d4c13946a668bfc6d03f8c79765667c20cadf"
+SRC_URI[md5sum] = "39a29deb598e9e3503ee7d9d5fb51a34"
+SRC_URI[sha256sum] = "f73a3708f1a26e9bf72da564d5037d6f7fedca2e0d6175db0681c2b672100a5a"
 
 FILES_${PN} += "${datadir}/icons"
 
-- 
2.5.5


