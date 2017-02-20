Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5653972F16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 23:07:31 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u63so16824466wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 15:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kGb+PsPOMof+xmmIcYOLQSp4itaNKQDnFrw3s0n+zOA=;
	b=ZMhA6qODWDlQsJH5DLl8N1xBHKDsBzphKU0NUQLMAJVLiEalP23gNAWUi6h1aBaXk+
	ZiEyfHYbUrhAYqHwl4WpshUIA+e3MjTReFR17DgZixobTD/cQJAD7RxbvtV40KehiMU/
	aYk3ZRCpWzF8q7wr1C0AqmI3Y1qunBCAciL0dAnScWt6dz3x/mpY+HgMfox6feeg4prI
	FbF7ZZ4M0VYjrZ8irCqcxSCmjdEAOcEFXf/V02kXNfG8zMjfqWUY4tx2tsdh2LLWjVys
	i5wRPSDWJWPvHCa4/2E1q+iWxdp/dMQ8PCQvd1Fa6VSsAAgqyVomslMYtHCAs9f1eRY4
	aqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kGb+PsPOMof+xmmIcYOLQSp4itaNKQDnFrw3s0n+zOA=;
	b=PM8PFe796UjBg0SY0qZE23WAcv0M46Go2BTZGioMwJ3NswDZnvPT6eSevnWX1mVIG9
	NJus/sAnTnILhELn64xpUeDpW043Ioqxqlmaceg2oT6Z05uyFeSacIP6IKTwI2sr6KCA
	8GGLdfF2RPuo2leIJTxU/y8Zs754c5mvCBq6qansrT/89jBu/dHBoYCF6+mUUJDb/Y9z
	Nh3/i7tCJG1zy+XhXSi/S5//ZVuYh5j7pME0FWUm7H9KPuGLDu1HmrCCQj7XTFcCq4BR
	ycDg4AMECD3JhhJomQ5U100gJ5wd3y/vpcWL6y7CycMEmgfTEVRiVXcsGHHc7gDi/FHC
	PqGg==
X-Gm-Message-State: AMke39mogCvfHAksjezXjAUSyyio1jL38i5iiFp3+UubBF5McEOk0x/CKOnTO7MH/ASL4w==
X-Received: by 10.28.68.10 with SMTP id r10mr12592079wma.68.1487632052398;
	Mon, 20 Feb 2017 15:07:32 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	i73sm15294743wmd.11.2017.02.20.15.07.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 15:07:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2017 00:07:18 +0100
Message-Id: <20170220230719.10066-5-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220230719.10066-1-schnitzeltony@googlemail.com>
References: <20170220230719.10066-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] a2jmidid: add pkgconfig to inherit and unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 23:07:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
index 325140e..0204fb9 100644
--- a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
@@ -15,10 +15,8 @@ SRC_URI = " \
 SRC_URI[md5sum] = "9cf4edbc3ad2ddeeaf6c8c1791ff3ddd"
 SRC_URI[sha256sum] = "2a9635f62aabc59edb54ada07048dd47e896b90caff94bcee710d3582606f55f"
 
-inherit waf
+inherit waf pkgconfig
 
 export LINKFLAGS="${LDFLAGS}"
 
 FILES_${PN} += "${datadir}/dbus-1/services"
-
-PNBLACKLIST[a2jmidid] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130646/"
-- 
2.9.3


