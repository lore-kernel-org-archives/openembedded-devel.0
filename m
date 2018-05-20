Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id B74FE747E9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 22:35:17 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id w19-v6so7626200plq.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 15:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5cz1M1D+HVne1M8wlQgQmuLIvD8MMaWES49iSDycPTI=;
	b=Fk76wZkR45w0p97AZXyOA9lBeb9sA8rfYN3PeTytf+qk7ntvC6vvLoW4jffYeGut2B
	+o0g+SGuiVYQGFzc3bs/AOmDx4Gjo2o/GNaBOFur43dymgr6O3huxAfCZ4f+uyBrZSHv
	3xJS3RlMfADpz0VkRoY3IEms4OQyZKI/mK605UqIfUb2ni4dO0PWsuZf+oUbUMNLu4dF
	SAqWOsNLO6h+y5MMiqGt5jjkbyetsb//CNFP4bJO2v3ULc3Gr7HP5KGa+vKACkZsXi4G
	eryOJVH5SmQeVHtHvP7mwV80i0d8CV4OSB6LyjoxHtfFhSh/7xYdyv03jLS+z/JptDNd
	yMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5cz1M1D+HVne1M8wlQgQmuLIvD8MMaWES49iSDycPTI=;
	b=hRKUF/duJLDv1uR9Dlm/KX1fZr23D8jSLnhvNGR15wmtTPcRPp1SvX0oeKI8uDXSiw
	tUwFp9Q2dLbQRpSnWp3Flebep+Y1E2mYSqFJd100DBeRB8ruuoqqVmSHd58A6ssVZ3RL
	VZ2AXaXziwCue7QGZXOw9rDqf+kkHvsg8EqN7lW6ZiwzT/wDSHLk2HiDUZJTirtkODN8
	dJ7F4ESQ7ywiIl6/OaGmq3KHxNrMXxvDfztKWk9UoRkoN1gVNg7J2EC1Z+2ebgdecTuT
	futnJ0Ka87yBYQD3Rk4s9LFhwW3zJUXW/Gp2yk2ujjVJgNZRaYTBXmsRfYReJZpxX+Ex
	OLPA==
X-Gm-Message-State: ALKqPwfbTXkk1rL0eiP4nanEOX8FbXudasix+PBs4Nc8A+vR1LuwL+Zh
	ZxFtitg3JDwQ2kJhv/XNAtlvUg==
X-Google-Smtp-Source: AB8JxZqv7HPC6Lso0oVNN/7oFVJWA/k7/rW4CpmNaGnpJQbotuzJi3ENU9BUEW84yPmTHJJM0OgT2g==
X-Received: by 2002:a17:902:8a81:: with SMTP id
	p1-v6mr18447351plo.33.1526855718304; 
	Sun, 20 May 2018 15:35:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	203-v6sm21887763pfz.131.2018.05.20.15.35.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 May 2018 15:35:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 May 2018 15:35:12 -0700
Message-Id: <20180520223517.9869-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-gnome][PATCH 1/6] network-manager-applet: Package gir-1.0 files into devel package
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
X-List-Received-Date: Sun, 20 May 2018 22:35:17 -0000

Fixes QA errors e.g.

ERROR: network-manager-applet-1.8.10-r0 do_package: QA Issue: network-manager-applet: Files/directories were installed but not shipped in any package:
  /usr/share/gir-1.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../network-manager-applet/network-manager-applet_1.8.10.bb   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
index dc2b964be5..ccfe38d010 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
@@ -43,3 +43,7 @@ FILES_${PN} += " \
     ${datadir}/libnm-gtk/wifi.ui \
     ${datadir}/libnma/wifi.ui \
 "
+
+FILES_${PN}-dev += " \
+    ${datadir}/gir-1.0 \
+"
-- 
2.17.0


