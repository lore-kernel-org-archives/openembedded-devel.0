Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id A7FDA60079
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 12:28:29 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g12so3343180wrg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 05:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RNzMsgQhJU4CnJLsxnXm5PV+g2ZG0WjOqepIJVzMimM=;
	b=Sjdrb8o87v9X1YLq1k7VTbhsxznVcos3DjTpIKjuyeYhSLEskXNMc30WExFSr7nZTi
	ncE1ncoO8f2iljJBPaR6DBLOiKkI3hHOhe3L9ypk9Sr3R6rMSJZ2AZzW/D0NQG+wd0e/
	0A+gr1TB7PQtIslzRcxRkZk0n1GpA07m8BD5HKUzIJaqbzDm0ncjCx88a09Mt7DNUi0J
	i1KCAeUAQX1oJGE5QfG0b6mXEa6zxQq/CoOR8E7Bhi1Mwk07BUlu02bIaNAl/4j9EGeW
	dflibIbjIgp9fhjhmhC9AROFm+iLrJiR1qDLjsSELlbs5zBRLezBKLmltJQjLbXKPDAW
	9cBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RNzMsgQhJU4CnJLsxnXm5PV+g2ZG0WjOqepIJVzMimM=;
	b=sPlddbP5vufukKyqsRUmgQ6lc5/ZfQsz1Gn0VmDxkicBPsZ7MA3etIMJCAUGwWmUr/
	P8dEmJJ8LXqrpZRKNR0sCnm0PO0pqnnL2QQtObNOpYLrTEgTIe7WR0/rPNLfwmxuLWGQ
	tuswDb77F9gLEJeZsYN6vKnJ8Jbp1Qza4MY/kwow+99SthWP0JmW15NxD70TyCDeY21B
	Ou4rDIoqIHtGTotTkoQzQqyIYOuJCLIoTKcYihL9SAtcfqBFFbtaPwCouXQ3gb8GWZ13
	+LMpqTxIuITyqYy/f3+KyesB/gp5s1JUXhESCV1xvu8+7QV0H7MO9SRYQrKEevdWeB5D
	Qylw==
X-Gm-Message-State: AODbwcA3PJAvRsziMkDBt/IDdnHOFgoSBLn9dMGy8l6cHBUUJXPzkAG4
	vqmllXxUPpM6OGz6ysA=
X-Received: by 10.223.128.34 with SMTP id 31mr54700wrk.108.1494505710187;
	Thu, 11 May 2017 05:28:30 -0700 (PDT)
Received: from localhost.localdomain ([151.68.54.167])
	by smtp.gmail.com with ESMTPSA id t26sm28347wra.43.2017.05.11.05.28.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 May 2017 05:28:28 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 May 2017 14:28:12 +0200
Message-Id: <1494505694-28118-2-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494505694-28118-1-git-send-email-costamagnagianfranco@yahoo.it>
References: <1494505694-28118-1-git-send-email-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: [PATCH 2/3] libndp: switch to github uri. libndp.org is unstable
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
X-List-Received-Date: Thu, 11 May 2017 12:28:30 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
---
 meta-oe/recipes-connectivity/libndp/libndp_1.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
index e06ff7f..b65f64f 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
@@ -3,10 +3,10 @@ SUMMARY = "Library for IPv6 Neighbor Discovery Protocol"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://github.com/jpirko/libndp/archive/v${PV}.tar.gz \
            file://0001-include-sys-select.h-for-fd_-definitions.patch \
            "
-SRC_URI[md5sum] = "1e54d26bcb4a4110bc3f90c5dd04f1a7"
-SRC_URI[sha256sum] = "0c7dfa84e013bd5e569ef2c6292a6f72cfaf14f4ff77a77425e52edc33ffac0e"
+SRC_URI[md5sum] = "de58352aaee0e8edb744f1aef852cdce"
+SRC_URI[sha256sum] = "565d6c4167f83ec697c762ea002f23e8f0b00828d0749b1ce928f068543e5aad"
 
 inherit autotools
-- 
2.7.4


