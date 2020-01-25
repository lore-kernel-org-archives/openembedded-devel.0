Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 95F377FA0C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 14:40:47 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id c14so5520919wrn.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 06:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mi5RXHafUjfDCO3I1SLreCmF1OxpUoJ4gjpb7ot3Uf0=;
	b=FYjyQKyLmd9CKPOeHs+GpAbD75IzZ8d5WPexqy1cHd0+hZpaFVMYb9qJXPTzYQtPQs
	I+SONJ1bO5DwpbMVoucSSkm0LYCeQeNhj1d/K12r6rNPoDJwoW9lhQ1fi4z2YCuiyctD
	VpI01P5HL/7bs2QhwyKyGxdyGmxMMXogVjcFCHmH+IaxGCQnro5v54Z6Hqptfz4j0nW4
	dB7freAK3DYaNVyUdznWDWm6YONCbTVFJ0BKMb3+t+OBcG2dQ5qoJ6B0Tz71vzUF1QrV
	oGbJbtK5PHWR4vk3GS/FfhbOA66HnuVbuKXeFJgYTPj1WORuGmvRP5LfyZg/cPVkM3XP
	lkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mi5RXHafUjfDCO3I1SLreCmF1OxpUoJ4gjpb7ot3Uf0=;
	b=ndsID9J2a73dL6zckJZh0juJEYQXv3Z4hkBsxdzTxt6zSSapfKvIHBZkzuGuAnoRLQ
	qNstYhtSxBjl2XWQfj6V/cMnjlc+uH0+A8Qe7oydHxzjjR3Xd6MuvjlTM0c14xA0RbVw
	HWxKa2cSmidnfU8uGVZlUoAxcSukCQDSKk2HGgUXyx/qT8H6wmPuBHBgS5xoVolM7Y3i
	1hmbhBNIMGpgWUnO8YN7YpP/kVc7hcG5Vatmn7UUzDM2w+sQzxugM3sHxX3DZLrWDOpD
	WB3e0vijFHoDHd17kC6Dp9BbaHGOsNLjI8mYLd1hVFsqvyuPkUBMKP73lbXZZrGAImSs
	cYeQ==
X-Gm-Message-State: APjAAAU/yjNfIkXpJtirH16b3WcFO5s+PXEuJM5dqj3fxZmVWmMSLHB2
	cvSXPnBE+5Vxhlvpk2wkfxwb5XXg
X-Google-Smtp-Source: APXvYqxh/TGVVca/7w+Un4DxOA1z36MgiB7TvMV387fycLROW01i+NRonZTbPS7CWuNJEW4LDZ19Dw==
X-Received: by 2002:adf:82e7:: with SMTP id 94mr11712147wrc.60.1579963248047; 
	Sat, 25 Jan 2020 06:40:48 -0800 (PST)
Received: from localhost.localdomain ([93.68.129.122])
	by smtp.gmail.com with ESMTPSA id
	f1sm10606984wmc.45.2020.01.25.06.40.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 25 Jan 2020 06:40:47 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jan 2020 15:40:43 +0100
Message-Id: <20200125144043.18259-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200125144043.18259-1-costamagnagianfranco@yahoo.it>
References: <20200125144043.18259-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 2/2] boinc-client: cosmetic changes, such as unifying tabs VS spaces and adding cosmetic newlines
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
X-List-Received-Date: Sat, 25 Jan 2020 14:40:48 -0000

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.16.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
index 0780993db..c52828018 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
@@ -73,15 +73,16 @@ do_compile_prepend () {
 	sed -i -e 's|^sys_lib_dlsearch_path_spec=.*|sys_lib_dlsearch_path_spec=""|g' ${B}/${TARGET_SYS}-libtool
 	sed -i -e 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${B}/${TARGET_SYS}-libtool
 }
+
 do_install_append() {
 	if [ -e ${D}${nonarch_libdir}/systemd/system/boinc-client.service ]; then
-                install -d ${D}${systemd_system_unitdir}
+		install -d ${D}${systemd_system_unitdir}
 		mv \
 		${D}${nonarch_libdir}/systemd/system/boinc-client.service \
 		${D}${systemd_system_unitdir}/boinc-client.service
 		rmdir --ignore-fail-on-non-empty ${D}${nonarch_libdir}/systemd/system \
-                ${D}${nonarch_libdir}/systemd \
-                ${D}${nonarch_libdir}
+		${D}${nonarch_libdir}/systemd \
+		${D}${nonarch_libdir}
 	fi
 }
 
-- 
2.17.1


