Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id A28EA7158E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Sep 2014 09:43:52 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id q1so2535413lam.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Sep 2014 02:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1RSvdmsBv8k5zd9EWjm39zJeoprvT4Z/6bvp6hUsQqY=;
	b=BMSM8CvV1B2IId09RuRAwX/Tfj70///aVOZ481bHLh8FzRp9hjTrVuLkv5RPwJjV6A
	1motLqrxoMEEBy6y/LSg0Jcck/2h68C2T5GjhmfdoQWbQr5/R/KxgPQFXYg9SjYWy5Tb
	bw0i2Ejpr1a8m57qg0SgJh2fdFarpXo++lO4og2hys5CZ5SyFZa/iePv4TbmkFD83JZV
	y6Zt+K8yfLtF+pFZvbEaE+RAinAiHOmGRot6b7lqItZ+aqpPd22CbvTctl42DkNCXG9Z
	VKTkyP7a8zPwiF3d086jbNEQ6zmgmYDEV7e4O8oW8dnEpu9QfABWVKCex5YiDzL4aA0q
	2f/Q==
X-Gm-Message-State: ALoCoQlPiZwK4aeercEPWkyZdpjHV7WrWxhRn0O+GVv9eu/huX/mZTzDWkwpOnmmFm8XZLZB3qWn
X-Received: by 10.112.78.38 with SMTP id y6mr2099654lbw.94.1411724631950;
	Fri, 26 Sep 2014 02:43:51 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id nx9sm1716716lbb.23.2014.09.26.02.43.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Sep 2014 02:43:51 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Sep 2014 12:43:49 +0300
Message-Id: <1411724629-16678-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.1.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] acpica: update to 20140828 release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Sep 2014 09:43:54 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../acpica/{acpica_20140424.bb => acpica_20140828.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/acpica/{acpica_20140424.bb => acpica_20140828.bb} (91%)

diff --git a/meta-oe/recipes-extended/acpica/acpica_20140424.bb b/meta-oe/recipes-extended/acpica/acpica_20140828.bb
similarity index 91%
rename from meta-oe/recipes-extended/acpica/acpica_20140424.bb
rename to meta-oe/recipes-extended/acpica/acpica_20140828.bb
index d10a31b..fb19c88 100644
--- a/meta-oe/recipes-extended/acpica/acpica_20140424.bb
+++ b/meta-oe/recipes-extended/acpica/acpica_20140828.bb
@@ -14,8 +14,8 @@ DEPENDS = "bison flex"
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
     file://no-werror.patch \
     "
-SRC_URI[md5sum] = "733532f005fba5d1c5344440651b13d1"
-SRC_URI[sha256sum] = "72ece982bbbdfb1b17418f1feb3a9daaa01803d0d41dcf00e19d702cdf751bbc"
+SRC_URI[md5sum] = "6f05f0d10166a1b1ff6107f3d1cdf1e5"
+SRC_URI[sha256sum] = "01d8867656c5ba41dec307c4383ce676196ad4281ac2c9dec9f5be5fac6d888e"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
 
-- 
2.1.1


