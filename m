Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 53BE8719E2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 14:45:08 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id l15so3619229qtn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 07:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c3mYZZjcwwBSi4LlpqORUkl0TRZn2myiQ9i0z05GiS0=;
	b=o+UpJEsxIpW4SSoj3diKNJFFi8VcqZb36naxsnj8rRtdCRwcdQK4k5OHRSOY9wGewA
	+NIWj/2O2mkqwDO+H5Vc1hSCmPGUDi338Bx+7nPUTEjXAYrfeOZBWnJOZcb/Ean3+7bG
	7r/Otl8cQJJ3gmAgaPgPrbLMk+VVEgBlxonkwRN4aUPk3TgkUUkvoe/6RRNSWkwe9JEI
	LqY/r3VaRCC+DFzo7DDFrUt8lvHxUQ+54faqIpxiO5XdDMsrUrFhRIWnZtXoVqaNUoLL
	bUi9Lkz9k40SiP1hC2Pc6zkZr2ZbVQ568r03pVcd/d/dZ2dpg3q63O5PWXVndctAZ2aR
	h6Mw==
X-Gm-Message-State: AElRT7EM4xPpw+1KOgPyjvWVnZU+w49K1luMyYp0nzLjkxyGmPbCzHSn
	3HyXrNJfENceaqlX8DorJFKllm+4
X-Google-Smtp-Source: AG47ELv6s5/vnrlkHBeZr3aByZtXNZ6lxBkiAfFd73xZyhdwvUrYdfRD9Ri4LuxXz+OotTDqPp1+Cw==
X-Received: by 10.200.34.209 with SMTP id g17mr7255759qta.93.1520779509053;
	Sun, 11 Mar 2018 07:45:09 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	n39sm3828353qtn.16.2018.03.11.07.45.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Mar 2018 07:45:08 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2018 10:45:00 -0400
Message-Id: <1520779500-3737-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] pyrtm: update RDEPENDS to include python-logging
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
X-List-Received-Date: Sun, 11 Mar 2018 14:45:08 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/pyrtm_0.4.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
index 2272da9..9d851ab 100644
--- a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
@@ -22,6 +22,7 @@ FILES_${PN}-tests += " \
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-json \
+    ${PYTHON_PN}-logging \
     ${PYTHON_PN}-netclient \
 "
 
-- 
2.7.4


