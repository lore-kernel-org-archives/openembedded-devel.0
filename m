Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0FEA478778
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 13:19:36 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b141so3473871wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 05:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MoILLBGe8x1Y1zjd7WyHaqHbsmimkwBeqGnBc1KgAz8=;
	b=S01YVeM4fu1IViJ402ex6ObXihFtpY4S7j7WxoFrEMVbIg9IcCkngNowoSVTJUhKuS
	lbmNiPHaAGXUdWS+SuoYk0GWDJX73M8fo3Zkj1PAZhRzLdM0tnPPM77PaX21Dgr3NMlC
	ERnszE1AZS1GTEw2ga/UAEWhsUHWdCrogAIui8esgtWiB0pxp3M5fk3jWa5LOIdavUqw
	C0/ftsscrMNfkriya+RBowNRaZH/ATlRYFl/Z3SGk2Ub0pmPModl8WQViU5L+TCVGT0W
	IeZC9PtPELGqUmpg8ZklAotNl1JTGwwT4ghqU9YuAWwDXuwIuoXBrQ5m6sWzX+cIZTv6
	L2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MoILLBGe8x1Y1zjd7WyHaqHbsmimkwBeqGnBc1KgAz8=;
	b=uYg6lgd4FFXgCYC/tzgQx+xBnZ6RPbQTc0Tb7FoVJGKesCSyC7Tw2dO34Gu58F6TA5
	ouBFaaF8L23OqgH7uKf0ensDdGJyhLET+ZbHCAOHwOLHFN1tQWIlb1lOyBzITpZL++Dq
	YrPljoqTiUtguSzd0RHCQ+CYKjF0qCR9imjN4buHYJsgw2G8X57rBpVFiSb5DCV8x79f
	00/O3Z/PY0079m8Tk8mRrmSDHnp8vlYFWYL76V1lS9jDbzn4dVB28Y3ryibf034qrTco
	IY6bjUF5ksveSLp2lbwrCV0VO9sLXbBw7UphLPeVx2YfJ1AvDhQr4BRaZ7vvuwEodgBM
	P/Vw==
X-Gm-Message-State: AKGB3mLoEZ35cZErQ9L7hSPOC+S1w2hzn0IS7LA0lzLFe1n8rO4HBQH+
	UbuVcML1y2UqcGWSx0HTQUbG4A==
X-Google-Smtp-Source: ACJfBotfOMhMH4YtWcall/lly/sfmcIq5juKMZdXzCknxlel2tZ84tF7ZEqF9nwQvhiMznmmD+pJ8g==
X-Received: by 10.80.164.27 with SMTP id u27mr7179866edb.11.1515071977771;
	Thu, 04 Jan 2018 05:19:37 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	m23sm2107083edc.27.2018.01.04.05.19.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jan 2018 05:19:37 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jan 2018 14:19:07 +0100
Message-Id: <1515071950-15401-5-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515071950-15401-1-git-send-email-liu.ming50@gmail.com>
References: <1515071950-15401-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java][PATCH 4/7] commons-codec: extend native bbclass
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
X-List-Received-Date: Thu, 04 Jan 2018 13:19:37 -0000

From: Ming Liu <liu.ming50@gmail.com>

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-core/jakarta-commons/commons-codec_1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/jakarta-commons/commons-codec_1.3.bb b/recipes-core/jakarta-commons/commons-codec_1.3.bb
index 0377168..fa74f6c 100644
--- a/recipes-core/jakarta-commons/commons-codec_1.3.bb
+++ b/recipes-core/jakarta-commons/commons-codec_1.3.bb
@@ -11,3 +11,5 @@ S = "${WORKDIR}/${BP}"
 
 SRC_URI[md5sum] = "af3c3acf618de6108d65fcdc92b492e1"
 SRC_URI[sha256sum] = "12effcf3fea025bd34edbfec60a6216ca453fb27e781d8e5783caf75fd33d90e"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


