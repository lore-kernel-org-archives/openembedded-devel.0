Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 159087C1DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 17:46:39 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id y139so783359wmc.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2019 09:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u7/ubF1MqMFChTQdez5QCy2r0sZ1+dqWlmZr8Fg/4cY=;
	b=hhq4cCaGX6xWKbpRjZMeeRZf+oGX7upS2XNdttc8EfevGrHwA+fYFHh42mFnhnbF6U
	+FjEdwAC8k5MJV+pWE3v1V30vOTdprE90Y4gC29/u9lsPvWGFYA4ZFXWdOveD/Q0CNx/
	yt2JFLqqj/t5Om2hxklZc0p8IcBdDia59Cza8nM1a1tkxOclQgtOJMrQ1w/JnybTW5k0
	m/kNnr9I26XxBI1a3xyI6uP7BqvIDwJC6FDXtUOp4FMaDE7Nk49Ling4gNvTWxaw9OMC
	3y1TT8QD7XYaOUrghoOjjfthiSd7n3QCP7tscpSAg9dire0RMQ4SEaeWfKS6u/WEp1HI
	YDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u7/ubF1MqMFChTQdez5QCy2r0sZ1+dqWlmZr8Fg/4cY=;
	b=nr7I1d2++uJhR0t3ZTgUHLFwgefgZxZXBxhyrPGdrncSEgPqt+qw9uUewBNqMFDI44
	818LMPVNSej4wH9qIo3rz56y97j3lw0gNQAakOJ+sx0wdljXHVGdfHjtlL03Wi0wwPLg
	Fe7l+MKmPbAv4sjObCBH3NBFPcEV+wFTYkyoCWn4iiqxe+m119bngBT4IJPUYW6kQeXL
	oOynv3DNOeEvytxoBOG/LgfblNwD57EafgubSFMswJen3ozoAKylJIVhGfLYpHNZX1BF
	HtUt9qeCixCzuHjlgyBK4clRyj8eaLSQzguEEthI6os3hROOO3jKK26IJyEoxj7P15+9
	Cd0A==
X-Gm-Message-State: AHQUAuZ4v6OTlQUksPOCa4512JEknMq5ukWavB1D1FYh52NLrFKPlr03
	miCmeFr280uoKwvfJQ9KE4qNv7Ht
X-Google-Smtp-Source: AHgI3Ia8czdfc1e07femnLhXlTVTO01e5+9VAZCxV/8M8GkweoUu/0QxEEV64w2Rldp+0HLRBloeGw==
X-Received: by 2002:a1c:a9d4:: with SMTP id s203mr413334wme.132.1549302399311; 
	Mon, 04 Feb 2019 09:46:39 -0800 (PST)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	o6sm10097649wra.55.2019.02.04.09.46.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Feb 2019 09:46:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2019 18:46:21 +0100
Message-Id: <20190204174621.21008-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] evolution-data-server: fix multilib install
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
X-List-Received-Date: Mon, 04 Feb 2019 17:46:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb
index db5dca95b..1949fc7fd 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb
@@ -38,6 +38,7 @@ EXTRA_OECMAKE = " \
     -DENABLE_GOOGLE_AUTH=OFF \
     -DENABLE_WEATHER=OFF \
     -D${LKSTRFTIME} \
+    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
 "
 
 PACKAGECONFIG ??= ""
-- 
2.20.1


