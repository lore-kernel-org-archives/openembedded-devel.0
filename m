Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id B2BEF60272
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:13:31 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id o76so10630778pfi.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=5lUvS7guVQ0CnQLZJGAIaCrprFmyZpn6++W9rDveOH4=;
	b=Jr8qXGCOTPuDz3zncnAPtR6WSJhVoanOHctLrRr69heyUiq/inu+un+gLnCRZM0fCo
	enfcuy0PyCNqDbkjX2f3Kr4FKtpKS7ppJTnF42fv46Z+mtVyldABSxUXC7tqlZ7QxPFz
	atrqH5QDaudbn/coICrc6SLPAPSOP/piOPazI4WVGCm2MeGvcxLBhR7zXrMtRrff14Ha
	By/bCWfbsaa+9+c5bQT7SAYMrApuMZsE0kSE+K0V1tYk/f4WQG7GaCM2GszfgcE4ScDX
	4x9vcqtOAv9YkyzGBZ5RJvuX+B8m/UkavOjSUm0zOtPX9yRrnbSou1VusefHOzd/507L
	/oDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5lUvS7guVQ0CnQLZJGAIaCrprFmyZpn6++W9rDveOH4=;
	b=UxrGHYkAZQLOeun08EXGMlXnvBMsFXCz0bh6BQHTfZhlvTaHo/qFt39RJnwwxQaVwb
	yBwS66MJYRNEp/yu04te+1A4ydRfv3hzUnQ4L0FwHMTiO52xGWfGN5S/RuUH5siLs6k4
	Yz8WaUTz4YafgAgFNGObSz+iXCv5g8cVkBoQDKsAlJQofpVth+LCaZNEKgBWAGGbEpMO
	l5qlQ8UPIpRDU0nyT2u+emDwEgedgAPP5G2Q72kuDDNMGutmJwp4fl3GbSIYc/ZMpE7r
	6mLg6S43eb7Hc9WfbpDQgeM+3UT4qph9ooftN1459ZxTqlN50Z79S6Xu9mxpJkVwdY/X
	hSBA==
X-Gm-Message-State: ALQs6tBWnbBwkhaWGBtPHHSI3AFogKA3lVde4WnhJ1jENBhUL1zCdT9g
	hTMPf4jSGGaxL5dE2preuhPLOA==
X-Google-Smtp-Source: AIpwx4/LiGIijXaoWYwOUsmoDaN9PwbtWDEdUCUZUp2nQK1mEcMGh6rkwROM/9Hr4kr6z5VaOi2Lcg==
X-Received: by 2002:a17:902:41:: with SMTP id
	59-v6mr29745714pla.345.1524665612441; 
	Wed, 25 Apr 2018 07:13:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:952a:dcb5:7c5a:56df])
	by smtp.gmail.com with ESMTPSA id
	e4sm35563566pfa.128.2018.04.25.07.13.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Apr 2018 07:13:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 25 Apr 2018 07:13:24 -0700
Message-Id: <1524665609-7709-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/6] iscsitarget: Blacklist compile failed
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
X-List-Received-Date: Wed, 25 Apr 2018 14:13:31 -0000

Kernel header changes are causing this issues. iscsctarget has been dropping by other
distros in favor of tgt.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
index 6593661..5d13591 100644
--- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
+++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
@@ -60,3 +60,5 @@ FILES_${PN} += "${sbindir} \
 
 RDEPENDS_${PN} = "kernel-module-iscsi-trgt"
 RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
+
+PNBLACKLIST[iscsitarget] = "error: implicit declaration of function 'init_timer'; did you mean 'init_timers'?; 4.15 kernel issues"
-- 
2.7.4


