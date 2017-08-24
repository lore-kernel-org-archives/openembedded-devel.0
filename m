Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id B964F77D11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 21:38:38 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 63so1006434pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 14:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/JJ3axfisV8wrp9aX9Abss1ackXIW2gPdsC4BB+YBAk=;
	b=XtVrTAQefQZ7KiZ+5IGBZfU4fVG3/WqZG8hfrWXF0WIRlvDxauVmogwQy8SwC2m4xI
	dhkRg5JzCO4EwReRBA4+REq6rHPT0uQ31wmcvnYw4PYSqAeRUpnEIo1zblaIsq0/9bbj
	MYmQ34DG+DLll1+KXL1PSg4k4K+ySYzKPKHilitsllVR3Tp+ozWk2d6NvUWgL7u6Wk69
	NDY0LEVqBbqtsLXU/loI+4abgOOB3RVWGX8Je5U0XFi/kbNiW6Gqd/OJ77dLpofY/lIK
	FEbFFIFT/0c1LGCWFkMah7HKgNacxmSBlnl794tAXFf6u/YC4Xh1Wug3WSqgZqLRy3fm
	XDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/JJ3axfisV8wrp9aX9Abss1ackXIW2gPdsC4BB+YBAk=;
	b=OlYb4odLGNdJRqVR4E/cL8jDlP5Xc+yKXKl0jkiCxhpvCdo82mzo+mT0DwdRIWgZFU
	74cKF/xYJKuNLC+VnOGnTYV/aCa+F/ZeaIBSxWDIz7Is9QZgvnbz83UEurOBF7/K/H0m
	roXTSyxWTFG66gIhNs/KawZT3bjNXwm/D1qn1wEd2Ttsylta5WPTIppXN7qxaH/Y11lg
	zOf/NmdwCFc/xRazB0K/EJBYMpdfOfLyf8oIAuyJ66MSpAHhJEtM4Xy5XwFKvqpu1+0y
	3k7re0kkey1nHhXWcc+nv0l7wDJxvsfmHNSTaH9AKerzvlGYGnCl2neybRKTNf608v1Z
	2zuw==
X-Gm-Message-State: AHYfb5hoIOm+dsJcSCKfr7/leLkLhWOmZK5/PwmVaE53GqpHgeId+Hv1
	0+nCabd0vp9DqPJp
X-Received: by 10.98.90.131 with SMTP id o125mr7693121pfb.222.1503610719930;
	Thu, 24 Aug 2017 14:38:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id b27sm9076560pfe.6.2017.08.24.14.38.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 14:38:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 14:38:25 -0700
Message-Id: <20170824213829.41431-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170824213829.41431-1-raj.khem@gmail.com>
References: <20170824213829.41431-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/6] wireguard-tools: Add bash to rdeps
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
X-List-Received-Date: Thu, 24 Aug 2017 21:38:38 -0000

Fixes QA error
/usr/bin/wg-quick contained in package wireguard-tools
 requires /bin/bash

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb
index 79d420f1a..c4ddbcb0e 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb
@@ -24,4 +24,4 @@ FILES_${PN} = " \
     ${bindir} \
 "
 
-RDEPENDS_${PN} = "wireguard-module"
+RDEPENDS_${PN} = "wireguard-module bash"
-- 
2.14.1


