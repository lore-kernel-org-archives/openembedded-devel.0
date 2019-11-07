Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 71D907F79E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 11:44:05 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id c22so2070601wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2019 03:44:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gtUPxU6Y/PcnF8hEybk7ZwLTGjFd/4yHpvp+vhKF2WQ=;
	b=Z/3MkzMgv5duIYksN6mab+g7Hws38Dmr7X6oPAI5M9wlavJPbpXFzLO72kAIr1TKVV
	bCEAKg0pd9CopBAu9bNdjTdionfnmIp23VGNVpxDlD+LrihbSCk0+SvlzoSSICXcinwC
	9J5LiDiI1Qt+ZOuMURcEG8CtdNYr3xQcTcHu8ZqLpVo9xvwtksBEOoe1ernhPjpSSHZv
	SBb1KW1FOIsG4oyrOMg2ZL8Qn5gSOYrswwGJv5tjxbGouxZQlHFhZKalYRojCU26Vk0Q
	fA3z/+NRVfCA8EDrbaZ5UbvIowq5IIU6FixdMV00t2GmJ3R3sIcGC8fYguO68uXMl5Aq
	1/iw==
X-Gm-Message-State: APjAAAUuuCw9+s7OxEZX4uzd7awXOwkaRT+eDN/7z/Ln5HWIaOMlGv/U
	6hIkjMoKkHAeoUfyO0cQesNLP3vk
X-Google-Smtp-Source: APXvYqwya96/O5H4ez1n/1QwORXkRthRj2QMiDszJjeH1dK3SstXK+NW+NY0en+UpZOF5E+RWWXD8Q==
X-Received: by 2002:a05:600c:254:: with SMTP id 20mr2632988wmj.6.1573127046203;
	Thu, 07 Nov 2019 03:44:06 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 76sm2283613wma.0.2019.11.07.03.44.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 03:44:05 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 11:44:02 +0000
Message-Id: <20191107114402.933-4-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191107114402.933-1-git@andred.net>
References: <20191107114402.933-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/4] nghttp2: allow to build a -native package
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
X-List-Received-Date: Thu, 07 Nov 2019 11:44:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will e.g. enable us to use it from nodejs-native.

Signed-off-by: André Draszik <git@andred.net>
---
 meta-networking/recipes-support/nghttp2/nghttp2_1.39.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.39.2.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.39.2.bb
index 7a475050f..c27afdb55 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.39.2.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.39.2.bb
@@ -28,6 +28,7 @@ do_install_append() {
 PACKAGES =+ "lib${PN} ${PN}-client ${PN}-proxy ${PN}-server"
 
 RDEPENDS_${PN} = "${PN}-client (>= ${PV}) ${PN}-proxy (>= ${PV}) ${PN}-server (>= ${PV})"
+RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}-proxy = "openssl python3-core python3-io python3-shell"
 
 ALLOW_EMPTY_${PN} = "1"
@@ -36,3 +37,5 @@ FILES_lib${PN} = "${libdir}/*${SOLIBS}"
 FILES_${PN}-client = "${bindir}/h2load ${bindir}/nghttp"
 FILES_${PN}-proxy = "${bindir}/nghttpx ${datadir}/${BPN}/fetch-ocsp-response"
 FILES_${PN}-server = "${bindir}/nghttpd"
+
+BBCLASSEXTEND = "native"
-- 
2.23.0.rc1


