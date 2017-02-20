Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E55B573173
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:39 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u63so15683724wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=d0e8DNdjfclxEIZ10t5HExRlXu/e2jt5QSXnfl49Xxs=;
	b=YnCOlaT5Y3QbA2BAbB/pHpN5t3zbkMm60Ogr9gEG1hSVeiYoa53Nw3sEKKwOXpNgqY
	fUr6UPHZKZXg1cnuqkKXOG4nkz3gtI0VCcdUgB5CypqJEs8W5U5yZLyT9qj7grQLsAKx
	kqcfJqcmVMbBK5qQkKN5IuxJf3sWOc5yDFuafRbQAhsUYyyq65zNV5U9gKtPhEL6yFV/
	jan42iQw0QehcWj38XVbZ4BEfgysHX2sGZ5cTOeIaaOEBH38RrLLelWcJWBiLy7fpxdl
	4s+q64xZXdyCWegcpHeOPk4Aw+Jo9kOKwVz0QilGDumMsoorlR2UciwFYdPVHfoMjQAO
	DK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=d0e8DNdjfclxEIZ10t5HExRlXu/e2jt5QSXnfl49Xxs=;
	b=IRwUlR1L6QZUSrN+c6Hg5Zc5y4yFTCYSYYpzIPz96WA5gRhxaKnano2lu+UbsPneA/
	ipNeu4TlQztSEEj+gpfOeONQDeGdU1HJWjOL6R3d1fbrfR+SEuXb4Y+UDx8eI1F7/1Jf
	JDARyVHnm3R2RXXvO2mIbmIYxgqb39SmdccFfCu+Z8KhOGTeUjGql8dwL3S59cHdiCGh
	gX7U9q1jwkmyxhlfiqlZVvwLg/r7idRPUQ9/f8bkZBalG+gs9sVHXrP0i8j/wviHkczy
	Y4v7EGVtyTrHlc3aQ/DO9EbyNWL9lFc/gWLnvADzxURwpFnOvFEvlc39rNc23u7/chiJ
	1d6w==
X-Gm-Message-State: AMke39lEdd59vpZGWtPljJwzRRxiLaAPlcntlG4FyDJ/lGBXuEkIm2+o6NnZSaFbEvqGwQ==
X-Received: by 10.28.141.193 with SMTP id p184mr20381688wmd.122.1487614060075; 
	Mon, 20 Feb 2017 10:07:40 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:40 +0100
Message-Id: <20170220180700.29836-25-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 24/44] xfce4-sensors-plugin: unblacklist - lmsensors is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.6.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.6.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.6.bb
index a7c8dee..c2e0ed9 100644
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.6.bb
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.6.bb
@@ -25,5 +25,3 @@ PACKAGECONFIG[netcat]     = "--enable-netcat,--disable-netcat, netcat"
 PACKAGECONFIG[libnotify]  = "--enable-notification,--disable-notification, libnotify"
 
 FILES_SOLIBSDEV = "${libdir}/xfce4/modules/lib*${SOLIBSDEV}"
-
-PNBLACKLIST[xfce4-sensors-plugin] ?= "Depends on blacklisted lmsensors"
-- 
2.9.3


