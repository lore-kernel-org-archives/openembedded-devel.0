Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id C15AC7FD28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 18:52:25 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m24so2679845wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 10:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OIeSQRjdzPKlBSSbyPThwrEniLKYAXxaN6gQ8YeSIQM=;
	b=GgQ9Fg2McBKFK7JDrkZP2lSfs3kRkx1JT9HvTgDvt6ukY1EfxYxqvNgQ6uftlKJKx5
	H65HKc60XQKFwjYB7CEKIOGHja4Wi2J3483E6/45WlbL46fc+L7dyNruT1hwKkbTLor1
	j0jYyybKILo0pZq5WNpVIVnFwA2005iPsN9+w9YNJJnLARLz2i385wfPaws41npHw4nP
	6bBZQF0/fHwaEElcFuC67uZUJKVmo6LXktuAF1vVuAnruEryKCQmtCqSwi3UaV4GS1CX
	bCWLTcaQWrq+w8q9Dp8TdRoLuauUNHhXsPoAjsmJSWSOefYHoEpyWsBboEnfkd2dJ10y
	2Dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OIeSQRjdzPKlBSSbyPThwrEniLKYAXxaN6gQ8YeSIQM=;
	b=J6Mf8ylgBL404YVKMZMbpcCi4KO73gUNOg0ye/468ImFnfSLyVJzuezZMmHHwBPOzw
	ClHfVA2Ho6g3l3ohdsy0iudZN8AEzJcO8/ZWRcNnWSKVAyN4zQB/HarR/G+TFVJAtTum
	DlARlr6yi1Q0PHDXdrXgAVj+5+Pfyte2MkqF4DPezwNwW+279ALucZaFKPTs4YWwbduT
	qc2ntN5YSPewmBqfcQHGgXZSR1axWg4vRlZb3xGJ01vY0qVX49N8UYZ9cdsUcN59WJCa
	3FK6i+BXtacqTn8r8iZJxky00kiBqhqrUDrx0SalA5sh8DX3ByiQVRunQZmjGf6LZPqc
	pCSQ==
X-Gm-Message-State: APjAAAW4yWZYXarlUmZOlDwV5QLXYYsTfx9P1bNgGRZM6+21vnnNNez0
	XlN2NviEhiMmKlqxIBYtpw9F/pyg
X-Google-Smtp-Source: APXvYqycWs2r3dKMswZcUwEHa59/J8bq5EOqHGOoOP7EsMM7EhKoxguTi9Y5GTNIz8GUjS/Mu0ylbw==
X-Received: by 2002:a1c:a9c3:: with SMTP id s186mr5034056wme.64.1579978346248; 
	Sat, 25 Jan 2020 10:52:26 -0800 (PST)
Received: from localhost.localdomain ([93.68.129.122])
	by smtp.gmail.com with ESMTPSA id
	b18sm12051677wru.50.2020.01.25.10.52.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 25 Jan 2020 10:52:25 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jan 2020 19:52:19 +0100
Message-Id: <20200125185219.9160-4-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200125185219.9160-1-costamagnagianfranco@yahoo.it>
References: <20200125185219.9160-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 4/4] boinc-client: minor cosmetic changes on bb recipe,
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
X-List-Received-Date: Sat, 25 Jan 2020 18:52:26 -0000

such as unifying tabs VS spaces and adding cosmetic newlines

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


