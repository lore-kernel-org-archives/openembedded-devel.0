Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id C5F0C71D06
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 19:24:59 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id 11so19256382qkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 11:25:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UCwyPEvS9jUu3kAv0OhiSPPPHtQTQehbKhE1of47py0=;
	b=Nzn30dzeU1c9LKQ2ktrbBR7aK2M+8wjS1nBQRjpji6pWOYiZHyK55/Oe57XkBy9WjA
	AbQ1nFUmcjwM6OdBaUTh4nD/1eTJp9SlBOvtbirxeRqpO6Ji6Rfd9y8v+XIIAz+hTaqF
	avK+IUZ9516+3iwgops+0Yl6BmbqKd2s92TNqJ1h6XIwgp7Nnfx880ScvGSCeScuxasi
	HsfEFJp5SwdsgTMqLfgQaoJlR1do0HHeww6xPEA2WUnrmfQ3Irq9MMkeDfGQXm0zUp+s
	W4PNuAkpkm4eoj337zXL3otQSMCsPKShj636Klr7pMSMKg3C9FwJKfsjNNL8P/3Ss27S
	v4Xw==
X-Gm-Message-State: AMke39mQ5Nq4O8K+uJB0B19LaldT4Fxhfro46hG9yZPASvLQwFEvBT/+9Xn7TFF3dequCg==
X-Received: by 10.55.105.131 with SMTP id e125mr23523860qkc.174.1486581899416; 
	Wed, 08 Feb 2017 11:24:59 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	p70sm6975052qke.48.2017.02.08.11.24.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 11:24:58 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 14:24:51 -0500
Message-Id: <1486581891-13686-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] gateone: correct the inherit to use setuptools
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
X-List-Received-Date: Wed, 08 Feb 2017 19:25:00 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-connectivity/gateone/gateone_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/gateone/gateone_git.bb b/meta-python/recipes-connectivity/gateone/gateone_git.bb
index 5323554..8b2a192 100644
--- a/meta-python/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-python/recipes-connectivity/gateone/gateone_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/liftoff/GateOne.git;branch=master \
 
 S = "${WORKDIR}/git"
 
-inherit distutils python-dir systemd update-rc.d
+inherit setuptools python-dir systemd update-rc.d
 
 DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
-- 
2.7.4


