Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2C89774760
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:42 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id o23so2247515wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=65dC98a1osz6QUYUTQui2LHuOh1Qeb5y1kk/ZG+8i+4=;
	b=mhp5p/dPPurIu1OXPsJ5OkujAzdDre0MWvnNwFMA0PvGoSJX5w/w6O2e2QypJQ7Im6
	+YmVR/L75HWmkG1jFM3xsxFLx2BDJdB7QqjDVw9zlZB/ztwK0pTrDStH/B2JiBmo8C1z
	oG/jJMVDRYOmmbJKCM3yaR9qOy2C8R1F5elxVafd8KlhqTyAxO8QTJ1HaG+TX7ydNE5T
	fM2J08lotWP26TV7axhqJ2Po3Ctb/o3sFOnLYI/tB9nss8lKCfUcI/YvhnOfDSFE042/
	/TDfMOy+P3PsgzIH0FOUI7REBT6/R8w/sLu694JnDXM7e40Y1UzAs7qB0x57+iGdeur3
	9FqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=65dC98a1osz6QUYUTQui2LHuOh1Qeb5y1kk/ZG+8i+4=;
	b=uCldbrrupP4sJVlOXL5qSi1eEy2IIpt60sfQiYHZ7y67Yc59dezEDP7W5ixe8LUA5k
	oa5C/IOOPAleqJnRj7m20JhQA9+3A/zGh421O9UrXbHxMDgnWxYJHRaq2ECIfHSjY2Xk
	NSuFn1Q3BRyc92JPK+5iMw7WeqO6WucR+xn7Wi891g5T/Hp3U5h1+854qyVB4Qf4Szpa
	XXQTK/RIkTHuzcA9y3FnZ/46uEl8T4aP6YReahADTKmdU5LTLLpojhiEazT6STFPtetu
	FcnC9SLuRrTbA8ApLCT8WVrkbgjK404q6k5pq27Rkychh0vQtZr/9kiUbqPqCHGnI7aP
	JsXw==
X-Gm-Message-State: AElRT7F7jL4Ail0x9is25QV21HA8DEOVcJTJkHEBBORBiPjf8X9fyuqn
	FZbw7QEm+73Wvb7hiR+wMAc5zA==
X-Google-Smtp-Source: AIpwx49VSRIyMEqhv6FwtSO/AinomIn346GPi4nnklBuFerxusAhOKE1yBGokqN2JY2jBDxXPO4fAQ==
X-Received: by 10.28.69.93 with SMTP id s90mr2231447wma.71.1522416762667;
	Fri, 30 Mar 2018 06:32:42 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:51 +0200
Message-Id: <20180330133151.25882-40-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 39/39] xterm: add update-alternatives for resize to avoid conflict with busybox
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_330.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_330.bb b/meta-oe/recipes-graphics/xorg-app/xterm_330.bb
index e3bb0fb6e..16f9b7882 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_330.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_330.bb
@@ -27,3 +27,8 @@ do_configure() {
 }
 
 FILES_${PN} += "/usr/lib/X11"
+
+# busybox can supply resize too
+inherit update-alternatives
+
+ALTERNATIVE_${PN} = "resize"
-- 
2.14.3


