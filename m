Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF5E771A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 01:51:18 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v123so1006930qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 18:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xFGmx93l0yiJUA2Mech8ri96bTTMkyxa1G+a5EDySkg=;
	b=QvaOw3DWyxg57cgVibdMya1uqFGAWfV/XChhu+A5qA/S3+vmXdoJ3jtRXHT9lKWwWg
	pYven82EshZ7tzXWHvTsQGc4GQWgJcL3y79EN8J80/gBY00tbZuzm57sD1f1mdlINzhX
	hKjvoRM0g7tIEi3zRQTbTSwZ7Amh3zPm51K2Mv2SJnKCiRmEprVYWIlcT3y+h14pp/Ys
	ygzbC+yRuYN1WaHPsGXAfrxdiCcF/1ofUypGCu6v9fdXGtszQcoq+S+MzHiCmfyuVGIT
	+ZwGH1oX8AUpjr9gxrJHuaguZV23BDQhj+qMGb2OnV0aNeOsMhT0VjIbOPonDynWCR32
	iCTg==
X-Gm-Message-State: AEkoouubUnPKtarPQcsY3wBBBxbrfFxsXmLxIOhTD7l9Yp0B6nis3M7pYXw2CnaGy8lA0w==
X-Received: by 10.55.132.68 with SMTP id g65mr14335858qkd.8.1470966679249;
	Thu, 11 Aug 2016 18:51:19 -0700 (PDT)
Received: from lnx-dereks-laptop.minotaur.lab
	(c-73-172-178-168.hsd1.md.comcast.net. [73.172.178.168])
	by smtp.gmail.com with ESMTPSA id
	l22sm3135874qtl.34.2016.08.11.18.51.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Aug 2016 18:51:18 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Aug 2016 21:51:09 -0400
Message-Id: <1470966669-23763-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] gateone: remote custom prefix for /var
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
X-List-Received-Date: Fri, 12 Aug 2016 01:51:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-connectivity/gateone/gateone_git.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-connectivity/gateone/gateone_git.bb b/meta-python/recipes-connectivity/gateone/gateone_git.bb
index 44df604..6a93f83 100644
--- a/meta-python/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-python/recipes-connectivity/gateone/gateone_git.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://github.com/liftoff/GateOne.git;branch=master \
 S = "${WORKDIR}/git"
 
 inherit distutils python-dir systemd update-rc.d
-export prefix = "${localstatedir}"
 
 DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
@@ -87,6 +86,3 @@ RDEPENDS_${PN} = "mime-support \
 
 SYSTEMD_SERVICE_${PN} = "gateone.service"
 INITSCRIPT_NAME = "gateone"
-
-# http://errors.yoctoproject.org/Errors/Details/74489/
-PNBLACKLIST[gateone] ?= "BROKEN: Fails to detect python's Makefile"
-- 
1.9.1


