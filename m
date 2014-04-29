Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1C6DC609AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 19:03:47 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so635206eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 12:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rG2Wfh3lCCcEnqKEHjS2QeWlQRONbj9POfYxsI3p4bk=;
	b=HE6qMwAkfYBEUOHnbm08YmHjY+5DgG/k18G+uT2VAbTgggzJJawWIK+z7lvJ72czf4
	YY+FmYNybpAUaR8PQT+sgMwN9eystB2o+klpY+nU4aqf9iVTIwEfFf8UA/8U6czqnwlu
	TnqSfbh73Am7/KY7PonYSRFdQXrw4j5IvflnPpflMKwZQd2yzXvh5FI6HPoo0fyUhdZQ
	UE+ZMvmbcvYZ+if7Y3YyQNWyrDD7Oi+XO1yxm6c2tjCRwkj61LW01fIB5ajIE7WHnTCN
	Yunpmvjal+k2W0BVVhMHAd/rKOqAZvE+zFvkEjHWZzXuEOYg6gI3Qr28POKK+3uEX3Je
	KcZw==
X-Gm-Message-State: ALoCoQkNuez6QEQAP8TBNx2EYchNakyyWyYfWCF8oOyHAeNwwTrha+Haj2LJlI49uBbOLw7BhBir
X-Received: by 10.14.183.7 with SMTP id p7mr850407eem.107.1398798228416;
	Tue, 29 Apr 2014 12:03:48 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id y7sm61435888eev.5.2014.04.29.12.03.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Apr 2014 12:03:47 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Apr 2014 21:03:43 +0200
Message-Id: <1398798223-28617-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] espeak: install header in proper location
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
X-List-Received-Date: Tue, 29 Apr 2014 19:03:53 -0000

This matches debian, also provide symlink for backwards compatibility.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/espeak/espeak_1.37.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/espeak/espeak_1.37.bb b/meta-oe/recipes-support/espeak/espeak_1.37.bb
index c7f4b52..86f2c7a 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.37.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.37.bb
@@ -25,12 +25,13 @@ do_compile() {
 do_install() {
     install -d ${D}${bindir}
     install -d ${D}${libdir}
-    install -d ${D}${includedir}
+    install -d ${D}${includedir}/espeak
     install -d ${D}${datadir}/espeak-data
 
     # we do not ship "speak" binary though.
     install -m 0755 ${S}/src/espeak ${D}${bindir}
-    install -m 0644 ${S}/src/speak_lib.h ${D}${includedir}
+    install -m 0644 ${S}/src/speak_lib.h ${D}${includedir}/espeak/
+    ln -sf espeak/espeak.h ${D}${includedir}/
     oe_libinstall -so -C src libespeak ${D}${libdir}
 
     if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
-- 
1.9.0


