Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id DB3FB7887A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2018 03:08:07 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id p9-v6so3172410pgc.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 20:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qLTZIkxSMX1O0TqF8ANTKP1fX/o8FlSpBw5xxt6cTuY=;
	b=FPpmCGHu5qs152ws8D393qd93H1BFhjEz4qLmhOJ7uRZZXD/dgstYEETtMKEsyiYBZ
	/0QCQp0E9VapNix5vAGJnYxNYIdxRRg5dbRldgi7p7JbFzXgy1BJ/QtqcQad5DCzLPzu
	6v/tRkINaOxxENKnJ+p/7QpUtC/Eshf0Yg2Lo1VaKyLqpi/WDLflRtGsXQiD8GZvKxAq
	PfJkp9B3pRvwmpcXMRMqvQYfib6lD0mibvEFM6Ysx2Rae4JRCuwhoJH+DivZmf6rIjBF
	kdTmmZFqQ6zkShZtYxiLcs8/m2Pu16MokH/350VGysxg34pYi7GstJamFBob06LvTveu
	K80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qLTZIkxSMX1O0TqF8ANTKP1fX/o8FlSpBw5xxt6cTuY=;
	b=g6FCOCTy7WvXd+3WrKYr1K/aa15DWIjAltmWmPwWDIDMJ5xGuPobvIu3sB20pC4Ibs
	7te8CFKcdRqmZm7RMHxrlqQuOU32Nq9R4k4yk7uT1nv0JoSjhKeH/ZS6HqZPS1P1Rh+4
	gxqbvprm2ot8knpldcsuCrhPM++Hqs0DZE4Hcph2EjxMPu9bVU/6Nmjrm1DfbtkhzTaQ
	OeZh4GgdhKos+HHzGSXmb5xrk0Y5HdlYpwQ/7RpZirfqakDDU06HfiSkbKhD6aaNhcoG
	mP5E6y9Czg2uEhNZiLBY5XNYHPQMB3HOS6RW22BJI6ySklpJRxZ4cHVqc4b/OssKMwVU
	zXYg==
X-Gm-Message-State: ALKqPwcwqCjB7nxT7WrNb19u+ay16nkIukm8DwSehMZHtBSuOBOfG/ec
	8UhhfTstydxuCPin8F2RMEorXg==
X-Google-Smtp-Source: AB8JxZp8MymI1SYVJAC05Ks6dwhPDi9z6FJE6qFnwTOIv2uXyJq1L6z1LXx5Y0tKhMjkvX44EqHnFA==
X-Received: by 2002:a65:628a:: with SMTP id f10-v6mr1359840pgv.6.1526094488022;
	Fri, 11 May 2018 20:08:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	d4-v6sm6440933pgv.73.2018.05.11.20.08.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 20:08:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 20:07:57 -0700
Message-Id: <20180512030758.31409-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180512030758.31409-1-raj.khem@gmail.com>
References: <20180512030758.31409-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/8] modemmanager: fix mbim disable string
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
X-List-Received-Date: Sat, 12 May 2018 03:08:08 -0000

From: Martin Kelly <mkelly@xevo.com>

The current string used to disable mbim is "--enable-mbim=no", which is
producing a warning. It should be "--with-mdim=no", so change it.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../recipes-connectivity/modemmanager/modemmanager_1.7.991.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
index 4f94001690..b1a718dbfb 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
@@ -25,7 +25,7 @@ PACKAGECONFIG ??= "mbim qmi polkit \
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,"
 PACKAGECONFIG[polkit] = "--with-polkit=yes,--with-polkit=no,polkit"
 # Support WWAN modems and devices which speak the Mobile Interface Broadband Model (MBIM) protocol.
-PACKAGECONFIG[mbim] = "--with-mbim,--enable-mbim=no,libmbim"
+PACKAGECONFIG[mbim] = "--with-mbim,--with-mbim=no,libmbim"
 # Support WWAN modems and devices which speak the Qualcomm MSM Interface (QMI) protocol.
 PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi"
 
-- 
2.17.0


