Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f41.google.com (mail-pl0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id D280674E86
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:49:01 +0000 (UTC)
Received: by mail-pl0-f41.google.com with SMTP id z9-v6so15405107plk.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=T6yFahAabcgjL/RVtnOZQDwNn6qxiOvVncLhrW+6meU=;
	b=kD5qIa1Ig9a0iuICLxIw+1ksnnDbDpmb0m/7scSr03juvKorzlkGEsriK/p3DP8NR0
	Lz05Div4qP2BbXxcAjaTzCYDFJ6Rv8oGkvXBARTJLDDsQ74p6JW0FPde02Txhx09Wyeu
	fYzDIAsWFfYg8N8Q9R1ArLlZ4AgPzRn8+dfq/l5tMjNcQmqY2S0JlejArnofBie5yspi
	+umnXEBZ5fu9tg6k1w6vR/b/OtXW46cuS8uo7soxtItNm9qAHxGvBUXq9z7QUf9IAS9g
	ER/0D6w3xXu+ffkfhkhly0dSf4NA7CuEo0xl2oqzYDNV4firZFtf/IXjBTQsUpxkrnR3
	414A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=T6yFahAabcgjL/RVtnOZQDwNn6qxiOvVncLhrW+6meU=;
	b=mK4gymScjg5nbQiGN67L8jLMn/r+yDDrsEc4yu4v5FO1ZSO08b3tzbFA1deB/QRLxr
	D/z5BR6ILuVhktLq05K2J1GfScKoZkrXWqTIhNW/hb4z+bAAvoPk/zpSUwGT6flsvY1s
	nY7rbybUn2+APdiJQJg15eDT8KNJUbJFbGXpXJlhMpS0UlO6/Kj3Tqtw+l6rUucDp7lm
	oi03QvrtgiXLB9tYNd6Vb67zfH4FrKjoDgIBkC14MauWwSIk5qhgK6mrqVL7ZWZMj8CN
	yc+UIfzci8zDrsAP9dUZ69KHVpSEK5/+l6wiasoL1uOIkY7paoD8Cg19iLcQahLVMhh7
	41vg==
X-Gm-Message-State: ALKqPwcSpvxFaAN9Xi4dTPM2U90N2Yp7PjaeOwz4E7M53tD2MIiOw7t2
	h5d8WFTlubmxW9X+Zluho0kg5w==
X-Google-Smtp-Source: ADUXVKIr32uf5oONeK+GwLBRciuDx2TYT5RDaZ1SrB3GteRtibPb7nqv3khte+c70jAdCOyd7W1TFQ==
X-Received: by 2002:a17:902:3001:: with SMTP id
	u1-v6mr20061181plb.376.1528080543139; 
	Sun, 03 Jun 2018 19:49:03 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm62844021pgc.80.2018.06.03.19.49.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:49:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:48:41 -0700
Message-Id: <8869e7cf7c517b8e8ec1ee0a8b1b603d7362c7b1.1528080420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528080420.git.akuster808@gmail.com>
References: <cover.1528080420.git.akuster808@gmail.com>
Subject: [morty 07/15] wireshark: update to 2.2.5
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
X-List-Received-Date: Mon, 04 Jun 2018 02:49:02 -0000

From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.4.bb => wireshark_2.2.5.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.4.bb => wireshark_2.2.5.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
index 29dfbfe..03ae3b9 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "6d0878ba931ea379f6e675d4cba6536b"
-SRC_URI[sha256sum] = "42a7fb35eed5a32478153e24601a284bb50148b7ba919c3e8452652f4c2a3911"
+SRC_URI[md5sum] = "749e7ca7606ae7df5c1ca8c62f93ff31"
+SRC_URI[sha256sum] = "75dd88d3d6336559e5b0b72077d8a772a988197d571f00029986225fef609ac8"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


