Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7304778872
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 01:51:03 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id g2-v6so3404494pgs.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 18:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j5xxetKAQy8+UncvsM3uMQ76qQjWz1vBqDtaYKsZGHk=;
	b=LjSJk4sjDA3iIHpLUN1PTJ1n1B3XZgHC5kZLPP9azFpGqzPYAybgkg44RpQsHz+JYf
	iD8rP+d2D1Jn0V9hbZyue+ZYLeDH7hDsBULqP3gMDEw8D6VlWjN64e9VHickCxiQ39vX
	mrreE0WpPATUOw9vbsiirG7SjRV+jTA0qNliGwj56drnr/u6z472yRm5ZbZwKUawblhY
	JFX/834Nt/7RUYXigYOCJZOdV9BHl7+KwZVhmSdUUJuoiM5siFrlXPrpZm7ENxYXZVeK
	BYrOA5TlXA5MXdxOxMFpZ7ngOEsUu1nOmYl5ayksCgXPHW7crsM4Bjuf9bsQJlGgq+cz
	cP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j5xxetKAQy8+UncvsM3uMQ76qQjWz1vBqDtaYKsZGHk=;
	b=j0zWXRWc8nTUQxec3ovL5Ro008SDdoNNg+oht7kBPtZuimq/O6proRmxMsfE7+TrPF
	00abcInDlZFmCgN+LX/pxe7czNfklHVqtmGRKovZBkO7fZlNY7RpI/pz/b3xc2AYblFn
	LA0ULYMXhCNYsZRHrc6cieP9YcdRj5SLbSV3YxzJuflY3FHySHpIsxTD1ZeO0X5TvSpU
	tj/p/QsT/jTmJ/EYjmn1siRE5YmJrK4tQQLEsLM4hcOXmntL3OUdBaTwEWA4mwFfqKtW
	y/FSTWL58+/p6vvHfV6ivGawcV6pI84V3XfCPwYTipucXqqUmA4mWpBx3PB+RTeEsNGB
	t18A==
X-Gm-Message-State: AOUpUlFNI/1sgGSjyHmCbHE74vszPr7WzM//OaUGj8y7Bg1jg//pWzzt
	V3L7Y9KGHAoxXU3WBUw+pVXbxw==
X-Google-Smtp-Source: AAOMgpcYqNRPf+8BXAo45WYhH5nd2wy0mcp0yEJ9uK787OMNh/ZhV5CDRjCJ9zvpGvi6ZL3Hh5Z7aw==
X-Received: by 2002:a65:5b08:: with SMTP id
	y8-v6mr17109334pgq.297.1531792264135; 
	Mon, 16 Jul 2018 18:51:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1736])
	by smtp.gmail.com with ESMTPSA id
	66-v6sm27878586pfd.71.2018.07.16.18.51.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 18:51:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2018 18:50:51 -0700
Message-Id: <20180717015053.8191-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180717015053.8191-1-raj.khem@gmail.com>
References: <20180717015053.8191-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/4] mbedtls: Upgrade to 2.11.0
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
X-List-Received-Date: Tue, 17 Jul 2018 01:51:03 -0000

- Use libs section, libdevel is not common

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mbedtls/{mbedtls_2.9.0.bb => mbedtls_2.11.0.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.9.0.bb => mbedtls_2.11.0.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.9.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.11.0.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.9.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.11.0.bb
index ee4f164a4b..71b1f80238 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.9.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.11.0.bb
@@ -20,12 +20,12 @@ HOMEPAGE = "https://tls.mbed.org/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=302d50a6369f5f22efdb674db908167a"
 
-SECTION = "libdevel"
+SECTION = "libs"
 
 SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
 
-SRC_URI[md5sum] = "31dcf56cb92da5d7ec2dbb7a3cc5dff3"
-SRC_URI[sha256sum] = "a06a9b43e583b7e6707becfeeb13d88ed00f25fee31a5386cb3a3014c454bad8"
+SRC_URI[md5sum] = "3b133b9b4cf0ccf3ac1c91436771bfa5"
+SRC_URI[sha256sum] = "2a87061ad770e6d019b3b9cd27ea42a58bd0affccc4c6bfe4f5f0eee9ebf8aa8"
 
 inherit cmake
 
-- 
2.18.0


