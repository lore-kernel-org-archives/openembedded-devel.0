Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8A37D534
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 22:40:27 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id s19so40688616lfb.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 15:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0yPbc2DO/Sn1qARnaCURxAQk7yzeL7iEH1uKBd7Y11s=;
	b=ft3xd3juSIZi19GiMMew7qD6VLH6r30XYm47zeyDUa+Pp+Jiys38+Htsglm58xsoox
	gppQ9EDQSBhJIj2o9ORIHIFPosZdqeSe3kQPgneo/NAlsh1/2HemRXa14TdiY6b53mK3
	j5v53JtnyCl3lHEVm+oZMVftEgKYTHTwAPgKcJ/p2G9SXWrCQdJ5wVyNlgu51R11Yb1k
	pPCx2AgiAdw4xvm8vWtyKeQseXvmdDjzo6ikEZh71jcFkW0lQvxdiob8+s7dUq3AGCSI
	9tvn6gSgFC/0wo5nULm1IJ3DAgcmAy4CmpXvWr+SxW48ce/ptEFGZ2EPIFS7ZeD3QRN4
	3CGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0yPbc2DO/Sn1qARnaCURxAQk7yzeL7iEH1uKBd7Y11s=;
	b=oeZWD0pe0bXaREUXJeCGMYVlAM37w4ZBxHP/hkr7FTrJRWCLAaI21JGJaoVer3bJHe
	dl05YLPMZznad8NyRl/JQdCFY98v8t/CzmWc9Uen7s1kMxOOl/6GaVy7+DQlaIYUx6fE
	waDwNYGr2oEV37UClTzVShvfkvssew3ooUADLHXT+PVVmszQ/VnvDeqOpxmdYSUuN6bF
	Nzjn+8j5DxFVxpnXrrVv59rYCqn+qexvBVejFLrjdiPDTD+hb0w9bqxpkE9qpolsoxhO
	SMCtKvDUqM4OMAwdwngnOEoa+VnPWvbcVavz0yKdvCKgJ3nql9cpLOFDGQF1Gu+nhGVE
	V93Q==
X-Gm-Message-State: APjAAAXYSe+prJiS6qqtviPnT3LVQBxm33WtfeM6dG/JYgUJ/M/6XkWF
	McJ9OFW3gec2buPX3npWf6hKMDJJ
X-Google-Smtp-Source: APXvYqxEVuNToQvYj5VhbC69342p3mZ557VUUxXGR1bZc1RrUI4HKMzT8SOrs8f820dNCkys8a5WXg==
X-Received: by 2002:ac2:47fa:: with SMTP id b26mr34829479lfp.82.1564353627356; 
	Sun, 28 Jul 2019 15:40:27 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	u27sm10362089lfn.87.2019.07.28.15.40.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 28 Jul 2019 15:40:26 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jul 2019 00:40:23 +0200
Message-Id: <20190728224023.28039-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] wolfssl: update to 4.1.0
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
X-List-Received-Date: Sun, 28 Jul 2019 22:40:28 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../wolfssl/{wolfssl_4.0.0.bb => wolfssl_4.1.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_4.0.0.bb => wolfssl_4.1.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.0.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.1.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_4.0.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_4.1.0.bb
index d8883a77f..ae379383a 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.0.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.1.0.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES_${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https"
-SRCREV = "21f2beca9f320199fcea4a96df3e19967804144b"
+SRCREV = "50fbdb961fd8c2d8123064e567ae8ec44167732d"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.17.1


