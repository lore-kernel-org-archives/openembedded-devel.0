Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 678CD74BC3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 18:27:27 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id d10-v6so3636242itj.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 11:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=A5sFskgm7w8IuAsLxSjmyPVgSN1LEoxRfmaQ/HNqZpc=;
	b=q/Nj0NSBO9Mz4iQFzuzVVKDOZ7YCILZzrObjmCQAiLtfXPxDMx1VCToXVcsAQhOJBO
	BxHLyfuAGpiRdXqcJe7dZXWaMkcXHo8PNa43S8/vC0HskKF3I99OjsjW5tZ5sBhgcgDO
	1BHdyxs+wPK7I8BBIN2ZFFHSQUZDPJTd8ZggftvEcULXpY+EGgDpRHNyAxKVfevIrOOj
	i3xvlBf8YwxKnkJ1ZJmYHVaV0T5f1Ua9x7+jZeNgmxf43L/Ls2vQirj8sEwb3f5MdAKJ
	PgfELIjzVSTkDqRL6EFPxXSrwfR/L0+M9eBN7dYRkggNcVF4u5ihohZVxXkXR8/4KPLU
	zPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=A5sFskgm7w8IuAsLxSjmyPVgSN1LEoxRfmaQ/HNqZpc=;
	b=TDn/TnbzdXNuWjgxsCPCqY623uI6KeVojsP5KfA8NMNy44CjftmcD+IOFjD1VkgsmT
	no7L6OXVnNOo9s5pK6tX2pL1x75qxJ7EsjnS9MufcsHvFKph/hKWmLic0CB1O7WIVk9l
	fRl3IZj1rj9IInnUmmygwBAM2rbu3uGOfpDCEUIKkQwQaty4BK8kE7a/qWRpIEucEgSr
	1+Ldw2DylFRK6uwIpiLnYUGymXmnZfIAYFZwaYSP5RFbcC0UJ5C9GlazqSCoFjiGhcIC
	8gKULZH+40PfuQA4z4N9nxuKqmv0+Tvs3FtOT47KpxJjRPrWtKQLWW+duK5Mo9G2ZUZV
	Y7mw==
X-Gm-Message-State: ALKqPwc3RftREAq0/4LFlB+d7AO5TPFSgWk/ACwAPMLyCGbBcoYPrYvO
	QLBxl9AxqmE7AucKMRlTHmFzAfgC
X-Google-Smtp-Source: AB8JxZoo5LXO7z0bYc3jYq5DdGadpw521oC0EoG8LHAyHoLOOBu43x3u1eWyB09ysw2/Nxdmspc7rw==
X-Received: by 2002:a24:cc83:: with SMTP id
	x125-v6mr10720770itf.120.1527186447971; 
	Thu, 24 May 2018 11:27:27 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o1-v6sm2746196ite.37.2018.05.24.11.27.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 11:27:26 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 14:26:58 -0400
Message-Id: <20180524182659.19986-11-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524182659.19986-1-twoerner@gmail.com>
References: <20180524182659.19986-1-twoerner@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][master-next][PATCH 10/11] capnproto: variable cleanup
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
X-List-Received-Date: Thu, 24 May 2018 18:27:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reorder recipe variables according to:

	https://www.openembedded.org/wiki/Styleguide

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-devtools/capnproto/capnproto_0.6.1.bb   | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
index dfe19947c0..6ca3613db3 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
@@ -2,24 +2,23 @@ SUMMARY = "Cap'n Proto serialization/RPC system"
 DESCRIPTION = "Cap’n Proto is an insanely fast data interchange format and capability-based RPC system. "
 HOMEPAGE = "https://github.com/sandstorm-io/capnproto"
 SECTION = "console/tools"
-
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=0a5b5b742baf10cc1c158579eba7fb1d"
 
-SRCREV = "c949a18da5f041a36cc218c5c4b79c7705999b4f"
 SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV}"
+SRCREV = "c949a18da5f041a36cc218c5c4b79c7705999b4f"
+
+S = "${WORKDIR}/git/c++"
+
+inherit cmake
 
 EXTRA_OECMAKE += "\
     -DBUILD_TESTING=OFF \
 "
 
-inherit cmake
-
-S = "${WORKDIR}/git/c++"
+FILES_${PN}-compiler = "${bindir}"
 
 PACKAGE_BEFORE_PN = "${PN}-compiler"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
 
-FILES_${PN}-compiler = "${bindir}"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.0.582.gccdcbd54c


