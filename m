Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 13A6971DDD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 16:13:08 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id e2so45384408qti.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 08:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z62IA1gGDQtYMP79FlDGHMx7foCQncjXNfqk7NME/lk=;
	b=V2fFJu8FnAAgLlumZBw7FX62hcjqR1GJmwEcxUoGaWuf8yYpWPeJ1ZRyWijL4k69cA
	TnAv0mwcuCfr4aZiGjOv6iXG8PClhggc2d2Kp2XWAuRLVSnQhJhDul7Ps8l7EMW2Jf4P
	Jvq/+BwjGqyUYdL/0HXNl0iW8eeHS8UDsbjGucNy4BwJhONulyQBzrRCg+YtjufdO75h
	aL22ryR4hjwEitHkUoYajAnisIy5nxMkN4qg6eJf+cw4DDPqdvUkeXMdbo9R+HZ6R47t
	cYhGZP3Nv+6E3+YstFq5a8qPR2nx96p/zcjOj5K1Sj08xRvaEb1lcS/xDK1Q/PC4Qy0f
	BDeg==
X-Gm-Message-State: AKGB3mLmsgsLUTwuQbrKI1RHpi5/L/bHLx+1ScLR2PZTpCQmShq8i3dW
	eKPczD9X+o8h39FZcX6fygXvFjLt
X-Google-Smtp-Source: ACJfBovNfPmSTnjivcLvR8ECP31ixfJopYNuOu7pQKvPs0Wnhree8bpUwtXm1LCW2Yl0pJc+nNI04g==
X-Received: by 10.200.49.166 with SMTP id h35mr33867204qte.293.1514304789872; 
	Tue, 26 Dec 2017 08:13:09 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	h21sm19804991qte.44.2017.12.26.08.13.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Dec 2017 08:13:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Dec 2017 11:13:03 -0500
Message-Id: <1514304783-6003-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cmd2: update RDEPENDS to include pyperclip
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
X-List-Received-Date: Tue, 26 Dec 2017 16:13:09 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cmd2_0.7.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.7.8.bb b/meta-python/recipes-devtools/python/python-cmd2_0.7.8.bb
index 82393db..96a1b39 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.7.8.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.7.8.bb
@@ -11,6 +11,7 @@ inherit pypi setuptools
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-doctest \
     ${PYTHON_PN}-pyparsing \
+    ${PYTHON_PN}-pyperclip \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-stringold \
-- 
2.7.4


