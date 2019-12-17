Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 91CE67DD6C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2019 03:41:19 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id l4so3923663pjt.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 19:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lFlKQrpvp0n7OVxeJqbhvsXgLsL2DRmuu6YOMiZSq4o=;
	b=DjI84iGAQIVIkkjkXjskdD4uYoq1iMVd6Kqt0wH/AAJ8dqebaCbVzV2dIWtnPRdYpM
	eVwv9tLz+gXNgQYl4ElU4bwpZQ4DCNT8mC2Gy77iEP790wuF+UXPsWlJnjEB4h825FB7
	TFeZJrwWgVACJ4rXU0EJdWLg6xlWEzmh4uCyrfmlTSv4a+nUa4Jb8iQ7R2sOuOg3jyw7
	nh4tGkPndH5nBDcZDjKLkfZ+e8OnnnSyNjCjorXY1R99EhHEP6kvj2Pl4SULsMpyAXTj
	Hj4stH4X3JQP3xtj4RE5HnHpgR2MFrn7F8Tqnqc6dgksPiPPIrSx7N6obUMqLwq7IuLp
	tQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lFlKQrpvp0n7OVxeJqbhvsXgLsL2DRmuu6YOMiZSq4o=;
	b=ceHNuEye0EeceAf4VDMcFXS3DdAViYTX2qYNnHmSH5m9eClZouXKv+/potMH4m3dHz
	QUi4Rm+3Q5uO78DB0fJOz7cXzyyAA5uWWID8pgvOVFfHTm+DTULdS8kOweyXzpb34P2X
	0SsHmgNziG2o1ebDo3ChqHhQhwR4z1EKC5ejETOuQ9OOm66Y1Q2Gtt8GH625qK1gFsMW
	0//0GeT+lgXsTdzhqSjMPzoX4NA5mQJlI/vTH4YEn72ATeRVHjjzcSeysdxCCVmBX3Os
	RljVKfGtOdzJEz9CX7dETx0yEZeSs8PrUW2rDSNxlb5rLb8vvvlZWvYu+mK58qlg1pJO
	VagA==
X-Gm-Message-State: APjAAAUmls1iX8/2VjSNbXJsGjOLKt4LSyaveuniZ5EEWoMMRFr2knCc
	/Vze/DCOXtc5QGP+q9BRQ7FAFfKFjyE=
X-Google-Smtp-Source: APXvYqyVb9T1nditT4b0IMlCyR/kyOHDhuRZF1dE5crnaudCIyBTg+qw98RtO2r0KLScHA8yDp8L7w==
X-Received: by 2002:a17:902:8d96:: with SMTP id
	v22mr19962610plo.262.1576554080180; 
	Mon, 16 Dec 2019 19:41:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2ebb])
	by smtp.gmail.com with ESMTPSA id
	u18sm25118197pgn.9.2019.12.16.19.41.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Dec 2019 19:41:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Dec 2019 19:41:10 -0800
Message-Id: <20191217034110.3234131-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191217034110.3234131-1-raj.khem@gmail.com>
References: <20191217034110.3234131-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] nlohmann-json: Upgrade to 3.7.3
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
X-List-Received-Date: Tue, 17 Dec 2019 03:41:19 -0000
Content-Transfer-Encoding: 8bit

Rename recipe to express PV

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{nlohmann-json_git.bb => nlohmann-json_3.7.3.bb}          | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nlohmann-json/{nlohmann-json_git.bb => nlohmann-json_3.7.3.bb} (89%)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb
similarity index 89%
rename from meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb
rename to meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb
index 4399edaab1..37597defed 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb
@@ -6,9 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f5f7c71504da070bcf4f090205ce1080"
 
 SRC_URI = "git://github.com/nlohmann/json.git"
 
-PV = "3.7.0+git${SRCPV}"
-
-SRCREV = "ea60d40f4a60a47d3be9560d8f7bc37c163fe47b"
+SRCREV = "e7b3b40b5a95bc74b9a7f662830a27c49ffc01b4"
 
 S = "${WORKDIR}/git"
 
-- 
2.24.1


