Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 57A4D746E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:04 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x82so16785150wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=S9PLWJdrO9xOh5gbiOMkpRLsSEgysVhQwDlhV/14bxQ=;
	b=DFXfgGzla3EB15t3gbst84BoUlTcQIEiaIV8yiOEjj9gkQ3uclGYkLQFdbJ5P9O0j2
	8Idxv+Tt0ZtTJltOK6nl5Yc67fuYY7uy2ZzoYYRbtPsXh/v4V+8wKk2EzVhgDc7cH8f3
	k7NT02KL2czB6WKQ3NVYQrG9B2Lw6DUl22xTj6NcGKXEuPuQBvE81oIBlz/cAYfDzW1S
	VNnf/LplaXjo5vdzgqnMOChBwnCqOxk+nW0rieePMDZVOHaiFSNwdM2qd7ShD0qmJXqx
	phK4GovIsLR/bOjuthFzKuKRsl1MqE8HqReEfJSNMjy1bJHY8+ZA0ms3/gAAt7drNyT6
	KadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=S9PLWJdrO9xOh5gbiOMkpRLsSEgysVhQwDlhV/14bxQ=;
	b=GLopmkfVAkYYit3RAKe+o1gWCUFN+viR0rQ5cyzRidl5Tb+vGtrGqW0WfvrhaKp220
	0MRluNU2iBcAcatICKLHQIDJcWBQmH0c6T7W7x7buHvgPGyxk1+pvW9h3BAk33diwv4Z
	Kzcvh6/dNI2+nwaejkaRJjZsO+nZpmIMuUG00ES/7EZu1ERt0KVvLgQG5wPL/GOz2Vnp
	jHl8LddKgGL4eHmH8BbbLkryph04rNKk5ZQRoW35i/WbKoR/UOb2O1mixs956CjGcMGR
	pBXmrXDvkFWIx5ABJ7Ictnygvr6j/8nnHMom+rmntf3Akf6BKchUgRSb16kFqh0D62r4
	vEKQ==
X-Gm-Message-State: AElRT7G4xatCVLuBWiA2xb1vaFTySGXTTc12TPux/KVbZasojQlFKr8o
	kNXuFXj7wajABn2vaRZiEn6hjw==
X-Google-Smtp-Source: AIpwx49yvED1mAsIxnfihSSSk2HRSR+fX3s7yRuZNyBl3HT0Xt68Waz/VFOfS7fq5dcGryd1JBC1iQ==
X-Received: by 10.28.139.5 with SMTP id n5mr2247834wmd.85.1522416725483;
	Fri, 30 Mar 2018 06:32:05 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:13 +0200
Message-Id: <20180330133151.25882-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/39] cyrus-sasl: fix systemd related setting
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

The service file belongs to ${PN}-bin instead of ${PN}, fix things
accordingly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Acked-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index 64d1a76d6..6dbff87dd 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -75,8 +75,8 @@ do_install_append() {
 USERADD_PACKAGES = "${PN}-bin"
 USERADD_PARAM_${PN}-bin = "--system --home=/var/spool/mail -g mail cyrus"
 
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "saslauthd.service"
+SYSTEMD_PACKAGES = "${PN}-bin"
+SYSTEMD_SERVICE_${PN}-bin = "saslauthd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 SRC_URI[md5sum] = "a7f4e5e559a0e37b3ffc438c9456e425"
-- 
2.14.3


