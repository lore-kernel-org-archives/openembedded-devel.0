Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9F14C71637
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 16:21:32 +0000 (UTC)
Received: by wiwh11 with SMTP id h11so39926831wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 08:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uT9EOaSNKCXnvjAwe9nUiN5juJwNUf/7eDCCoU7EB+8=;
	b=uf+WH252W2gcBUaytsQxvTWCN/jwhpCWmPA12eX3/0TXzCufviV+t+Xgl5+VdNJ5IH
	nIkr1iobiQF8GyaO/jCTptQZiD9pwgTn7x5G8d6g83oP0kXxTtoPvC7PGzO6kAATiRDG
	qWq6qzXjWoAljsmw9iIe9o/9w4Ax4Bn4TzcqWHo6DE6vLPOHOwYPDguZAtOI4os1Ei/S
	srbM3ATelhLbW2kyqkrGuwx5F6XT4wBmyTpoMNDvKUyq4PhwyT0p2uDiOyt37nqXFTjW
	iYkuKsSlsGBx+OQwIQ0EhErqyjNezlgse9R0YhYCCBWSRPm6l//7ajSxHrECdgKhpQMN
	cNyQ==
X-Received: by 10.180.221.232 with SMTP id qh8mr23710943wic.19.1425572493069; 
	Thu, 05 Mar 2015 08:21:33 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s5sm31056983wia.1.2015.03.05.08.21.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 08:21:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 17:21:34 +0100
Message-Id: <1425572494-30387-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [meta-efl][PATCH] mcnavi: blacklist, isn't compatible with latest edje_cc
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
X-List-Received-Date: Thu, 05 Mar 2015 16:21:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
index 9ad5d4f..2b5722b 100644
--- a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
+++ b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
@@ -11,3 +11,9 @@ SRC_URI[sha256sum] = "ee7f65155e91386175875fc4f72f4bc94e4e9cdb8258112632da94520e
 S = "${WORKDIR}/${PN}"
 
 inherit autotools
+
+PNBLACKLIST[mcnavi] ?= "BROKEN: latest version 0.3.4 is 3 years old and now broken with more strict ejde_cc from efl-1.13"
+# | edje_cc: Error. parse error 0.3.4-r0/mcnavi/data/themes/Default/main.edc:126. invalid state name: 'none'. "default" state must always be first.
+# | edje_cc: Error. parse error 0.3.4-r0/mcnavi/data/themes/Default/itinerary.edc:84. invalid state name: 'none'. "default" state must always be first.
+# | edje_cc: Error. parse error 0.3.4-r0/mcnavi/data/themes/Default/text.edc:1129. invalid state name: 'none'. "default" state must always be first.
+# | edje_cc: Error. parse error 0.3.4-r0/mcnavi/data/themes/Default/fileopen.edc:78. invalid state name: 'off'. "default" state must always be first.
-- 
2.3.1


