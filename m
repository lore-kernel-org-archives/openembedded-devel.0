Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1B070605BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:22:33 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id o35so1115270qtj.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 05:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=n9s4ZcL2sad2GOKsvztV7u4a97D8r34z3n1zZI9ueyA=;
	b=pACUwKu6E834m2oF/2oObZwwzQlfBSJ4YTTxqVLOtMd/vVGlnmTSyLRAj7Qr9Mc9jz
	g96X1iwNALE3Cvl/dtJSAFdtrpd432yiiMpAo7SAt6eKq1GR8Ze09yN4eBE1BcXVotOl
	3iTWb1tgoXy3HhygkuP82GtYs0KPzlpy/pmh/TNnwwj3IDcE9Esta7eiNCdgpJEBkbJD
	g57hpjrbYRk4um2LfDYagPQWJdf+zswAnU/us87ivJF0qcypQbEWZqV77j6yXhUJIpx7
	IRbgRS/OvXrNMTnyuORlmgX30Dym8zTHvAl0fzhwOnTiJcnJnDc7XAAdCmnTwA8pgoio
	qLpw==
X-Gm-Message-State: AKwxytee9fpNEpvtI+do+jYDP0PYjzDQw7iUSdkUUGL1RKX/VAlQMa6S
	C1thiMXbjlu+jMus/FseJPtTktog
X-Google-Smtp-Source: AH8x225oMyz2/N0ngHfPt8Ptyyn4/5INhAK2+818JLXrsR2ins1133Ok7nxeTGbcDJ/jk2yWmQU1EQ==
X-Received: by 10.200.3.150 with SMTP id t22mr22509753qtg.19.1516972955023;
	Fri, 26 Jan 2018 05:22:35 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	o12sm3410741qki.96.2018.01.26.05.22.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 05:22:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 08:22:21 -0500
Message-Id: <1516972941-22353-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-javaobj-py3: update to version 0.2.4
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
X-List-Received-Date: Fri, 26 Jan 2018 13:22:34 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-javaobj-py3.inc            | 4 ++--
 .../{python-javaobj-py3_0.2.3.bb => python-javaobj-py3_0.2.4.bb}      | 0
 .../{python3-javaobj-py3_0.2.3.bb => python3-javaobj-py3_0.2.4.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-javaobj-py3_0.2.3.bb => python-javaobj-py3_0.2.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-javaobj-py3_0.2.3.bb => python3-javaobj-py3_0.2.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-javaobj-py3.inc b/meta-python/recipes-devtools/python/python-javaobj-py3.inc
index 8fa3e15..a0e802c 100644
--- a/meta-python/recipes-devtools/python/python-javaobj-py3.inc
+++ b/meta-python/recipes-devtools/python/python-javaobj-py3.inc
@@ -7,8 +7,8 @@ HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://javaobj.py;beginline=21;endline=33;md5=8b504419ce78f8133b21b4d4a89ef7e9"
 
-SRC_URI[md5sum] = "1e3f02b5c4c0853d653b7b8590d9ed2b"
-SRC_URI[sha256sum] = "1dea6be0848c58013d92d8249ef6bc8688bbff7f13c78e02dbf08a449b4c0885"
+SRC_URI[md5sum] = "f669bb8099380e3dd84db3d542aa5b68"
+SRC_URI[sha256sum] = "b8b0d310fd97e1c7914d7911ee9d3f4b3d84d2a674aa95a4b0da3d8f155fc1bb"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-javaobj-py3_0.2.3.bb b/meta-python/recipes-devtools/python/python-javaobj-py3_0.2.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-javaobj-py3_0.2.3.bb
rename to meta-python/recipes-devtools/python/python-javaobj-py3_0.2.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.2.3.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.2.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-javaobj-py3_0.2.3.bb
rename to meta-python/recipes-devtools/python/python3-javaobj-py3_0.2.4.bb
-- 
2.7.4


