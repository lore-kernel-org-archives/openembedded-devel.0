Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9DD4773197
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jul 2016 15:58:00 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n202so6913731qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jul 2016 08:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iAdZbow7LM9K/iLWWqbHrDnkqrDg8sesDODQZHSyL80=;
	b=LaB0coG42XuwQnZK68j2l8FNfTeiwhbByEWjptaErNWM5mnj6qMOJSOzj7pPK1nsZF
	WYXxhXcTmhVPJWtx2JjsmLT99jRoHn0/Kgd+t1rWFw15S5bhzWWhSdQ3CYdesAynJQ8D
	RiLQYRyVuiBTCwv8+fmARKCVYf/EhsCuOmo2ud4oiuJaJtX+sRTPqFqqH+qL49+UkTpg
	MkcbMuNPL/4MTA+5s8YZirDIAqlcznJ005W6+7D+UBunk/rRQjnWgTqbtcBXCUefaF2p
	G7yifIenj6SIzAVc81v7oycT0gHoGAYR4QoBFe/c2mraYKZqowSdp13/JOQyH4OqivCs
	PIsw==
X-Gm-Message-State: ALyK8tJ3JgVCAbr5OzOhQqtkvOrVjaVcngiPK6il0F5ytellXaBSNU47damKAkQ3PbeNDQ==
X-Received: by 10.55.108.2 with SMTP id h2mr8252682qkc.202.1468684680854;
	Sat, 16 Jul 2016 08:58:00 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	t15sm2516090qtc.26.2016.07.16.08.58.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Jul 2016 08:58:00 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Jul 2016 11:57:53 -0400
Message-Id: <1468684673-5228-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-epydoc: add package RDEPENDS
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
X-List-Received-Date: Sat, 16 Jul 2016 15:58:00 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb b/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
index c4752d3..ac5e563 100644
--- a/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
@@ -8,4 +8,12 @@ SRC_URI[sha256sum] = "d4e5c8d90937d01b05170f592c1fa9b29e9ed0498dfe7f0eb2a3af6172
 
 inherit pypi distutils 
 
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-re \
+    ${PYTHON_PN}-xml \
+    "
+
 BBCLASSEXTEND = "native"
-- 
1.9.1


