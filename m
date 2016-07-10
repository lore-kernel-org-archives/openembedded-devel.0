Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3DED073174
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 11:39:16 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id 82so13782005qko.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 04:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zcVxekwlIusauyOeDd79h/gJiErX9BIFr83KImBOXug=;
	b=VM+iRIjgg0WIplh7PM75kCkqTS7j7lXOJGUDUMpYxPkt0pI/+G1H83grubTFyMgeUq
	Jt1oMUvmNrVEoJ+00LPd74quC5ZPVA3SQYmaRrKqKLbLCmWIJYmAfFVg/tnF8okUVZEb
	tENFGVJ6/o4yvQ6y4huVNphLl9dOqrKcNZmRRCb6VPVlUOpc11xTDnAc4iEd1a2iwikc
	/9vwgnUYz1NHxtZftOkyN8gueRvRSgKxsqqgNq2vjXaqS61ATX8ewTxko5Ak/5WjslMF
	WZ9X5LDW3rhuneHQ6mZVbBKDKUjdCcd3wV7MR7mgbarZpaU+6of+wzLHjQavMdLZHBEV
	zOjw==
X-Gm-Message-State: ALyK8tJoHkwwEiC1bsYBUdxcaBCR5KHnRPM+/GEFvOyCfEI4sphdihkCF0SczcAXBo/I8w==
X-Received: by 10.55.159.148 with SMTP id i142mr19136658qke.53.1468150757394; 
	Sun, 10 Jul 2016 04:39:17 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id o2sm1597191qkd.0.2016.07.10.04.39.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Jul 2016 04:39:16 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jul 2016 07:39:07 -0400
Message-Id: <1468150747-14730-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1468150747-14730-1-git-send-email-derek@asterius.io>
References: <1468150747-14730-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-wtforms: add RDEPENDS to work correctly in minimal python environment
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
X-List-Received-Date: Sun, 10 Jul 2016 11:39:17 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-wtforms_2.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-wtforms_2.1.bb b/meta-python/recipes-devtools/python/python-wtforms_2.1.bb
index a5ea283..5ddcb48 100644
--- a/meta-python/recipes-devtools/python/python-wtforms_2.1.bb
+++ b/meta-python/recipes-devtools/python/python-wtforms_2.1.bb
@@ -11,3 +11,8 @@ PYPI_PACKAGE = "WTForms"
 PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-numbers \
+    "
-- 
1.9.1


