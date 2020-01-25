Return-Path: <ticotimo@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 608C47FC84
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 07:26:33 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id p23so1718891plq.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 23:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oxcphd1HI4Ohi/uKyR7JJmQW+7BMvhqVs4piB62mhjU=;
	b=o2wDYINJN/4Sj4tpLxCjmaMJky9s75aBUv4gRxnK3a2YQMFf+nN6EcCWSt0R5X2OuP
	w91UeTeCh4hgknJgPj4IzFblaYy+7J9MkCmusVesAdRcbreb6SNv8fNiqpPraa9ChJME
	YzydxvD905oBJtOSJCw7fUWbmnnrVdDMeU0Zs0y+y7nr8N6rxGsljOar/ouiKZwTapeB
	QqeATf+R7I63Vg13TtL/nGnzunS9rNEL/cyzmbtVYUbE6JKd0zXOG3qY+AYJ14KTK71/
	RcTDNdtV5xc0uqXWNMMsMIVZ1Np1ZfrkT29pKmPw3MA8vW+9Kf8tb3c+d33quBMKwcXW
	R3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oxcphd1HI4Ohi/uKyR7JJmQW+7BMvhqVs4piB62mhjU=;
	b=l7/4ticgeWtPCu4c8do9IzHb71TVJVGEcvCEHmmpLGBkxWMrDevFd+wj5H9ZnJD327
	RyvlvNKCCVg3y6cjPPZ5KtC2Lvq6EFbmfTKvUWJ2WkT8i+lsi6tFUbKhALqKl8gJVnWK
	HKrhDaAZC58bSZ1atGZoSLhI9Yqa3mJqx3TO5qocSLYHhkE04ZM0/W+WXFX1uJ3dgZwP
	QjcUsnjZa3qfOhnrX/ly/EQUymgUGN5B9Yq9Y4y+gnv4OV4+bvr89BM1or9KCfz2Uh6Y
	ivfAJCTKh7/5vp9dEEER6jgjTAEvRzJMXys5THjQIYo4rKJIAjFb5AN1STxIjY3eFcEw
	U65A==
X-Gm-Message-State: APjAAAXDFsEp5mqGRgmY37cCcMzIcClCq+WKyiwNlB2Xp1yh5gPk7LlC
	9KSpbNyBOHWqESM7hciZ0TfAjRVXc7s=
X-Google-Smtp-Source: APXvYqyhBlbfxn9f4JhzaC6KYEQEg7wNoVPWtA3HZXqfvMPw2zIvQwkKSfa5ePuozWvYIpLRulExHA==
X-Received: by 2002:a17:90a:f88:: with SMTP id 8mr3658061pjz.72.1579937194501; 
	Fri, 24 Jan 2020 23:26:34 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:ddac:a57d:b60a:6cb7])
	by smtp.gmail.com with ESMTPSA id
	m15sm8603271pgi.91.2020.01.24.23.26.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 23:26:33 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Jan 2020 23:26:12 -0800
Message-Id: <20200125072612.4306-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-pyrsistent: add target RDEPENDS
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
X-List-Received-Date: Sat, 25 Jan 2020 07:26:34 -0000
Content-Transfer-Encoding: 8bit

* Missing target run-time dependency:
  - python-numbers

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-pyrsistent_0.15.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-devtools/python/python-pyrsistent_0.15.7.bb b/recipes-devtools/python/python-pyrsistent_0.15.7.bb
index acfcb122..970e51b0 100644
--- a/recipes-devtools/python/python-pyrsistent_0.15.7.bb
+++ b/recipes-devtools/python/python-pyrsistent_0.15.7.bb
@@ -12,4 +12,8 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-six \
 "
 
+RDEPENDS_${PN}_append_class-target = "\
+    ${PYTHON_PN}-numbers \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0


