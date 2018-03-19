Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3422C78938
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 12:11:00 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id z184so17980141qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 05:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GpiUslAsHRBnoglj5wmtKZwg7ZAZagx1Af+ThMkDMWA=;
	b=XWhtpBWfM2RLjHDFgq5E3voQPaKn20uG+rsM+ErJrlwUWplkQL1gOGA/s6L+0zImGy
	tQ3ue/V8NJ0fwC2ikD1HWi1wrcMLgURtaBDzpPlRwcUx8SfuS8dhb50ee+e7eRV09sUO
	5BTp4kGYaB9NVmr//AT6iAAEXyiPB8TyWyz/PUoJACfV9Ru5+Zi3toy9GMQUwoylQ6hm
	dg6L5fXev/Ttkhkgn1Yd6aRFSymIGh9b/2lKVBTV+m8bNYsnwdEtl0wNAozmD9vVZkIs
	IqK++Q7R9qqEFC2ZM1cAPd0PpXFicOysZYS1Nl4jqsVg4w9rPZUXbsokNWcg+7Mzd8I/
	ZpkA==
X-Gm-Message-State: AElRT7GdYw0+fo0huoB2CSckE3+Go4Vty2MwwEuddLPOq9faLa4SsP4/
	B9Yvtf3Q46xqZj0XTyE/85JQ7K6q
X-Google-Smtp-Source: AG47ELufTFVt8O/o0Rgsj/CEm1/qeA+eZzlnkfiQN4X4XyitQVGKURIA0LokzH9nm1+eFV/L3gQxJg==
X-Received: by 10.55.116.135 with SMTP id p129mr16819116qkc.344.1521461461938; 
	Mon, 19 Mar 2018 05:11:01 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	n187sm9411724qke.48.2018.03.19.05.11.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Mar 2018 05:11:01 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 08:10:56 -0400
Message-Id: <1521461456-920-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-meh: update to version 0.46
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
X-List-Received-Date: Mon, 19 Mar 2018 12:11:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-meh/{python3-meh_0.45.bb => python3-meh_0.46.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-meh/{python3-meh_0.45.bb => python3-meh_0.46.bb} (90%)

diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.45.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.46.bb
similarity index 90%
rename from meta-python/recipes-extended/python-meh/python3-meh_0.45.bb
rename to meta-python/recipes-extended/python-meh/python3-meh_0.46.bb
index 6ace497..40e2cbd 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.45.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.46.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master \
 "
-SRCREV = "2bfc751fd680515d44f7096945a1e282a1f7d6aa"
+SRCREV = "bb1156728a4f76e5e3638ab20b9454a1568a99db"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 FILES_${PN} += "${datadir}/*"
-- 
2.7.4


