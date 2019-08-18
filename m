Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id BD8FA7F291
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 22:33:41 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so6723281wrr.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kLVURqH9DwKFpez58jX9/JXsdHooxQ2RqUOHR4WKm3Y=;
	b=Kfr+wQiSN4LLA2JMmi027P/7eLDtVO39WdK6qCjVmqNAZwDtb6poopCDYrmMxMEC6P
	FmHEj8Lc0EeBZKlWv5N1wSJAO5DnsoCjIJwL1zOSkz86mlEA9wiQijx877wKOndmTl/p
	tk9XmV8FYqkOQAinp3KHE1JEqyBmlmTMyPrdV9XV/UJYfmbyEkRjdRkFhu9Cl9gfZIjD
	PLBxza7mQJ8T1weQirZAd9ZpHppusq8ivmMkXA/Y0wuJzcd1Lj2KjFDvxLlXk7L3c6j9
	1b2FiRQqJwI+9PxMV0gar0o96X/139gtD5/FxJN54NopxOHIzKnRLSv9oolQn+hGqZqU
	K86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kLVURqH9DwKFpez58jX9/JXsdHooxQ2RqUOHR4WKm3Y=;
	b=DYY1a59cE8j0y89CSgxVqCjzMo3U4tQWzy30bvjdgBydCeOnFz1I5OJnVLRu0PQien
	kZRcIouiAPhA03ZJ9p0wiAUBYv0LsnZs/vbK89qESfx9x5BzwV2s32EnQ8O1PheHzXDY
	MIxsd7TGORyymIQmrRYLcfTnwj62tMpfJC4JZ7UWMoFOrlvjThPZgcgMZDkZ1dMUtWwX
	M7Ee9QMaQFrvT+qRQzf9mR4sjRMRRdjQS9qJj4KQumTCUS7d5OIho1xEeKXBY0wRqfLl
	WMZVWpjEJIxi8kNbDTtKb3qkti68U6CtVjHKNwPZd8OAywn9o9gKCCaqXwsBUM0GaqEV
	c8JQ==
X-Gm-Message-State: APjAAAWEyqcSSYlpeUpPaPJB6R1A1kraTTs31fmkPXDpe9CUB9pJumDg
	aQk6e6Q6/52W7DtoSQr/M7LK9otk
X-Google-Smtp-Source: APXvYqx/Zwkffxfpocqa32P1eu7062H5qUiT4IT2y2CSIrpVrzTQrY7w13gJqVA4ZCWVIwEwZAQh1g==
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr24145588wrw.304.1566167622126; 
	Sun, 18 Aug 2019 15:33:42 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2D8718C84C5511B02F056F.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8718:c84c:5511:b02f:56f])
	by smtp.gmail.com with ESMTPSA id
	k124sm30390814wmk.47.2019.08.18.15.33.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 18 Aug 2019 15:33:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Mon, 19 Aug 2019 00:33:12 +0200
Message-Id: <20190818223316.19772-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190818223316.19772-1-schnitzeltony@gmail.com>
References: <20190818223316.19772-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 06/10] xfce4-systemload-plugin: upgrade 1.2.2 -> 1.2.3
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
X-List-Received-Date: Sun, 18 Aug 2019 22:33:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This release fixes possible leak, crasher in properties dialog and updates
translations.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...oad-plugin_1.2.2.bb => xfce4-systemload-plugin_1.2.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.2.2.bb => xfce4-systemload-plugin_1.2.3.bb} (53%)

diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.2.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.3.bb
similarity index 53%
rename from meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.2.bb
rename to meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.3.bb
index f9fb2cad7..88d40c495 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.2.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.3.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Panel plugin displaying current CPU load, the memory in use, the swap space and the system uptime"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-systemload-plugin"
+HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-systemload-plugin"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9acb172a93ff6c43cce2aff790a8aef8"
 
@@ -7,5 +7,5 @@ inherit xfce-panel-plugin
 
 DEPENDS += "upower"
 
-SRC_URI[md5sum] = "c7b9237ec4a421de5dac76449b4b5a78"
-SRC_URI[sha256sum] = "3c67dfeb042eaea5aca440de9c6b3ecf99be0fbaa1cf7fdf9e6528233b46c99e"
+SRC_URI[md5sum] = "5d75865be699d0b3d36a5fc17ed02d44"
+SRC_URI[sha256sum] = "052407c575203da4de2db6f4a5e997220d95ec655d393dc3875a0d5a20520775"
-- 
2.21.0


