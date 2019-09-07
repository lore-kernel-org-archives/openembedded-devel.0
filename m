Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id EC03D7F4A8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 18:44:09 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id x127so6639036pfb.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Sep 2019 11:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kS7sqo+83COCO6eBlIuSFZ6HYVJOodz7puVmLrnjbJA=;
	b=HKgUy2l8ps3VVtL5gdj8wzKlGYXHiDpwPFUIn+yaOY5uGCXgiqJTqj3RBDJiD+Wau1
	EVk6hwWeAQkqrbrK8wod4w1nXvNpiCemFMDaLQ1F7M1UoxNhlzBoyzYJom+429NZBsqw
	CcdWVFlp0PJXHgNHwUlScgu9qxgDNTNw+s9iova5xhEVzTqy8PuyAXxxEOpVaO7WyTgS
	Lxcj5B8dpzQd5e7Kx4YbE4NE7qjVo1DSupQ/N5pMlZMYse9W+Fvgxd9x4lxQf81+o+tM
	HsAZ4ZD+fbwPQ3g9QUX4aVHXWVpr7AOiX7mvxL6b9vZBxHsDye3jVu2riKb4lPYXlE2U
	D07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kS7sqo+83COCO6eBlIuSFZ6HYVJOodz7puVmLrnjbJA=;
	b=ZJvupQgObk/MDcDsonepp/yWEQcKep6Ydoywmnh6MKUHlk1qi9pFTvJxz7rbrkq8dE
	waP0CB0VZp+bwdsF3zHdcB8vNse7uOV6jdAjN5J4jfzpDYIpsBlS8w5YXrNiOtimT7IM
	VtNkMoEvqwqeKtzglRbDRfTWlFJPoimQYaTB4f9l2SFHkXA5j7rkUbbZaYiCUKdFScAS
	wg5hTaQTd4+Y1bggpBM2cC9G7AnR2KAuVDnc3ZraiTFfU85fyrSSeI6oCkK2a2JuUP6/
	DEGdTiU0Ii5Mv0HgTPNLNGy4q+ObEj6dfG5U+Ra4aKQrdQVnmaPvDs+0nwl43b3HUmeH
	Li9g==
X-Gm-Message-State: APjAAAV61yXpUwjPvYVk9FsIklVBbGRJUR8KDwfXjYP18rxP/O8gPClX
	ydrhBJZ2CDaEf74SOixqzEw/k+su7Do=
X-Google-Smtp-Source: APXvYqwq7QDFhiWflRAOh+Xdk83/pZNthuhhlzt5rBOanT+KIk7fsTkJIe8wKeZ4RJZTByAlaPS7BA==
X-Received: by 2002:a62:f80a:: with SMTP id d10mr17906752pfh.98.1567881850379; 
	Sat, 07 Sep 2019 11:44:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	64sm12469699pfx.31.2019.09.07.11.44.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 11:44:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Sep 2019 11:44:03 -0700
Message-Id: <20190907184403.9365-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] vboxguestdrivers: Add to blacklist
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
X-List-Received-Date: Sat, 07 Sep 2019 18:44:10 -0000
Content-Transfer-Encoding: 8bit

It has been failing for a long time, there is no point of keeping it
alive by default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../vboxguestdrivers/vboxguestdrivers_5.2.22.bb                | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
index e394f34c76..0f8d7af3fa 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
@@ -78,3 +78,6 @@ FILES_${PN} = "${base_sbindir}"
 
 # autoload if installed
 KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
+
+PNBLACKLIST[vboxguestdrivers] = "Needs forward porting to kernel 5.2+"
+
-- 
2.23.0


