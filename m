Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by mail.openembedded.org (Postfix) with ESMTP id 16AE87ED4A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:43:03 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id 7so31975399ljw.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=jDIFahaLZgnTb9JLbZx4Wh6QtwpDAQgu61xUa94l8yo=;
	b=L+0ICmFfH70Oj6Q14EayNoKRy5PmYHHj0kHL4lD+7rp0QjuZef886cJuCOPLqrL4Qs
	rXXMpqFb7i2xj4826hp9dwW74E3iWg/nqapraMS0aZE7GdiReyWj19KhC385tMIdZZ68
	r+pI879fVWiIxUvphRB2B9yZa82fJh8pacKHABcjS7fj0r6ZL8Ag29XKDRBs4GqaeOnW
	7TUrU0Gn5u7NFg5hFzW8zcGaYe+jMgdDcp7VREoI+Z7YYf2uLh0t72XcIwvtv8SBoYGm
	2eEidSZIsXKoNPM5bLsbtCoPA6a/3x9zgHvAlDFnTDkoenH7bhdi5H0Nff01HOXs7R7B
	XHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jDIFahaLZgnTb9JLbZx4Wh6QtwpDAQgu61xUa94l8yo=;
	b=L9j/IInkR1658KS1Jt1qbqIJOdCzTbr5WFu0Vff26DQmDIDGqTls3a+U0uXKjXJ+SM
	AKIw2NkCqSDuRr1INQ3VKXqZUh4HnDJRXDszVsZwENg1pE3/4LoeSVCnwuINHk2YXEU4
	/4C4kYhkmXZvbQ62vSrbU6BnVhrsyueoUDzgMFXAQ6td78jwJ/O6yP6jO9rd80MlQpI4
	gwo3Iwn4zqGXwb355OOA/iHOxEtKHIR5U/mGzlVNSuxI/dAQ95Cg6oufORq3aqXN9oRY
	/37NX1M/hjKkAsDCj6zkkNmexuIjfNhtNvjQS6L29sF5fK2XNNsFPNlmQrxUDkK+R4Al
	8Ypg==
X-Gm-Message-State: APjAAAUc0b6sOt218A2rsh5NguZK0WLRDjd0IunfWdaOgrerYP+wmJ7c
	/8M11Cl4LjlxcDBBCuUeoQ4p29l5O0Y=
X-Google-Smtp-Source: APXvYqyvHy/7UNsIIkbXKYw/HeizNRaatuM7+J42lX7vNOX1xxjC8kR6iSje1U5gpAyDNRsys9BxLA==
X-Received: by 2002:a2e:98d2:: with SMTP id s18mr4480709ljj.68.1568590984357; 
	Sun, 15 Sep 2019 16:43:04 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	y20sm6847523ljj.89.2019.09.15.16.43.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:43:03 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:43:02 +0200
Message-Id: <20190915234302.14043-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] digitemp: update to 3.7.2
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
X-List-Received-Date: Sun, 15 Sep 2019 23:43:04 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../digitemp/{digitemp_git.bb => digitemp_3.7.2.bb}           | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-support/digitemp/{digitemp_git.bb => digitemp_3.7.2.bb} (85%)

diff --git a/meta-oe/recipes-support/digitemp/digitemp_git.bb b/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
similarity index 85%
rename from meta-oe/recipes-support/digitemp/digitemp_git.bb
rename to meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
index 460aa1438..9fcc278d3 100644
--- a/meta-oe/recipes-support/digitemp/digitemp_git.bb
+++ b/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
@@ -4,11 +4,9 @@ DEPENDS = "libusb1"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0"
 
-PV = "3.7.1+git${SRCPV}"
-
 SRC_URI = "git://github.com/bcl/digitemp"
 
-SRCREV = "389f67655efa1674f595106c3a47b5ad082609a7"
+SRCREV = "a162e63aad35358aab325388f3d5e88121606419"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


