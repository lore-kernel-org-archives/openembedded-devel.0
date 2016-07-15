Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E8140731BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 19:05:05 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n202so5335429qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WpBShhx1Z4pzYcjEGKjOJpFYGWdV/tsEc7yIT59ItXY=;
	b=fKu/0lDdwO06pq0zj1WseBLXQc48vTzcU1FmMySUi+tPLUopv4De055RESkwoUzKmP
	1HE1a9ZX/ELCZ5Y/1qFb1daCeS0/WzV5L6JYBxJeyz37HG81GBdQR0MPmEVxl6sbrFGn
	4EHj5SicDh2/G9s+MfyhB8hNI43kz8rNlkRuOcHviBKx0JfmUrlIqTJRdiJ99qsixP6A
	bSSIFHdwFfd7sp7ynDUEafLvV8a4oNQ0bYIqUpVXltKUNTQQyx9nJMCLkzzMJI3O8LYT
	EE/v6SqEWb9iMpiMIeFcAZEOnrVNmRBjUdISvY+Ov+apf0s6BSuoYDriW1NeDb3zNQ9K
	x7Gg==
X-Gm-Message-State: ALyK8tKU4A+z3Uri7/OBwd8WY7jmB31NpLHEGkPO+ES4A7tkNBPJ0HaXS4QvhSg5J6LbWg==
X-Received: by 10.55.113.197 with SMTP id m188mr22829306qkc.90.1468609506421; 
	Fri, 15 Jul 2016 12:05:06 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id w16sm376451qta.10.2016.07.15.12.05.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jul 2016 12:05:05 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2016 15:04:57 -0400
Message-Id: <1468609497-20858-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-cmd2: update RDEPENDS to pull in required packages
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
X-List-Received-Date: Fri, 15 Jul 2016 19:05:06 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb b/meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb
index f4962d6..ddc7f38 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb
@@ -8,4 +8,11 @@ SRC_URI[sha256sum] = "ac780d8c31fc107bf6b4edcbcea711de4ff776d59d89bb167f8819d2d8
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "python-pyparsing"
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-doctest \
+    ${PYTHON_PN}-pyparsing \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-textutils \
+    "
-- 
1.9.1


