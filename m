Return-Path: <jpuhlman@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 313DA610D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 22:39:41 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x7so117862pgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2020 14:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cyXs3lhZmbKgxZBehZ7e50K+qH1P3eNGIQPoB3c1qgE=;
	b=DmSmhY99atFMhHg8VOpUEb/8SHSU1whFvMTUvK0rUX7uMgwMVAxwXtxIG60w9BctBC
	dJI8sQU7pakjUBzR0UpFmRD9qknjJxnmBtM9GL0nohMTplD8QIkcxTOGIYihiozwlYYR
	gfYJTRWa+4iSnKv+eqtnFTflJIelnuHlFjagUs+7zf/RH/fLzardojRtSMjCFLfQxIyL
	OCKQ4bzHrFfS9TT47oS77XywwJsrX5MpeHf1UnbPW8XcW/DXkZ043cy+EWntPzfn6plE
	6yv3X3KmbWT23L245ZCAccIypze5QBGcJjD/K7esIgDWht7aE0w4NTmRIRmrBL4ch4xC
	ikvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=cyXs3lhZmbKgxZBehZ7e50K+qH1P3eNGIQPoB3c1qgE=;
	b=NMFvFaSbbwtM/ZIH1sr1Qg7m3Oy/QSjqEpPdMK+AP+XyG2mPdh9NZt6aXFHQtRyzRd
	Hfed06zfIYoFg/MSSAY+lc3KPqw+Kv0/IBq4HQoS1BGoXEPEuYy4cSZ3PI2s/f8GOHGW
	yQP8MXnDwgYGg2IE7emG+O38H2Ofy4AiayoaBTx9Ldzfbz4zmN4/w5gTBe9WLB6h1Izv
	CSaciU58K3GWLOSI0G7dRALSLDwvu6h7crrzbsvqazPNGv+HLFnLTH9q+pF99vf97Yb5
	6d13GsFSnXRG5atfT+R3EBzdLN8M8X9HI5q0FBTkLASJAnEFPY9jJ/AdocdNas2AwaI+
	xsuw==
X-Gm-Message-State: ANhLgQ3QTUmtEMniUjMDmy9nBGnQsrg4z9KtKuQVF3en+iM+FCoqOh56
	nKXhepsek3s29RqcISJQ7Mt/7ORBcPw=
X-Google-Smtp-Source: ADFU+vvhO3vZ14v9TmyRvxhRfe/E5pkeWspAsikmPUIFN3LmGewwRW5qjY1tD3EyAuckClDsT2bzkg==
X-Received: by 2002:a62:a515:: with SMTP id v21mr629991pfm.128.1583447981957; 
	Thu, 05 Mar 2020 14:39:41 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	n9sm29514035pfq.160.2020.03.05.14.39.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 14:39:41 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id BC98F2A07BB; Thu,  5 Mar 2020 14:39:40 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2020 14:39:32 -0800
Message-Id: <20200305223937.12418-2-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305223937.12418-1-jpuhlman@mvista.com>
References: <20200305223937.12418-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/7] quagga: make version.h a multilib header
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
X-List-Received-Date: Thu, 05 Mar 2020 22:39:41 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

version.h contains the configure options passed during the build
which differs between multilibs

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 3494a4398..134a33d47 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -40,7 +40,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
 PACKAGECONFIG[pam] = "--with-libpam, --without-libpam, libpam"
 
-inherit autotools update-rc.d useradd systemd pkgconfig
+inherit autotools update-rc.d useradd systemd pkgconfig multilib_header
 
 SYSTEMD_PACKAGES = "${PN} ${PN}-bgpd ${PN}-isisd ${PN}-ospf6d ${PN}-ospfd ${PN}-ripd ${PN}-ripngd"
 SYSTEMD_SERVICE_${PN}-bgpd = "bgpd.service"
@@ -108,6 +108,8 @@ do_install () {
     sed -i 's!^PATH=.*!PATH=${base_sbindir}:${sbindir}:${base_bindir}:${bindir}!' ${D}${sysconfdir}/init.d/*
     sed -i 's!--with-libtool-sysroot=[^ "]*!!' ${D}${includedir}/quagga/version.h
 
+    oe_multilib_header quagga/version.h
+
     # For PAM
     for feature in ${DISTRO_FEATURES}; do
         if [ "$feature" = "pam" ]; then
-- 
2.20.1


