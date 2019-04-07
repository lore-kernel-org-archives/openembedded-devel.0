Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9D80C7D3B5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 14:35:39 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id q66so8966662ljq.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 07:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=r9N35DNf3rPYHLtsVvuDV9PRIrdVSZyCFfazVgrnOhY=;
	b=isv6ANuFWy/o+AQ+zJSHECO7RZYNYiKZuiwhUwx/yGgH6ieSK8Vp1TacWbBsKuZFOX
	RtMpqoojstD9udVlt8KiIg+tGs+wSMRrY8f8Heq2eidQtvIP9tP383wyxkseUbzjHtkq
	flhH/VjC04mEfnFUDBFKWU1A4/aOJCDps1EzwQp2n126E0V2IiP2TSeevI1XCnVsC3e7
	JiNDfW7GcJ18VctanYejGo+7Dh4+MK/hrY3SU7FWDruowQJYlyPL1QMCHhv+be8VJCtT
	yP9b0q6VscvL6HvrJ8uTvdhWoLLWFZvNmoMkpNtRCpwAsVkNyTPaESVv9T/gVonaUNLH
	oGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r9N35DNf3rPYHLtsVvuDV9PRIrdVSZyCFfazVgrnOhY=;
	b=pxqidJoV2ySzR5LgVhZbzeBv2Z5oP/iJmMUFY0wQYzhTF7knoe0g/Mq7TWJspfGSAx
	xGmdBMo2o7M7JaPEtE+WWbmVS33XkzFOFiiwrw92YzUyDHKSD1A6l+Cyldkdl9VbdWBI
	qgz6d04dn8XM/x/D+AhUE3sObenGEWiv5cDnm5MBYHgPTZ5rojX8VDs/iM61zH2uySPl
	E/VqIslxI2LqJSgpjwLUN+1HF58zpDbf13Cfqa9ET36W1N79qeF73V4p6Z0kZrexNa5g
	1gHYVJwffnrbidOeXvIUN+qDGyJg7McJU2NxaP9+zJodibhgRO2XjUYJIcge0651EwFD
	L4kg==
X-Gm-Message-State: APjAAAUCvrrGx5uSaIGFWCgwUQK7oyHzqTA3GAoPJYu2taq7qAWN2y9L
	/Y0p8DdSul8vlCwKnAKMbzX3aQKJmE8=
X-Google-Smtp-Source: APXvYqzQ9M0UTKc1GAmxXuQmIJHsiL+wNPMVn0IFZHa+JbVEmFr5GptTsgzazRlTLnXmc4waq3w6iQ==
X-Received: by 2002:a2e:3e18:: with SMTP id l24mr13731382lja.68.1554647739815; 
	Sun, 07 Apr 2019 07:35:39 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	f25sm5518446lfc.46.2019.04.07.07.35.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 07:35:39 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2019 16:35:36 +0200
Message-Id: <20190407143536.2030-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] chrony: update to 3.4
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
X-List-Received-Date: Sun, 07 Apr 2019 14:35:40 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/chrony/{chrony_3.3.bb => chrony_3.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/chrony/{chrony_3.3.bb => chrony_3.4.bb} (97%)

diff --git a/meta-networking/recipes-support/chrony/chrony_3.3.bb b/meta-networking/recipes-support/chrony/chrony_3.4.bb
similarity index 97%
rename from meta-networking/recipes-support/chrony/chrony_3.3.bb
rename to meta-networking/recipes-support/chrony/chrony_3.4.bb
index 2586370fa..fb7135953 100644
--- a/meta-networking/recipes-support/chrony/chrony_3.3.bb
+++ b/meta-networking/recipes-support/chrony/chrony_3.4.bb
@@ -35,8 +35,8 @@ SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
     file://chronyd \
     file://arm_eabi.patch \
 "
-SRC_URI[md5sum] = "81ab62cf5d60b4b3fa8cd2c1b267ffd9"
-SRC_URI[sha256sum] = "0d1fb2d5875032f2d5a86f3770374c87ee4c941916f64171e81f7684f2a73128"
+SRC_URI[md5sum] = "7170e750469c198fc6784047d6f71144"
+SRC_URI[sha256sum] = "af77e47c2610a7e55c8af5b89a8aeff52d9a867dd5983d848b52d374bc0e6b9f"
 
 DEPENDS = "pps-tools"
 
-- 
2.17.1


