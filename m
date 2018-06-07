Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f44.google.com (mail-pl0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 88AC2787CA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 13:52:28 +0000 (UTC)
Received: by mail-pl0-f44.google.com with SMTP id i5-v6so6192030plt.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2018 06:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PpIdnmViOYFiCIeIIWKnO/l5Y1NlM6cql9nLBBxWUbs=;
	b=tvJwrVYEnaCvxB3jZQRxmlY7qQNmfB3sbJw5TdsUdbOFbC9NlebaCZFXvAdpCKYViO
	nZhx3wD7bbxYNfBZ4pLKFGmnCuKyOXokqxZPYEZW957idjQFxkJgsxNwws+n02Xx1qbR
	ISYdVu6fO8vF/7zXkHEJdaXts+2qdDk+UfmqWdiNKt//E3VF/nmIRCGkF0zuSzdFYRxT
	PII4I6nW9WY0HY1cXu+di7RkcMWG9tSSC4qvFAkBYFiw0/b82qdZs2K1exznkt/z2ulU
	1vcWAKXQUzXEpX8nhLsAgugpiY7MxdNDRCS1YJOtA86GOVQKGFP5amLb+x7n8WwHNL7F
	+0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PpIdnmViOYFiCIeIIWKnO/l5Y1NlM6cql9nLBBxWUbs=;
	b=BrYmYY7Dw3YpDuh7+UXv86TkH59zlnMIHTQjiv3cacaPRkkj2nVwXRkrbNyqs/0wZv
	LJTLs9B87bGpBUftzMOE5nWlB+FUjm9oOnCVCk9CT2vNtNrXAfhoj1PmmDnKkzacTo38
	rnkCZ2vHK1WYu5iAZNyJBID0nG30OVgjdACyJJco4z5wSN0CIOma51cdCUqZuKrL5pKG
	KVIyKac1tWgdX+Tt2D09Ne1nm6SRTSUbRZ5u4mnvlzdPLuAtOH+HMIPK/5Puw3fsjCeU
	qokL4m08uI1oec9abvdqoX5Rrc2vUIgcC+FUgQTG+DD0xoaYJQOGtJhMkHfT3i7BduJs
	hfSw==
X-Gm-Message-State: APt69E3xbXfHrjFJWoIcPFYdgvAPJ5K5mrnB1zMh1f9zwhsr17ZEPK9+
	XOHjwv2rLlUazQnnIvT7DCg=
X-Google-Smtp-Source: ADUXVKJD+fxmOafKlfZOaoKEem/kGvoDXIdCuPQCcZxSf/cGMUyDuHM+RuAHBwsvJxp6/V1mxmYAVA==
X-Received: by 2002:a17:902:3381:: with SMTP id
	b1-v6mr2171140plc.248.1528379549787; 
	Thu, 07 Jun 2018 06:52:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:143:7168:4d6f:f251])
	by smtp.gmail.com with ESMTPSA id
	t21-v6sm18675481pfi.22.2018.06.07.06.52.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jun 2018 06:52:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gamil.com,
	openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jun 2018 06:52:17 -0700
Message-Id: <0d626da0d60bc9e9d8824125984b13abe7ede572.1528379391.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528379391.git.akuster808@gmail.com>
References: <cover.1528379391.git.akuster808@gmail.com>
Subject: [PATCH 2/4] wireshark: Update Package to 2.2.12
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
X-List-Received-Date: Thu, 07 Jun 2018 13:52:28 -0000

Includes:
	wnpa-sec-2018-01,  Multiple dissectors could crash. (Bug 14253) CVE-2018-5336

	wnpa-sec-2018-02, The MRDISC dissector could crash. (Bug 14299, Bug 13707) CVE-2017-17997

	wnpa-sec-2018-03, The IxVeriWave file parser could crash. (Bug 14297) CVE-2018-5334

	wnpa-sec-2018-04, The WCP dissector could crash. (Bug 14251) CVE-2018-5335

Full release notes: https://www.wireshark.org/docs/relnotes/wireshark-2.2.12.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.11.bb => wireshark_2.2.12.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.11.bb => wireshark_2.2.12.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.12.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.12.bb
index 5eb372e..6c0b644 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.12.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "a79ba6cda83be2a91bde4110fe194788"
-SRC_URI[sha256sum] = "a9f11621e85d7e1d72259157edd94825e72af3fd72e184b8474459f92ad5fc40"
+SRC_URI[md5sum] = "ebf3d4230d7a13408758cdf037c42d66"
+SRC_URI[sha256sum] = "3274458d1bb1658a5001465ecb07c7cbfc709571ef36bd062897570d4bab3ebc"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


