Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 57D0160132
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 10:10:05 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id u188so248798357wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 02:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eTOT7oeQFCg2gwdZr1y3jovXhm/d5NfJhMD9ipRMGaA=;
	b=rI90cGsE4dukCE2dniM+bGdEs9r11cHlspqW+uDe9miL0Mpuhnhvs0/vEg3Nj6bQ9I
	Tk3JSQ2Iz/TVN9GyOXjdWnGI74UNbZ0jnNr/x7OSF5KKci9Pcc+4GSxUzsSRsV/CvBUr
	wYVX5GGHMZ+V6uzMqSIwd08Jxo35vHSXFScnwl0bXyXBNtXLQf+XlwMMh6OfZkbHatCO
	wOCqC29DZow2d3Ol3SKVsRUqdEBKJq2XsENOCO65uvkQHIrHCsVFVvVXtO5oiZZtFlXU
	PXBsKvHdEufvBqtDU4EyqS9L+ej4mOvJv/lvckIskZ0HoOQs9R0hBfuV80PdV5Ip7dTg
	XC+A==
X-Received: by 10.28.176.133 with SMTP id z127mr19559095wme.22.1452593406421; 
	Tue, 12 Jan 2016 02:10:06 -0800 (PST)
Received: from chl500346.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id
	k130sm3090286wmg.6.2016.01.12.02.10.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jan 2016 02:10:05 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jan 2016 11:09:55 +0100
Message-Id: <1452593395-19468-5-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1452593395-19468-1-git-send-email-adrian.freihofer@gmail.com>
References: <1452593395-19468-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCHv2 4/4] networkmanager: fix ppp rdepend
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
X-List-Received-Date: Tue, 12 Jan 2016 10:10:06 -0000

pppd is not on the target if NM does not list is as a runtime dependency.

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
index 6126ed7..b00c9bb 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
@@ -49,7 +49,7 @@ PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
 PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
 PACKAGECONFIG[concheck] = "--with-libsoup=yes,--with-libsoup=no,libsoup-2.4"
 PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
-PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp"
+PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp,ppp"
 # Use full featured dhcp client instead of internal one
 PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-client"
 PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
-- 
2.5.0


