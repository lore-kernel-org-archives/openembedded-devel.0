Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF1D7F4BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:32:07 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id q21so1676396pfn.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Zji+J9vJITNvVlUfHCgJjfU0U6xp3/v+U7eJr+EZnhc=;
	b=qaTiKP8WvG5bzOHGdGft++vss5GYLoS1+8T64xrMbr6Mac7UhqbHonxkll2oOPCHK0
	p79/HuobWpUAm5vZOlkdag0ylH3/PbrgwN0pes1ZTzgncizF7qI1Xd4oSTOu757G29zN
	WERM02f915OJ4jNSG2toJwmarqv5nF5oFP5yDPuReVpmAjDBQTKBxU//6sUbrYEi8cig
	f36qQ5beTKDGy3VbAkryjoASSNh1yf8kHQcQHBdVWeR1f8JtxDUolreLzR9BV0b5LY68
	g8wRq2tKr3DsEFAwAZikkPd0rZVe8905VOOqQ/3qFMaR0waD+bSzTbPiflFli9lQ0vOf
	6sLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Zji+J9vJITNvVlUfHCgJjfU0U6xp3/v+U7eJr+EZnhc=;
	b=SA9boZB5NRQY1mZR69PP0XzRzTw+E320hAWNGpgBMk8fIQzl3do/6wg5MxijacIbRT
	UYGGN5KbF0pXMG7FGzc2ENp+5nGwTdE3lV11LlSMaonho1N1Ms1KpLtpVbLKfl9zX7cR
	ZyY2S3Bw4dglwhs3tcDIHB7dc5YnppE8cs8UtDaeFsloAl8wkYDIZ7Pa/3P1/dJWtZ6u
	+qq99OpxUlJkQB5jg8udXYMMF8VddLfu80StKTArqFFsYVU7nifWA1+0DzCbReaO2WSj
	iG51xnIkqFFR4ZeMm55NP1JaunShCXXeYreE/2tzrOz7h/0HP6Y15cvAr+PYothpNyNU
	33Kw==
X-Gm-Message-State: APjAAAV2zeNxtqPBWweJ5DVTGG79P/F2CdJ4QKuSKUy/W6iNAoN0SQgn
	K/zDmMT43Zf4jgVRJeGqhQandnSs
X-Google-Smtp-Source: APXvYqyC1+EXQiYFYxMKpJTEyulKMcaiizZP+4mpTU6K1luPZPtPHnI7yFvGUoycUIXuC1kxN7ta4Q==
X-Received: by 2002:aa7:9393:: with SMTP id t19mr25327553pfe.12.1567287128516; 
	Sat, 31 Aug 2019 14:32:08 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.32.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:32:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:44 -0700
Message-Id: <e1c2c90558c20378f727e8b962cf538e5003ad09.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 23/23] apache2: upgrade 2.4.39 -> 2.4.41
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
X-List-Received-Date: Sat, 31 Aug 2019 21:32:07 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Security fixes:
  CVE-2019-10081
  CVE-2019-9517
  CVE-2019-10098
  CVE-2019-10092
  CVE-2019-10097
  CVE-2019-10082

See: http://www.apache.org/dist/httpd/CHANGES_2.4.41

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-httpd/apache2/{apache2_2.4.39.bb => apache2_2.4.41.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.39.bb => apache2_2.4.41.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
index 4cdf36c..be9c864 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
@@ -25,8 +25,8 @@ SRC_URI_append_class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d52d0fd0bc788f068e647116c01ddfcd"
-SRC_URI[md5sum] = "930e217ba2d71e708a3f1521ecae7ec0"
-SRC_URI[sha256sum] = "b4ca9d05773aa59b54d66cd8f4744b945289f084d3be17d7981d1783a5decfa2"
+SRC_URI[md5sum] = "dfc674f8f454e3bc2d4ccd73ad3b5f1e"
+SRC_URI[sha256sum] = "133d48298fe5315ae9366a0ec66282fa4040efa5d566174481077ade7d18ea40"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.7.4


