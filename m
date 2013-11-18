Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 089786D2F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 22:33:15 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e51so2654034eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 14:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4tsx6e3Ssh8qW0VVLED3HtpcS0yZM9tB83fbYwXgiKQ=;
	b=KCJWEY8VjuObUeXWBKrljf+8761U5EFxzsXsMPB8HFm02o2Ooa776FBQo7AqZGnB36
	mawE0E9mBTr6EowCc9imrq2FN5P7yNCEzEyIZ4MJco/GgzIk25JqC+6/R5TwY9VPp3Vp
	AGTRPaHoLdaSCmFpr7n32pnGvaU9pHDO9L5IW6euOHaelUyCOtOz5AgsMFj0k62Rne/C
	MzK2be5qF5iCAauglceGAPlUuJWaZGi+wIq0BazXcEpLwajxUocPwTID7/2qxPNRZ7Ef
	/CGUpOKDDblV3KOaiCNeequSPGytA2YEnKi6VFMiEXrll3DP7r50RWOyBf8EH6WanJk3
	uz6g==
X-Received: by 10.14.221.73 with SMTP id q49mr16037580eep.25.1384813997454;
	Mon, 18 Nov 2013 14:33:17 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	g47sm42130379eeo.19.2013.11.18.14.33.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 14:33:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2013 23:33:16 +0100
Message-Id: <1384813996-9695-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-systemd][PATCH] ofono: Rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Mon, 18 Nov 2013 22:33:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../ofono/{ofono_1.12.bbappend => ofono_1.13.bbappend}              | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/ofono/{ofono_1.12.bbappend => ofono_1.13.bbappend} (61%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend b/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.13.bbappend
similarity index 61%
rename from meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.13.bbappend
index 914117a..17a3124 100644
--- a/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.13.bbappend
@@ -1,9 +1,5 @@
-PRINC := "${@int(PRINC) + 2}"
-
-inherit systemd
-
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "ofono.service"
+
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.8.4.3


