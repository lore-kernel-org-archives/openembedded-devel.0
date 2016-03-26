Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 97C2F6FEFA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:08 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id c67so8514777qgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=9APvBOqkQr+AiPe78isJUbirUenpO4yaiF7ykCODl2U=;
	b=gQfYiljWNRFhtrUbNuYqpbnAlWDAelIXmtNhrgKqkFsmVDKRe7kQdMC2/2LRdI0mzV
	vwhc+F0+w6SzqwaahM+uIKS8ZtG/gtqfFWjWOM60iEelV9nTexvTV0dZKwXIXIn2Mm8M
	lpVRDv37hRgXEH76X4y3y15TxmP3SM/QQif4M3YIH2Sn6I2bCzMNHiyI09zOTWWKWCrv
	mQVzxZFuRYPsFU19L9UOvWSTU1lsHnYeRRU90WTPg5FFrOMMmwG72j6NQ7qBPJ2HlPZs
	fve5znNyQWHyPWHW3t2/yuEC4WyupyLS8CCOFhKNmZ+/8VBpOybOps4b9DDRac8dXOFd
	kH1w==
X-Gm-Message-State: AD7BkJLSr3kIGjRmZtUPanT3uaHt5ZfnqphgB/f/fBZ5zMu9HzkAcIUeT93MOoyKXKC9tQ==
X-Received: by 10.140.99.69 with SMTP id p63mr23105596qge.97.1458997509696;
	Sat, 26 Mar 2016 06:05:09 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:09 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:21 -0400
Message-Id: <c1b25d31c800e11b2866f44b0970a8cb68dd896e.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 01/30] python-dateutil: update to 2.5.1
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-dateutil.inc               | 4 ++--
 .../python/{python-dateutil_2.4.2.bb => python-dateutil_2.5.1.bb}     | 0
 .../python/{python3-dateutil_2.4.2.bb => python3-dateutil_2.5.1.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dateutil_2.4.2.bb => python-dateutil_2.5.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-dateutil_2.4.2.bb => python3-dateutil_2.5.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index 9200afd..0a95d81 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -5,8 +5,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51430b33c900f45f999c459ee29ca493"
 PR = "r0"
 
-SRC_URI[md5sum] = "4ef68e1c485b09e9f034e10473e5add2"
-SRC_URI[sha256sum] = "3e95445c1db500a344079a47b171c45ef18f57d188dffdb0e4165c71bea8eb3d"
+SRC_URI[md5sum] = "2769f13c596427558136b34977a95269"
+SRC_URI[sha256sum] = "40d1bc468c7df50aff9e7a12c14687f9180efcff86900ee2963f9f2c13b5d7a9"
 
 PYPI_PACKAGE = "python-dateutil"
 inherit pypi 
diff --git a/meta-python/recipes-devtools/python/python-dateutil_2.4.2.bb b/meta-python/recipes-devtools/python/python-dateutil_2.5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-dateutil_2.4.2.bb
rename to meta-python/recipes-devtools/python/python-dateutil_2.5.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.4.2.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-dateutil_2.4.2.bb
rename to meta-python/recipes-devtools/python/python3-dateutil_2.5.1.bb
-- 
1.9.1


