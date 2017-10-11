Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id BE42F600EB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 01:43:09 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id h28so588480pfh.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Oct 2017 18:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=6YbPbSk6cQnPg1txa5O5jacccRCCnKPA75TPCBeQw+o=;
	b=Va2eikvlCZF8K6WtpPzgfvnRq0KugaBBSGiI+kiS1AEb3E27ud5ZxX9O9WK/EZOyG/
	hR/WfdguBoA/oPTEdfJKo0ZkTLrrZ5ovv0wFqQfJ4not7cj0W2SeNnkWcxTAvtaQ4Wck
	eUiYhjhhYb9RkALJvz3Q7rHG5tGivMPAJknO9DoqfDaqa9/CDhkurWhOKSPbZonyiHkt
	nQdnqb9m+LdrV1GKhnYcSaDZpKFEQhZTi70xDjkCIXxHJWpA534h7vr8NRYLmvWHfjDP
	GxgCfrP+Jj4JSmWvQGE088ncqxc6nVJNoWMUzubird3lFy/HgUcWXnsH9StBphR4v23m
	QQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6YbPbSk6cQnPg1txa5O5jacccRCCnKPA75TPCBeQw+o=;
	b=NMUT3dv7ZrCrH94t8CZr7pSkfJxllw/Gi+vxnB06NzQxTBDUwacAous9tqj6mCv4sX
	WmSQQokFiam5KFrI8j443+iyTmTTZEUSwr84JtCSoVPZvMLuUSIi8bdPtT+Vp5Nz3n/M
	DZa8lk7s0pW7V4u1jQmD2+OyxJ76HI50s7rq2TKcMfktNk4DKRSq0Tg/eoZ4mSMAdypR
	RhVz1ro1ZMFCnYwlm5rg+Rky19goyVouT86oLopT1mIpPQO5rETE15njijFyGqwURNJG
	XqiYW6S/g4Iqn//m1ueq+Cu0YRpPb6Qh/ctyyxeDqIb7COCeOCfWzwV1I6ycFZ3RIsi5
	u7Og==
X-Gm-Message-State: AMCzsaVZjEjtKpFuUEZYpI3Q9FBrbzpNyVdPB1BLhdlVIwPYt5qsxXk6
	rQ4YMuZ/E71Jc61oVYyad5qb/A==
X-Google-Smtp-Source: AOwi7QD/BS5icv+XfcQkr/Z0HIClXVZYwiNL6mhU22MJvapuCc2RWQPv1//uR168IUcCQXcs4iYVXg==
X-Received: by 10.99.50.135 with SMTP id y129mr2914506pgy.399.1507686191046;
	Tue, 10 Oct 2017 18:43:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:b1f1:dd8d:5df8:a2f])
	by smtp.gmail.com with ESMTPSA id
	q13sm14916613pfi.166.2017.10.10.18.43.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Oct 2017 18:43:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Tue, 10 Oct 2017 18:43:09 -0700
Message-Id: <1507686189-445-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireshark: update to 2.2.10
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
X-List-Received-Date: Wed, 11 Oct 2017 01:43:09 -0000

The following vulnerabilities have been fixed:
     * [1]wnpa-sec-2017-42
       BT ATT dissector crash ([2]Bug 14049) [3]CVE-2017-15192
     * [4]wnpa-sec-2017-43
       MBIM dissector crash ([5]Bug 14056) [6]CVE-2017-15193
     * [7]wnpa-sec-2017-44
       DMP dissector crash ([8]Bug 14068) [9]CVE-2017-15191

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.9.bb => wireshark_2.2.10.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.9.bb => wireshark_2.2.10.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.9.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.9.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
index 82c25ff..5358ba0 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.9.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "7d5e65efd0714bd6248aa5b36c28320d"
-SRC_URI[sha256sum] = "c8b32c0e7d44a277e737c53d9d142ad3fe4265338f25a7fd8c891f58a7633fc2"
+SRC_URI[md5sum] = "ae3a1a43a6e3687f44a738fd15d78021"
+SRC_URI[sha256sum] = "8574a5e1fdec7affae640924bd46c1aed1bd866e02632fa5625e1450e4a50707"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


