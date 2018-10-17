Return-Path: <yann.dirson@blade-group.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 56F5779B0D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 15:40:59 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z204-v6so2697925wmc.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blade-group.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DWuuvkYX6pbzoTsQzYd7s1FLknPsgr3FEWIwGx62pkc=;
	b=o1NIRSEjFkaHQIaHEodoRpTnBt16ATE1zxKAxzItqPg2h9zwfdzDLK6ByjtzgQrlZP
	FD7VFTaISd/QzbC+C/dkZs/nJtVGj19ghwPJp6Sol+9hYQe7NJzIXKbO5+4mR62CMW4p
	wHH8hm6ovQrQILq9ImgOxO+iEdUjDD+E5JIQa7fzgjHCfTJfUJ4SGpWISKpSMEoAdBRL
	p+UgkjP57RJiKc5NZlmyzTsGUpTWDu4YqEK5MHNgJfMdD4TVrLD07qqO5nNKBZpari3u
	cYuwg5PLFr14ShLJvT71e/pS/0kotneZeKEXPki1eeDreqeFQSL0pIBn13Q+mQeFf1XB
	ueQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DWuuvkYX6pbzoTsQzYd7s1FLknPsgr3FEWIwGx62pkc=;
	b=Iui1iame4VHVer3L5iGj+x8pGZ1FzKUT0C3vYghFUddurBJcuGXbHIFVDOeeVqC+X2
	N7ZUnhBF0Yi1Z2MU4qyxY7VjEXW/TUMC8UbKHb5sQl3peIyg57hUtQ04hkV69Ksievn1
	UG8E2CPc6K699HB4XQXi8v9XYxTd+xKDfeynXHprT97oQkxIsuI7M3PrJTYeqakIxyTN
	tGX0ak1axsBqq5+5GShBj2AoO+eQF896ansP42IAnyAVYsDt2YLuhju5nGcIhoClWvGg
	Ep+JvsNdnJFUrUuS7KdHWPGCVEqceGSuOlMZ4wOPUUz+S/dSs29TpG0XczPoyPeV0Z0P
	wtUA==
X-Gm-Message-State: ABuFfoiskyhpx2NWAFQf20iJ0rU6F3QyAjQ+v/zyzGyvLvQQODltz7CX
	M7ivR1RDFkSIxaYql3dELjQgytOx+EhHNA==
X-Google-Smtp-Source: ACcGV61XhnLqc5qRoG/RuZtfOwGK4A3xqmEljULfpO6yYpUw2oj/OoQ2Vi5KEGu6R5Uo/m+1EP0t9A==
X-Received: by 2002:a1c:dcc:: with SMTP id
	195-v6mr3361677wmn.117.1539790859730; 
	Wed, 17 Oct 2018 08:40:59 -0700 (PDT)
Received: from yantop.local (lfbn-1-3228-112.w90-79.abo.wanadoo.fr.
	[90.79.233.112]) by smtp.gmail.com with ESMTPSA id
	g10-v6sm14371989wrv.49.2018.10.17.08.40.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 08:40:59 -0700 (PDT)
From: yann.dirson@blade-group.com
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2018 17:40:48 +0200
Message-Id: <20181017154048.17231-1-yann@blade-group.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v2] packagegroup-tools-bluetooth: work as advertized on distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 15:40:59 -0000
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Otherwise the build fails with:

  NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['${RDEPENDS_}']

This restores some truth in the "Otherwise install nothing" comment in the recipe.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 .../packagegroups/packagegroup-tools-bluetooth.bb               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
index 0ede5e57b..e81516fef 100644
--- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -32,6 +32,8 @@ RDEPENDS_bluez5 = " \
         '', d)} \
 "
 
+RDEPENDS_ = ""
+
 # Install bluez4 tools or bluez5 tools depending on what is specified in the distro.
 # Otherwise install nothing.
 RDEPENDS_${PN} = "${RDEPENDS_${BLUEZ}}"
-- 
2.19.1


