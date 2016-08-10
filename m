Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7B516771DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 00:39:08 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o1so2303087qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 17:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U04LO4p5HpKDBL8bYLn+VfNwiV2Ey8fhMY2PT06bhE8=;
	b=LLmjKVY7nHVNxrbOrhDJhHBkYRNY31fh+8Xz5Hv8jU9GnRemL/zEN9H4ZBE/sqCqCA
	iVjyNae/fNCqkcgkeY+Eabe18iiGTeFe/SV4aEdAq+SppW9hyFtjGyZ+LXmn9age3nSu
	sTyscepMDZN5mIyrzdd66e6OMDq2hfgdJMRczyG8kiF+mFuAvgC48/WD5grAhnE/KfW0
	3ZHsqu91lwRDrYn5e/hoh5kZVJMA4VGtgigKl9DIpmgDiz6rf/OmecnuE27m4/LcB5At
	0kM9bmVgKcHk5cMP6gMUfB/NdYhQh1qZsjq/tEfVSAo0vzshnob7Kyb88x7zVR3xZWMt
	oGqA==
X-Gm-Message-State: AEkooutfYsDe2wnKrYisdSeFTUSn6kXQamuUPlUBn5sHqeQJe6vvmM4onmS3ZjGsg+eOzA==
X-Received: by 10.55.94.66 with SMTP id s63mr1420584qkb.31.1470789548912;
	Tue, 09 Aug 2016 17:39:08 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	o131sm4898084qke.20.2016.08.09.17.39.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 17:39:08 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Aug 2016 20:38:54 -0400
Message-Id: <1470789534-602-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470789534-602-1-git-send-email-derek@asterius.io>
References: <1470789534-602-1-git-send-email-derek@asterius.io>
Subject: [meta-oe][PATCH 3/3] opensc: update to version 0.16.0
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
X-List-Received-Date: Wed, 10 Aug 2016 00:39:08 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-support/opensc/{opensc_0.15.0.bb => opensc_0.16.0.bb}    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/opensc/{opensc_0.15.0.bb => opensc_0.16.0.bb} (87%)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.15.0.bb b/meta-oe/recipes-support/opensc/opensc_0.16.0.bb
similarity index 87%
rename from meta-oe/recipes-support/opensc/opensc_0.15.0.bb
rename to meta-oe/recipes-support/opensc/opensc_0.16.0.bb
index a11b3d8..fd67181 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.15.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.16.0.bb
@@ -11,10 +11,9 @@ SECTION = "System Environment/Libraries"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz"
 
-SRC_URI[md5sum] = "f266024e5a9630821ffa0ac14f72e369"
-SRC_URI[sha256sum] = "8f8f8cf52e0252334e4dfdccca829b876a3de6340deb772aa0bfe0c0cc10eaf5"
+SRC_URI[md5sum] = "724d128f23cd7a74b28d04300ce7bcbd"
+SRC_URI[sha256sum] = "3ac8c29542bb48179e7086d35a1b8907a4e86aca3de3323c2f48bd74eaaf5729"
 
-S = "${WORKDIR}/OpenSC-${PV}"
 DEPENDS = "openct pcsc-lite virtual/libiconv openssl"
 
 LICENSE = "LGPLv2+"
-- 
1.9.1


