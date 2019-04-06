Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by mail.openembedded.org (Postfix) with ESMTP id 67C107D5BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Apr 2019 19:08:12 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id v13so7915902ljk.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2019 12:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=4dEnWAaaoFKSQgYKxa8JrxbrpjcNMm5+TNkfAO/qkFw=;
	b=wZdPW9+pSf4HW2bAMGJRshAm0OKWWah0r00xe/O7661+9eLYvlPtX1I9XPaGHXgaGm
	NceBsqDOnBOdgeAKutRZbYJpCpoDu1VsmqjGyBeiRbZ6fVfcXGfdlaI4Ne2RvQXYkvbh
	O9G5On/GM7AJ+HVktCH5/mbouFbaO0hn1ZyBvVOvGW06D1dMCBf1i4QHCI2EpzYkAkyq
	6ux2rq77w0zE1qPRWIovJGOB0o5ep140/LERw8kJnV5NiMB9rhc+oSoblEYmM+k2Ork4
	g5CWtiJqavR49FqRga3PYMEJooOTr3OnOat6HIW/c+S7hsNWxDhsh9yxHNjfLdXPvTu5
	nwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4dEnWAaaoFKSQgYKxa8JrxbrpjcNMm5+TNkfAO/qkFw=;
	b=ZNmL1fd+wRMLT6gw1SglbDz+ARsKMA7+/yptZ/PkFP1Gl9lU8dEdXAm4qpMSTi7xFo
	769SKz+sG0bmG/WxRcdVU7SMPLJ1FteG+M5RNEMalTY6QiuhMo5rb1YuLFA8vZ813Yqu
	aSxpd4SemcwBpTNrGhXfpa13bda59TSk10jknS6seleRYaz+qddKogV+LSJgo8bjwLaQ
	1dkBrdIfZYfZ2mtFG9FW6ogFdJme/NzI0LWAOjlUX3ZuI4wkgSTuL7v73/l7Wpy/l25f
	1dCfyouzV25mnBJR3wuG9Fp8GwfiFquswTt9r+s3Ke/NcjG69yre3SFeNl/n/BIWGKEp
	w+SQ==
X-Gm-Message-State: APjAAAVF6gbMGUL5YVTiPGWOBI3RxXlYaoqV32LMjyMxMQBu16u1+KzA
	dPi2FtH8RzLj2JdMsfiC1V+DeDUOc5U=
X-Google-Smtp-Source: APXvYqy3E07Q6q7U4VCCXmOdEt3iNywvPKb5JNMBLa/JziuI9m9SoRS/8vb5tUNuIDmV2N87rWN1UQ==
X-Received: by 2002:a2e:9a91:: with SMTP id p17mr10693934lji.127.1554577692719;
	Sat, 06 Apr 2019 12:08:12 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	j76sm1961384ljb.78.2019.04.06.12.08.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 Apr 2019 12:08:12 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2019 21:08:07 +0200
Message-Id: <20190406190807.5220-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] macchanger: update to 1.7.0
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
X-List-Received-Date: Sat, 06 Apr 2019 19:08:13 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{macchanger_1.5.0.bb => macchanger_1.7.0.bb}    | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/macchanger/{macchanger_1.5.0.bb => macchanger_1.7.0.bb} (50%)

diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb b/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
similarity index 50%
rename from meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
rename to meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
index a90177f19..0c683ac01 100644
--- a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
+++ b/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
@@ -1,14 +1,13 @@
 SUMMARY = "Tool to view/change network interface MAC addresses"
 DESCRIPTION = "A GNU/Linux utility for viewing/manipulating the MAC address of network interfaces."
-HOMEPAGE = "http://www.alobbs.com/macchanger"
-LICENSE  = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+HOMEPAGE = "https://github.com/alobbs/macchanger"
+LICENSE  = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "net"
 
-SRC_URI  = "${GNU_MIRROR}/macchanger/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "79b7cdaeca3d8ebafa764c4b0dd03ab7"
-SRC_URI[sha256sum] = "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb2031120826cd73fa8fe"
+SRC_URI = "https://github.com/alobbs/macchanger/releases/download/${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "ca56f16142914337391dac91603eb332"
+SRC_URI[sha256sum] = "dae2717c270fd5f62d790dbf80c19793c651b1b26b62c101b82d5fdf25a845bf"
 
 FILES_${PN} = " \
     ${bindir}/${BPN} \
-- 
2.17.1


