Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id F0C7D77DCA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 11:38:06 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id w43so19841022wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 04:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/jwrT2VvZyTlHAGbfUQt3OH3fh4h5D6gMYV5HGZ/FQA=;
	b=mwc+lLum3ndfOAKhotk59KljuYBZRgPQx55+0ChyQZ2y5rhllkeFNKNGzkGfv+SQAr
	qeQAQgTvsMIN/bjWssjHzJNo5YwAf1Kx3/FFhCrKt1f7ThNFIjOVU0SuxQIFvGlWY9b8
	LpWgmJfVMMERmNnaSN10S1dh73WJV9Lbn4AdvqtFrTpxLqDZwzbLWmdG6XBagg7w7PbL
	kwuFnzOKPTQFklYuXRGpK2IjuhSYhlp4G+Wlo5/ICgf6oOZx0GAfJV6gU+MuXIzyGFyP
	8JqsVpSAiIRtrhZqj+4jLz3sRtpncOdo1cfRDQOH+Hd2AjOG09+b4guR7JgnkJ+xKCsY
	RdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/jwrT2VvZyTlHAGbfUQt3OH3fh4h5D6gMYV5HGZ/FQA=;
	b=lE0lZf0zOuCooRGdNZ6tuWpEpo4ysTjW3CEQFXNryhYVKzO5yLGfYtlpWBMmV3NcOR
	Ed8xxohvX8KvQ+cVgRZm4ZkTwh2QybAief1eX/Ug5humy3SCGTCFFbheOTCUsVqQdCwZ
	7aE6TSNrEANg1PgET92yutm/+LzeS/igYTjKwMdfmTeQd9SlBdXi2CyCeQKvEfgglv9+
	3htjZ5mjDU3LGEP8UnOSZZZB33xcn+rQPUYaU44A+iT1pg9ajYg/LluTUUftReMU+XAU
	n3F8gQFKlU4W6/iEt3jBjoJsgYCSgqMQ4M6Vegw0i0k5cOi/JjsQo32fvsf4M+7qix18
	/YPg==
X-Gm-Message-State: AFeK/H19+DYYMFFluM/XCGnIaXirFQ0AeS+si0MSuouSpoC2DV9YljyLpRgneP3Y3pfvNg==
X-Received: by 10.28.218.197 with SMTP id r188mr2460810wmg.0.1490960287662;
	Fri, 31 Mar 2017 04:38:07 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id i7sm2565944wmg.30.2017.03.31.04.38.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 04:38:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 13:37:57 +0200
Message-Id: <20170331113803.31535-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH][meta-oe][morty 1/7] lftp: change SRC_URI source
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
X-List-Received-Date: Fri, 31 Mar 2017 11:38:08 -0000

From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>

Changed SRC_URI source to official web-site, which keeps tarballs with
old releases.

Cherry-picked from master, but without the upgrade to 4.7.5.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
index 287821194..d62453745 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
@@ -6,7 +6,7 @@ SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.gz \
+SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.gz \
            file://fix-gcc-6-conflicts-signbit.patch \
           "
 SRC_URI[md5sum] = "8eb1fe5f113126b60f172643c7f6c2e6"
-- 
2.12.2


