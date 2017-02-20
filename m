Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BA222731CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:43 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u63so15684042wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VOTxqNubTW8igsAUCUjQ1/bBI9ywvsJ2v5RARmFdDKU=;
	b=LbNy+71F3LsYA141D3eyJaDnHnznVfDGj9eOP03+0j4KtCV9A8LWl+ZHQ3gqC5ySWQ
	Od34t9oypXIrFk2N3xJDFBOIIql+tgt5loSTAaSIpgHl/WeRIbizcGtp4uqE4yFxTrxp
	Kz518jaDjx3E3yfRmIdD2i1lnkpJOd0nH2Q5oCkJyYtnn09QRT51hdRpWGQr5R3MkI/+
	OC4cktnp0PXLHC3ZYgQH0mGjWZ1bzx0XDv7ocJRCDcNYLwU4we3K6rCL8Q4fvIEO8S/J
	laVfksqFsxZUcTiUGZ5RjibEwNuFXBVHHG7JsO38tI34vhvqWQRcXN8dMpZYfybL+F5Q
	9dOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VOTxqNubTW8igsAUCUjQ1/bBI9ywvsJ2v5RARmFdDKU=;
	b=WZKiJ6Te2g5UbjoC7rAvuZa5AhlScBmGa7HXswpyn4H5hzZSob4PeDudRTpt1W0su1
	OlHivY2gD4VUZXjfk/+4Es4vSkdadeAec2HRtBNYh5XOwiCWOJN4Omesy83M6aLVzWpG
	sCsTDncPH7PVfO7+dNktpI0HiasddD/5Qbaii/RsBR2KLDHVTbomUyYkPWVHMRAUCnU8
	YGJP+45RaH7TeXwdRi3Txt8d0FQRXeHQ0XwEmn57e/HhFuySZJuhn+cJnVifh+npkLo4
	QoafwzynRF4n+qFUajirRNaYG2WBTZP51gf652YWibeuECPL9A+ZaZdnY8MJTebLp9Oo
	6jhQ==
X-Gm-Message-State: AMke39lvVuEoMVmp0VhK4czZmz6MdiYS9AeUjFbaIc4Zo08uuzUTpTw9D5mO5AoPnxW+qw==
X-Received: by 10.28.142.16 with SMTP id q16mr20375011wmd.78.1487614063873;
	Mon, 20 Feb 2017 10:07:43 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:43 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:44 +0100
Message-Id: <20170220180700.29836-29-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 28/44] modemmanager: unblacklist - libmbim is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
index cde9bf6..5e4e220 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
@@ -49,5 +49,3 @@ FILES_${PN}-staticdev += " \
 FILES_${PN}-dbg += "${libdir}/ModemManager/.debug"
 
 SYSTEMD_SERVICE_${PN} = "ModemManager.service"
-
-PNBLACKLIST[modemmanager] ?= "Depends on blacklisted libmbim"
-- 
2.9.3


