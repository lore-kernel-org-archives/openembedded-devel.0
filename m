Return-Path: <gizero@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB2077C39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 13:26:07 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id l28so4202515wre.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 06:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sZxD6Mazk1W7a80/x5iZiOotP+28Eme+2Iq1vX9Sn5o=;
	b=pejtCIa6Q5XyqkgcnLDME9kFIJxYHur9uJuyxWyvT0aBNTQ198Ac6JR6qL+s2qn/xF
	Oe57akH6bSE84axw76e+xtApEnVYKWGVqK6IOrJUlFuk6sJ+WezaL3E/unoVC3VJL/nT
	Blzzn51Jcg18oIH5t+WTZhvnAuf+W+Joaimv5+aY8FbpAiZgFJzPqQcq4AwiRg0MPIg3
	vOBrFNTpKmPgG0V8EvTA5tza4aEvwvVUAz0WFk/vYU3AJmxKapHCwx/ZXOqCSEi9qw+B
	3TSnkxXQkeWxTHL/+XVMuPa+CBhK2FzyL3cI3OYGR1/NkdHZ4TwRA4FQATTU0zYklkGJ
	DXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sZxD6Mazk1W7a80/x5iZiOotP+28Eme+2Iq1vX9Sn5o=;
	b=WmUfuT9b53yOFkbdXeV38Dzsq1MYAhBxEyxfIHfN9XMreGYJCRnk99Hbfbiwtx1ecr
	xPQ5ofpzn5uT3IqY1KlG74+LY5cwMx8np42qbCGWDTHo0gDn7xsQRzFrEuBNtUeizBmv
	f7pAHNv7HFSelbu1nChbGWbIZxL029A73zq+MuiQMOdHozAToUHVX/tmSYTg/Qp5fb6L
	veCj1Rd03HEcn0KzWsOjm80VcM6RYcgfORZVFqS5iu0AAm3BM/qA1ZqdEYXyWDCZC2hK
	VAkIZ4DLcas2CWPwk5Micb+gFFLRqlAFWqU+lUaTTDEWCJxdh1Ppe4QeqH7iY0y9psZd
	e2Iw==
X-Gm-Message-State: AN3rC/555GQx8enl7bsQ5Z2ROWMh29Bh+kcd+JLQjFhjAxFWU6jtPfXqIA8JIVEJCAMkWw==
X-Received: by 10.223.144.8 with SMTP id h8mr2878504wrh.45.1492003568294;
	Wed, 12 Apr 2017 06:26:08 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host193-245-static.58-79-b.business.telecomitalia.it.
	[79.58.245.193]) by smtp.gmail.com with ESMTPSA id
	e129sm6606102wma.13.2017.04.12.06.26.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Apr 2017 06:26:07 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 15:25:58 +0200
Message-Id: <1492003558-8647-3-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492003558-8647-1-git-send-email-gizero@gmail.com>
References: <1492003558-8647-1-git-send-email-gizero@gmail.com>
Subject: [meta-networking][PATCH 3/3] openvpn: openvpn-volatile.conf: avoid hardcoded localstatedir
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
X-List-Received-Date: Wed, 12 Apr 2017 13:26:07 -0000

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 meta-networking/recipes-support/openvpn/openvpn/openvpn-volatile.conf | 2 +-
 meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb              | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn/openvpn-volatile.conf b/meta-networking/recipes-support/openvpn/openvpn/openvpn-volatile.conf
index 4a3dc4a..1205806 100644
--- a/meta-networking/recipes-support/openvpn/openvpn/openvpn-volatile.conf
+++ b/meta-networking/recipes-support/openvpn/openvpn/openvpn-volatile.conf
@@ -1 +1 @@
-d /var/run/openvpn 0755 root root -
+d @LOCALSTATEDIR@/run/openvpn 0755 root root -
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
index 8dd4566..8892a9e 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
@@ -50,6 +50,7 @@ do_install_append() {
 
         install -d ${D}${sysconfdir}/tmpfiles.d
         install -m 0644 ${WORKDIR}/openvpn-volatile.conf ${D}${sysconfdir}/tmpfiles.d/openvpn.conf
+        sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${sysconfdir}/tmpfiles.d/openvpn.conf
     fi
 }
 
-- 
2.7.4


