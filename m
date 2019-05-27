Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6CB7E05D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 09:53:52 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s17so16309786wru.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 02:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T2A5HmoBpjU+PFDLR9pK9tqmmxVQv3g3+nHF+otMAQo=;
	b=H+58DubgdrkuLRAB9koY0oIaWfVxJDunFhmcYQle1eFHrV9tXfHkP/HLRs6itphPe7
	QJN7CN0OV0dVxOyB2yPJJB6+KXc61shjvKXQso4ijhY/jdYDo/tBpUSDzutIqShzNAm7
	Ri5Qgaul6vH9IPp3UQxpCPBWgQOciqSCeA50h6lesJrp9NdIsR4oZVOnjdgbge+MD1aI
	FcXQfVkdxarzMHoEmqL+mrqAkpDeUMOiH55nwbPdo5RhnR1VZmL6tYs/Aoth0DBoypnl
	tTbSbqQHaIJx0PMVAESHNTZSFXSK8QW8JSbkXwBb5CeDUyArbK1kW/RmMlLP3z/u9Sy6
	AIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T2A5HmoBpjU+PFDLR9pK9tqmmxVQv3g3+nHF+otMAQo=;
	b=C8+vdjgje87Xkbc0pxX7gpyTIzgIAcTxxCT1PoU8zEtmxouJ9UO4R2lMJz+u4ZqExz
	cdpLfq+4axuUyvpmh8bH1hFFDQ2OWMaZfS/4KlA9evRJJJDzJFXpq/0UVpwnVhtd3Wa1
	CEoqsYATGyemQ8G6ULOlhi+0ngVuxqaTRxlLXRE9OagZpRBJZigPIglPFXC0UH6/9Tsk
	+FI4WWJQLwj9u4mgsSJItvDD4M6vWWqz8eEYNxkN1ULnCQsuw9WXDN6hFRjbccuAwlKe
	OWMhqj+kc7ExTJ5oMHEePwlICJdQvG0nrjkMnLBu/Wu/Nlx1APOdICGNLBGGHjjlVYO8
	KNNg==
X-Gm-Message-State: APjAAAWvwxR34cRuBJsr5p5frJtK/d8k2fPLXApWho6BK6gi+ag+408p
	+eTogFr6Es18+UoUgGgniU50yz8V
X-Google-Smtp-Source: APXvYqz/MEo4OoIDBRQgnplCS+maapGM8HfjMfNFUusCpXpKphYkcUUHVwdE8am6nwnPIe+HcjYb2A==
X-Received: by 2002:a5d:4988:: with SMTP id r8mr9530550wrq.57.1558950832761;
	Mon, 27 May 2019 02:53:52 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	n4sm12103130wrp.61.2019.05.27.02.53.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 02:53:51 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 May 2019 10:53:10 +0100
Message-Id: <20190527095310.4890-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 1/2] nginx: update to version 1.17.0
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
X-List-Received-Date: Mon, 27 May 2019 09:53:52 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
deleted file mode 100644
index 5e6dc33e9..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
-
-SRC_URI[md5sum] = "719b2e3d416f111fecc9db6625553658"
-SRC_URI[sha256sum] = "8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
new file mode 100644
index 000000000..8774a87ff
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
+
+SRC_URI[md5sum] = "56767fd62302508295b31adc48b99a59"
+SRC_URI[sha256sum] = "e21b5d06cd53e86afb94f0b3678e0abb0c0f011433471fa3d895cefa65ae0fab"
-- 
2.20.1


