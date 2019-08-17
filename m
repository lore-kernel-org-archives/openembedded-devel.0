Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id A7A0C7F353
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 14:04:18 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id f17so4603254pfn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 07:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NW5Szly9oSsXQ/Wp5oSlW20NolCxyPjo7m1rtr6BiZg=;
	b=gpK4TjsAhyPYQgkllHlJhHBUfR87JWhdemuxrKLlOwHoJIDT2VRccL4/9l+a8I5Y5A
	P/STJbrnd+HHkn7WScGKCVS87x03XhUgolAsfREYaqyp4LRYO4WMvZ2OtLfFGLGS5qcx
	zv03BgkIEgr57LO6VHJwUKSZc5lzOKhAqdiG44uPYmKgj88D5Hcc2R1iDR3OFrgNM91c
	GFg2nEl4kDz01rBj0pD85qpSqQk6fmbgwkjTaySN/pWijWzGE4WhkRfkGq44WNHe+w08
	FQO7I6pVSywElma8oRp7RTHoxemEudp/m2PTiIl7cDE+tld9XVh8o9s8OnAjHarAp1vk
	iLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NW5Szly9oSsXQ/Wp5oSlW20NolCxyPjo7m1rtr6BiZg=;
	b=tkWI0kWeFSJc+8OdcstxZLzgULFeQyFBQk3uU9Y5JS7InGDoo1xcSnTLYCNrhCh8DU
	7yC65KpDCY6ySwXbmVGJiRNbifYWfoQiZ3DB6hmLcq/rx3OSYz+i/U454GtmlOZ8vEe5
	SxB1PoiSYJmke7VtlzVmGHA3XHv1JtoS6119e2d3WSOrQcHNocBbB/gJ/mbC9V5zU6TN
	Fdw+vl8dI8tyb7TklLAO336sBKyW/eMAKmSFk90zKLkREfCwqqwcA6zz9wRV+nQrIgxc
	BPgSS/UKKHMhUSjAUfOtcMk1y/2vkCfAKt5kXMos/GR4uJ0QXWTszwsH0J2lD5xnE+XI
	ECxw==
X-Gm-Message-State: APjAAAVAOwp+uhPN0pOnxVHYrX4rDfkDISPYbO91xX/Y2/tktwhrEUvd
	YhGk55tY2Ub9YMSUeigw5i6oA9ur6ys=
X-Google-Smtp-Source: APXvYqyThXwmPRCLUYHYE6MqVQeRmPt67TySyrnAxzV5brK6kje9JcACNfwxWaFKJRSfPPJja5DidA==
X-Received: by 2002:a17:90a:e2ca:: with SMTP id
	fr10mr2234049pjb.72.1566050659275; 
	Sat, 17 Aug 2019 07:04:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	22sm10988546pfv.134.2019.08.17.07.04.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 07:04:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Aug 2019 07:03:58 -0700
Message-Id: <20190817140358.17988-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190817140358.17988-1-raj.khem@gmail.com>
References: <20190817140358.17988-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] hplip: Add python to rdeps
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
X-List-Received-Date: Sat, 17 Aug 2019 14:04:18 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: QA Issue: /usr/share/hplip/upgrade.py contained in package hplip requires /usr/bin/python, but no providers found in RDEPENDS_hplip? [file-rdeps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
index 1f1e80ce82..77c995b57a 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
@@ -41,6 +41,7 @@ EXTRA_OECONF += "\
 PACKAGES += "${PN}-ppd ${PN}-cups ${PN}-backend ${PN}-filter ${PN}-hal"
 
 RDEPENDS_${PN} += " \
+        python \
         python-syslog \
         python-pprint \
         python-compression \
-- 
2.22.1


