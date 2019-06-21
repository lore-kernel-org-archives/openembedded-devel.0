Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id C70A27E790
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 15:14:36 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id n2so3512173pgp.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 08:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Gj7O6pPuUN41Nx0mE0Y7VJI55zQQ78YyPGAXjPwa+ag=;
	b=f5gLigmVUz/wrSh58MvBXvo/ZpoaoT6QvbKwLeKYAgc5DHRBmBz4qVbqW1ZBZm7vJc
	xR3+kaIq07D7/DKGqJP3aYCw4PylDCEZJ98CSsfyaKsYif6FRn4kJiVphVCpQy6wizoK
	rIgQBiZUDs+5lZw1O/f7kamKPDY99Xul2caSvCXA/YQvXgukJXU+PaxLWObfIvWeqecO
	VJ6hohH7zPKlyco8TgJX03eMv5iGlvasruI3hcokaUXV/IrTX09S9cWQWISCYRTtTJHJ
	nuoI1vW0DejUVhhoY73TGAX6gjoD5I3r5tiYU3m//64GBiMnAJbNR1Qpz248llFw2qZO
	NlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Gj7O6pPuUN41Nx0mE0Y7VJI55zQQ78YyPGAXjPwa+ag=;
	b=d7/Gu9VI4TtDunHxjHAcQS5GDUqf9bMmX1/brw73ZAPN0MWVrXW/ABa5uO6F9a4KqM
	1k8ml6AexAOivvJDzUuPMWt2DkbMXTG8siysdfv2PGiM5dravXT/JYfSSgJOqo402nYc
	JsG3BKQiI7UdnC3mJbGGUgg4Rk2DzLMOEtxsxpbEtZctAkaevVmFwU94IDomUHjyWv5R
	MvHP8mz98gy9yqmKSt8FeZn9l/mK8azl9RPFbm4UvisWVB4Xa4mLfMk9WAJUFKHovD69
	BCkqL3/Ibj92IVKsUnfH5eL1TAkovzO4x7Pr/BLfB9k5B3zEuS/+vXsGnFk+N0eB7NRz
	Jxhw==
X-Gm-Message-State: APjAAAWkOKTN1hRRFvzB+pWIv6YuOiMZNxM18VYp2RWkyZLnY6Hv1TAu
	tBYHgv5gkUNwTzFIiVTl6RT/mjfTYVo=
X-Google-Smtp-Source: APXvYqwlOPzPd7KpctkGg3qPFV/wgNSoAIwZRKfyx5ht55xU6Z9ky3a9/BlvA98vGSEqoqD9VWLDow==
X-Received: by 2002:a63:6dc5:: with SMTP id i188mr5707307pgc.188.1561130077715;
	Fri, 21 Jun 2019 08:14:37 -0700 (PDT)
Received: from localhost.localdomain ([192.55.54.41])
	by smtp.gmail.com with ESMTPSA id
	z14sm3142408pgs.79.2019.06.21.08.14.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 08:14:37 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jun 2019 20:44:24 +0530
Message-Id: <20190621151424.25736-1-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] safec: Remove aarch64 from COMPATIBLE_HOST
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
X-List-Received-Date: Fri, 21 Jun 2019 15:14:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 meta-oe/recipes-core/safec/safec_3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb b/meta-oe/recipes-core/safec/safec_3.4.bb
index d55d081f346b..b4c125faf433 100644
--- a/meta-oe/recipes-core/safec/safec_3.4.bb
+++ b/meta-oe/recipes-core/safec/safec_3.4.bb
@@ -10,6 +10,6 @@ S = "${WORKDIR}/git"
 SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
 SRC_URI = "git://github.com/rurban/safeclib.git"
 
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm|aarch64).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm).*-linux'
 
 RDEPENDS_${PN} = "perl"
-- 
2.20.1


