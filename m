Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id E4FFB6BB2D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 18:14:13 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id x10so7524276wrs.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 10:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=sR1SpQHnlO6UMM8tKqVFw2lizex7bkpvl83Y5iDVBaw=;
	b=pSrld7d3lKsRvcyb8ehL1tIH/Q6Hy2Lv4bqZ215Bh9/Vb2mwy4MI936FU5/u5teL6M
	fRxlPed5oaX+Xl7LmtbAVnGThQquhJwNGJNM+Hzn3gn5UWd1dh7vHo9W+vujCli4wWAL
	1WjIuZmOIA+6BWi72RF0T1qd7xvFRZHtqvb97+BPDZJEju5M/uSiZudHYcu1D0UlcKna
	86uNWB+OeyNpHFbh6mVZ49SUfakJrPcmaHnLY24miKysHzH80CJ+Jqbhzrpyp1eHM/9M
	lN4AYB8gMsRq/TFm5zOeog30DK+4RWwRbfMAyG0CaXbbtGRDxXGH+UrwRnt/Q59MGvbl
	RkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sR1SpQHnlO6UMM8tKqVFw2lizex7bkpvl83Y5iDVBaw=;
	b=sUB+p49pTEY9oOtHmgGnEseobvl+dblBNHJKZS09+P2HIqVZe77qw95zcam9Ftc5bC
	5vhpV2RNgKEum3TGrP6B1owde5EYMP9Xc+G+h+6e7JDu62jLSw1ro/C8Bs572q/Wfv3V
	BV9xQBq8uO+IYenhEh+uWd5OGwOzRrZMu4D/BtehI1+5B0n9U6Wp0TS8VTv2ceRGbR6Q
	3eZGOIUe6Zw2S0Z0+M3l7TYzARTZJAku9r0hwcFvOyFrykre70Q5REZI3YDPxFHvlyyq
	RvIpP39OyHo5ZvV8aZITL5p4QYEpkN1gQIgjy6ve37P/7rIU5tc954cQnxFalsdt9Y1C
	B/xw==
X-Gm-Message-State: AJcUukdpXoTkdtz8JIy3uW7gB/GPLm8VV5P9ilnWtVn6yPhZJdE0heub
	OVXs+LSCCBRYe+BecSi10fKNh1ab
X-Google-Smtp-Source: ALg8bN7NV39XAnJvHkUYmQe0t00q++TbGWr7Jw206mJO4x2w025b2mS2RMP4GlOJuizbEjl9ab3sow==
X-Received: by 2002:adf:c888:: with SMTP id k8mr8673045wrh.6.1548353654259;
	Thu, 24 Jan 2019 10:14:14 -0800 (PST)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	c10sm100318274wrw.49.2019.01.24.10.14.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Jan 2019 10:14:13 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jan 2019 19:13:55 +0100
Message-Id: <20190124181355.4609-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190124181355.4609-1-schnitzeltony@gmail.com>
References: <20190124181355.4609-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] xfce4-battery-plugin: upgrade 1.1.1 -> 1.1.2
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
X-List-Received-Date: Thu, 24 Jan 2019 18:14:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-battery-plugin_1.1.1.bb => xfce4-battery-plugin_1.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/battery/{xfce4-battery-plugin_1.1.1.bb => xfce4-battery-plugin_1.1.2.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.1.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.2.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.1.bb
rename to meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.2.bb
index af7c65aa0..5de1ce5e0 100644
--- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.1.bb
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.2.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "26941c579ebf4143b7e49aa08ee9b30a"
-SRC_URI[sha256sum] = "1e94969b93e0c1d6da87364b64c0cdfb40bae5e4a055039be8b67b9e5b3dd44b"
+SRC_URI[md5sum] = "ba1cfe619046373f9af5b903c77d1858"
+SRC_URI[sha256sum] = "d601349fa9a979dae99ace39b24d99b97f62b80f42ac5dea5a99e5af3e88d7db"
-- 
2.20.1


