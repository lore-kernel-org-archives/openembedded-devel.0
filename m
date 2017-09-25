Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2F4F8782A3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 22:41:38 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id b1so5952072qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 15:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NU1NKxH46ZJGk1m0CI2hsp3u3vmaXVYT1g3p8woxg5Q=;
	b=ZqK8oC80mQ5w19CsbsrEyjvT9NkTR1P1A2XTYi+eW084SIrR5PhVr6DS8shVIz4sEc
	5T9/Hv4erlOA5kdInRZb0VVzYRB1mxVAzeJ9xoLYT+H8Bh7Q6vB9MfrDxVjPSZKl9ywt
	TwvV13PjCQ4Fmjzhq2sdvrLJUqGsjrjpPac59nFy08/A4CrVehaNh9IHTgBgtsw1Yur5
	oHBdbFOcyNSIipjObNeCtbgON3p4YFjFHZyHzZ+lYFS+NEZ6OFZhCuKSczzqigO6dCl8
	7tRyigOfaeSFuEFgMpplUZ/e820sd8VnhcO3NbGOYm1aCr1MuEYUyoXK5NKgQ2VHUWRQ
	Gmng==
X-Gm-Message-State: AHPjjUjAfaFESFOoCEIik41Yy6jdGbeLO2RFnj3KTweVWGnx/cMr7UfK
	MWSeWTlLTa7ZnBBFBCWfY3L/hJLW
X-Google-Smtp-Source: AOwi7QCt9gopGHgEy5z3LnbhEPB/S1OkWZfuhRTVaRDSZsn1vEhK7M+r+BEmLas6y97o6zJi/q7LpQ==
X-Received: by 10.200.15.8 with SMTP id e8mr14106597qtk.315.1506379299941;
	Mon, 25 Sep 2017 15:41:39 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	y77sm5698347qka.87.2017.09.25.15.41.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Sep 2017 15:41:39 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Sep 2017 18:41:32 -0400
Message-Id: <1506379292-14431-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-zopeinterface: update to version 4.4.3
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
X-List-Received-Date: Mon, 25 Sep 2017 22:41:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-zopeinterface.inc          | 4 ++--
 .../{python-zopeinterface_4.4.2.bb => python-zopeinterface_4.4.3.bb}  | 0
 ...{python3-zopeinterface_4.4.2.bb => python3-zopeinterface_4.4.3.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-zopeinterface_4.4.2.bb => python-zopeinterface_4.4.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_4.4.2.bb => python3-zopeinterface_4.4.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-zopeinterface.inc b/meta-python/recipes-devtools/python/python-zopeinterface.inc
index 8cc613b..4b38aea 100644
--- a/meta-python/recipes-devtools/python/python-zopeinterface.inc
+++ b/meta-python/recipes-devtools/python/python-zopeinterface.inc
@@ -2,8 +2,8 @@ SUMMARY = "Interface definitions for Zope products"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
 
-SRC_URI[md5sum] = "d69131352ef06753388c3da09cd8c8aa"
-SRC_URI[sha256sum] = "4e59e427200201f69ef82956ddf9e527891becf5b7cde8ec3ce39e1d0e262eb0"
+SRC_URI[md5sum] = "8700a4f527c1203b34b10c2b4e7a6912"
+SRC_URI[sha256sum] = "d6d26d5dfbfd60c65152938fcb82f949e8dada37c041f72916fef6621ba5c5ce"
 
 PYPI_PACKAGE = "zope.interface"
 
diff --git a/meta-python/recipes-devtools/python/python-zopeinterface_4.4.2.bb b/meta-python/recipes-devtools/python/python-zopeinterface_4.4.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-zopeinterface_4.4.2.bb
rename to meta-python/recipes-devtools/python/python-zopeinterface_4.4.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_4.4.2.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_4.4.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_4.4.2.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_4.4.3.bb
-- 
2.7.4


