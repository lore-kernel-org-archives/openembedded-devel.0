Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D4E23787D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jan 2018 15:19:46 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v123so4235953wmd.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jan 2018 07:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zBqZzoxX4GN/d2zLEh+HeCVG3IluVd3YwPsd1Fo3rw0=;
	b=T6Nl0nZVBmQNMO7zXROl7qUCb0hQBfLzKQxcntl1FMkYgbgCTz6Y+6QEVKdmf0gFfJ
	nZEU7hhJw2gOu98o/RCL0zWA+1ikwVl8lc1+5GkJZq5tEzvVhDm1gFHlqBvE3uU46gJ1
	IjavFx9S7j2dliEvGW5dfazVRCnfZWKAXbxB9XD8XPTTfklFDxZpse9YZSdKpFzjM4tC
	XZPaAJqZkwsfyqLKCNmm5uRTnUVA66fC/zH16YVXhpnhzIUC9NsRskFLovD7vVTG2rCY
	2KnMe4jQw2GzriBtA62yF8au173mtT0vWyz64fDwTcWwRx63GjHcJtcEVuXq3rKDDxsU
	CFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zBqZzoxX4GN/d2zLEh+HeCVG3IluVd3YwPsd1Fo3rw0=;
	b=rLnNuNse6qLcpSLlQfERcF11qnyZDKXId6VxpXbtw7E78kVeJv3v2p+p51kPRfRCry
	L418Amt3Jvq76DGgvSc1GWkvhIn/sg/sOQSP+dLJ0H0XKkKWJNonylkpA9R6/247Bv3c
	dw6AftMmhq0aR69GAI8FLovzD55SFIo1oS+sWtj50VHMHxUXfJUb0+OkjP+JoqiwEXmt
	0piymmsbCd2H6SuT6raWiaAURKKQuRcBryO5QevaiMdg93uowsSczbuxVboRRnZmrM9l
	2/FwFHz3PCHa3Sttk7STS4+WdM0F4zDahUL12ARi0HW0tRNlQazuVGtjnwslwN0txLgI
	gf/Q==
X-Gm-Message-State: AKwxytcDH1M2GOUGPLobbVnfDA2KQJDhdXlzWAbAb6K74q4LDe3zRu56
	Y3W/YTdSMRShdKKr4VITQTS/Uw==
X-Google-Smtp-Source: ACJfBouGqumafbBioVTox1e5cu4JeC1pvYqBzuj5yQNR0F87SXF0MxSPYJRIFnaOJHmS/VrhA57bkw==
X-Received: by 10.28.213.77 with SMTP id m74mr5286964wmg.137.1516375187374;
	Fri, 19 Jan 2018 07:19:47 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id n74sm5268605wmi.1.2018.01.19.07.19.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 19 Jan 2018 07:19:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Jan 2018 15:19:41 +0000
Message-Id: <20180119151942.19731-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180119151942.19731-1-Martin.Jansa@gmail.com>
References: <20180119151942.19731-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] freediameter: add dependency on virtual/kernel and use MACHINE_ARCH
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
X-List-Received-Date: Fri, 19 Jan 2018 15:19:47 -0000

* TUNE_PKGARCH cannot RRECOMMEND MACHINE specific kernel-modules
* without virtual/kernel dependency (which isn't really build time
  dependency) the QA check won't traverse the dependencies correctly
  and shows following errors:
  ERROR: QA Issue: freediameter rdepends on kernel-module-ipip, but it isn't a build dependency? [build-deps]
  ERROR: QA Issue: freediameter rdepends on kernel-module-sctp, but it isn't a build dependency? [build-deps]
  ERROR: QA Issue: freediameter rdepends on kernel-module-tipc, but it isn't a build dependency? [build-deps]
  ERROR: QA Issue: freediameter rdepends on kernel-module-udp-tunnel, but it isn't a build dependency? [build-deps]
* also change kernel-module dependencies from RDEPENDS to RRECOMMENDS
  because the kernel config might include these directly and then
  freediameter shouldn't fail to install

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-protocols/freediameter/freediameter_1.2.1.bb          | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb
index 92cd24c3ae..c556eb48e8 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb
@@ -7,7 +7,9 @@ Accounting needs."
 
 HOMEPAGE = "http://www.freediameter.net"
 
-DEPENDS = "flex bison cmake-native libgcrypt gnutls libidn lksctp-tools"
+DEPENDS = "flex bison cmake-native libgcrypt gnutls libidn lksctp-tools virtual/kernel"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 fd_pkgname = "freeDiameter"
 
@@ -121,8 +123,8 @@ FILES_${PN} += "${libdir}/${fd_pkgname}/*"
 
 RDEPENDS_${PN}  = "glib-2.0 gnutls libidn"
 RDEPENDS_${PN} += "openssl openssl-conf openssl-engines"
-RDEPENDS_${PN} += "kernel-module-tipc kernel-module-sctp" 
-RDEPENDS_${PN} += "kernel-module-udp-tunnel kernel-module-ipip"
+RRECOMMENDS_${PN} += "kernel-module-tipc kernel-module-sctp" 
+RRECOMMENDS_${PN} += "kernel-module-udp-tunnel kernel-module-ipip"
 RDEPENDS_${PN}-ptest = "cmake"
 
 INITSCRIPT_PACKAGES = "${PN}"
-- 
2.15.1


