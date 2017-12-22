Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id A9E97788DF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 14:51:11 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id bi12so13016185plb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 06:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=a6CsFZ2RFZuxYzNcBklAbpPYz4kJy44sUDviTJk1+Gw=;
	b=iV2PuZdibkbM8i4O7T6mH21tMHRcFWC7BRjBZf7HWQuOrMEu6E+O4qtRCScJoIp57l
	DcznpgYRsUTjse6clG4lTR5ypbAioSk53tKTLGdd8OODNlkcvCkDPmovQTY9NNQFQB7c
	lNkL3DT8BUJayey/dt4IutLo0oeddGjB8E1GvO+9+kiVeyChw2BE6BAdH/QPU8O/CAUV
	VCITtRZQV6YQxEfL59aOI8L7fCNSu5Bp3vAaUWkMVy4iGGwZfp4FRowuDpDz8esM/Ax3
	64op/Jr/RTGS9VmPyM9McoLnkT4HPB9pPFlrzc5hL+hFY5YpEyL0+oKNm2WzjIG29qIR
	PMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=a6CsFZ2RFZuxYzNcBklAbpPYz4kJy44sUDviTJk1+Gw=;
	b=lTi1JA1iB7IyTMEOKNnI/OS16oBNQs/Q6QX2FkGU6QfClzTkhKM062tq8e6CGmt4Kp
	3IjDVTCqBAP4ZII33/1+sjAMj0/qJP+SAQSM51DQNhuF0/BGKOi449ZGMn7Wb+jVxECz
	7jA40JeKloadSAT05tDhBSrff7+Oz9RzyXWhY/6Da2ENnv4YoMK+40UcKjDidRgtPXC9
	hYEs2Ws9GcZ6hDdJyCsommy30wj6uRs9IP3vkgfvZxegs5GtDwy6JlYIQO4mLYuRxtI7
	PA78gaRFJfnQ8JjjrjRnsL752nt5Hb3BMGQOYewJRAZ4WRijxrbr1uKf6WxYUXWEgV0+
	TkgA==
X-Gm-Message-State: AKGB3mJUjMcq5glEeElqUtQR5W/CLSZsniCmP26ChWJwecJ+eIg+sI6v
	jF06Kg+L3UUeub0Mydm0LgjCZA==
X-Google-Smtp-Source: ACJfBovLVMzIa3m0Xxl7c8YRfXrNODzQNKMwYwNLVDrEZeWm8UX5uHLL/KAGSxr0JJelUHGFmQGA9Q==
X-Received: by 10.159.242.196 with SMTP id x4mr14645591plw.342.1513954272487; 
	Fri, 22 Dec 2017 06:51:12 -0800 (PST)
Received: from ip-172-31-1-64.ap-northeast-2.compute.internal
	(ec2-13-124-121-69.ap-northeast-2.compute.amazonaws.com.
	[13.124.121.69]) by smtp.gmail.com with ESMTPSA id
	k9sm36504249pgo.53.2017.12.22.06.51.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Dec 2017 06:51:11 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Dec 2017 14:51:06 +0000
Message-Id: <1513954266-110130-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-multimedia][PATCH] rygel: Add lms PACKAGECONFIG item
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
X-List-Received-Date: Fri, 22 Dec 2017 14:51:11 -0000

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
index d2eda6b..e94c9ff 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
@@ -30,6 +30,7 @@ PACKAGECONFIG[ruih] = "--enable-ruih-plugin,--disable-ruih-plugin"
 PACKAGECONFIG[media-export] = "--enable-media-export-plugin,--disable-media-export-plugin"
 PACKAGECONFIG[gst-launch] = "--enable-gst-launch-plugin,--disable-gst-launch-plugin"
 PACKAGECONFIG[gtk+3] = ",--without-ui,gtk+3"
+PACKAGECONFIG[lms] = "--enable-lms-plugin,--disable-lms-plugin"
 
 LIBV = "2.6"
 
-- 
2.7.4


