Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 42DCC77FC9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 21:44:05 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id l15so4255122qtn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 14:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=H7vPzz3Av0Cx6V/vV8tp3BBxoulzXWf+QJQEXmmF0Hg=;
	b=twqZin0WWb3IPRtFoMsQZfKH1nk1nDmSa0kWnqiE/UEuT69sos03BvAMZqCjUluDiv
	+09offv6azBYU/omzs3zQFyarzzbDj6yvkeAe5mysywSP9ZCd84TRxw1lXMg6qFdDrUW
	62vMZ6pEh6VvnTKGc1pNj0D4GkoNHkNaq3npI/NiTes27v+e0lfBHGPAs4y7ewGyyY+H
	aGndQvWXKRMNH3jssYynLBUEy0C2QIeIUmbwDKdpt52/C+rLMhrv7bravB0Vb9fqbmIh
	JxMMEB8YT7A/dpuU1gQFTvTl8nu9O0KVSskCdg69VkRGagmum4y/u76Uk9N/FoQfDIgT
	LPTA==
X-Gm-Message-State: AElRT7Gs55DDWhuowlM6TsrcPZpvcCtXOcH5LCxmMfYARw8SBHVwuKdi
	o+roslJoezFT3ysaiYUMX08+4Azx
X-Google-Smtp-Source: AG47ELs9022rYPKrOl4JyjGCXb9DWyxSRAYYC26jM6z5eaZBGBIE7ZkGtosaFF2vZ7MggXqr5oFnYA==
X-Received: by 10.200.25.157 with SMTP id u29mr5483795qtj.221.1520804646980;
	Sun, 11 Mar 2018 14:44:06 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	x30sm4037872qtm.13.2018.03.11.14.44.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Mar 2018 14:44:06 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2018 17:44:00 -0400
Message-Id: <1520804640-29798-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] monkey: add a valid upstream check uri and regex
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
X-List-Received-Date: Sun, 11 Mar 2018 21:44:06 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
index 97dc276..559d251 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
@@ -17,6 +17,9 @@ SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
 SRC_URI[md5sum] = "9699e4c9ea6ce6b989907c252ae80254"
 SRC_URI[sha256sum] = "7c3d845306aa74ee6effd7ab6169d16ac4e6450e564954d0d0baa2d1e9be1a22"
 
+UPSTREAM_CHECK_URI = "https://github.com/monkey/monkey/releases"
+UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+).tar.gz"
+
 EXTRA_OECONF = "--plugdir=${libdir}/monkey/ \
                 --logdir=${localstatedir}/log/monkey/ \
                 --pidfile=${localstatedir}/run/monkey.pid \
-- 
2.7.4


