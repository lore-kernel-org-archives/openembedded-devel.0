Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id ADC666CCC9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 22:36:37 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so3047022ead.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 15:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=za8ab3elgJXluk9RPLrWIdxMByGTakZdRh7lgCMm44g=;
	b=n7ZIC+pP0Pnl3prkrD3B/Ochg2Qo5LePrtv8nluyeRnQNJVS4pjAyxxQoPvbGqpE1s
	JTvdNqlXRGQKU4pNan20q+3wdkZOT0lQoN2v/q2TOtpnpGyxG3FUUomvvXAiLtZHeVTh
	36+P+rza44nrhgDn320upEnRk4tzmaCp4i80V79kCZg0gCOxsOeTE/9IhlS2xcCQhuy9
	AcajjqKNncUFMtf7aSPJOYySYVG8fiT0OnqkOQqsscnkHYF+a8xK4VA0ktZSPIJCKqd5
	s/hSbLAQb/4CJ5c9UMprOVSf5Ldcajoch8/8/SfyMP1FKvO82wKAfeJYponaR9ZeWTQp
	//Ow==
X-Received: by 10.14.219.198 with SMTP id m46mr50343534eep.41.1381703799219;
	Sun, 13 Oct 2013 15:36:39 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id a1sm145535666eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 15:36:38 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 00:36:31 +0200
Message-Id: <1381703793-5661-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381703793-5661-1-git-send-email-andrea.adami@gmail.com>
References: <1381703793-5661-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/4] jornada56x.conf: add qvga to MACHINE_FEATURES
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
X-List-Received-Date: Sun, 13 Oct 2013 22:36:38 -0000

Used in oe-core in:
recipes-sato/gtk-engines/gtk-sato-engine_git.bb:
recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb:

EXTRA_OECONF adds '--with-mode=qvga'

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/jornada56x.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/machine/jornada56x.conf b/conf/machine/jornada56x.conf
index 4258a51..4a0d2e6 100644
--- a/conf/machine/jornada56x.conf
+++ b/conf/machine/jornada56x.conf
@@ -10,4 +10,6 @@ EXTRA_IMAGECMD_jornada56x_jffs2 = "-e 0x40000 -p"
 
 SERIAL_CONSOLE = "115200 ttySA0"
 
+MACHINE_FEATURES_append_jornada56x = " qvga"
+
 require conf/machine/include/tune-strongarm1100.inc
-- 
1.8.1.5


