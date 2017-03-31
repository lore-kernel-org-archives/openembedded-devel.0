Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 407D977E57
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:22 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 81so18581483pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XiW1uMKPMaIKDqk2hzsx37OGoZscPx8gyg0AescP5Ho=;
	b=Hoa07ehLDxJqcJW6f//b3dhec3OHWLZlFDRl9d5vjUZMOQfP87Wvt4EQbZU8kUGt/3
	e1lP6NJeTDF+8lEgR5E6LH8xf+Up4HtoOd8ywL/iYNkDiTR5587CsaqM6pyfIfwHOSE4
	iLoKHsBQYdC7y4gshElNv3BrV13r10wy1tzb4uNSQ3fX71kkc8zPheQjESUatZQ8wNtl
	NexXnDXRwNC5YznliDv7EVp4KoAq+3A80v53jP1jdkNDNVJoV/BIbDwpYhmPjkRG5aQk
	hDhR52j9ngL+Q1IUqQYQWR7knA7kce6t3+5DmYX5W3k0bR80uySqhR4Pd0grURiFgQOH
	S/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XiW1uMKPMaIKDqk2hzsx37OGoZscPx8gyg0AescP5Ho=;
	b=MoMLRSTg0Js08s3u+0CywSjeiXpcXMiCtC/LHCWmEq0jovWD2olkgQz2WIl51zHhKD
	6wAtkUlCdREnnJ2b4B7owYLE+135ECMEY0VHWfZrSqINeBFh7reB5sB+HINjvPo4muM/
	L9fcZVBi7OLQ+LhWOxlN+Rbk3N6CntfwublxxSOQ/Vg+gSSFYooqd8wRnTQSjyYh75nv
	rDcZv5tBoM0PJZjvfVndyXPA9TKS3qA2pbyzCLVE5gtQkSogrVWSfq5DjiKYZ5YRLQ9Q
	qpFihILJU5SbFb9BEK8eqioSQkT3LL/0bOaQiVvebWxOtRE5RSgxfGJpnOxew2M4dNsM
	Cusg==
X-Gm-Message-State: AFeK/H37piOq5EQN3qQaVq24kCg0ug5wpZ8RvvoXXsJj6cJE1oXl5bzEbu6I4iyw+CrMQA==
X-Received: by 10.98.138.76 with SMTP id y73mr3610133pfd.118.1490978603894;
	Fri, 31 Mar 2017 09:43:23 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:24 -0700
Message-Id: <20170331164247.5052-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 20/43] libdc1394: Update to 2.2.5+
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:22 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
index c298b440d..8318385b6 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c848e78d9a4a5cc69906178e4d6fbd64"
 # libsdl to provide sdl.m4 with AM_PATH_SDL
 DEPENDS += "libusb1 libraw1394 libsdl"
 
-PV = "2.2.4+gitr${SRCPV}"
+PV = "2.2.5+gitr${SRCPV}"
 
-SRCREV = "9ac63fe7a7561bea83bfd4a5db47d4d74fde43a6"
+SRCREV = "5e78f51936fd09db0c0f742c7d2c0e5bdbbeed56"
 
 SRC_URI = "git://git.code.sf.net/p/libdc1394/code;branch=master;protocol=git \
            file://install_examples.patch \
-- 
2.12.1


