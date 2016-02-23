Return-Path: <joe@deserted.net>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 38266772A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 00:54:57 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id g203so196870638iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=cONMByL3dyEQvijzqRNyl8rubWFXaFfYSBxQsjOL6mc=;
	b=PbyDN2+Of6Qkoeq9eU4lHvqW/OA51hDydQVKHFdHfNR95iU6q0z71nB5hC4Yh7jS/e
	r2O4C4U3b4E8N1tt11qSbP5wE6IfFd5QZihRnfvzEda6abHTECVUOwQoiQtZp/1SAC62
	XXeByw99Ey9eHXurRgZnVnmNfG9lMJGA59wSLTUZQ4XJWiHQGXBO0VED0+fpCjzZsJiZ
	bS7W2a7/YgbwLdAi0f4813D9yR5Sr4YTqbqHHfPUi/tMTUv4KvohrKxIIHfrSTzr1365
	a9bg+FlmfGOhw11GzgLWOkBPybzlmyq0wJPM4Vx4AZ0OnLlWi6ytrcmGl4X3Nw3Sv4SS
	1+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=cONMByL3dyEQvijzqRNyl8rubWFXaFfYSBxQsjOL6mc=;
	b=W9EN6ksbqDXiogsFNO/Ob8D6f9p4jdhb9EVTkYPbPWL4uikesxCZlG/FKVsm6y9NrS
	OGiGQhq7VCQJRQM8lDl70ESPB2WNqGdZLxUBcw/XBRMErH+Sg/GxpKKpscrpvMQqv7yO
	OuJCHcPddgtBfm7aXtZOvKm5ptnV0ZdzoArzwpos+UQ2UA0h6hLcw1yz9bt7gcmJRssn
	9SzjKU88LcayNgqpj3CzzTuZ+xiaRzsC4IgHLY2pyIqpajJlj+Hf6JgprMwYU7YtxFP1
	XB3hz2UBVb0iR2bE8Z3HoXkM9uj1inrrJjMoWR5FnCPdC0NI8edZbqECwqd9HJPTG8d/
	keAQ==
X-Gm-Message-State: AG10YOQ5IShOGOve/Eybg2hs0R6wkAzfZG70BLCGlz/HQRXV2MIZSxFd1wtnmVA0R61HIg==
X-Received: by 10.107.168.141 with SMTP id e13mr31850296ioj.51.1456188897975; 
	Mon, 22 Feb 2016 16:54:57 -0800 (PST)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	l91sm12570703ioi.3.2016.02.22.16.54.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 16:54:57 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 19:55:10 -0500
Message-Id: <1456188910-29029-2-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456188910-29029-1-git-send-email-joe_macdonald@mentor.com>
References: <1456188910-29029-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH] iscsitarget: blacklist
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
X-List-Received-Date: Tue, 23 Feb 2016 00:54:58 -0000

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
index b327f86..b73da51 100644
--- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
+++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
@@ -8,6 +8,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6e233eda45c807aa29aeaa6d94bc48a2"
 DEPENDS = "openssl virtual/kernel"
 
+PNBLACKLIST[iscsitarget] ?= "BROKEN: kernel/block-io.c:36:19: error: 'BIO_UPTODATE' undeclared (first use in this function)"
+
 SRC_URI = "http://ftp.heanet.ie/mirrors/ubuntu/pool/universe/i/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://use-kernel-makefile-to-get-kernel-version.patch \
            file://fix-errors-observed-with-linux-3.19-and-greater.patch \
-- 
1.9.1


