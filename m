Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id D5E006067D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:14 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id e124so6290715qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=3f0qq5WRPvcw1V637YvI8m5Bt6085HRxe+R+HSVenBU=;
	b=kbcTUgV5LJ08CmXSvzAZpl2T4lAkTvEzelP9Q8pOpjdhSBv4vodZsyPK+UJtj30NaD
	14iYCrVE/fIPY4Ka7OAA6CNUqSXCceoe8usZU+39klU5kJechzYWYxf6nveAZdulxs6F
	HFlhFEDLneXaHt2Bm6B57IZO5g1GsRY2nk8iuCUa6gdh8NpwvO/NjdO6YC//4XeCviz8
	WJxMDs8T8gLjO5nsYALTowqHkJyrhGqQkW6hlimyJ95CeGzZEUbzHxkbJNN/BaH1dEuL
	2RkgQFDVSSPYkri/b6yP5i4G2ddF0FlThqBYTrT1mOSr5LiNHTuGc1BNZVYrNUH1hepp
	t1Mg==
X-Gm-Message-State: AD7BkJIlvL58pKVf1qTVlX2gqHvGUWpoClnihjZJ6hT9iYkHMEGb70o6BFp6TIO34WbWzg==
X-Received: by 10.55.192.14 with SMTP id o14mr3042515qki.31.1458997515549;
	Sat, 26 Mar 2016 06:05:15 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:15 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:31 -0400
Message-Id: <c2ec94735fd6cd2e453c5888d5621e65dac43a4e.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 11/30] python-evdev: update to 0.6.0
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:16 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-evdev_0.5.0.bb => python-evdev_0.6.0.bb}        | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-evdev_0.5.0.bb => python-evdev_0.6.0.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python-evdev_0.5.0.bb b/meta-python/recipes-devtools/python/python-evdev_0.6.0.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python-evdev_0.5.0.bb
rename to meta-python/recipes-devtools/python/python-evdev_0.6.0.bb
index 2435b45..e555552 100644
--- a/meta-python/recipes-devtools/python/python-evdev_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python-evdev_0.6.0.bb
@@ -2,10 +2,11 @@ SUMMARY = "Python evdev lib"
 HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2b500cb3c70f576a0a75125beda9491a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
 
 SRC_URI = "https://github.com/gvalkov/python-evdev/archive/v${PV}.zip"
-SRC_URI[md5sum] = "30c11ee7bd4a943f8ae586d839b860f2"
-SRC_URI[sha256sum] = "ce6a757e28b56a12a9ad4e86420db4b11918b75ba1cd70f7444e904a7284b6fe"
+
+SRC_URI[md5sum] = "24e4ffa98e338b535eae44d91d609005"
+SRC_URI[sha256sum] = "61f6893d80da87a995e5781c74d22a39448b1b32004ffac2f31817017709be04"
 
 inherit setuptools
-- 
1.9.1


