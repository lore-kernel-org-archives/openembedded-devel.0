Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id E50D778766
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:02:04 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v111so8268369wrb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Z1mSTjvZBZrNrmqmocJKCKa2AT/YrSXbTvXmR5updeE=;
	b=cU+dJr4YS1cdmtU7jhHszo1V2pXK0ioqroFPDgtMbUGDzqWyaevYwSojCFHTL01kGj
	fCBFiTS2emipQy69yFOr7icIrYsd4O8ul5e/2f/Uz/L1v9EnNMqOJkXklUIZxfPSghNJ
	wgCKCtoGf3SOhUUrb0aIlsDQeMHV60aOyJuzqgWhc2R15UPrgbKiOdIVefhYVFE1500z
	UZhXqLtobUM33PxKpUs8SxcOhvloXzn/6vNRE1GFEdmeWZZMi1jfYYDFre4s+j5+k0di
	Vis5U2woKNWPnz6cb9Ph3CH9OeJSq0aVXSa/Z9206evUNChNHOLlPxJDZBHsuV2ug/8y
	rzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Z1mSTjvZBZrNrmqmocJKCKa2AT/YrSXbTvXmR5updeE=;
	b=JBM4fT7nCPIqkT+zx/OB5uDxOic4P9/DRerQeRBJZb95UKKVIhb9dul/9rjXe4sdTr
	DmAZfQxHPbhUztDHIyeG7AHORRNE4BdQZJ/tqbOm6fCMqsP3XPKX6zKjxcOSOxvdM2Y1
	h38LdO9GAR+Hdv3Rla0qBQF5DyTO3Rb37Y5xmecedbsp8cALi/esABPKRlfA9Tibj3s1
	9XiVwwkE8YWUou/9TOm9QunIDrAQctj/5IqwkJVoDVX1COqnrvE7BsJOMR10Ul6eTgJX
	KEvK7Yy05sF6+AHZmnP9n97oV3QlA75YTuSVaF3kBHvI1xbaox6bYhdZOmXMmI6Pytgx
	IqHA==
X-Gm-Message-State: APf1xPAysIZ4MUyFNiMRdPaW4ID3QUFL9tsGvpSOc/jIflsl70JrqWTZ
	SaIqtMTdixsK+blzM/ABVv8M7A==
X-Google-Smtp-Source: AG47ELtiUGNM4KVAcNhq9WKFtbFMU0m7dzfjUhhsqQ8eNKjLf/rw/cxmv1ZMwzZjZRihEOYcPczOmA==
X-Received: by 10.223.158.208 with SMTP id b16mr3012204wrf.274.1519945325600; 
	Thu, 01 Mar 2018 15:02:05 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC063001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:6300:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 8sm5490wmf.13.2018.03.01.15.02.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 15:02:04 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 00:01:39 +0100
Message-Id: <20180301230148.2284-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301230148.2284-1-schnitzeltony@gmail.com>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/12] xfce4-whiskermenu-plugin: update 2.1.4 -> 2.1.5
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
X-List-Received-Date: Thu, 01 Mar 2018 23:02:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-whiskermenu-plugin_2.1.4.bb => xfce4-whiskermenu-plugin_2.1.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.4.bb => xfce4-whiskermenu-plugin_2.1.5.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.4.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.5.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.4.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.5.bb
index 4a331c5f6..4aed9902b 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.4.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "5aeff066c38fda9aea2a2a3d8ab6dc9e"
-SRC_URI[sha256sum] = "ffdf2d5d4e0eeffc96d4642fdce8c55f26d3444cbd6c7b3d6f6cd7168ad4a6d5"
+SRC_URI[md5sum] = "9bb98425d45b027e7a35905d07b0cbbc"
+SRC_URI[sha256sum] = "20684ffe014b84d3d0630bbfcc5f8707582acb67b602ab7ef6317df6782df2b4"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.14.3


