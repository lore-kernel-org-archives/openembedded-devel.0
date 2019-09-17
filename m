Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 165297F8B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 05:40:50 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id a24so1377298pgj.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 22:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=smqAVqaxhgkOtl2VPYxQp/CaTer54UmymQfsDR4r0MY=;
	b=etLtRnf7Y37JSTmc/QfzCJqShbeb7s8m/TOxaDfKNaSguGiSXQsnacgeGulaI1KTOX
	n5FdXeAxonPdRAcOfEJkwr91Tce4Ljv7d93cs9VMsjuMCPe3twoWQmgs6zM/CsaHJsHr
	zFEPrIhvIB0/KqbEqLU29hK7+lXrai7lJtNoB/LWiz2qyHSfSSNYMQBHcsWkM2DlbFDF
	3QRJTcYaOP3jGlDjPMlqJIB0+LSbCFypsQa9QtE/wh914K4zrZn9QIAaj4+HFrfAq3Rc
	1vvP8wD8VHA73lDnNRi8sbIUyJjY1l+Hj+qp6qrUvQlUbF1dq6F9yveViF4fzGQu61Ky
	yPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=smqAVqaxhgkOtl2VPYxQp/CaTer54UmymQfsDR4r0MY=;
	b=k9kpaPqVRp5MgNowOQfm8dUpjrCXM0PlCb2XsdNUDWu+rWoTwD1K+u545Edbaau0wv
	5wXc5pwXhSwqEoDb+BDMcA/PyTq+f4cTEf8QIhaCwphd/yO1G12ZO7BpFMCYuGfwYpZ4
	Wi0khekqh7zuFPVhenYbyclq6MBSo7i1AYDKTsLaNz6vzd+/LOEktvbhWbXkCuwT5d9I
	Q3YnnXZrzvix75mgNhXuYKKUkRCmtYDo9k9cfpBS3QvPku9co0+N64yTQ2cQKgwEPGCk
	UQArsarMt0bKIX2P5J6PO/CFWgCGMII3o/upFnYpc4Y3zyuBGHbbDGApHCU+a90o0T7o
	asBg==
X-Gm-Message-State: APjAAAVCQNEaaw8vj2ECOeOPr1x13mWUAXGfGjoozdtjQrk5ySLWm9YL
	s/swQNSPOg5QgifRVINPyicxy4wW3I5/rg==
X-Google-Smtp-Source: APXvYqw1A8V0PSq0NAKYRrVUT8HdiJsDepT/lBiKeEjTkOa2Q4NCV+mO0fURz+K08v1f/QsNfdVOfA==
X-Received: by 2002:a17:90a:ba90:: with SMTP id
	t16mr3180301pjr.104.1568698851471; 
	Mon, 16 Sep 2019 22:40:51 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	q42sm1011829pja.16.2019.09.16.22.40.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Sep 2019 22:40:50 -0700 (PDT)
Date: Tue, 17 Sep 2019 05:40:46 +0000
Message-Id: <20190917054046.20322-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [meta-python][PATCH] python*-pyusb: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Tue, 17 Sep 2019 05:40:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta-python/recipes-devtools/python/python-pyusb.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pyusb.inc b/meta-python/recipes-devtools/python/python-pyusb.inc
index 30bbe85a91..baf2db5301 100644
--- a/meta-python/recipes-devtools/python/python-pyusb.inc
+++ b/meta-python/recipes-devtools/python/python-pyusb.inc
@@ -8,3 +8,5 @@ SRC_URI[md5sum] = "862b56452c64948c787ad8ef9498590b"
 SRC_URI[sha256sum] = "4e9b72cc4a4205ca64fbf1f3fff39a335512166c151ad103e55c8223ac147362"
 
 inherit pypi
+
+BBCLASSEXTEND = "native nativesdk"
---
2.23.0

