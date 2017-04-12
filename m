Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 788FE77CFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:56:58 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id l28so5817575wre.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jjbuNc4zAF0EIyg+mN8Aq0q3ARpkMnTFornX4yx1kNA=;
	b=iq2cxK6BoIBCKU2m0VWZInXFXXP65RuOfWGKtlWajqe1Q4qvurkNUryyphl9FnON9T
	QtZo4eWSsq6/oFZldpcBvORifPb0e0LO38066/I5Ev7L9pjLQ7za/0idC3UMDgEfRoiB
	kREmiYgFRCEiX5MbSjGV8GTaYQYpO4twrzj3xNn53o3na7NlsJxZoXGkXzI7zzu1ZkF3
	06fl9hjQDqHYg498IYWtzfpi08nKFImbKEQ6XwPbAUlHmX/UnEuTTvr5jm8iArNW5Ler
	fF+fHl03x83g3/aCri+caQRXU0gCPfi0DABp6JQKUifSTRWXAmirqr6sFfBHeQdi4kFf
	4uLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jjbuNc4zAF0EIyg+mN8Aq0q3ARpkMnTFornX4yx1kNA=;
	b=K4R6YeLGF1uFq4fcCQAsxpbYFHwMqgyoq2riQmP9mRo3+knfY6/7dzF3aFgJLT9wRW
	1GV9z8zd/J3cIL4CDEhwwMJrqcbRWCG8obxxfdiIqxvhbKbAniOcvWprKcSyfqR479NL
	3W84sOTMp1CEv3EL6pQ98ZsQZkpTTKi1Ngg4rU3OqAiL2Ayr1rZcfc0hcRi2pcm4G0e9
	4OYB4qFF1Q27QaOHoaVV+Fx+X6hGnR9UEF/BnaLz0CJF04SeuRDmKVi0bMlRbT5vli4C
	c8k9XIfLiYoGWmi6vMIWYKv49mncXoCZSslfCQrbbPdCNdp/rI4TtubiJHDPivg2Y1xM
	0CFQ==
X-Gm-Message-State: AN3rC/7uCKtkrzrcnftJFyvjrCMcQiV17wztTQVf9DxdxF0ihiGZIfmAeY2lw8MDhOaUDQ==
X-Received: by 10.223.138.199 with SMTP id z7mr4873257wrz.66.1492027019136;
	Wed, 12 Apr 2017 12:56:59 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.56.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:56:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:17 +0200
Message-Id: <20170412195638.3243-9-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 08/29] xfce4-terminal: update 0.8.3 -> 0.8.4
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
X-List-Received-Date: Wed, 12 Apr 2017 19:56:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-terminal_0.8.3.bb => xfce4-terminal_0.8.4.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.3.bb => xfce4-terminal_0.8.4.bb} (68%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.3.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.4.bb
similarity index 68%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.3.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.4.bb
index 7d49785..bc1d216 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.4.bb
@@ -8,5 +8,5 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "d4a3211c23aa3f588e86cb21d34c0e91"
-SRC_URI[sha256sum] = "40e6e4b3b8e887a326d9491a47388bbdc379f971a8d622509c0a006e53dc12f1"
+SRC_URI[md5sum] = "7d9ea57301d6a770e5db8e7ecd6e4cda"
+SRC_URI[sha256sum] = "c5c1163b30e7a43d56ff92a25193bf9f29ce60e6cf43e5988530df79c84cfdc8"
-- 
2.9.3


