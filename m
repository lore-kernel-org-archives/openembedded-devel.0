Return-Path: <tom.rini@gmail.com>
Received: from mail-yw1-f53.google.com (mail-yw1-f53.google.com
	[209.85.161.53])
	by mail.openembedded.org (Postfix) with ESMTP id D0BE86D50C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 May 2019 23:57:50 +0000 (UTC)
Received: by mail-yw1-f53.google.com with SMTP id a130so4271481ywe.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 May 2019 16:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AfFFAfzF4qIRspD7p0pF45Ph5QxTTdXD1De0UKOzwfI=;
	b=emdIaOeh5AjBuhIEmOHWaaQSufAGF4EqdN6B+39DCJ9UxFhhZrYhIYF0tr/dHfXePi
	OvhBLfixwSF6UJxc2qd96GD1cSajPlmXLfAhO6spsEyZiYVzeIhZchkijndwsCabOL9a
	znsvDMevY6wTOytSkfpMHWVYYTI8OFHAsiuCf3FRneZn7ul4rXeaL6RjxN9DGNr/SDYu
	0Z4NDPftYBlMcnHuTqGnhVFvvuJIFhMXoLqfk/wksHMDxvzxqtgprXXiWzCFi1S3bgYP
	Yqx7/R2Bj6+6pxQNAZfLLfgqNAoSpyU35nA60F0jlL815AXq+T8I8fCrA9FiFSzxRIJC
	+nEQ==
X-Gm-Message-State: APjAAAVKaJ/BV0Kt9g6xAbSquMo5ceCDRr4uhH8vEF43zZtMCTNztKmt
	F9SkR7zmwjD/ZmY+Pdo+Zswqwwk=
X-Google-Smtp-Source: APXvYqwSgpwn6mJT64hs9lH+L/iCyja7SxTEk5kAPb36gU9ipcG95c8b+e8qxa5e+GpR01ybbo5Eng==
X-Received: by 2002:a81:4c05:: with SMTP id z5mr30668534ywa.413.1558223871479; 
	Sat, 18 May 2019 16:57:51 -0700 (PDT)
Received: from bill-the-cat.local (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	y196sm3724036ywg.40.2019.05.18.16.57.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 May 2019 16:57:50 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 May 2019 19:57:46 -0400
Message-Id: <1558223866-20797-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] toybox: Re-order inherit location so we can override do_configure
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
X-List-Received-Date: Sat, 18 May 2019 23:57:51 -0000

We need to override the do_configure function to disable some applets.
Move our inherit line to where they should be, stylistically, so that
our function overrides the one from cml1.bbclass

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta-oe/recipes-core/toybox/toybox_0.7.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.7.5.bb b/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
index 614136e27f50..069f0471c088 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
@@ -5,6 +5,8 @@ DEPENDS = "attr virtual/crypt"
 LICENSE = "BSD-0-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
 
+inherit cml1 update-alternatives
+
 SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
            file://OE-path-changes.patch \
            "
@@ -48,8 +50,6 @@ do_install() {
     install -m 0644 ${B}/toybox.links ${D}${sysconfdir}
 }
 
-inherit cml1 update-alternatives
-
 # If you've chosen to install toybox you probably want it to take precedence
 # over busybox where possible but not over other packages
 ALTERNATIVE_PRIORITY = "60"
-- 
2.7.4


