Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id EE5A27E713
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 00:17:22 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id e5so1415624pls.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 17:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zzgoAgVqP+wTKikU4C+GtlBYmZpxZWELQylmLA5VtyU=;
	b=Tfe1vK0CGel8Y4G4A7c+7BvPeTZu1mjPnkeT2XjPqZb/e6MiB+J7CttCrrKz63CCgl
	fkEBhY1HBm1895j4LGOWdxp+0Vj+FDWTlzt14NPUjjQlxERYN87iHhpD2lfFfK8kIN3R
	t2no5CQMZeeU+xOhAUfGCovdfu9KCz67qjadkB/iNlVVDxPujfR9brNmKpBaoQkLXNAr
	E8afKdvPV2F4zkDevranLsJEKQASkeekF5TWBZeSjvI4yOaSaWhZap8RMft4n1/dUqF7
	0aONoX15P/xYcLMmcuh9t0RTo3eew5G3085Jz/O+aJd59w2tW5ipEuEgoGMF+FtruLkL
	lUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zzgoAgVqP+wTKikU4C+GtlBYmZpxZWELQylmLA5VtyU=;
	b=iepft1MHb6lmrIFolrxCL9VaTaZP7+0O6OMv+GOXnWvttVr4FfieE6pm/BF2KuJ0bz
	xVqt4tSW2iunkzlolrfTVQjcriATTIb3SlekYJqzLsOCfBkHIQ6FMQIv4SqFjQXuWXx/
	i5Ueejt29PRvmMPlRlr0zLORySNJmLCcJPU9I7Ar8uUM4AwUNIo9+v5zkZcNUPg/nhwl
	Ptb1rqz+Fxw9M3FgjTahrhRo7JNtGDOGFMFDSMLwf8hIwCQzsbdRkzpJHPHE7nOnGHEV
	7Qy/5go8ubqHq3gphZNgwzxySk1+OZjKWXvrmybvXvp8ZLvHHA20wJjB3+NVahVk7loH
	x0Jg==
X-Gm-Message-State: APjAAAUqRlVTj0m2N+sAfSSQ0GFzSyeAurSS9qQdOuyO5+kD5MK3cmBF
	aWmIDkZZQozQ11RrLJgehrcHm5bKQQo=
X-Google-Smtp-Source: APXvYqygMhmXHW9ooE21mKfgeHYfQApfq39eZKkpZIXBfnK8Z1Hj2ugvIgUM3F3CrvjYkd0Oq0U9gQ==
X-Received: by 2002:a17:902:7d90:: with SMTP id
	a16mr8100324plm.239.1568333843271; 
	Thu, 12 Sep 2019 17:17:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	c14sm28632091pfo.64.2019.09.12.17.17.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 17:17:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 17:17:15 -0700
Message-Id: <20190913001715.1882004-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH V2] mycroft: Remove alsa-oss from rdeps
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
X-List-Received-Date: Fri, 13 Sep 2019 00:17:23 -0000
Content-Transfer-Encoding: 8bit

It seems to only need pulseaudio alsa plugins and alsa-oss
does not build for musl so its marked incompatible for musl
so lets remove it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Delete alsa-oss from rdeps completely

 meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.3.bb b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.3.bb
index becd0bf790..b03a90083c 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.3.bb
+++ b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.3.bb
@@ -64,7 +64,7 @@ RDEPENDS_${PN} += "python3-pip \
                  "
 
 # Mycroft uses Alsa, PulseAudio and Flac
-RDEPENDS_${PN} += "alsa-oss alsa-utils alsa-plugins alsa-tools"
+RDEPENDS_${PN} += "alsa-utils alsa-plugins alsa-tools"
 RDEPENDS_${PN} += "pulseaudio pulseaudio-misc pulseaudio-server"
 RDEPENDS_${PN} += "flac"
 
-- 
2.23.0


