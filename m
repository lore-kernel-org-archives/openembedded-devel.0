Return-Path: <jatedev@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2870B65FF2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 14:17:46 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id l6so10398408oag.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1PiFYfFLf3Bz4M5QqPKSJdEtP0yx1bRK4/3vlg0ZxhU=;
	b=WeK2X3g91Uvuqgwj9huy/IHdO0eH3az04cbWy6ojPK7LGlhl888cBaow9nsAS/DQ81
	j+RgjVwITHHj6y29sKH55jNkYCeBeZ0kiBslH6HoXgaksRZXyKl3awfklpnEibfCJwly
	nxui5mMoA2yfsWYlgl+ffCl36EZWKJdYXoY+bFbU6NEgYqeLVyDvcwWN4/GNeSqj/aBI
	JQ5wGaTYE2M//QQ1D3DmaEkje0SZHT1lkljH4LjBHrX4TFA9GIPBd1d22yGoE65MItvm
	cmWOBw6AB3oCwLzpqro3Zf/VdsJ6iV8sl/3yd8iG8Dq9SfuyYJd7iWEgMvGouLvYKRny
	03vw==
X-Received: by 10.182.106.99 with SMTP id gt3mr3694404obb.24.1403533067078;
	Mon, 23 Jun 2014 07:17:47 -0700 (PDT)
Received: from STSPYoctoBuild.syntech.org (exchsrvr.syntech-fuelmaster.com.
	[199.44.250.2])
	by mx.google.com with ESMTPSA id rs2sm5080788obc.20.2014.06.23.07.17.46
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Jun 2014 07:17:46 -0700 (PDT)
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	sgw@linux.intel.com
Date: Mon, 23 Jun 2014 10:16:42 -0400
Message-Id: <1403533002-1118-1-git-send-email-jatedev@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] Install list-records with resolvconf package
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
X-List-Received-Date: Mon, 23 Jun 2014 14:17:53 -0000

The resolvconf script uses /lib/resolvconf/list-records, but the recipe
does not install it. This causes an error when /etc/resolvconf/update.d
runs.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 .../resolvconf/resolvconf_1.75.bb                  |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
index 7310c83..77eac7a 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
@@ -40,8 +40,14 @@ do_install () {
 	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
 	install -m 0644 README ${D}${docdir}/${P}/
 	install -m 0644 man/resolvconf.8 ${D}${mandir}/man8/
+	
+	# resolvconf requires /lib/resolvconf/list-records
+	install -d ${D}${base_libdir}/${BPN}
+	install -m 0755 ${S}/bin/list-records ${D}${base_libdir}/${BPN}
 }
 
+FILES_${PN} += "/lib/resolvconf/"
+
 pkg_postinst_${PN} () {
 	if [ -z "$D" ]; then
 		if command -v systemd-tmpfiles >/dev/null; then
-- 
1.7.9.5


