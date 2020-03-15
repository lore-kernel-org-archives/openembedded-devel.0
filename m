Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id C90F46021C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2020 16:47:10 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 25so15087738wmk.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2020 09:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HKGmEl6+4Cz+zg8u5YHvs7X9hnuHeHoYtFHm6YDAMIY=;
	b=vXCv2NLEHG4nOy9cBtWAOSTXHOIJPtOknefmYY/TGNhr5GpLpfgGbi4WmxtPiFMBqx
	+G9QwD3HSs1LR6bSj1xb7i5Xh2kSZVoUeYQTu6ZKK9jGWSO2kqSFYTIc6MHcUdPXl/4f
	wQ1MlD6ndcfhcyCdZ2Hshr+lTj0/54wk1PttM76jF+Ed6wKNpEJfq2uW0I+5zzPIQjAZ
	J3HgTL3y+d+c8F9asF6HvAfRj+XBUnJC9a1J5Hl4FlJZI2iqIBGvlYI+EPmNZdivGSoJ
	zeBRZ6BqInjxanS5LicUTApLtNZp6PXZDXaFSQeNwK7p5MxiPVeC+0JNcn6DYBAzQkH5
	ZZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HKGmEl6+4Cz+zg8u5YHvs7X9hnuHeHoYtFHm6YDAMIY=;
	b=CGhkgH49cj8MNezhmQ+2OBJ5O5CCCcWzH7qJmDU8fwMuAofe1UrOvDI8gKID8jupij
	rHVnhCxXL+jWwWsf63aH/9rLjOvvfycnMSRyv928JhQNQq98lZmCwJXnlNLTY7epAlso
	pUNI2rsGXnXCN95U7dpmo58yLLE5kEGu8bCuH09G37NwIKGdzn8uoCiZIfAy73GNaWO6
	UvtqyU4rQtq/alQIDSlOIWl3Bi6RzSVGJ3sG6WEoUx+pQ9g1gxO5SUPmY0N0iwH9i4wc
	k2GinZQYMeS6LwJ69YphNdRQBmFgbkwlZtYHRYk1a+8atU+x1PCweoPNuV0qbRg8XzgZ
	bicQ==
X-Gm-Message-State: ANhLgQ3zGJxUZ5NzuIbdQEArTApuhUMSpOE8gc9/5bfhvPGYg7re7Szi
	OxYEQNbt6+wncxbGZN/YLtWYew2m
X-Google-Smtp-Source: ADFU+vv53YC2hEz6e20w+H3iSKS/flFVJOnmZhoEUiSzIWmJdSteWXQbPL1clk2rRLgHICK+r83TYA==
X-Received: by 2002:a05:600c:248:: with SMTP id
	8mr23395953wmj.182.1584290831021; 
	Sun, 15 Mar 2020 09:47:11 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id v2sm20743980wme.2.2020.03.15.09.47.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 09:47:10 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Mar 2020 16:47:06 +0000
Message-Id: <20200315164706.7672-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] ostree: upgrade 2020.2 -> 2020.3
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
X-List-Received-Date: Sun, 15 Mar 2020 16:47:11 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../ostree/{ostree_2020.2.bb => ostree_2020.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2020.2.bb => ostree_2020.3.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2020.2.bb b/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2020.2.bb
rename to meta-oe/recipes-extended/ostree/ostree_2020.3.bb
index 78f4cf588c64..43021c534249 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2020.2.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
@@ -25,7 +25,7 @@ SRC_URI = " \
     gitsm://github.com/ostreedev/ostree \
     file://run-ptest \
 "
-SRCREV = "c6085ebd5e27da35f43165eb614190665468f13a"
+SRCREV = "6ed48234ba579ff73eb128af237212b0a00f2057"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.17.1


