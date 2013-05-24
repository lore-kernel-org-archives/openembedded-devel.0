Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id A45D7616E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 19:38:11 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id md12so4589696pbc.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 12:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=qCvtwsMCPNj97QQkmoAMx8CZW3aDae/iRZNUAMNZrvQ=;
	b=FiqCgRv+CZ0rDTfzUQUUQBSENslzx9XfDlpiVybwDU1ZFofD1OYlqZythcyrz8Rvqk
	z5Ut4rpQOKXqGvH/3D6HGypzI9T2I/+N4Z4dof7KF8a0rx3g1hCnynfViERjWJxQ4rnj
	bqSA00ZbYYmLd1F2hKTRt2HzunQv0EJ8BZmlfQ+90pSeeINnDfK0EPcmP471kp1d3dR4
	A963xI30i3e+8mxv/CHoGlsdilm6VNTDM3Z7tykCgfnZ0CQIxZCygg8onmvGM2+o/Aas
	XmlUXEEaRMUszWAdrsN9b7Jlh/+P0pSiLGIHnxdBIt8PmQaqeXpH03l2hQlXBEIzayTC
	i0Uw==
X-Received: by 10.68.219.70 with SMTP id pm6mr19194112pbc.154.1369424293095;
	Fri, 24 May 2013 12:38:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	cd2sm17284987pbd.35.2013.05.24.12.38.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 24 May 2013 12:38:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 May 2013 21:37:47 +0200
Message-Id: <1369424267-15051-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1369424267-15051-1-git-send-email-Martin.Jansa@gmail.com>
References: <1369424267-15051-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 3/3] connman: rename bbappend to match new version from oe-core
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
X-List-Received-Date: Fri, 24 May 2013 19:38:11 -0000

* removed PRINC to make it easier to remove .bbappend if this
  functionality is moved to oe-core
* removed SYSTEMD_SERVICE already set in oe-core's .inc file

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../connman/{connman_1.13.bbappend => connman_1.14.bbappend}           | 3 ---
 1 file changed, 3 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/connman/{connman_1.13.bbappend => connman_1.14.bbappend} (59%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.13.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.14.bbappend
similarity index 59%
rename from meta-systemd/oe-core/recipes-connectivity/connman/connman_1.13.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/connman/connman_1.14.bbappend
index 61292ad..f006b3f 100644
--- a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.13.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.14.bbappend
@@ -1,6 +1,3 @@
-PRINC := "${@int(PRINC) + 2}"
-
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "connman.service"
-- 
1.8.2.1


