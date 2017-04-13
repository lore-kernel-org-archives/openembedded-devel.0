Return-Path: <gizero@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D4DC677B14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 06:44:49 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q125so10572906wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 23:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OOJ//cSogSyXXDqYeKZslig1+hLu5uKB4aEHMCQPrc0=;
	b=V4YqCGNtXJJKHZKGpRaosg7beWzEHQJrbBtzADIgzK0xDO2ahN/zVIRdXFfmLRYX6m
	f1isVwuHQEEdmyuHKMWK5eFjUAmmVbKT8E5H0FvMn2aYcPIYm+a21t0mPxsdUSkvoyiK
	9DY8XfqXoDK4TL0ibUJb4IMVwEAJazX9hJuMeLEAlKBnJipxrWPk2Df9uAf9JoKHikhQ
	y06dIXgfN6/Fm3GirMS0qumOnsVjirRlnAy6kxXjwc9vtg3iE+VVRtK2vq4Oqde57FhA
	Q+d8VuoOukjMZqUBG1tWUk+dhQ4OfXj/AKb4yscYtVQDX89AD74/GwC1DRvz6aZ+M9MX
	3UBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OOJ//cSogSyXXDqYeKZslig1+hLu5uKB4aEHMCQPrc0=;
	b=A9SqJs1RgXi95YphiKN3Q3V2Cbq+w4k7jQFth+/so25NpQIjvGJcjeQoNYYrjmFAbG
	nyhm/2sruwoXI3dv/xVdDFxTsynGxLglEbqvtoud/DPG37OOehHbqxUeLQxqzsCOFpic
	7HoYPEhlZ+cRJpiDmuTYT09Mp+GLhyJNOC7MXgtdJauW6Rqf1ab4izBelk3gRpZiMO4P
	qXT6ArfqigyYhpjqz8Otn4YHleQVDoa952/XDoNxNXPiuxnzMi9hE9wz5X0MzmSmK3jm
	/JQef0AC7VhkOPmMKE53vONQ5L0aKKMkye5GIXFW39U8PtFvprOuAOPsO06ibs+mlKBu
	pi7Q==
X-Gm-Message-State: AN3rC/5SedWNj+5KBZpo9wjGBJtA4aDlTE8gHWBHNuRhqaLaurNjfu6H
	YoQAZ2F9vKy+NMoH
X-Received: by 10.28.167.18 with SMTP id q18mr19747560wme.82.1492065890299;
	Wed, 12 Apr 2017 23:44:50 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by smtp.gmail.com with ESMTPSA id
	r52sm6983323wrb.37.2017.04.12.23.44.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Apr 2017 23:44:49 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 08:44:40 +0200
Message-Id: <1492065881-31167-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH 1/2] openvpn: avoid packaging /run
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
X-List-Received-Date: Thu, 13 Apr 2017 06:44:50 -0000

/run is in FILES_${PN} but nothing either populate or even create it.

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
index 8892a9e..b6bd69f 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
@@ -61,7 +61,7 @@ RRECOMMENDS_${PN} = "kernel-module-tun"
 FILES_${PN}-dbg += "${libdir}/openvpn/plugins/.debug"
 FILES_${PN} += "${systemd_unitdir}/system/openvpn@.service \
                 ${sysconfdir}/tmpfiles.d \
-                /run"
+               "
 FILES_${PN}-sample += "${systemd_unitdir}/system/openvpn@loopback-server.service \
                        ${systemd_unitdir}/system/openvpn@loopback-client.service \
                        ${sysconfdir}/openvpn/sample/"
-- 
2.7.4


