Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 38FC773167
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:24 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id 14so8508239qgg.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=3eIhYnr9y/rb9qQlPugO87dEhWKcRPpI+PSBhHb57iI=;
	b=jASmOUb4lLEiRS3O8lIJlg/oiP8EBQ468xZ/3btVsg4UNFHQXIYp8jzGWXrXCSgaId
	GLu+s14idqTeGfwkW1WCejzP0vBnK+XQG29MT4PK6BLPauKwQv8ej5Tn+TS1i6HWLIg/
	KFDhoDKGrqj8XFhNA6QJ9vWE1paqeerd8y2swnRBqhmKpxj+aybcYtnhE9rOOGC9DZsx
	IZQGlghUA2GwNj+QmTF/bEINMlfaKKRrUOn2QE/avIdJDd339K99nQTA01adbvracgTC
	ogRM9Rzf5VFrEszqe36QW+kWuW8Ve740Qj0JyJTh+ZNvy0fffKFYVFikFgzm6NJBrhX1
	bquw==
X-Gm-Message-State: AD7BkJKXUhlEUbZzN1WugD5/Kx6rAaagpTm+kYGvszcnVYCM/lvYEaws9PqDfGLfJpQ4+w==
X-Received: by 10.140.254.9 with SMTP id z9mr24684188qhc.5.1458997525057;
	Sat, 26 Mar 2016 06:05:25 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:47 -0400
Message-Id: <019b8a9c4aafb5b15f3c35963eec21533c95c672.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 27/30] python-pyudev: update to 0.19.0
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pyudev_0.16.1.bb => python-pyudev_0.19.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyudev_0.16.1.bb => python-pyudev_0.19.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb b/meta-python/recipes-devtools/python/python-pyudev_0.19.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
rename to meta-python/recipes-devtools/python/python-pyudev_0.19.0.bb
index 1ec9944..aa26dc7 100644
--- a/meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
+++ b/meta-python/recipes-devtools/python/python-pyudev_0.19.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "A libudev binding"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[md5sum] = "4034de584b6d9efcbfc590a047c63285"
-SRC_URI[sha256sum] = "765d1c14bd9bd031f64e2612225621984cb2bbb8cbc0c03538bcc4c735ff1c95"
+SRC_URI[md5sum] = "1151e9d05baf6ce7b43e7574dc0ef154"
+SRC_URI[sha256sum] = "5abcbd03e4965110d1fedcbdd5532974cb4638ceef34337aa2d5758eceb54ad3"
 
 inherit pypi setuptools
 
-- 
1.9.1


