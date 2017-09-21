Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 434C660102
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 09:57:30 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m127so4746002wmm.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 02:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9mRQH1EWGO/eXFyFeFmIUW1WE88VqmTvQGvHyzLo3zA=;
	b=KQqLaKTjYnQ4HcbM8S1EaiuiINELuQn4Gp2PjnjZPECNYQTMjWgXaHUNK3QdlJzDBx
	Zj2lkFb2baKLOS1BGXvA4iz0MjysvqfRAOOW4+CoOMTav0O/4Zcyyl6CAmw0wio3Yu2h
	VEMlkNW9n5/OyjZuzzJBuJS6mf5D7wuGspgOGXgfq9I0UeheegW5gtbG3K5XUmaTRwmV
	SijOMoKerABTVwq7Y1pOkiE2+vE87KIfhOyBV3trpjYZFfAP07kEqqmYrsg/fkTat3sx
	yo2ujZzno6mEgDQB/ipSir4jsmgYAteC4QNRjboOr+KWTLOsy7oHZYWdRz8HvR5A6WDd
	MFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9mRQH1EWGO/eXFyFeFmIUW1WE88VqmTvQGvHyzLo3zA=;
	b=Zvj28grpDyKnx5exD1jdIkyICPowNJS9PjGqHRzKCMHN0J2mk8DxggJntJA7Hfku13
	1tHl88tod5bHHva/uG4PWIN0Vfuq6D4GB3uG7mIaa8VifcpnbnTIclNF9gaUD3f2x+lg
	L/9G4gwJ4GSIyaAjsy6D1PRNNjtdBfs7UMBlmFYlijxQMf5nxhLAva7n4sUnRO1GIoI3
	cX1Vu1Uiq4O+7rj1W8cKGzXB/5APYFoJSm0S1NaubNDxsVbafuzfR7tuxZPTXRYw+Pt9
	JsHpBHxzYCbPKUsn1angq3jYwyV4QMohFfJDcPn3CWBn045AS2BN14/3Ef+2WK1H3ShA
	ciWQ==
X-Gm-Message-State: AHPjjUjmBo1e4zxK2IIdukptlGhzZDXMlxEd166to+FiOyarhLVabSnz
	IXpUFjksssCLZISPhEmWKuM6lw==
X-Google-Smtp-Source: AOwi7QA032aoXYFQYpZvWAgMhS5WCmYoM0ZobMfWVhsI4uvQ6IivRiex5hEBXYppsqEs2kfGTIPimA==
X-Received: by 10.28.165.1 with SMTP id o1mr505988wme.31.1505987851840;
	Thu, 21 Sep 2017 02:57:31 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id j2sm1060770wrj.82.2017.09.21.02.57.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Sep 2017 02:57:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Sep 2017 11:59:59 +0200
Message-Id: <20170921100000.19981-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [morty][PATCH 1/2] lftp: change SRC_URI source
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
X-List-Received-Date: Thu, 21 Sep 2017 09:57:31 -0000

From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>

Changed SRC_URI source to official web-site, which keeps tarballs with
old releases.

Cherry-picked from master, but without the upgrade to 4.7.5.

  commit a2e075ba656a89da58ca4f849c2f08ec6d50a96f
  Author: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
  Date:   Mon Jan 9 15:34:07 2017 +0100

    lftp: update to 4.7.5 and change SRC_URI source

    Updated lftp to version 4.7.5 and changed SRC_URI source to official
    web-site, which keeps tarballs with old releases.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
index 287821194..d62453745 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
@@ -6,7 +6,7 @@ SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.gz \
+SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.gz \
            file://fix-gcc-6-conflicts-signbit.patch \
           "
 SRC_URI[md5sum] = "8eb1fe5f113126b60f172643c7f6c2e6"
-- 
2.14.1


