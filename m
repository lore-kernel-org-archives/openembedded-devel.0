Return-Path: <gizero@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 690AC77C31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 13:26:05 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id l44so4185033wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WUj8XoBw0HixiCoTZe89cQQ0/0myHGQ5O3hTF4R9mRg=;
	b=rGhS8vSuId2bFWjyLjvAh57r459OguAQMXt9U7YiFvAnjr6UIHYs3hJ/Jj3SSsKc37
	5DPzjG1XgaGtHWBVHChbPKUs7urIp2oN2ONEMfZY2VPVG+OgJYpEVdqJf57VYqsJrGZX
	r21B1AbfYMAnfc7PBEUU4GRWTSBTn37IkAnxR3uBGGkUj2/vA8quvsaogf7ObkX6K2mn
	lflAGVrgpX44JbIsfURL0zNlalWeCl/bWt+JTdl4mHzLBSwMY3pN1CEX/IDDYe/4TCl+
	d382mHGGP6VOCk1gibOYNedxiDD3iPu1N/wZEJolzSnpXinpxbxaexFfAsaSb6cefMAB
	UU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WUj8XoBw0HixiCoTZe89cQQ0/0myHGQ5O3hTF4R9mRg=;
	b=Y4Hk8E1Ak63xrAV+8WH/qUiXsb6VSyqgFtoseN4Mkqgulg0Hmy41068tlL/ry/9gW7
	iH5voRN/nTbsaLhaBI9KYGRG5TnSJ5xAHhsCRNqAI8OK73BWws/r0wVFUFSgZIDiylOH
	NO1c+GuzHjf7dIr3GhBuntzJ3m8UDN4+6Qa+flnlqEVxRlpCdkKEo91zTjNm6jjN8agW
	snQZ2rc6hJFvwJTPkHRRiQyzPMCKNrUhhYqc8o5nHmaiv54EME1onDtwGvtx9LOJRGQJ
	aW9UXbTNC+su/ri7oS6IFwbg1U+oZrzDlc2GHqvhJJv1xIGbXH7osC+1+AytfuoPEZ6D
	cK+w==
X-Gm-Message-State: AN3rC/6GC9+pD9OlRXGPFcGxgJQ1ZZnDHD3rIV2UsRm0Os97OfR11lzcyKnlj5FJ5EO2Fg==
X-Received: by 10.223.128.99 with SMTP id 90mr3130632wrk.101.1492003565938;
	Wed, 12 Apr 2017 06:26:05 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host193-245-static.58-79-b.business.telecomitalia.it.
	[79.58.245.193]) by smtp.gmail.com with ESMTPSA id
	e129sm6606102wma.13.2017.04.12.06.26.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Apr 2017 06:26:05 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 15:25:56 +0200
Message-Id: <1492003558-8647-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH 1/3] openvpn: ensure ${sysconfdir}/tmpfiles.d is packaged
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
X-List-Received-Date: Wed, 12 Apr 2017 13:26:05 -0000

The file was installed but never packaged, ending up in no systemd-tmpfiles
configuration on the final rootfs.

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
index a3ef765..5fd714a 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
@@ -61,6 +61,7 @@ RRECOMMENDS_${PN} = "kernel-module-tun"
 
 FILES_${PN}-dbg += "${libdir}/openvpn/plugins/.debug"
 FILES_${PN} += "${systemd_unitdir}/system/openvpn@.service \
+                ${sysconfdir}/tmpfiles.d \
                 /run"
 FILES_${PN}-sample += "${systemd_unitdir}/system/openvpn@loopback-server.service \
                        ${systemd_unitdir}/system/openvpn@loopback-client.service \
-- 
2.7.4


