Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 37BB17D537
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 21:53:04 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id u17so15884658lfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 14:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=pWfEpPW0M+3bJ17pIKAQ/kLXBz7dXCfo0MgusXxvHBc=;
	b=O2PB5jdynEU6UEVpVlCNLLwQ5c3waeXovwBmAkmAPlU6QCOmzDLS+IxdqzBoEv8afe
	My8UYlSdNnIuKvJUJ5MheUsCstwn7fmlVz+aFsXcxabSiChFmXHmrBCrCIy1SbHZcNx6
	yhmEpiVuAdr1gKED8KLFvum87ymaGSPxJtwD8z8XDK+4/ES5H8BrveeFIDfP/Skf1cE0
	Iw2aSXFLnXYyRtS1flfVfhG+FvP5gZOZnVfm5cPx6oHIo17PYmKi91ds3HAe6ytl03aU
	/Qqy2Rf+ytZMlVdxkDSeTjXyx/0CqCqVahVZBCqQxSfCjQK1DKV+WZ10+89RzyQEjlK+
	pWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pWfEpPW0M+3bJ17pIKAQ/kLXBz7dXCfo0MgusXxvHBc=;
	b=pv6je+Tbr4A1XU5tYkCCEk9T8deTArahPtdhNprjQrbvm59mgtVp4j/Bfa5UPIUFWC
	XgAHFu4O/4gztwonjLP/CE020h3E8N3sOs0+t8w9z81T7x6Nxe58h3yyTrs4Q/3Ew3el
	XrAVgs13f1y5qyb6FCwUPwUu0bBfEBq0VTsUnX8K/6+1yF4KWCmdJ+Ymz9HDuW2R9K5d
	PNBT/PGfJC5NH3zp/U1OpR7A+7+7X58NwbfPD3QKHIARzWQ2F/K+Ukgj1QXGy3GAoR7p
	Mvi9TzHpOQ5NYKanCLRebSGBmadBX5qAszc58NVYzywTcH6cjM8uIKQzR3hPbQhGTaSu
	nCyA==
X-Gm-Message-State: APjAAAV2dl78I3ODDtV5e/pXxaiK8pjeJgHOawpSpUoJRFzrNNa1pir4
	8gNYoU+5hvZ/6FERdQ/A5VPAI1VqPZA=
X-Google-Smtp-Source: APXvYqxw0ZhVChkdsgexszDXUK7fo28+HsZCx/vkvq3oGcCIwlgm+oPoe8GQrar0eZbK5Hx1y641WA==
X-Received: by 2002:ac2:43d8:: with SMTP id u24mr18683725lfl.94.1556142785000; 
	Wed, 24 Apr 2019 14:53:05 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	m19sm4488695lfl.43.2019.04.24.14.53.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 14:53:04 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2019 23:52:59 +0200
Message-Id: <20190424215259.14227-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] nuttcp: update to 8.2.2
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
X-List-Received-Date: Wed, 24 Apr 2019 21:53:05 -0000

License checksum was changed due to updated copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../nuttcp/{nuttcp_7.3.3.bb => nuttcp_8.2.2.bb}           | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/nuttcp/{nuttcp_7.3.3.bb => nuttcp_8.2.2.bb} (73%)

diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_7.3.3.bb b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
similarity index 73%
rename from meta-networking/recipes-support/nuttcp/nuttcp_7.3.3.bb
rename to meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
index ec4067806..2fd563123 100644
--- a/meta-networking/recipes-support/nuttcp/nuttcp_7.3.3.bb
+++ b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
@@ -8,11 +8,13 @@ number of bytes."
 HOMEPAGE = "http://www.nuttcp.net/Welcome%20Page.html"
 LICENSE = "GPL-2.0"
 SECTION = "net"
-LIC_FILES_CHKSUM = "file://${BP}.c;beginline=4;endline=30;md5=c55daba5a5a869a123c3565de07d15a6"
+LIC_FILES_CHKSUM = "file://${BP}.c;beginline=4;endline=30;md5=496a7c0bb83c07ff528d226bf85e05c5"
+
+UPSTREAM_CHECK_URI = "https://www.nuttcp.net/nuttcp/beta/"
 
 SRC_URI = "http://nuttcp.net/${BPN}/beta/${BP}.c"
-SRC_URI[md5sum] = "dfbff3c38fb0cbdc474ca6d13539d425"
-SRC_URI[sha256sum] = "d68e291a72375d76f301d54aa945727c95e78090aa6783a4844764e632e98a4a"
+SRC_URI[md5sum] = "d3c92c4d2f261221193c3726c1b9a42f"
+SRC_URI[sha256sum] = "8c5595bcd27c2fd66831be74c390df078cfb1870aa427f2511ac2586d236c8a1"
 
 S = "${WORKDIR}"
 
-- 
2.17.1


