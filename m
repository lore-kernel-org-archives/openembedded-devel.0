Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9996271B56
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 09:28:52 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n189so6573673qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 02:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=V5e6i0CIxY2mNrPZ7e6NjEwxhyANpBYxS/H/O0yLjg0=;
	b=hLVe5cz3fgI9GM3ysAA7Sc0ulfyX1xY+wS1yXx63Mv1SCIevqgVv/Gwods2qaXIJzr
	+JkIh02ScPRyyIjqRtpD115spkNIYGNNuMBg40inSc+oU4lSfZz8sOlAlgL9XcDrSpew
	2amhv+0CdClSgHQPjbTReDh2uMaeFUiBr+qt0kxmONXbPw/ld24ZJGN+ah6cZW1+0MXv
	O1KMpuOla9TY8Ylyoqujue+iTUf27stg2Gm/po8dP6FJzgxyoecknH7SjopJ4V6DOQz6
	yR1ZdWfxt5UqjJnVKYJYm7yuWW2r8BJ7zqCbdC/Hw5/WO0Lq/wxunJVh4zvGiaH9JQEz
	eLng==
X-Gm-Message-State: ABUngveK+mm+c5pz7mwv8kIwnK6c0jz0hZGeCdaUPGJ9wSKf5V/UUzv4iUcOD49F7UoRNQ==
X-Received: by 10.194.102.67 with SMTP id fm3mr3140876wjb.80.1477042133316;
	Fri, 21 Oct 2016 02:28:53 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	x127sm3176457wmd.21.2016.10.21.02.28.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Oct 2016 02:28:52 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2016 10:28:51 +0100
Message-Id: <20161021092851.27635-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH] c-ares: fix metadata
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
X-List-Received-Date: Fri, 21 Oct 2016 09:28:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We should set SUMMARY instead of DESCRIPTION.

Signed-off-by: André Draszik <git@andred.net>
---
 meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
index da8e096..4e28d6a 100644
--- a/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
@@ -1,6 +1,6 @@
 # Copyright (c) 2012-2014 LG Electronics, Inc.
 
-DESCRIPTION = "c-ares is a C library that resolves names asynchronously."
+SUMMARY = "c-ares is a C library that resolves names asynchronously."
 HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
 SECTION = "libs"
 LICENSE = "MIT"
-- 
2.9.3


