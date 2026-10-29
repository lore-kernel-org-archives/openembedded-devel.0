Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7659.1793265712764112147
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WCzp87u+;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1082723f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793265711; x=1793870511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cs9CGa9djD575i36VgtDmnTQAXHI5AqPDLrid9BOzT4=;
        b=WCzp87u+r0wHG8dlV01o50ZOsk63yKYRw01ebHQ5fVOnfEmj8xdzbyMGh0sQV32JbK
         8JqqS9xBJuokVE7XreS3yceoCOy4FICIeXBCR9ZM/rq9y15gbMrzDD4uT8CkZcg2iPA0
         jY3OmOmcE4ipf8tvsXnhwto654xhpcfGDt34Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793265711; x=1793870511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cs9CGa9djD575i36VgtDmnTQAXHI5AqPDLrid9BOzT4=;
        b=n4s8XJY6Ydlj+IsuGr1TvG8PyGZyVGFz5nfaX+SHlDMwQ6YG6mYLpoB9dkbAmjVEk6
         BYf3CTILkU61uqN+LNE1D55pG6d0lVMCteRx56WoqBjzlr7c1pVy2qFwtPIYccvt2lb3
         idFvTGC05fM6TODjdmYKKKL2kIzhA+E00uAMlfI+ByEtHT7vs5vcVXW1IFg2iQY8BfIy
         14dqkm+TpZFQBtjr/d20UUnDcQhs4pOK6WCMColWCo/yf7fdrpshnyh/cHrqt3AlLpwM
         P83W6HaqUHuOkKUtfdWpIlbHrWn/eYm1pnBvCs7QsfXS6+Bo295Hex7dbIJJEORH+Jo8
         nFsA==
X-Gm-Message-State: AFq9FYKcM8dAJTHO8u9NctqxslyAlqNBk520uSXId3XlbEFrtkVEdNcm
	Q3EyLVoCW4cCjqCmyxAb3aL83kLw34Ctj/TjcalYVJj3hlhOAuy4EbVwDvf6dRjy10RDwnZBMHt
	hMC2i
X-Gm-Gg: AYBFou0GJR3mgjg82C0okDSQzSeQUBOyNcggrPTQ5tRdZWwkSbnTQTxcsQ+jkrCzxQc
	bcwNVUbDMSmygWaABaWPzIwQuWULpqfapA83ZAR4UHPIYYb+dXqd3tBjcgXz7kivFn2HaFUP61b
	kyg2rEis+Djqbwq10wrLuJKO2PXT4aL4OXNGv0Fk82uZVGn54fW4Xdxbu/QhctDCPvES1JRAHV3
	4OzrPi+S+6ljxvzti010PEP03SpFQF7msV6zKRemDn09sOZLyoifo4TcZlP/ynDZeLdmNb1zj1W
	b3lVH5irg0JmLB41PEaOKcPzbqd83M3PJd1Q4ZGVElACjgZ4jI8nIAb2RpfX/D65cyBv7TytRj+
	713ORBMNQJdmdeNOcf1cmIhdRpj+3oJvh0dJA8dYbxRl5vgNx7iPfrmcEte+y37B68Exq+av4Z+
	dww9LwKooAIRcjheppGXaOV7J07yNtC/jI3v15t5E4uCymPOB26O/JiUNgGsICCSMdifTD8lR+Y
	/idrfJM/K0599bc+hTcqd5efUiyiiPN88JuMhRKnKV2zv/LsZTu+1KqEK0oblV7f2FSwV+T5LvL
	ilyke0y/wPlLPBFeRIHkocvO27xZhcFL6Gs69bpe5q4UiASzIjbU0XY59JbgxTG6I/GqVOqrKsj
	g0fNUm4vQduzcWiNjoApM40z2QV9VLFaMbZBrPw0SXmLrpvAl/2ijjw==
X-Received: by 2002:a05:6000:3101:b0:48e:3085:7cf0 with SMTP id ffacd0b85a97d-48e5d5da15amr11641633f8f.51.1793265710711;
        Thu, 29 Oct 2026 02:21:50 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdf9bdsm31901084f8f.55.2026.10.29.02.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:21:50 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2 1/4] python3-pyroute2: Upgrade 0.9.6 -> 0.9.7
Date: Thu, 29 Oct 2026 11:21:44 +0200
Message-ID: <20261029092147.791220-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 09:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131645
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.9.7:

- ndb: basic support for XFRM interfaces
- ndb: basic support for object preload hooks
- ndb: basic support for prometheus metrics
- taskstats: fix name unregister_mask() -> deregister_mask()
- plan9: fids per session & inodes per FS
- ethtool: fix the off flags
- dhcp: support option 41 NIS servers
- wirouting: link features
- rtnl: support RTAX_CC_ALGO on route metrics
- rtnl: add missing NFT flags

Fix ptest-runner errors.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-pyroute2_0.9.6.bb => python3-pyroute2_0.9.7.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.9.6.bb => python3-pyroute2_0.9.7.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.7.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.9.7.bb
index ec72b450ee..d83b65f6da 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.7.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
                     file://LICENSE.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache-2.0;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "6bc5e2ea9a372ded682b4ede4028ba00236bd6e35b42d833f39a96b219ef1db2"
+SRC_URI[sha256sum] = "a678b098478c46ec51d6bf9a03c3cd2ac0172dffa590e9e8c1eeab633d0c17c6"
 
 inherit python_setuptools_build_meta pypi ptest-python-pytest
 
@@ -35,6 +35,11 @@ RDEPENDS:${PN}-ptest += " \
 do_install_ptest:append () {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    # Remove test_frozen.py because it is missing some components
+    # and is not present in the project's upstream GitHub repository.
+    rm ${D}${PTEST_PATH}/tests/test_unit/test_frozen.py
+    # Fix paths
     sed -e  "s|'test_unit|'tests/test_unit|g" -i  ${D}${PTEST_PATH}/tests/test_unit/test_nlmsg/test_marshal.py \
-    ${D}${PTEST_PATH}/tests/test_unit/test_iproute_match/test_match.py
+    ${D}${PTEST_PATH}/tests/test_unit/test_iproute_match/test_match.py \
+    ${D}${PTEST_PATH}/tests/test_unit/test_nlmsg/test_nl80211_station.py
 }
-- 
2.47.3

