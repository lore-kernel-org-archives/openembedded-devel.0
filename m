Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 018DE70200
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2014 19:33:11 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kq14so6613090pab.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2014 12:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O8D1X2bSBmSn4zjWKr29nzUnCYCR5Q4JccVI4OtnmCc=;
	b=HqJPO0/V5Vuzd6jkZOciH9mLjoJCqt/H4HDuvJK0Z9m9qb07mtOL+FjsyLAKVa+DWR
	ljgthRFy/u931w4wf/cCO13FB15WnvCbSotjHJH7I9M1c4tcMJpfZ9CTgwqehGnpXf18
	M2JP3GlhTw49WNLTLtWa+8rDglg9sRq5u/IZQcMlRaeZqxcdVa29mgt/n+zyAjmqWkWE
	bm/wXe1b4Jr4v5IRrHf2AwPoy7um9puQAYTm5m3H7sxP2HRxEckGz3z01KJyTThPwDjV
	vXzss4Vp2tbHg2jpgF7Yk4WgG4MSWbK2WYYPTsKHWbtvD8qQ5wTiBetG2OjitJTDd5+1
	tZsg==
X-Gm-Message-State: ALoCoQlHb+SS13wGMDLgfc6uuRQ0NBQVGOSmqzP7LfSI5PccH/lYJ/31i2d1vUGY3GUiPGmuTaTI
X-Received: by 10.68.164.164 with SMTP id yr4mr20791833pbb.57.1406316792638;
	Fri, 25 Jul 2014 12:33:12 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id dd5sm9650903pbc.85.2014.07.25.12.33.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Jul 2014 12:33:12 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jul 2014 12:33:09 -0700
Message-Id: <1406316789-27514-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] V4 wireshark: fix build depends
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jul 2014 19:33:16 -0000

This should address issues found in test-dependencies 2014-07-25

wireshark/wireshark/latest lost dependency on  libcap libnl libnl-genl libnl-nf libnl-route portaudio-v19 sbc

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
index 5d6df40..b965fdf 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.wireshark.org"
 SECTION = "network"
 LICENSE = "GPL-2.0"
 
-DEPENDS = "perl-native libpcap pcre expat glib-2.0 libsmi"
+DEPENDS = "perl-native libcap libpcap pcre expat glib-2.0 libsmi libnl portaudio-v19 sbc"
 
 inherit autotools pkgconfig
 
-- 
1.9.1


