Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6F24A7508B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:59 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id n5-v6so11792421wmc.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=gFsCsjL+iE26fCX8zlOK+mWW3eSXtBSaUrnKyoywD/w=;
	b=nEB1e+Pu7HILtVSqLSdbtjpJ1KaIkAYyq0H7HFM2mBKaNRMb8YfaQz9FXARAmUZV2N
	nqqtllxBmACTa97i0Kra4h4F+GJEsJEPXp7BWZkz5tqeSjZXkz20EGN5mhEuJSolneOe
	Z3PrOfY4XoIiTHDlgYzPcUFsJgyGjsA/AVDFbyTAKb5VXUNg11ihIkWK+WWXzYj9tQt+
	xeEFbr1Gig8LIINc3VhQcjoN6qoAxHCMsa7StZHsBg2c3l+sQQTNCMgmy5IqfbjU3qBP
	95jRfWrRo2nLUibsP4hTXCNxlNUffPjsWeJ8s30QJNt3Ag/EkUGz6B0cEhmTzSy9e6vu
	m5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gFsCsjL+iE26fCX8zlOK+mWW3eSXtBSaUrnKyoywD/w=;
	b=Mjyv+x3qScvla/Jkuz/Su7JdcuYhzhgiJkMaRQq4cwY9LxrU1gf6kv5Vag0a5LsPvM
	HgLOuRWEfPATzUxx1dyaw3HHP9SZ0WamTfNidE2mIswmxa3LdYKAV2jrrgR5x3uNczq1
	IosNn1uYZ9AA51LOFoSYxruM0s4nk4Na0AZUEg+w4Z6xgirEacJ9V7cc4ERXrn9atLdJ
	bxT1iT0Amut4qf5H4DFR3OuIDmHaHDI2uYasOaYG/ePHwZTCkDR/XuMXshcgFPVRJ+FW
	Is4/BruRxCfhGNEw64YlYZ6lyw0RBRj7pBmnvXwlE+PXN5JOzfTVJFcwRGkF+ZmcNf+/
	tQXw==
X-Gm-Message-State: APt69E3BCV/MYnVCjN1AwKadnQlaOQiJGR4MOjxikklqN3a5epStAvdz
	hJIwSngUjNkomA2lIAGh5XUjXQ==
X-Google-Smtp-Source: ADUXVKIir3vlIHaF2hF54v5ZxImf102rrJzH2TvePKQvfYIMpSQlY2GpTcIjnkK30pRgT9jL5D/22Q==
X-Received: by 2002:a1c:d905:: with SMTP id q5-v6mr6505299wmg.78.1528643340029;
	Sun, 10 Jun 2018 08:09:00 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:19 +0200
Message-Id: <20180610150821.9536-18-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 17/19] packagegroup-xfce-extended: add mousepad
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
X-List-Received-Date: Sun, 10 Jun 2018 15:09:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index b73c9ee16..2e0f7f5b4 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -67,4 +67,5 @@ RRECOMMENDS_${PN} = " \
     ristretto \
     xfce4-taskmanager \
     gigolo \
+    mousepad \
 "
-- 
2.14.3


