Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5151974561
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 04:22:09 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id p124-v6so1545688iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 21:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=20YUObxd2sd19Obths8ZApGseU2Q9rma860HDlAvUzw=;
	b=cgrrxIOI+bHqgfJjVapsfFWoSez9IgTvVrN54iMaYuBtJYlWlR6vYG4Mhz9zfmjnw+
	th87s1O8rX9yJRXkgAs8+p85XgmWDctI1G/BnXDPBw6A5vKHanLksj0UMuhnvTHri+ao
	ZS2KOwui4YnC+xqhzP5w3dEl3dLZMDEuQJduPPs+CKwYDJE4Y0UUYmpG1JUKMKt5NWvy
	xcKZaOqckdM4zT0z7ZOA4PTEq5HIPYqJWne2eCxK8PZutM3fsmcVly0WUBZvt3zvomV6
	0uqL8sOnv/eJoRVSgOBgYSHzfuUsZnXtEjDsOSfzKobXE5VcxG9qqtPE4yVv+6vHdCRa
	Ic6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=20YUObxd2sd19Obths8ZApGseU2Q9rma860HDlAvUzw=;
	b=k8zb6wpO1631NPsMxKZvIS0qDMz8NckeCWrAKLcZEdodSZw9ZW2ZuhyPMjOJUjQ9zH
	YrkbruskPMxQu80NLitovGFL5lnAt8KhQECIuDnRF1+emnjHTQf66DX8G8wsymhhEmZs
	rlkq4NEKO42E4O48JEzCEO0YG9QDAt2XSVBErCyIO+g07MVUKeGW58bT/+Cd9hqF2GOG
	+RudVL9KdCleVsPgb3FL3/8qy8SIffrh5tMkAVw5YvTX3yvuJ8wGQTTCmNcSeoYOn7Dw
	9JNQFd3LtW6PLIVYFCO+RkUwySFjXt13LAYqQbNlyquNjFg6/p5I5bLiNNetR5TGueo2
	v46Q==
X-Gm-Message-State: ALQs6tDRrmOHntHQ5CCLRsJt0stKqBkab15LxFjvqhyvsfm8lMT9+N6K
	XgQ91WzbA1ltKwYPJK7O7r2KuRM4
X-Google-Smtp-Source: AB8JxZomTxkDSglzTKFYjCWpLxfr6M9qqF3ljypiK/iii14LfTxz2sFRNP5xUmUi9Hz1w4CyOoH2Qw==
X-Received: by 2002:a6b:bd4:: with SMTP id 81-v6mr51216138iol.25.1525926130888;
	Wed, 09 May 2018 21:22:10 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	c80-v6sm69586itd.7.2018.05.09.21.22.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 21:22:09 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 May 2018 00:22:05 -0400
Message-Id: <20180510042205.28212-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
In-Reply-To: <20180510042205.28212-1-twoerner@gmail.com>
References: <20180510042205.28212-1-twoerner@gmail.com>
Subject: [meta-networking][PATCH 2/2] geoip-perl: update 1.50 -> 1.51
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
X-List-Received-Date: Thu, 10 May 2018 04:22:10 -0000

NOTE: the license checksum changed because the copyright year was changed from
"2016" to "2002 - 2017". There are no other changes to the LICENSE otherwise.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../geoip/{geoip-perl_1.50.bb => geoip-perl_1.51.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/geoip/{geoip-perl_1.50.bb => geoip-perl_1.51.bb} (87%)

diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
similarity index 87%
rename from meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
rename to meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
index 95147bdad2..ed5c3a9799 100644
--- a/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
@@ -7,10 +7,10 @@ DESCRIPTION = "perl library for country/city/organization to IP address or hostn
 HOMEPAGE = "http://www.maxmind.com/app/ip-location"
 SECTION = "libdevel"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b7a36f55e8ba62aadd74e4f0886a405e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e4f3ea6e9b28af88dc0321190a1f8250"
 
 S = "${WORKDIR}/git"
-SRCREV = "47f7d49bd15cfc2e5f8c0f5c4068dc8bb0e10e96"
+SRCREV = "4cdfdc38eca237c19c22a8b90490446ce6d970fa"
 SRC_URI = "git://github.com/maxmind/geoip-api-perl.git;protocol=https; \
     file://run-ptest \
 "
-- 
2.17.0.rc2.3.gc2a499e6c


