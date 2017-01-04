Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7080171978
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jan 2017 01:27:36 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so50921155wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jan 2017 17:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=gOpvhNjA2BdNQhCwMky/MtkY1UwAWpPcxvtkJVwfkdk=;
	b=hGfODXu+Ebih+sbEwskInSlP9GxfMqw5A2/zxpHSR9t63P8l0mdgG1MipdAyKFFwGc
	IOrRMQ6cYay3OH8dmNkoqz+RapwUU1b3rhXta1aR0qI+Mh9+FPckfiQA7hrjhkYQ/0HC
	BygCamEhTciwKvmM2oa/o7lfkrGe7CY/R0Azbv8IHvJw98nOEBRuDhody+XB2qdFCaPt
	6oLKPc6vKVibDl6tVAOouYr6b6HW2Sw9ah0gtxUBT6lH83RXZ4zmmazLM/HlzvOrz+5b
	bbv7s9J64BVxV7cX2uuwWtWJdq44yVqTx46rhiFGSak1OBBMyOx53TIrpmwSYNa/AxoB
	u5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gOpvhNjA2BdNQhCwMky/MtkY1UwAWpPcxvtkJVwfkdk=;
	b=i3X/0op7XnnwsBDeXOKB6Q5kel/ovaeYy5R1WIX65u3OAGq94BvrirVSBeNlOsT7Gs
	zCJfqr6c7N0K/hA+CzyBom1qDxPm0dU+aoyymw9dVpFus+qkMr7hYL5KdhJd9vUUEXfp
	t06lnzPRiTDJiCFnawRrhRoqt7jzXTqJqlZ6FJI6UH5Uck0v6sURvdpsl+cDw0cz792G
	5H/b9gMEXJd5fitLB1uF7Pa1CSTK3pdIR5C2wDd8boLstvV7sXHjsBoNXQdP/C7YFS1t
	K9Zmpo1ivJM9LpFWneUm6+9LVvrJYQ4MdOvHIMWDtixjWv1F4qr4R/0OESmAYMMXQPzD
	PG5Q==
X-Gm-Message-State: AIkVDXJZZkbiSOcWOOtd4UFPq5bVRHO/yRUOq/5r1O3qAIvMcFO4a/S/IXDihfifmnOIfw==
X-Received: by 10.28.225.138 with SMTP id y132mr54080929wmg.52.1483493256921; 
	Tue, 03 Jan 2017 17:27:36 -0800 (PST)
Received: from localhost.localdomain (p579CE4CA.dip0.t-ipconnect.de.
	[87.156.228.202]) by smtp.googlemail.com with ESMTPSA id
	i15sm95427825wjs.16.2017.01.03.17.27.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jan 2017 17:27:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jan 2017 02:27:22 +0100
Message-Id: <1483493243-30984-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1483493243-30984-1-git-send-email-schnitzeltony@googlemail.com>
References: <1483493243-30984-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][V2 1/2] xfce4-terminal: update to 0.8.2
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
X-List-Received-Date: Wed, 04 Jan 2017 01:27:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-terminal_0.8.1.bb => xfce4-terminal_0.8.2.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.1.bb => xfce4-terminal_0.8.2.bb} (68%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.1.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.2.bb
similarity index 68%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.1.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.2.bb
index 9313efb..8df7b5f 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.2.bb
@@ -8,5 +8,5 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "46d347c0ecbb74a7878d48833042371d"
-SRC_URI[sha256sum] = "ddfe53a89d315a4a9170ca6d2cee2d33145bd63630062b2e867fb3a5fcde5fdf"
+SRC_URI[md5sum] = "53d46d7dbcb74d238dc5e0c8dbc447cd"
+SRC_URI[sha256sum] = "92aad3e14f3ef8d4c6c1409463e989bd8f5eefb686234f3cdbfe574729401681"
-- 
2.5.5


