Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id B4CD47883A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 17:53:10 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id z10so18370907qti.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 09:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gZOn2r89V7hgkxVQ8MQ9KFb0X33TrCgveLsnw56Cpjw=;
	b=ulbS/Fcu7j68SuMhJDMZPeTQmzDESG5WZucIC+s6hetfikIVFZaLgfH1G+KdbS7WYV
	xWO0RUkGjuCB5p70LWz6pAP1Xkq54nc3I+LAHX/ZuHoSxi1MnbJimPHqERhAFdJOq+W5
	puKrUWFB4T5+JtO78wtBNOZ4iLFWk+Xl7jUyPXDDR66AfKj1bfGJE61teQwsC61Dd+tD
	Dk+0p+Xk3DO0eQ6Cwojkfx1Qvo4K7svT6kiXnDLqhBDSqvoR3TS9F/pLOOgJaqAm/LzK
	22DneU2E5yOstZrWKtjEoI17GTTaRIIYHs7S3ykwpU6j6+ewC70nTybYlOoUYzXUvqs3
	tX7w==
X-Gm-Message-State: AKwxytfYvuNBkexyGinR18VWO43JPXsSzs0tJ9WfQIb33aAYKq0jk3rG
	slKaooRifGEvOyToNh1UH3Crc2Mz
X-Google-Smtp-Source: AH8x2247i7/5ofA9OBaHqT3BhCa0xO5tbL/PL0hLUzw/EvGybZQi8HmEo5ecZTQL8X6YKfYtRrfNqQ==
X-Received: by 10.237.42.165 with SMTP id t34mr44517624qtd.60.1517334791384;
	Tue, 30 Jan 2018 09:53:11 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	d16sm9830965qkj.47.2018.01.30.09.53.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Jan 2018 09:53:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jan 2018 12:52:58 -0500
Message-Id: <1517334778-30445-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517334778-30445-1-git-send-email-derek@asterius.io>
References: <1517334778-30445-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-grpcio-tools: update to version 1.8.4
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
X-List-Received-Date: Tue, 30 Jan 2018 17:53:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-grpcio-tools_1.8.3.bb => python-grpcio-tools_1.8.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-grpcio-tools_1.8.3.bb => python-grpcio-tools_1.8.4.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools_1.8.3.bb b/meta-python/recipes-devtools/python/python-grpcio-tools_1.8.4.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python-grpcio-tools_1.8.3.bb
rename to meta-python/recipes-devtools/python/python-grpcio-tools_1.8.4.bb
index 85bb000..45e0cc1 100644
--- a/meta-python/recipes-devtools/python/python-grpcio-tools_1.8.3.bb
+++ b/meta-python/recipes-devtools/python/python-grpcio-tools_1.8.4.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "108e5d231074d5eeac9dd5515e0c434f"
-SRC_URI[sha256sum] = "195e5b8d4cfac2492769eb6b0f7b53fda54344a1dc7b4bbfa653889a83038219"
+SRC_URI[md5sum] = "e04e65afe60410cf178ff2698f052a7c"
+SRC_URI[sha256sum] = "edc84c09039d3a01012ccd97450abd06ee6b980710f6d9f191b50deb6774a75c"
 
 # For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native"
-- 
2.7.4


