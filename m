Return-Path: <net147@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 05A2A6B0A2
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jul 2013 11:32:09 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rr13so2850953pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jul 2013 04:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=jg7/nr+vs270i5v86o9XZ8a2jVdL66PUTuJgkyvX4uk=;
	b=CU33zp6vSSwBBYDoyanRzNQI7jc1rxTs5hK4gz0f8d9Pc8r6cRgf4q9FUmaRDcPDaq
	SpEbllTmtcZYnVHutT0vydkwF29bvFPT74QUv2b1xaUAmFjsW4AbuOdtCMkr3mG20xo0
	Wm6wLDcjvVYD2C5tPtC10jhzZBnOqfsrMeSTpgiV98xw+i/hc/e2tt9CsIDccuMR+Kax
	8pdz6PsfbaK7RpGxJNo/GTX0XeROI/zapT3sFqMmnRmLKVq4D+goPjzsJvBellPH0rnN
	5TIcSezdqos5bMBsvE9ut/mqtsi5cvMztE0LK7+swo0bW5mRyrtSPCwnOGGM7sfKOkmi
	a9EA==
X-Received: by 10.68.197.136 with SMTP id iu8mr13242534pbc.183.1373110330193; 
	Sat, 06 Jul 2013 04:32:10 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	eq5sm11895672pbc.15.2013.07.06.04.32.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 04:32:02 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Jul 2013 21:47:38 +1000
Message-Id: <1373111258-1371-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] cherokee: remove empty /var/run directory
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
X-List-Received-Date: Sat, 06 Jul 2013 11:32:09 -0000

The /var/run directory is already created by base-files.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
index 1510e70..265e24e 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
@@ -32,6 +32,8 @@ do_install_append () {
 
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/cherokee.service ${D}${systemd_unitdir}/system
+    rmdir "${D}${localstatedir}/run"
+    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
 }
 
 # Put -dev near the front so we can move the .la files into it with a wildcard
-- 
1.8.3.2


