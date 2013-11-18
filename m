Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1425D6A463
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 14:55:30 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u57so5817964wes.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 06:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pojIdJR4tyezBkVc0+3DO615wxKv3RsMMmhvzz4Sy9Y=;
	b=ImTujQqFq4sack6nJjEjalo/C8Zv5qrcMzxb/TOmjl9wCOqqV2tj9oTH3fTW9dgP+o
	N3ZnfXBPpM6H2BYHPIUnYUFOW2SamXl20UnFBwBIQjTtBNatEGzeKjS2Zz46f9PoDrnC
	4Pa3B0f8SyIniP3/XRaMAsEOPuoteo2GjnvhLknR3gSyjDz7lx9LQXxaHhR5dUKsPmuP
	aYSXlIsJOl8BWdycszoCZ7E1O0T6HU5BquCtUNRihgGEC/1ZyIUtczhQA5DKKOwBey/9
	R0BqxPnAQxjtOiB3OaLCoHbOXuFrQStGjE4zSg9S/blVeIBQT4sjKLb7M09v7BnF7ONi
	es6A==
X-Gm-Message-State: ALoCoQno+CghnrHQqfHAPB+3KoLxO6fsfESpvcBeHnziIxxcSEM16ILKapHQISLxEUNxwNk6grXF
X-Received: by 10.180.104.129 with SMTP id ge1mr17077578wib.6.1384786532327;
	Mon, 18 Nov 2013 06:55:32 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gg20sm24890546wic.1.2013.11.18.06.55.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 06:55:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2013 14:55:27 +0000
Message-Id: <1384786527-7569-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] python-numpy: add native support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2013 14:55:31 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
index e6d328f..d18a79e 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
@@ -72,3 +72,7 @@ RDEPENDS_${PN} = "python-unittest \
                   python-subprocess \
                   python-compression \
 "
+
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.10.4


