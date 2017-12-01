Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 16E4E786AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 11:08:25 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id z18so9697309wrb.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 03:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=D3g2mmJli1cv++dcDSaqpl8LcH/lgY93khG234ZQ+AI=;
	b=h3FQ60Ar265d/ZnEJI1xmg012UASskiX5zWESRr/Zkd7OmE8HA9e0rfDtB5YDIe6Cd
	b03kuEpYwsq18rRSbsl6TdAwov/86R3W1fyfNOWnkRGHK0+CPJWH1PHjtwzft1vUAG2p
	jn6T9Ike4WoTjbrK1M8ztPEQXNtTvuDed++LkRoZLwrUrnF+jMWQQGQQTE5ozZcCtj9t
	rtQz/jGoxZHTmAuHqFiltr6jmQ+Qv3BbulcBm++XUgnj7L/97jWitL+AgomyVcC3eZ+k
	jZHKAsDy0XzTVVSWvUWH3UXtfX/kmK+m7cvIGoHBN7Po0DLlcS+4YkbxT92OxcBViRBs
	MOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=D3g2mmJli1cv++dcDSaqpl8LcH/lgY93khG234ZQ+AI=;
	b=YZJQCsAi+vnT4GiAuBtaoKaq/RixZCZaC9FW8/G0ap1qoXiOTXNyc1gOmXRi83deIl
	kYrJ0X8AQJHtjN269TaSl+P8tDYNB+gmZ0Lnn3xH3WidffguEsM9gjhKuDcA3E0NS9ip
	y+rSR7VnS0tULBTAqx7JMCsP0QBM2GivrZhQVoSru8xCFpEfTWlzPxH+vvk3oImgNKqf
	35TAQbMO20gOjAQUjE34yZIuQpSR3jgOXIYlqj2sgYKPzVSCxCHtQ2K7L9+AiXKKQ7Bs
	MBb/JhkEmtfjN1A2NF8R7iqWuK8QK2/vojzEhGydSNSxmj9VIqQ1HKRYz410Kc08N0va
	wafg==
X-Gm-Message-State: AJaThX6t7WKRl9eEoT+gFvOHWgYyMBRfag5k7/3mQYJLTJXsouZazKUq
	liV4jR2twwd8P4jiEXgoqakCWw==
X-Google-Smtp-Source: AGs4zMZaka3VxhJ9XcB+qjXrV3vd182wJWQo0yw+ejLITkBag7mT3MvRyn12/zAbegFPogrMwDY1eQ==
X-Received: by 10.223.158.203 with SMTP id b11mr4923648wrf.82.1512126506610;
	Fri, 01 Dec 2017 03:08:26 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id
	a126sm791054wma.11.2017.12.01.03.08.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Dec 2017 03:08:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 12:08:07 +0100
Message-Id: <20171201110816.13519-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171201110816.13519-1-schnitzeltony@gmail.com>
References: <20171201110816.13519-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/10] tumbler: ensure thumbnails work properly
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
X-List-Received-Date: Fri, 01 Dec 2017 11:08:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

After some builds link tumbler-cache-plugin.so is not prperly created causing:
| Failed to load the cache plugin "tumbler-cache-plugin.so": /usr/lib/tumbler-1/plugins/cache/tumbler-cache-plugin.so: cannot open shared object file: No such file or directory

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb
index 4922206..7e0c555 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb
@@ -15,6 +15,12 @@ INSANE_SKIP_${PN} = "dev-so"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gstreamer-thumbnailer] = "--enable-gstreamer-thumbnailer,--disable-gstreamer-thumbnailer,gstreamer1.0 gstreamer1.0-plugins-base"
 
+do_install_append() {
+    # Makefile seems to race on creation of symlink. So ensure creation here
+    # until fixed properly
+    ln -sf tumbler-xdg-cache.so ${D}${libdir}/tumbler-1/plugins/cache/tumbler-cache-plugin.so
+}
+
 FILES_${PN} += "${datadir}/dbus-1/services \
                 ${libdir}/tumbler-1/tumblerd \
                 ${libdir}/tumbler-1/plugins/*.so \
-- 
2.9.5


