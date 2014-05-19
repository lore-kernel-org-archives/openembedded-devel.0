Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f41.google.com (unknown [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id B581C66003
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 May 2014 13:38:30 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so3648833eei.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 May 2014 06:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=upTkyDXXpmmiIShV/77X5Y/4ZpUTPyHJ9LAieYpJSMU=;
	b=YO2+8mOBzhlVaeIctskZqt8JVl9M7wQzfE5g1OS0W9dW9CkrzrYC6tTP//L9J+sSyr
	C9YKg7U07rUuhl0oTYKwtAIUjH2+3YAX9XwJULMhz3g9gt7WT7HVSkd/PzzphZV9JiGb
	DZDlP4JWBrydTgrFTEBu9f/B0moWEh5St0NVcgxY4L4ctF0gJ1sPsVq1eVmaiV6cMa/3
	osRET4nb3DsbPrOnQusL0fEV5VzkrqGXExkx+PnljFJwu0aAJB9zTdu4hctLbRMFrIn0
	V6ZIjNIIxsroAaQHrLm931lLSIBaEA7dqOq9U8uWqR3DAOUiFksQKyEXZtIavaxZCpFW
	9Qhg==
X-Gm-Message-State: ALoCoQnPf/lsX7O5uOhxvlUWsQpZni6LS9EMsrbSNiaDQJ+ypucSPze41KbIlasTHTSgYqfEoPC/
X-Received: by 10.14.199.8 with SMTP id w8mr45953903een.22.1400506710872;
	Mon, 19 May 2014 06:38:30 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id a41sm535746eef.30.2014.05.19.06.38.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 19 May 2014 06:38:30 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 May 2014 15:38:21 +0200
Message-Id: <1400506701-28686-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][dora backport][PATCH] qmake5_paths.bbclass: Use Qt version path for headers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 May 2014 13:38:33 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

When looking for Qt5 headers we ought to use the Qt5 specific path. In
case the distribution wants to have a flat tree it can set QT_DIR_NAME
and it will still works as expected.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/qmake5_paths.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/qmake5_paths.bbclass b/classes/qmake5_paths.bbclass
index 2b5bf4b..8f91e93 100644
--- a/classes/qmake5_paths.bbclass
+++ b/classes/qmake5_paths.bbclass
@@ -5,7 +5,7 @@
 QT_DIR_NAME ?= "qt5"
 
 OE_QMAKE_PATH_PREFIX = "${prefix}"
-OE_QMAKE_PATH_HEADERS = "${includedir}"
+OE_QMAKE_PATH_HEADERS = "${includedir}/${QT_DIR_NAME}"
 OE_QMAKE_PATH_LIBS = "${libdir}"
 OE_QMAKE_PATH_ARCHDATA = "${libdir}"
 OE_QMAKE_PATH_DATA = "${datadir}"
-- 
1.9.0


