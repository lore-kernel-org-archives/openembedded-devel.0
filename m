Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7579E7FA32
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:07:03 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id k3so5739008pgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=D+XdUknhIN7HCRH6jN76vO/7O+h2pxcH3EeuQG5ESEc=;
	b=Y6umoeOC/7xFW70BsooQ4YS0QbJOmWm9fK35Hkcum7nws3r5BoyOpTR/zjVOk6ib1p
	nNEAZ0GEamPXkurdM/P7kVOZrimE28FS8srmuYyPxjPcFgBdEkGc2VOCEv+ZrE8RwTs3
	A5xV3DLa/64h8Z9nISh0Xn5f8BHhl79wtNoNUyLQWlv6r+snNVMAsUp6Mo2yXTW9aPzB
	BMArR5TdqbESfGmSOJuYvWOwL6iYBjqIVy/AJPX/3DlETeKfmMwbXHulYjrifl1xmrmO
	RwHHag8p6CcV0iLi8EUYiuJfS5zV/l96wKEnRX5b06meLPh/RzC9OojVyBfsg0l7uGUL
	TtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=D+XdUknhIN7HCRH6jN76vO/7O+h2pxcH3EeuQG5ESEc=;
	b=hgokmL/9Qn36nT2D3+b15ObCHGUIC+uEV3lTr5CFaUPC+qtiTs6TCJJI8clrUDm/Zi
	ETbxyPhPm+FSv28lM+LGFU5sutH38BR/iF0CoxDFGxxJFkjvHeSNaVVoppt7NHNjBbRY
	FoozralW/KBVvOzkdHn1sk/2PndiaDVNNYNEEE3TR1lZ0+Xp2taxEgKguVviWUtVuymp
	UrEB36fC3Ho/OPnrKwlNBOSueiJQVK0kJYVfPpXyxGuXCcMaEJXqRL6+9er1dUumVKY1
	9LmzccQ5zQLw4QI9LRahHbux68oU0BFA4EWDX0NXW5iSX5GPcsa95g0vbvEuQqoyrXa5
	cZHg==
X-Gm-Message-State: APjAAAVtzm7ltdGg/jj+aP/w+GWdiOddUdROyuMcFcgROfz20P3byxmW
	r5XEtGrpvE0SH4+VSIW35KpSsv2R4mI=
X-Google-Smtp-Source: APXvYqz3+0Vt21xjqLm51jYeL+kNaaqK9aAKGNSpVqXjTEfJbzf4AqnL4RLUI3X6wBM4O6BxvwoXGw==
X-Received: by 2002:a63:8041:: with SMTP id j62mr17802618pgd.41.1576886824157; 
	Fri, 20 Dec 2019 16:07:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.07.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:07:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:34 -0800
Message-Id: <20191221000635.1573390-22-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 22/23] boinc-client: Use nonarch_libdir for systemd_units
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
X-List-Received-Date: Sat, 21 Dec 2019 00:07:03 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.16.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
index ce3f691b2c..1b0af5549a 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
@@ -74,11 +74,14 @@ do_compile_prepend () {
 	sed -i -e 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${B}/${TARGET_SYS}-libtool
 }
 do_install_append() {
-	if [ -e ${D}${libdir}/systemd/system/boinc-client.service ]; then
-		install -D -m 0644 \
-		${D}${libdir}/systemd/system/boinc-client.service \
+	if [ -e ${D}${nonarch_libdir}/systemd/system/boinc-client.service ]; then
+                install -d ${D}${systemd_system_unitdir}
+		mv \
+		${D}${nonarch_libdir}/systemd/system/boinc-client.service \
 		${D}${systemd_system_unitdir}/boinc-client.service
-		rm -rf ${D}${libdir}/systemd
+		rmdir --ignore-fail-on-non-empty ${D}${nonarch_libdir}/systemd/system \
+                ${D}${nonarch_libdir}/systemd \
+                ${D}${nonarch_libdir}
 	fi
 }
 
-- 
2.24.1


