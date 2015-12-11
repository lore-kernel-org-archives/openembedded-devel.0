Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 77E8A60722
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 16:58:30 +0000 (UTC)
Received: by wmec201 with SMTP id c201so78673333wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 08:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=RGY2joo0AzA98L4YdQERAZWVThOuDNVYdUqEnWZG11Y=;
	b=AFwqrwpAdtUUDfWqZqYMbYC8kg6oj4Tl4ih1vAulz51lleSFL3IsWjEwEH4hgQ8woa
	rsbNYJDFfbbaPaAGaGJjGTLW/oGaEDo0Hnmym4Z8ynuCx6Qqx++CPYEJQZ4AVs483eX3
	iLSzw0zE1CESsI12yQItPd+dWYsl4HKGMlWCPwHsc0mIUQrsOjkwXV2+IhO+LGZ/3mA/
	rDwrG7iAymNPyIBQrZCzwOU4JC1oHjV0FfnRiODB7c3yGSia3ULPancLMnpgeWJDzf3s
	blkf7RjvT/w1YDLHpR/sCjEeif68KR0ZovnTIbWGoydQbifJOXML6yhUCxf0mxh7LVke
	LQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=RGY2joo0AzA98L4YdQERAZWVThOuDNVYdUqEnWZG11Y=;
	b=QtVFB9PS1sPeZoTNxF20oLcl40I2724nQCrdmsD0Fw/0crJpzHRYPqXGzsU2zwvJc6
	y3tu7zkpxaj6+x+5wYEcPmQvAXwahFJPlKXJQRm3TaIO3cJ0hxWlHUPKxi44xkgWs6ek
	K2I6tH5eSAaoCEi3NixBwGIM7wBn1XcK4kgONSSRLbIFOGi4Ak2az+ef9YPJz7I2+dQ5
	e02xrwcOsQnWRb8LWlY7gyiXxcwFOCOIBzfo3vBMbiwX6KR4tC0M4Avx1QS2ugdI/qpL
	OeQFfVEXegSHjPtlzogCxNmSxK5WkEBNZf3uic2Km/+qV57YC596A1KFT34Bw+cR7gjF
	9w+w==
X-Gm-Message-State: ALoCoQmFNNOZBYmWmPN6prJS6Z5n6Pl/ZWhLDIYQmhxMA9ndQ9yvCTfTNLFgL0mzoSF46lcPfXODDr8nQWIjoAkZfoq1Z4Mbqg==
X-Received: by 10.194.133.5 with SMTP id oy5mr23719227wjb.32.1449853111001;
	Fri, 11 Dec 2015 08:58:31 -0800 (PST)
Received: from oe-builder-2.your-server.de
	(static.174.44.251.148.clients.your-server.de. [148.251.44.174])
	by smtp.gmail.com with ESMTPSA id
	ql10sm17782326wjc.23.2015.12.11.08.58.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Dec 2015 08:58:30 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Dec 2015 16:57:24 +0000
Message-Id: <1449853045-7196-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-browser][PATCH 1/2] firefox: Update to version 38.4.0esr
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
X-List-Received-Date: Fri, 11 Dec 2015 16:58:32 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../firefox/{firefox_38.2.1esr.bb => firefox_38.4.0esr.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-mozilla/firefox/{firefox_38.2.1esr.bb => firefox_38.4.0esr.bb} (96%)

diff --git a/recipes-mozilla/firefox/firefox_38.2.1esr.bb b/recipes-mozilla/firefox/firefox_38.4.0esr.bb
similarity index 96%
rename from recipes-mozilla/firefox/firefox_38.2.1esr.bb
rename to recipes-mozilla/firefox/firefox_38.4.0esr.bb
index 4065031..ade98c2 100644
--- a/recipes-mozilla/firefox/firefox_38.2.1esr.bb
+++ b/recipes-mozilla/firefox/firefox_38.4.0esr.bb
@@ -50,12 +50,12 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
            file://debian-hacks/Revert-Bump-search-engine-max-icon-size-to-35kB.patch \
            "
 
-SRC_URI[archive.md5sum] = "3b9e4d1bf0dc9b502042e973c91d1a08"
-SRC_URI[archive.sha256sum] = "0143b3f99ccb390949d7f3847215f6f9b4bb7cd692f4f802921d2f9961bf270a"
+SRC_URI[archive.md5sum] = "73fff277dfc9abab4de3a3b708b28f65"
+SRC_URI[archive.sha256sum] = "028a1f7ce16b3016b0d98e5a5ef73bcb3f732b80d406e54f49e3c246e207f2c7"
 
 S = "${WORKDIR}/mozilla-esr38"
 # MOZ_APP_BASE_VERSION should be incremented after a release
-MOZ_APP_BASE_VERSION = "38.2"
+MOZ_APP_BASE_VERSION = "38.4"
 
 inherit mozilla
 
-- 
2.1.4


