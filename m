Return-Path: <net147@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id C3F22731B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 06:13:41 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id x24so3513266pfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2016 23:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2+8DZZgi7Hf3fgynfqYhr53lISN8hjxBGWX2KbPybsw=;
	b=xwo+eETgwc+eXFBu0CZc/qtZ/JVDOB7xCA0ieEsHzvoxnVYiOdvK4hNGrTJtBVAHnM
	SygLwYAHNK0dve9vaA4JtwS4MtOz8Mochqq9uFvsZjCRijGEBoGkLP7RTAFE06pov0jf
	ei+Ua7Rr5U5qMNIrLqrV9uo0l1Cf+iQd5CYpNz+MdUx74M1CGkdAv4EOu50bcCntz4+O
	SGkbehXT3Qmx8kXUfXybY899Qx3FsvbJONrUo1kcJLD7NDmIwFVin5OmykFkIRdYDoRh
	OY1HHwTtXCwgeCpXu7dukaLqfDw+6gIIub9KjujMqXfX8hxUXBkjq1ZNJqzHlzJIHOeJ
	jVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2+8DZZgi7Hf3fgynfqYhr53lISN8hjxBGWX2KbPybsw=;
	b=QxdvFU4ipDSp4rhlmHGOyncNEWKnQ0rjKEkas1zrwUmtasgYIaJM8J8ZHRSvBYdXBi
	vY/dycb/VlhP5L6V9KXZUbN9hjiU0zsgWYDPxqCwaLJMPDPfgSj3lanYbxEdlmE2CnT9
	jQD4/I2jT0Yv2zHpjw+Mvb4GTSUb7R0vOhAeAnWKVDpDn0sh4UttaC0V24PEp40Yj7W5
	QOvyIlJyddDZypuGHMHxycGtAJDZB27FSxmAo6G2+/YL9WRjroeODkGX++bNwWdrnbJ4
	DADcAKYqqsVw0i9B09FBwtoZOSfcoA9zQIccA6JdkflCN7NfJssvbcBk51fzw9uJQ3YQ
	li+w==
X-Gm-Message-State: AE9vXwPsqCHquhfEuBS6hRjkpML4JAfOZkmNNNlWJ1GDoYnI2CWuIJdc4Z17ozK+kKb52g==
X-Received: by 10.98.24.70 with SMTP id 67mr3572670pfy.52.1473401622814;
	Thu, 08 Sep 2016 23:13:42 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	b88sm2055861pfe.66.2016.09.08.23.13.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Sep 2016 23:13:42 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2016 16:13:44 +1000
Message-Id: <20160909061344.3606-1-net147@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-qt5][krogoth][PATCH] qtbase: avoid qmake errors due to missing oe-device-extra.pri
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
X-List-Received-Date: Fri, 09 Sep 2016 06:13:41 -0000

An empty oe-extra-extra.pri file is created if it does not exist to
suppress qmake errors.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 81e808a..e532cdd 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -203,6 +203,9 @@ do_configure() {
 }
 
 do_install_append() {
+    # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory"
+    touch ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
+
     install -m 0755 ${B}/bin/qmake-target ${D}/${bindir}${QT_DIR_NAME}/qmake
 
     ### Fix up the binaries to the right location
-- 
2.9.3


