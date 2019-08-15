Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id BE27F7F29D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:56:16 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id y8so3491986wrn.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2pGZomo2wD53U4DuSxcb7wnAEoXrvyMqQfuS6WKCaMQ=;
	b=iNSRlIHuvoP58BqOyZLe43XDv0R9TUKSPK4Pl64fkTZW88Y6eU4nUZRP001ursaCUx
	zFyEI/JtXU/fugWU2vwRI6yjhN6jOOqS9vJkEp27ZjO0Jg3j8Jp6KP7D1ASVMN+fRscG
	8A4FeCmW/CnMF1ckM2JPgQV0c3rc/JGFPB3t4swDfg3klSVsu6rCn76QLxn3ZusddCrj
	OutjFX56pe32JRw0xaURm7GA7hvYCI0odd4dBiy7eM5Td7097p7CXNQKt/QB54iaq4sx
	XiduhebkouY4PJ0ciJXZSKeqI2I6oQVOUSmS1BlwinVJjjSMydzwCASCvV1Q9LBml8Oa
	Gl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2pGZomo2wD53U4DuSxcb7wnAEoXrvyMqQfuS6WKCaMQ=;
	b=FYx3noJAP1cXwJRM/TG4MxR7E7RN0izzCRgbrxO58083EODCjrFQ3PsrtMSzhg4qxa
	pDpqolj8spA+X8dt4htWaAdl6XMtFoWVmEI2hzbgqF4qnAkvBC403YFfj7ebwcMt5I/D
	9LP4LIkRsU59l7WDSyjy7XZqb44lR7qefk6Jt9SM/xYDPxb0/uKtTQbnImeuNEtZi9gn
	OdH8DDr0zCzyISxhRaTl6ymN2EoJw7sP+KWi/hgi5o4Sh+M4isJl5MS+MVERllgJj2yV
	f5AVFDEkpx3v1ifI45P6mG/IY/OCrQ68gxQqU4ByNtPxbUrd22ov76gBBHI7l/oCmwOT
	Hd/w==
X-Gm-Message-State: APjAAAWJF21qbvEOiD3RqCzhdcaidNAqv3P+jWFjtkF9TmVwmmxU0vyj
	BzSPIRf/Kqd2GVMmRqJAJ7YxQYkR
X-Google-Smtp-Source: APXvYqw4L+Ge4Mvu7GCkkd98nsYPCn2MBGnFVJUl+Al/kaxFY82o/mttTXSN5QFUqUR0FFxve2cXWw==
X-Received: by 2002:a5d:4111:: with SMTP id l17mr7372454wrp.59.1565906177055; 
	Thu, 15 Aug 2019 14:56:17 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F042332D9169E9166842542.dip0.t-ipconnect.de.
	[2003:f0:7f04:2332:d916:9e91:6684:2542])
	by smtp.gmail.com with ESMTPSA id
	h97sm10555192wrh.74.2019.08.15.14.56.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 14:56:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 15 Aug 2019 23:55:55 +0200
Message-Id: <20190815215605.19600-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815215605.19600-1-schnitzeltony@gmail.com>
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/13] xfce4-cpugraph-plugin: upgrade 1.0.5 -> 1.1.0
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
X-List-Received-Date: Thu, 15 Aug 2019 21:56:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GTK3 port & minor feature/bugfixes

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...graph-plugin_1.0.5.bb => xfce4-cpugraph-plugin_1.1.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.0.5.bb => xfce4-cpugraph-plugin_1.1.0.bb} (46%)

diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.5.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.1.0.bb
similarity index 46%
rename from meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.5.bb
rename to meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.1.0.bb
index 83e2bb5c0..eeb54b315 100644
--- a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.5.bb
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.1.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Panel plugin with graphical representation of the cpu frequency"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-cpugraph-plugin"
+HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-cpugraph-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "f0ebfabb273adf69361b37a3fa4b7912"
-SRC_URI[sha256sum] = "85da0ec89aacfd31e0bbafcefea37cdca618d62e681c1c9da8bdd492f028f4c7"
+SRC_URI[md5sum] = "48ead9dcc019212795637c170d9e2ca2"
+SRC_URI[sha256sum] = "3ece0a24e55827e0d9b6314129906da60513acdc1748d9dece9f50526e906ba4"
-- 
2.21.0


