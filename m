Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0C3866010B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 01:57:06 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id m28so670840pfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Oct 2017 18:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OhzQfktFD7W3kw4MoVTaOUdI1/AtkQVnW6Rto0sVmmY=;
	b=NcWdZeC83+QNEFLUW/uGNyHaIi12d/VCaEW9GBPRkk1E8nkTo2Y7KB+sUoO6FGOZbO
	Clfv0BKLivzn1Ho+sA8+DCnMqu/gPbQ79IenhvERCZOQk5i+ZmWKrb/AxUNSACd9T6wS
	i4goeotzOB3z3BKCHL/0qQv2hUoilZVNmqLKR4RqCjf9cVtCFtwo3/DavlssWmWQ+GWX
	GmHRQp3csZSkqCyqPzuQ+l4jtjmJufXGSPZlktlyNiamWATZXiOcRIVLeQ2cfPrid7nB
	pr71dCukhYjYCxRdRQDj6BnS3oWZxk72C4F/qvorgdeZEekWRzcZJbckhYKqcIgaA5kb
	xbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OhzQfktFD7W3kw4MoVTaOUdI1/AtkQVnW6Rto0sVmmY=;
	b=VvLIO4WPKb+fIci2uvYVjK9sohM/jDXfULJHPYwbP7ZgST/GGdvd2rHEsUOn4GBZz9
	6FZKjkbIq6tdr6CWhF96Zb16Rp+1VDQFtBM1lAXmlXRbGzo5PY1ocfQEh6pgtN35bF9D
	Xg2S9nm9DZP6lAAqlS1NWBoKkxCTH8zcrbH7hDNcEwWXKlDUa8C8/VveaYM7TpLA765U
	FcbSOPnsE6MuebAx9qjspYfvULzUW97GS+8VwF2I81tCpF9kkMB7NwHfZozoCQET2E8R
	We8oCdw6x1Wr7ucE3tanPFciMSnJJhoFqwMOfA2OloBHMiVrlXNgjhCcVe3DrAIKTbve
	meNg==
X-Gm-Message-State: AMCzsaXW19nTOjRqjw6DHNZPEoQXjZYnrSlBz8r0Y4EFOUMD9fAX+rIi
	/NTl1VMWFXS3Yw2oaMgLWibXrA==
X-Google-Smtp-Source: AOwi7QDMhs71qhFhD3Ru/xBCxmAyYTTsufEHCqslNaUYPFARGQExMsHJzWUm2EXsorgHeXux8NLF2g==
X-Received: by 10.98.48.195 with SMTP id w186mr15246129pfw.213.1507687028044; 
	Tue, 10 Oct 2017 18:57:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::74e7])
	by smtp.gmail.com with ESMTPSA id
	x4sm20685317pfb.101.2017.10.10.18.57.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 18:57:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Oct 2017 18:57:00 -0700
Message-Id: <20171011015700.12779-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH] toybox: Switch building from git src_uri
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
X-List-Received-Date: Wed, 11 Oct 2017 01:57:07 -0000

We need a patch e.g. https://github.com/landley/toybox/commit/78289203031afc23585035c362beec10db54958d
to fix build on archlinux

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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


