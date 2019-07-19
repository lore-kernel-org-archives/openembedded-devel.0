Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id B17E87ECA7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 11:55:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x4so31961054wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 04:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Vjtdk58HyaN3jlZj0vYmi+X8J1X8ixiNTmsEb/QgU2I=;
	b=csZakNE4EdwnUA+onXeZI3ncm7E+C8T4OmDcsnb22KbXRxpNyXrhydTMOeXzpjU9Kt
	Pu3qrf1NVGFZdfN9Jm2RKaNcDFwijwHrEPEEMW2dXbSTpJ5Riqyd96dEytD+56PIID1v
	eio5UezStO3k7f7BkClHzIGKly46sEdyzUbpzMXBBGEpJo/BaFoqNUfJTW97ExmBWQws
	rqoArqBiqOFIJcZT/nPWTdMzRAeqsclcaVK5ZPzzneWUyK22PbaWGfw9WCjCjzFlKOv0
	lqmb6i63BIQqxs9SMANkOFrOQgGNRlGLvz/XGmd9f8hQCmW7kc+iHLJFbsaTlJbGSah4
	8mlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Vjtdk58HyaN3jlZj0vYmi+X8J1X8ixiNTmsEb/QgU2I=;
	b=ISpEbQzwi3GnHJK6xQM4pTw7Jiw3FUK7U8DzyUw+bozgoz8hUG9MTmrN7ZZX6xEEu8
	1gYXW3ocwxBcDmwRZr2x5XP/NVp8R/d1ZhJARR/e7K+R0yeMtFCgKvUMCjpnlnZ0zWxz
	GwRb/SRRrfRzix/TwhAsRmrDzw+FB6talNqKLjsBVXx4YnOEGpoTkwCK/vlNm9Daeb9O
	jqcjtAV3sij4NH4bG9hMDDVg2/5d/dJJ2vZXGSi353gh6Jd/AqfvUlldx4mSJLwPBjIs
	stgN+zqBF6PK14il44Fre9pViyroKM/l7E72LDIhCZPKI0zsrT9hx5S1GAV4/T0E7aQC
	xi3A==
X-Gm-Message-State: APjAAAWwVo07aU4XK/AE7Yezbt3JdmRzADddu3yao/+mJ8ie/s8m9GVO
	C/Wui6FDRprlp8/N/0V3PEfBrfnhmIw=
X-Google-Smtp-Source: APXvYqxZ/GUAeCK9xYoE8loihufR2HCZ3VpCSB7sM/VtKRXjDod6/XnZBPnJ2bHlhJhIY7S1NGhaVw==
X-Received: by 2002:a5d:6949:: with SMTP id r9mr53088217wrw.73.1563537312896; 
	Fri, 19 Jul 2019 04:55:12 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	e6sm30874167wrw.23.2019.07.19.04.55.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 04:55:11 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Jul 2019 12:55:05 +0100
Message-Id: <20190719115505.20680-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libzip: Upgrade 1.5.1 -> 1.5.2
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
X-List-Received-Date: Fri, 19 Jul 2019 11:55:12 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../libzip/{libzip_1.5.1.bb => libzip_1.5.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libzip/{libzip_1.5.1.bb => libzip_1.5.2.bb} (74%)

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.5.1.bb b/meta-oe/recipes-extended/libzip/libzip_1.5.2.bb
similarity index 74%
rename from meta-oe/recipes-extended/libzip/libzip_1.5.1.bb
rename to meta-oe/recipes-extended/libzip/libzip_1.5.2.bb
index ce73700d78ae..5d725bf36158 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.5.1.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.5.2.bb
@@ -14,5 +14,5 @@ inherit cmake
 
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "6fe665aa6d6bf3a99eb6fa9c553283fd"
-SRC_URI[sha256sum] = "04ea35b6956c7b3453f1ed3f3fe40e3ddae1f43931089124579e8384e79ed372"
+SRC_URI[md5sum] = "f9dd38d273bcdec5d3d1498fe6684f42"
+SRC_URI[sha256sum] = "b3de4d4bd49a01e0cab3507fc163f88e1651695b6b9cb25ad174dbe319d4a3b4"
-- 
2.17.1


