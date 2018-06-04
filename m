Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7E9B77472A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:49:03 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id a12-v6so1622468pfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cEbiB715PYcyHtX5az1bJJTv+pDG+PhhVGRst9jE+O8=;
	b=aV7j4D8R3rzX9K2hjC7mqa+bkiKrmiWkmPS5jNk1+jSh2HfdsgS+VHgb70lCdkW4kW
	t9Jhfh82bM7T2SpbJiOJvbOrTKXGt8MqiAdfnh+wt4SE5e7/f2CsPvfamnm6IqIhHhT7
	DHlZuJDwGtC2pTOp/GqC0OrdVN/uLaI5YPr9tvZFrPsFg4CwdHLUk6GRUXEBpdexzFFp
	tmD5RhbEDMSw8gFWwiQ0jQo3XsouBJGQYPBUht6g1gX5bkDPCclZhteop77opp3Ky68p
	PlnevH0BKw4RfQufUp4lbjEU+7PAEVKVIowXlG6dkXeM3bLWHxHP8dRhKFXLI4wSyrm8
	JCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cEbiB715PYcyHtX5az1bJJTv+pDG+PhhVGRst9jE+O8=;
	b=YlqbkB5cwFTF5o2WQ80kZXpIMGqLx/CRVIBUduZq8/uHH+kKmiHaoOiuFyEbRVcQ0Q
	5KIjHh+5vYNQHycm6Ip+sU2bCTOB5fDurTs3v+wgSSKLadA16Nre5SSrjydURLz0JUdU
	emID5JXgEOdyQtE/Co0srbji36mVw7qLd32dNlasAC/clWD204T0/+cgVvXyAQ5Ku3Jf
	4i3tDFF+EhEA6SCWqFAApXGDVcryx3dXDzvjx6I2XCpTwOGA80x4U1B1Qu6yIF0ISHZa
	syRRzYrfK7P3AO3SeOCwJMsWxVzyMYFUp79Y1q6FxvmJccFhnxu/Z67oxBcQ7+E8U+Ur
	PrOQ==
X-Gm-Message-State: ALKqPwf7ZVvOow2rZNAOYdmmBmP7HutLY3iv1S2rBcp5/rYiHJW1mec+
	sJcyauDPTAQpecOQqKWRjrc=
X-Google-Smtp-Source: ADUXVKJd3doke7ZzuQhcfuWAD8QB/Tm1E+8LBZ/DqVllgeMcCbp7QhKn/kkd+naHedqiqLbuC2rhJA==
X-Received: by 2002:a63:b305:: with SMTP id
	i5-v6mr12511559pgf.370.1528080544752; 
	Sun, 03 Jun 2018 19:49:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm62844021pgc.80.2018.06.03.19.49.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:49:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:48:43 -0700
Message-Id: <dd6339447729b5919a0b7a54db6ffb7a3fd78e97.1528080420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528080420.git.akuster808@gmail.com>
References: <cover.1528080420.git.akuster808@gmail.com>
Subject: [morty 09/15] wireshark: Upgrade to 2.2.7
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
X-List-Received-Date: Mon, 04 Jun 2018 02:49:03 -0000

From: "fan.xin" <fan.xin@jp.fujitsu.com>

Upgrade wireshark from 2.2.6 to 2.2.7

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.6.bb => wireshark_2.2.7.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.6.bb => wireshark_2.2.7.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.6.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.7.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.7.bb
index a0b6b8f..2f6f7b0 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.7.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "2cd9a35c2df8c32668c1776784f074df"
-SRC_URI[sha256sum] = "f627d51eda85f5ae5f5c8c9fc1f6539ffc2a270dd7500dc7f67490a8534ca849"
+SRC_URI[md5sum] = "a4d880554c7f925dafef60fa313b580d"
+SRC_URI[sha256sum] = "689ddf62221b152779d8846ab5b2063cc7fd41ec1a9f04eefab09b5d5486dbb5"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


