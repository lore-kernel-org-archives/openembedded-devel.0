Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 54D4077FA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:21:16 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id 77so174553619wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 02:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6Thn0sk0fOePXcMK46h5HI1/qAH95bSSnS5XXBGbutc=;
	b=p+VKzTlDMmVVk6ud3pm2Pg17U/KVvcuGI1jAdJhdrqEueWYDz/+xASDETmt1+N6/w8
	aKveP7X/0uPremHtnQgpCRhX3GTbDlb644v0F5oy4F2gASgOvPkNT7lYSVx7r+4iG6bd
	v0QnvIyZVP33K77QhZ+Ty9oVFlRN0CRuah6NqJIJ2+sLaTSzm9t9yJohUAcarKkFvdYX
	5EnaOnr2HWFhBkqxHUlRrBak0rixlMYJa4kt9R/AtXlUQqHxeFop21SiynkhBsQbjz/S
	rtE3PVAg0PPUb5eTKhm7q4PFRFMa6+bZVoTaBqlzePRi7r61LFZl/FCOd9tdVKDt8o+l
	b40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6Thn0sk0fOePXcMK46h5HI1/qAH95bSSnS5XXBGbutc=;
	b=NLP++ykj1Ep+eDoesRcSDyWmK6ZuL2kCv43ShGpS8girGs369SVSY1V39W4tRuD3f5
	llO2eZ9fhmdYslouzUgt/jhMD4aTCHuOGOBhYD4j0qKX3cs1hGVBzx0OUuszaPZ9xc5H
	mkwjnKL1cNmnyJXUrugagmmzfNeAT3FfEDwu2/RPg8wHstlm2jK4ICHHYCeQPSqYskRz
	/EwDaFU8XledySDDpLtwTvr5yHz3tRGwN9Jgb99vqbhYLM0+NPLWaam6wPfBM2i1n7OU
	H+dWmWjHoE24TyE9pe3mAeHO80gABbgUEpVrOavx+vCX5nebc1nj9ZrIphjEJVPe46Mh
	wsPQ==
X-Gm-Message-State: AIVw1105VE/x4dp8N+n3Vr1L7gRT923+rZXt8gHXzJBcCbV0MwvvCjHY
	G07+TK8Osc0MtgfH
X-Received: by 10.28.109.26 with SMTP id i26mr10653191wmc.64.1499764877953;
	Tue, 11 Jul 2017 02:21:17 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o131sm11520051wmd.26.2017.07.11.02.21.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 02:21:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 11:21:54 +0200
Message-Id: <20170711092154.23082-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCHv2][meta-oe] fluentbit: fix SYSTEMD_SERVICE name
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
X-List-Received-Date: Tue, 11 Jul 2017 09:21:24 -0000

* the binary and service name was renamed in 0.11.11
  from fluent-bit to td-agent-bit, but unfortunately
  SYSTEMD_SERVICE wasn't updated in the recipe with
  the upgrade causing do_package failures as in:
  http://errors.yoctoproject.org/Errors/Details/147040/
  ERROR: SYSTEMD_SERVICE_fluentbit value fluent-bit.service does not exist

0.11.3-r0/image/
0.11.3-r0/image/etc
0.11.3-r0/image/etc/fluent-bit
0.11.3-r0/image/etc/fluent-bit/parsers.conf
0.11.3-r0/image/etc/fluent-bit/fluent-bit.conf
0.11.3-r0/image/lib
0.11.3-r0/image/lib/systemd
0.11.3-r0/image/lib/systemd/system
0.11.3-r0/image/lib/systemd/system/fluent-bit.service
0.11.3-r0/image/usr
0.11.3-r0/image/usr/bin
0.11.3-r0/image/usr/bin/fluent-bit
0.11.3-r0/image/usr/lib
0.11.3-r0/image/usr/lib/libfluent-bit.so
0.11.3-r0/image/usr/lib/pkgconfig
0.11.3-r0/image/usr/lib/pkgconfig/msgpack.pc

0.11.11-r0/image
0.11.11-r0/image/etc
0.11.11-r0/image/etc/td-agent-bit
0.11.11-r0/image/etc/td-agent-bit/parsers.conf
0.11.11-r0/image/etc/td-agent-bit/td-agent-bit.conf
0.11.11-r0/image/lib
0.11.11-r0/image/lib/systemd
0.11.11-r0/image/lib/systemd/system
0.11.11-r0/image/lib/systemd/system/td-agent-bit.service
0.11.11-r0/image/usr
0.11.11-r0/image/usr/bin
0.11.11-r0/image/usr/bin/td-agent-bit
0.11.11-r0/image/usr/lib
0.11.11-r0/image/usr/lib/libfluent-bit.so
0.11.11-r0/image/usr/lib/pkgconfig
0.11.11-r0/image/usr/lib/pkgconfig/msgpack.pc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
index 83818c84d..521d00bf6 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
@@ -21,6 +21,6 @@ inherit cmake systemd
 
 EXTRA_OECMAKE = "-DGNU_HOST=${HOST_SYS} -DFLB_ALL=ON -DFLB_TD=1"
 
-SYSTEMD_SERVICE_${PN} = "fluent-bit.service"
+SYSTEMD_SERVICE_${PN} = "td-agent-bit.service"
 
 TARGET_CC_ARCH_append = " ${SELECTED_OPTIMIZATION}"
-- 
2.13.2


