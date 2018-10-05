Return-Path: <uvv.mail@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5CCC574AF6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Oct 2018 09:18:08 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 61-v6so12030129wrb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2018 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bqt7IFr0e4jeTFHkOpNO9s1TFnmghVJn/vXCcJKo3Dk=;
	b=ogIEWFkwJb1NCZlHdseoDsHNlHIWnjXc7FwbJrgXtKyuLnJpDhcBpKRDuxrIlxJFTL
	cih1aHCJOMDd40CGaESMEuyETthdaAjlWQK+aI4LqLgaldnvJQO53HfnzEHRnVb7Ecwu
	Umcw++Le/YAjdzlp1Fb+hoBfscmqjHSUHz8LbT8qRxPSeseDGQUvhElNw1KxtL6XhOpx
	Zav6G4eFszRQ9K/i44kcGBndRBIdjX5mlByUIl3JCa83UWnndBtVGC0ujD29QaVF00Yb
	Jrgngn2uiK8eSBQ9HzZYjzYhYNfYwu0vgL6a2yepqGB1dyyBXlttMETTtwvsONOBd17w
	bP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bqt7IFr0e4jeTFHkOpNO9s1TFnmghVJn/vXCcJKo3Dk=;
	b=tM9NUQuFKAEh9w46eE1kx9nqKM2PBnFEk/ZOHj+fw06YfC1LuJi9+OXe2zfZHCdlBT
	SwHaYRU8Xo7MsrNzorB5DIwe/lBWLkz8y6xXOxbG7h+2IPtQ6NSB1U3PFEGeydwuIGBu
	9nyEtBWtoidmRcT9YqNXXB4OrU03pv2fbqtbfb5XV+2GsTDQ7HoDi1TZvsiWLd5nU+nl
	Pud+SLhE0ZZf3HDE5g4vGUR4ozK5YvkuHt1r3vqYFEVBK348DoRfVOwRJrbZsEeuBqEl
	QCcIRm0C4P79plcs8cKJy+m29Ll95qe0VM9XukzRHuIzXIBnQ0F8rANjiryrTUuRKkGz
	pq6g==
X-Gm-Message-State: ABuFfoisf3CHXP0xMsfKH7KZc95A4uCHDxmgBXgzVhgmUNUIpsMIqWK9
	9kOj0yyoxXfPwYETdkGhlPwDmaAB3JA=
X-Google-Smtp-Source: ACcGV61GkYR84F93TR4XfvGzIThpqrEnwLy+rC7rIrJ4nOLqhSzAMVNVuC2moETRxhUdGYHtqV6+TQ==
X-Received: by 2002:adf:f90b:: with SMTP id
	b11-v6mr7717797wrr.307.1538731088651; 
	Fri, 05 Oct 2018 02:18:08 -0700 (PDT)
Received: from localhost.localdomain (ip-109-42-0-21.web.vodafone.de.
	[109.42.0.21]) by smtp.gmail.com with ESMTPSA id
	f1-v6sm1266418wme.23.2018.10.05.02.18.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Oct 2018 02:18:08 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2018 11:17:22 +0200
Message-Id: <20181005091722.105122-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] ceres-solver: Removed empty package
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
X-List-Received-Date: Fri, 05 Oct 2018 09:18:08 -0000
Content-Transfer-Encoding: 8bit

By default ceres-solver provides a static library and headers.
This change removes an empty package and sets an implicit dependency
on dev and dbg packages.

It also addresses missing cmake configuration files in dev package.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
index ad7c8f2a3..13ca8efab 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
@@ -13,5 +13,8 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
+FILES_${PN}-dev += "${libdir}/cmake/"
+
 # Only a static library and headers are created
-ALLOW_EMPTY_${PN} = "1"
+RDEPENDS_${PN}-dev = ""
+RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
2.19.0


