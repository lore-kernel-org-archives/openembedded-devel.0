Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 92C6260269
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 18:21:57 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id s66so12125256wrc.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 10:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=q6df3ei45Co3KlkNaO4dtugmSbOFuvTkvsPdFVG8KKc=;
	b=N/VmDXenNr9IOPTfTWmyALrbWs9IdjBEprINs2F2SACTgKXg6AHEgpWs1t799Osecd
	0XrDW2PcmOObr9OG+MOuzRYvdjIznnjgxhMyOU44gDCzay6vi861m3V7X6T23eL3SJlA
	CA+nESLeC5CgAWnVIVzbJg26iCVTOi8YupISwvaqYWqDI+kJT1gSpX9d8RhKHhQ4BzY/
	cpPeUPDUrTYAWLjnPZ7VnkxqLnEofrW1wMsyrVGemVFyA2PMoeqJ+d/yg1zunlu8jBgp
	tyTRakyyTXbU8krmSvyPkC0d0wVviHFbkAt0T6t3XqGRlqrKPVBXDzVEJztuJfaifIDg
	hE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=q6df3ei45Co3KlkNaO4dtugmSbOFuvTkvsPdFVG8KKc=;
	b=sT3xQv8hHgO9GrQOwuBIF8BqoCmwQqEhy6z0+YJZgLfuFbKaMs+iqOQcMAm0rRTC3y
	IfhJpd1yhy8+/nxAIwInIe2v7p78QZXcHWnyxtt+247inPtT2QK0GtcZ5APytIz39ox9
	CKlrjl+lT75vLCz+xMgrKClKpkAf2lC2w5QyYERdQPY0e0i+BbsOZ5Pfa4Tbrgw0OYzw
	Ee2651+83LAq1MYCvOLnojuR7tsT9GEXQpVsQKhykGFo5ee0LKqLRdcXRsFHlcNdXZIB
	B3ctzcSgYoeQx/aKjbJbvU+o396P1ciuBESpgbW0iKQKe29m9RHvgsA/u0pPp/XTgFQF
	CPZw==
X-Gm-Message-State: AKGB3mI6gdmvpvfpTaMy6PJzgHdNWMtqKh17wd9P9yrX4jAPpidHV+m2
	R5uB0yHhiVS7hkC3j8uGqWpJog==
X-Google-Smtp-Source: ACJfBotfm1YuAMISTwbEJLFxdRDU/u9BFPxux/U7Fi41h4wwCmON6VtuFQQQ44QiqAb1kQ/w/EZ+8Q==
X-Received: by 10.223.186.9 with SMTP id o9mr14443168wrg.221.1513534917995;
	Sun, 17 Dec 2017 10:21:57 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC3E4151E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc3:e415:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 139sm7762637wmp.7.2017.12.17.10.21.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Dec 2017 10:21:57 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Dec 2017 19:21:38 +0100
Message-Id: <20171217182144.21123-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171217182144.21123-1-schnitzeltony@gmail.com>
References: <20171217182144.21123-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][V2 2/8] plymouth: do not install systemd units manually
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
X-List-Received-Date: Sun, 17 Dec 2017 18:21:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They are installed properly by plymouth itself. With buildhistory no change
in packed files could be detected.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index 6163cff..e331779 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -39,9 +39,6 @@ LOGO ??= "${datadir}/plymouth/bizcom.png"
 inherit autotools pkgconfig systemd
 
 do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 644 ${B}/systemd-units/*.service ${D}${systemd_unitdir}/system
-    install -m 644 ${B}/systemd-units/systemd-ask-password-plymouth.path ${D}${systemd_unitdir}/system
     # Remove /var/run from package as plymouth will populate it on startup
     rm -fr "${D}${localstatedir}/run"
 
-- 
2.9.5


