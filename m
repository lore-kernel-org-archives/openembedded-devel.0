Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 49E787F822
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 15:40:07 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id q70so3691169wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Gmpa/TmVU2CYDRkDJjuM9yzR1wr3ixUOOoHTVKDWDvY=;
	b=KTI4s7FdAMtk8v3AAHLnaA7h1vGF3p4RX0Q9VzpXbhMuDUvznIS5JIBB5Hc0TTib4q
	H9QzNdM5f7Xahpk5+I/QPSlruDzGKCDUAh325gbOJHcO0o5nv9cf3xdp7CMm+u3OiPd0
	ngdZ/Qh9JRd1kaRVP06ACKG+eXEOAiz1WZhyPQ/6DArzE5PiXdH8PvF7b0dep2Fyzr23
	u/GN5QPtGxF57I/BEKCTIAGm+Tkv2t2KebPVV1Ff9xlS36MBOb5uDMZ/4INye7rGV1nh
	AdofrJg/QgjQ0rxilZUVLEpLOj7JfuqIfahxJVkt2SYxH1KX1/bCL4etjZ6LHqQXa884
	OWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Gmpa/TmVU2CYDRkDJjuM9yzR1wr3ixUOOoHTVKDWDvY=;
	b=gPtSea4raS5UF4slNRI2xbbIuCVqj1HnxxJ4evEmlhUXi/3zgBiECWh0fh3UC3+Wx7
	JPzDVvK06cMXXQsmhZfSU1mpVRXWHg1O/IzcMgE1r04M0MvBXSEaN5diU3QskQ2ROsxq
	89Nne1mE2vajiBSccYm/sykA6u1ZYE8ejmyQrbZ+D0GfQep2nP67WiS8l9777mSjCNi0
	Rmc2n6C7TvDxTnDHONO907mmWeUoCMEILCkdW0xeGNOUCFoJ1BqiFTGXrtHvNwHxMDME
	5Eh04GKKEj0e1TTfI83+zxyOtK6CJVSPxa2TURCNI83rEXL852QcOFdSG9qc+OehD/5U
	x7LQ==
X-Gm-Message-State: APjAAAXSq/soRDPDwQTFoXDOURN587rkn4qtCH2oH/s0606F4D5KNU/S
	yd8lqNvzFp04fQwdTyC2Ttou6TZ6Isg=
X-Google-Smtp-Source: APXvYqwyjOYLJdqUiGcPaMrrcNONR2aa87QDNmLGNKFJK8vz9Vmwp738uug/utOP1q/nmci8D+XoxQ==
X-Received: by 2002:a05:600c:2383:: with SMTP id
	m3mr6291826wma.166.1574178007686; 
	Tue, 19 Nov 2019 07:40:07 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	o187sm3490410wmo.20.2019.11.19.07.40.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 07:40:07 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 15:39:59 +0000
Message-Id: <20191119153958.2274-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-scandir: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Tue, 19 Nov 2019 15:40:07 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-python/recipes-devtools/python/python-scandir_1.10.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-scandir_1.10.0.bb b/meta-python/recipes-devtools/python/python-scandir_1.10.0.bb
index 253c2342b..9de272417 100644
--- a/meta-python/recipes-devtools/python/python-scandir_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python-scandir_1.10.0.bb
@@ -10,3 +10,5 @@ SRCREV = "982e6ba60e7165ef965567eacd7138149c9ce292"
 S = "${WORKDIR}/git"
 
 inherit setuptools
+
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
-- 
2.20.1


