Return-Path: <scottellis.developer@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 44F8C6B513
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 14:58:52 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id l22so40066699qtp.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 07:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xy1W8Rz19954VBZ6LeWp8SHjwC43xfT3T6wOPMkKRFU=;
	b=K0ge6GlP4XJ9OsrsMFKzflQdUcUnInC4r1ILFEvvYFG0WEQSJAbBRS6gZMkUcQhtXS
	i4JCmAR0lcwpBNr5T9IqnASk9QoFlG4GeszexPcu60bPFXTqLWe0asyjrHg68jvVPq2Z
	0NxIhRv10fS59MIHfly6DTgBWd3I9ukpZ8H4jeDGbihyfkd5rnYdsub13HypfbuWyAzD
	C5V3kUdJtsPnbkCIoGzY6S6br9eEr0/C0D0kO2EoeGbJHGaLAER4pBk2Gc0vw0kiYC0g
	o4n5Hun6+FDFUcTEjqDVzRx4tUOSUbpRSNciSwkBrzI/3GgXpa8F/WxIL4VToIcXDkLt
	Br0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xy1W8Rz19954VBZ6LeWp8SHjwC43xfT3T6wOPMkKRFU=;
	b=qUVQjKSs6mIR1W0AEXwvEvhKLTFfspBfs9KbS7ucrEu+ThE5swDd0G8pSI8lOChioX
	K0TzvQ7u35iGZve7kLCEJTRrOShWrplCunAYPkgAejIcTMGeJeSIPPwBk/arCiIsMa0O
	mXpbESPKFJq0hZNE/yPh6BBP4yDo8ksl9nvOXnVdD/z3YGsRyXlHE3qAfAhGaJPFUiJS
	XCjw5/08H7WTThfGjKbvsPBn16E/N9Kz17R7U7CacfZvIJKdNUNME6O7Yo7sxCDt8tNj
	nkRIdWXSlZUQ1U4egFOIYi1EwaxMPeM74j6pS62MAX6kQjis1J5If/jLXxcd8DlSs+fH
	B9Cw==
X-Gm-Message-State: APjAAAX43dSZk08BUxkJg86f3gKGfux5xrfAPdhpQZASAaMrbPyzN4wP
	kaMBtkuBHV5OrvewYUm4Qf6wxAEa
X-Google-Smtp-Source: APXvYqyf3Dl7yXlcYJiS3X7do3MyRCDCFM8pXgo/V7SflfM0muJwT/UmwZx1JxibszHaMDwP6Z4uMQ==
X-Received: by 2002:a0c:e48b:: with SMTP id n11mr39769419qvl.38.1568559532908; 
	Sun, 15 Sep 2019 07:58:52 -0700 (PDT)
Received: from fractal.jumpnow (c-73-234-253-132.hsd1.me.comcast.net.
	[73.234.253.132]) by smtp.gmail.com with ESMTPSA id
	c12sm6900487qkc.81.2019.09.15.07.58.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 15 Sep 2019 07:58:52 -0700 (PDT)
From: Scott Ellis <scottellis.developer@gmail.com>
X-Google-Original-From: Scott Ellis <scott@jumpnowtek.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Sep 2019 10:58:49 -0400
Message-Id: <1568559529-23722-1-git-send-email-scott@jumpnowtek.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH v2] wireguard: Upgrade 20190905 to 20190913
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
X-List-Received-Date: Sun, 15 Sep 2019 14:58:52 -0000

Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
---
 ...eguard-module_0.0.20190905.bb => wireguard-module_0.0.20190913.bb} | 0
 ...ireguard-tools_0.0.20190905.bb => wireguard-tools_0.0.20190913.bb} | 0
 meta-networking/recipes-kernel/wireguard/wireguard.inc                | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20190905.bb => wireguard-module_0.0.20190913.bb} (100%)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20190905.bb => wireguard-tools_0.0.20190913.bb} (100%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190905.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190913.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190905.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190913.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190905.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190913.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190905.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190913.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
index 4848740..b0b48d0 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
-SRC_URI[md5sum] = "97a8f781cb683f3a23ffa2f0cdb008cc"
-SRC_URI[sha256sum] = "78767ceeb5286beaa851145f072d920a340a9f1b771a2943b8efd638cee1a8f6"
+SRC_URI[md5sum] = "ec2345dfc8ffc61ccd7529d5d19b2602"
+SRC_URI[sha256sum] = "997327185d2d1b597dc118f737c0c165e2a2c21453387ea02659f1159d148518"
 
 S = "${WORKDIR}/WireGuard-${PV}/src/"
-- 
2.7.4


