Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 222B46C12C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Dec 2018 02:29:40 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id b5so8179273plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2018 18:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fEl9PAM0a7uoeo00efQ/eW3sbLL6J1m3H3I8Up++wDE=;
	b=npFfibaEYevZ3SviK9I1xR16ZJJTCAvcySdm8E2kmARVBJ08DxLVDWXr4cGnP+bGj9
	VAs+G6yy2w2FvJ8qFtq/hFV8DuAqu2JrPk6W2YJfnkhUHeIbPySmrK9s5ABP+O6qGe+g
	f8mBd+1NSJAdhkqK0n3aI9u8m0jSMINO4DbrEfJt2+slo+WdO8Cf1DY36werk0oW6Pt4
	iEjKUYusw1EXTUZC1f6GFCLklwt3v1hxYrl/8NiFT9RXO2tJPl8W2te4+ZO97g2bW/gC
	J8k1Y8a7eJ93RMKNZt3O2gd3APrk8BiFDqtLidtmkwzkvJcazJemcv518Yv+hx4reXyL
	LRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fEl9PAM0a7uoeo00efQ/eW3sbLL6J1m3H3I8Up++wDE=;
	b=gGnYMCNOC9Tso1P1j8AGUrgRHKiVy2mRSG57OdDdwo6u+aOYGGk3fJNYVnXNFWJbor
	I2DvFQBYqRADRBs8uGx6mDFF/M50GKer+seTv3doy4mxkGP3bXlP44MZbkkz/wHcgdJ7
	DdjgWs/ME1Z6+VvykPYZ+9+uFCQHLCTddFtu6hlkjbH5ePlI7fOWnbLl4LgOgE4AynG1
	r0GQQ/zGdSBc/GjsFNUHeqEeRoRTPq0zftHb6EBXEIRgd/uRZnq809UD5mZI/FFFLWlS
	QQV4BumMulv3seBcLqFgjsHm+a+yZRNjHnvTtEoQNn6w8pUH3v5XVvtZbPYGFqnAYIhm
	z5WQ==
X-Gm-Message-State: AJcUukd8g+LXENHd6/lP2L6WjTR9FYGXTAfkmyHNohcpZriFyq3OWCq5
	4JzPiLjubLX711lELXGDBhuppKYF1Uo=
X-Google-Smtp-Source: ALg8bN6aaeBKm6dLwmVc8tM+T8pEaoOg6goBcMXDvyca/VOurLD9euwwQV7icV4HdArTbNd6aJ64JA==
X-Received: by 2002:a17:902:7e4f:: with SMTP id
	a15mr21614565pln.149.1545877781600; 
	Wed, 26 Dec 2018 18:29:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	([2601:646:877f:9499:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	p2sm50666072pfp.125.2018.12.26.18.29.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 18:29:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Dec 2018 18:29:23 -0800
Message-Id: <20181227022925.5920-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181227022925.5920-1-raj.khem@gmail.com>
References: <20181227022925.5920-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] packagegroup-meta-oe: Exclude android-tools breakpad on ppc
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
X-List-Received-Date: Thu, 27 Dec 2018 02:29:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 1bbb40dc6b..eb461297d5 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -118,7 +118,7 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_armv5 = "uftrace nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mipsarch = "uftrace lshw"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64 = "nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64el = "nodejs"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "android-tools breakpad uftrace lshw"
 
 RDEPENDS_packagegroup-meta-oe-extended ="\
     byacc cfengine cfengine-masterfiles cmpi-bindings \
-- 
2.20.1


