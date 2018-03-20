Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4DA60750
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 14:04:24 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id i8so1670766qtj.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 07:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X5V6nx9qLH0UrTlBWhfnE3WN2IM78+s2Tz9OyX378PY=;
	b=lOB2b6XKsBWewKy8+vjlobcqnWRUPPtVPcjw/JjGCQbqYdh0GZEdBrZKstNXN3ldJW
	jNI4HgiPAnsae+p3jKB9zcMdZJJh5m9YjE4+eP8gpzQvzSqmhUBS7mzoyDgeyA1Kmslt
	11eBjV9Gk5qn3buH0JUBOZCOlew9v1gWbmpg5nFws4XgT5q2WlNeA4sl+yu2Zb+pszwm
	tEVpnGGlQbOjk26Y0kOElAKpUSmFO6sH+yysd/LQt0OXedIAbGZhTz5iUfcE9w6eEAjx
	pIYm7hYYWCvIcAC1HwN/GbtOtE3/jX2PbRCfvosVYDoSnhW7tpvntYRqKhNLcdrC7Kds
	5PAg==
X-Gm-Message-State: AElRT7El61ldKu0PcMmi8Z6Ab70iVWLurAdJEqqDiQxrI28WEHNcGTqk
	Srevao4GZPb6xim/ePGasgGwFEL4
X-Google-Smtp-Source: AG47ELuTTCNbkiLXfhp16kGVql6A2e/gWa39Q6vGo/RYaF/iHZK/3zqsUonoDVp70nCpGifl9riLJA==
X-Received: by 10.200.23.50 with SMTP id w47mr25553954qtj.131.1521554664943;
	Tue, 20 Mar 2018 07:04:24 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	o22sm1270422qtf.59.2018.03.20.07.04.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 07:04:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2018 10:04:18 -0400
Message-Id: <1521554658-10933-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-attrs: add logging to the RDEPENDS
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
X-List-Received-Date: Tue, 20 Mar 2018 14:04:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-attrs.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
index 12410bf..360f9c6 100644
--- a/meta-python/recipes-devtools/python/python-attrs.inc
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -9,5 +9,6 @@ SRC_URI[sha256sum] = "1c7960ccfd6a005cd9f7ba884e6316b5e430a3f1a6c37c5f87d8b43f83
 inherit pypi
 
 RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-crypto \
     ${PYTHON_PN}-ctypes \
 "    
-- 
2.7.4


