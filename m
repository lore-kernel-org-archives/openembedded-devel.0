Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2086277D78
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:08 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id l44so5796046wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NHg04O2UjInRLLfODooEd0QibXCku9rjJX5yRTKInBQ=;
	b=g1mf7F/0YAWZhmqSapeOv9h/vuViVCq71TefQlVDXCRSdj+vi6/ZhJX8kO7uJv6Vc+
	gRFH1z98WkfrqdOwEmIEc5qk8rEYHqgYWBHFeTdoYC4YEu/fukiXzVTM0YD06LafvPma
	fdISb/aJ7ZAcXtGlO5i2yLDARCLYxG4ObLGWq30UaTx+fcRVc/tED7CG1ItzlmoIAhub
	VQH3gIFC/bZUT7oIu330nhvY5e35betyz/VFtyph+iCB30QJDVEJix9Dwi0tt2VoWBGz
	nHiBVlQnFb12IWxvUMkEdur3IxV3+FpvE6XG/ZgVvH55OmKGulJmfEVxkefU9h6EoL0r
	lIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NHg04O2UjInRLLfODooEd0QibXCku9rjJX5yRTKInBQ=;
	b=W8vfHTPRUUp9fNn19YjxPXqpYceoMqOIpasSOnG0M3wbKRmx/QvAmT4gE6XurWyMGa
	aLxF8L9hga2zkk0d0cUapUPzh7Q6yA4SKCpqavIHFyHu37BT7rfND6ABqef9GNYF/XC/
	nhrDGU90GiC3/lGXv4O/J3N8g8NWJV0WJE9R0P5wenGeJjBZJoOn214NQQmuiXCByRFm
	EwxlKio5Op+cvLCGIXN+MeT3dQMOSsKUuGrF0gc7pG2bK9DxUdn7SFE6qvGJPv8FRAbP
	Rn5dEDLzsI+llQ+MlJBi/jKe6acnk2jI64PIrmQjQ7aY9mG2OqmHMAVAX2WWhlMSRExv
	DNaA==
X-Gm-Message-State: AN3rC/7XIq3gt5wpnaSW6s9RwrQ/Oy+9oPfEbXQAoL7+OtWZFFTLmxULsUhg95r9HEyXzQ==
X-Received: by 10.223.133.152 with SMTP id 24mr4707300wrt.86.1492027029050;
	Wed, 12 Apr 2017 12:57:09 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:28 +0200
Message-Id: <20170412195638.3243-20-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 19/29] networkmanager-openvpn: pack static libs properly
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WARNING: networkmanager-openvpn-1.2.6-r0 do_package: QA Issue: networkmanager-openvpn: Files/directories were installed but not shipped in any package:
  /usr/lib/NetworkManager/libnm-vpn-plugin-openvpn.a

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../networkmanager/networkmanager-openvpn_1.2.6.bb                    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
index ff2ad87..d360a71 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
@@ -29,6 +29,10 @@ FILES_${PN} += " \
     ${libdir}/NetworkManager/VPN/nm-openvpn-service.name \
 "
 
+FILES_${PN}-staticdev += " \
+    ${libdir}/NetworkManager/*.a \
+"
+
 RDEPENDS_${PN} = " \
     networkmanager \
     openvpn \
-- 
2.9.3


