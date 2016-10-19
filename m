Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id B4A7C719A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:38:45 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 128so1429373pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BqrKdU5V9f8dfdsTbfuYx2Wsq1Topjn4xe1foaMxqM4=;
	b=buzcdZn02p02OtRtpDHG94ETgBoADNpk4NVBCHhTr7vZjQIg1/TYYBKwlduHs4QwTJ
	a6Dy9zvoILWVjGnHNTtTYtz8PtCG5CghPqJvYvqoYaVDm38+YLPQj60bhbNVtP1hKqga
	1CttymrRJPfFmlogdrGSO714meeiGyU3VoHU+g+E8vdhfJsJS2mFGU5K2DM0PkjFCu9f
	05LENCq60mDuGsVOh8B7+R/K/LzKhoLGRPLJeq4rEE4EIvjv6gppHI90bq4Q8XSBRFPa
	ibPeBB5B4vZwHDTTO6VQrK176Ftgc0QpGYO13M8IBI8QWRtJ9MjozArVNBMfRMfxsN3/
	bivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BqrKdU5V9f8dfdsTbfuYx2Wsq1Topjn4xe1foaMxqM4=;
	b=KM/eE1vUD6pNVVaVF2F5WSa+RxMyvZUmIeFT9Dt7O3p4WRYWqq5T0gKaV5Ghs9SPKv
	8DZsJywMy7+YvLb6MbnkhJjfRdJ02GBN6FdnG+EX7dZziUh5JZTcRDeWNPI0d7fnm6dP
	P6cLhOCX1I2YpAeka+tis0IhpS2eX1h2E23job7ed9dJVbWG/RayMRhTC9jr8eh3CwnM
	y4EZWJniEmj/JsO653ui2vJgJzw5PeoYaMgeGYIPIvIW3VkGVbZD//bw84aBLN30uLlk
	Yz4UgQbdAZPVqJWTHXfxsyVEBdPwRycKMgvzehIOrNyiG2QQJ6fQxBPN3ymABK6YIoY3
	f93A==
X-Gm-Message-State: AA6/9RkIAPxtkaB+dyvVgzwjIMfgJUdzplyDKGpKkF0cebQAKOXlg4P0J/MIRP9U0Exarg==
X-Received: by 10.98.204.67 with SMTP id a64mr7754083pfg.120.1476855527510;
	Tue, 18 Oct 2016 22:38:47 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qd12sm60099564pab.22.2016.10.18.22.38.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 22:38:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 22:38:25 -0700
Message-Id: <20161019053834.11523-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 07/16] libdc1394: Upgrade to 2.2.4
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
X-List-Received-Date: Wed, 19 Oct 2016 05:38:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
index 0ea5cb9..c298b44 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c848e78d9a4a5cc69906178e4d6fbd64"
 # libsdl to provide sdl.m4 with AM_PATH_SDL
 DEPENDS += "libusb1 libraw1394 libsdl"
 
-PV = "2.2.1+gitr${SRCPV}"
+PV = "2.2.4+gitr${SRCPV}"
 
-SRCREV = "b90342933b4b48634b98b73805f47bd25ed5857e"
+SRCREV = "9ac63fe7a7561bea83bfd4a5db47d4d74fde43a6"
 
 SRC_URI = "git://git.code.sf.net/p/libdc1394/code;branch=master;protocol=git \
            file://install_examples.patch \
-- 
2.10.0


