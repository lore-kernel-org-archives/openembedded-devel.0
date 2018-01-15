Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2965078689
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:14:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 141so332817wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:14:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cy37SM/QcmKY5wxpnIELX4UUjDwmMYQPvsrdRZCPzSc=;
	b=sJWcuADVVEcAsoHF3aUa7yHSuz0RfRe73nor+Y34AgYvA0s6MJcINwEbR2qCQiBH6h
	jqd3DkIWf5kG3kyFlTLBGaR96Z7FWPskFML3zzkdpYatdfHrsdccrcas1FIO9oB8BbQK
	yZByrWgCnY03Wr+Tiro34E2ye0MHqvd++rXt9zV3iGsOLrsVd6H5K5yzRgeLv6zW80Kl
	cjyIMU1j4PhtGSsat154s7H2CSM8ygtqJhnCiwv3PbZeIxJSTxEOQt3gNE7hqBQLXQgj
	4q5FA3wzSyTcnkwqOCCxBn2JmJySxDf1giPohXijEm0FZaxN7qFkyHamQ495Yw5gOW9X
	ZY2g==
X-Gm-Message-State: AKwxytdihx5o8CgU0hMkYFh8Knlu2rqhp1AVlXyz1rxjRtwxQ+jxUMrC
	gyYPldz7UQGSi/hhyE4FpBp4+OkR
X-Google-Smtp-Source: ACJfBoszfkxsXtM7FfjGCdPWPYPmyt4nb1XnsMIS2Cnz1bAtNOg2DFlx7QWV23O8cHdiZtllsTuAPg==
X-Received: by 10.80.177.13 with SMTP id k13mr1933410edd.154.1516007650632;
	Mon, 15 Jan 2018 01:14:10 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d3sm17254591edc.15.2018.01.15.01.14.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:14:10 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:14:02 +0000
Message-Id: <20180115091408.1133-2-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180115091408.1133-1-git@andred.net>
References: <20180115091408.1133-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/8] python-smbus: replace startline=1 with beginline=1 in LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 15 Jan 2018 09:14:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

'startline' is not a recognised keyword, it's beginline

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-python/recipes-devtools/python/python-smbus.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-smbus.inc b/meta-python/recipes-devtools/python/python-smbus.inc
index ded30ced9..de2a2704e 100644
--- a/meta-python/recipes-devtools/python/python-smbus.inc
+++ b/meta-python/recipes-devtools/python/python-smbus.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Set of i2c tools for linux - Python module"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://smbusmodule.c;startline=1;endline=17;md5=fa24df321a520ff8e10f203425ab9fa8"
+LIC_FILES_CHKSUM = "file://smbusmodule.c;beginline=1;endline=17;md5=fa24df321a520ff8e10f203425ab9fa8"
 
 SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/i2c-tools-${PV}.tar.bz2 \
 "
-- 
2.15.1


