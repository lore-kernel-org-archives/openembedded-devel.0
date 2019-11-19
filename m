Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 48B417D708
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 10:33:37 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id z19so2903338wmk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 02:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jU4U8BCtSlcNwJKS8u+UOYXtv2iV+bvbbSLfbLI4bEs=;
	b=Wl98ZbQCfo2nQ6+lLwf+6cUmgIM/7bPPvRDfSufMhW4JiK2O9d7TtIBGKHjgxDTZHd
	oYA9Gd2ou7h33mNNJIUlxSOhF1EHJulwyJnXBI3rEs09YR2OlrvG8ONsI1XaELHTlnZe
	7RBpDSi/Rq21W44OAqU0FZ3/TDtzVhD+oK0+vLKlhDI09xY3zzZFBQKg+R9wDn2i8Ssh
	bkkNkIDsfFkmfb5f1H4lVaDMt+sLgIigJ9pMWscMKSDBYTfjrI1R23ZsoCnKZIvolJ9A
	k11+TVtvJNWloeN0bzeCgKvlq8KwQHMRnOH5qWZq3daU75YVMb130klPYhcATS16g74+
	KDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jU4U8BCtSlcNwJKS8u+UOYXtv2iV+bvbbSLfbLI4bEs=;
	b=VPzDjCZl7vFExw6iEfOGdGJW55o9HqNZJAs3RBWvJDw4NbFlQccXSqZ0Aa2K8ICV/8
	ZrTyBaVy7ZIRqbfsfXeIfPSe3bQRPim5L8R1VAY31Ezoww3tJGgMaARVaQur4HEO8w/f
	elO3r66qR60anqTZD1ga6Pqew/kbh7CGdcXxIqtGfuoV7IYtzRPLA7QB7k4V0eDTHv5L
	2VRWTfYLlG2Yy03qAsBCyYB0WEMDRPFRyCGq4EHByTpgW7ZxQ6r6YQyQsMlE66pZhAjE
	c4tsmJ7d/tMS2c3dU2Bs7lF0Xb51YG85+eBiueko46bE+1c/TAj8aVMfUqVmwcTSUeqz
	jfqA==
X-Gm-Message-State: APjAAAW3qMV6QUuVTc5isPKQfLxk7GJhkYEkSFk/ztE6pz83hlBt/bfU
	ZqrZ93kxyPScLifhNb92Bbg2sUgfeRU=
X-Google-Smtp-Source: APXvYqxp/h2Q61SbKyTWU3DzNncYwxO/O92JM1sM6gga68Ew3a7EI7b6SDNX8kIgbtP3BOJKLhNe+Q==
X-Received: by 2002:a1c:9e58:: with SMTP id h85mr4805060wme.77.1574159617545; 
	Tue, 19 Nov 2019 02:33:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a6sm29423600wrh.69.2019.11.19.02.33.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 02:33:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 10:33:32 +0000
Message-Id: <20191119103332.27937-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH][meta-python] python-babel: add BBCLASSEXTEND for native/nativesdk
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
X-List-Received-Date: Tue, 19 Nov 2019 10:33:37 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/recipes-devtools/python/python-babel.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-babel.inc b/meta-python/recipes-devtools/python/python-babel.inc
index e6e6862509..c55b45922e 100644
--- a/meta-python/recipes-devtools/python/python-babel.inc
+++ b/meta-python/recipes-devtools/python/python-babel.inc
@@ -23,3 +23,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-threading \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


