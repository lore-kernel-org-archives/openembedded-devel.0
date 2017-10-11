Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3471D6010B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 01:58:19 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id b85so308426pfj.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Oct 2017 18:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ChV6UitU4PqfJtEV8MzSOSvIWhUbP8+Vk/AwVsS8ScI=;
	b=tVHM/UP2uHhIivl8kBsZeeXoDKPESYdRFVXG5KHk/abakruldmCBuc3kJN2Eb0iuAs
	f28TE7hKDB/TA+I62XkwBjt5ILfBzaW5lG1czooJZ4cUSz0eEv4ngTM0RCi4V1PSiA40
	TDmGK150sG1rmlUWTHx+7uqn3dRRw39Sh67CR1j+Nvvm5M5zTT6nyQrH9wNx9IgGnAZ0
	6o3cWwBLhQwC2PWolo0iM/+jLE0Uy6KxoDwEqZ+YVqnmm4sgTzSrSI4Q4AZ3U2T2/snW
	eLKw5Yx55YG+xxI8a/JTc7HK48kQwjJR5j8M3gZssfllhabxYf0tOWEFSxBGdSM1PQrH
	mzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ChV6UitU4PqfJtEV8MzSOSvIWhUbP8+Vk/AwVsS8ScI=;
	b=kCKT+Rwh78hWPLmoxvP2LUypAfceygJ6GzygQttQK34jz1NNJuRnzuaKTXmFrGFyPS
	o9kZv2mvi9Q8Oval9wJqtOzJaVCosKQsQSoJkzNkvAOGcIGMN3GQktf4TlAYebPbAs4m
	1SOLpKMf+gPmjAcSGEdTstXSbeyVndVppBvEgNy4POUCSQUEHIfpuy9YA3u6K0wKZlwp
	kO1F9t8Na4BEwRvoYvYk60wulYGuTlnASlZk6M6SBrjkJJ/HLyBkCwLqU1wYgw1dw39C
	yUsHKFGjUNDLHQrmvGRjGqPFgomDnWRbAl7pEa3OqKLQ6kk5y4CdND1SU25UdfiVnoXM
	YxbA==
X-Gm-Message-State: AMCzsaXTlDh5o/LIbtwk3lI6Kk1AVYqF3+GZgnJkn2WJkBaQgW6b4asI
	lhjYbEgRlMV6k01oPuX6n3y0zA==
X-Google-Smtp-Source: AOwi7QBoehaQeikYI8UtdhtBYycCJ6tRsyr3O4+9i1Kt5bVHlO5MYnqitUK8tyhki288IlxgufVzuA==
X-Received: by 10.98.58.199 with SMTP id v68mr15361152pfj.44.1507687101289;
	Tue, 10 Oct 2017 18:58:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::74e7])
	by smtp.gmail.com with ESMTPSA id
	j6sm20930735pgn.68.2017.10.10.18.58.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 18:58:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Oct 2017 18:58:13 -0700
Message-Id: <20171011015813.12863-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [meta-oe][PATCH V2] toybox: Switch building from git src_uri
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
X-List-Received-Date: Wed, 11 Oct 2017 01:58:20 -0000

We need a patch e.g. https://github.com/landley/toybox/commit/78289203031afc23585035c362beec10db54958d
to fix build on archlinux

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
- Changes since V1: Added proper layer prefix to subject

 .../recipes-core/toybox/{toybox_0.7.4.bb => toybox_git.bb}  | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.7.4.bb => toybox_git.bb} (90%)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.7.4.bb b/meta-oe/recipes-core/toybox/toybox_git.bb
similarity index 90%
rename from meta-oe/recipes-core/toybox/toybox_0.7.4.bb
rename to meta-oe/recipes-core/toybox/toybox_git.bb
index 76a7af459..08f971573 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.7.4.bb
+++ b/meta-oe/recipes-core/toybox/toybox_git.bb
@@ -2,14 +2,17 @@ SUMMARY = "Toybox combines common utilities together into a single executable."
 HOMEPAGE = "http://www.landley.net/toybox/"
 DEPENDS = "attr"
 
-SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
-"
-SRC_URI[md5sum] = "55ea59a31c7da9510c8fabe70f4bc561"
-SRC_URI[sha256sum] = "49d74ca897501e5c981516719870fe08581726f5c018abe35ef52c6f0de113e7"
-
 LICENSE = "BSD-0-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
 
+PV = "0.7.4+git${SRCPV}"
+
+SRCREV = "78289203031afc23585035c362beec10db54958d"
+SRC_URI = "git://github.com/landley/toybox;protocol=https \
+"
+
+S = "${WORKDIR}/git"
+
 SECTION = "base"
 
 TOYBOX_BIN = "generated/unstripped/toybox"
-- 
2.14.2


