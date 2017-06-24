Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 28ABF6FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jun 2017 17:15:38 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id f20so10054338itb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jun 2017 10:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=74IGbgrKwJzt4hcE7UW5LZCyFEGVnWrX33goXPQVR34=;
	b=ZdmILLCPOyUO+V2QoS6Jq9tuw2w71IJYaDfLwMG57HrOTibW2EmJMDjAQ+BcnRP9m9
	eBikD58G96+NE42XZGbJi1KChm5OKplWXSJJLstOP8zTAqO0W5uAWUuh04yZsLC7UCKR
	Owwg0Ro2eqVPtsR+9JHoba9mjtstkgnGVQPfhIM0ycLDcJ2p6VQkcBqO0FpEzmzCE4Ll
	3f2rf2pP+r9WVWRAy6OZU4RUA+Jj9lyCwIC7RR/BoIHyUSMrlb8AMafa696QpNVa+D24
	djvJKJnSnJ9bzYvy1Y/puTGhHM/JwebxH3n4GvUhydqYh6QBgMyNpz4kXVQkrVKiXLpe
	W1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=74IGbgrKwJzt4hcE7UW5LZCyFEGVnWrX33goXPQVR34=;
	b=A3hwkCTRqGe6DPES4uNL+YkMmX29Vv0XnDH7pA3NrCX8/LeS9wLYCDezrcp3am5BHp
	jYckh7TyxMzfoIk738Zxpw6W9+ejBHqhmnYMrr7fbKqIplwYOPgnHbqIvTWhhne8IkeJ
	3XC61N8S4LWmEb7Xu9Ga7iaRLmPKRatLm1Sxu6g2NgFcWzBn2lwuVRYTbMR1T7Itmwqa
	Ev/RWWkATkKzKDQHg/yq0ekMKVkrDD193m8YY9pZah/eLmBSQDvw6qP/DR18qnIKyNEB
	ZMYHT1eXKl1VtpE3zu/UeUkrAiuiK9ORYsZ4YwO07w8FXXSoqSts53mByIiuZFwG/F64
	98QA==
X-Gm-Message-State: AKS2vOy+KIOFPGIuQjKLi6dVUHri3SvQE0nRy8T1piv4edSPFsUMoh8H
	2pRA4p32SZQ1dL4i9DM=
X-Received: by 10.36.7.202 with SMTP id f193mr14232182itf.80.1498324539881;
	Sat, 24 Jun 2017 10:15:39 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	n73sm4826594itb.13.2017.06.24.10.15.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 24 Jun 2017 10:15:39 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Jun 2017 13:15:27 -0400
Message-Id: <20170624171527.15285-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH] glmark2: update to latest
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
X-List-Received-Date: Sat, 24 Jun 2017 17:15:39 -0000

Fixes and updates for imx, pl111, and vc4.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index c7896f8f8..85d7bf16e 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
     file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch \
     file://Fix-configure-for-sqrt-check.patch \
 "
-SRCREV = "7215c0f337dae0b232535549c37fca441747a891"
+SRCREV = "9b1070fe9c5cf908f323909d3c8cbed08022abe8"
 
 S = "${WORKDIR}/git"
 
-- 
2.13.0


