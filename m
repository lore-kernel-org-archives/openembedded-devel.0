Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id A7160786C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 11:08:32 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id a41so7793464wra.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 03:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3EYhzLDxE6eCsuS55dfD9xruxIp0RRm7YxBwdMwGjwM=;
	b=RAbZgkaRsIyNhqCEaNviiSaNK8yWo3JXBuwnZoskhJn4VUdBQ6oV0sRYvTiwzMd8Yb
	A6FpVlVvjm/QEnRkDgtvUdtI4DnYeOo3pKmCa/TAUKDh7RjixnCHT0p7pTs+VVlXkxs9
	n3Rk8qHaBCfcFmsS/705smYek9Gfg7wPraZBxpnH8Lm14X9jKTwkAtiVdj1qOVC5pExG
	vudH4zTD5QrCJ1wrvbbsGl2fqcMzdTi2GWH044T2OqtTTzdwSYn/7B792DwoA4vPvH9S
	zPeZKNQ5H7fm3Ke4x7oMZkjd3IkB71NACTyQ5rzH8rYE+5/psEDAEs0Q+3VGtxy9Qpxv
	sDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3EYhzLDxE6eCsuS55dfD9xruxIp0RRm7YxBwdMwGjwM=;
	b=M0s8Q+V+9eozJyJJ0w4bMT8D+IGPyJXhDpgIHRmnxkz0AGvxRA9KSlCCORA9VP3WUn
	/zWMqx8RNjBH+y2MyHt+izdCKWP3kZKc+QBXMgpfNHmQLyG2WMSVSbkAeoKLmVODmRJM
	2+1uFw/Qw0z5pNIyFSNBu1SDAlSGHn+0o6MBBlI4g3rOO4sNKXr5L6Fq6KsO5Be62LFW
	tGo/gcCwp+I+eSOGrwlzkRWTh4rTuoBdxWyY0NMvioOtnmFfgmAhcygHG7VYetE32yq6
	tGiCIHDQG2WGoKUuGRbmcn/O+yM+u4mMPyhghyhqDhqvIjTtHGVYwpUfD1NCCiNkanbX
	z9iw==
X-Gm-Message-State: AJaThX7w+VSy9dxy7ZeGaIV3Wv/r9Kzh+OjyPJwTNtrvL32QHeZYgbet
	jsgbDU9V7Dpnt8w06e3uTPPNEw==
X-Google-Smtp-Source: AGs4zMZqe68HeFAC6D8advDPC860tYFYDkEROH0p+YXAETxij42r8K93WoiqFn4O7iQJH54TXSCzjw==
X-Received: by 10.223.190.134 with SMTP id i6mr4912607wrh.177.1512126513084;
	Fri, 01 Dec 2017 03:08:33 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id
	a126sm791054wma.11.2017.12.01.03.08.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Dec 2017 03:08:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 12:08:13 +0100
Message-Id: <20171201110816.13519-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171201110816.13519-1-schnitzeltony@gmail.com>
References: <20171201110816.13519-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/10] xfce4-pulseaudio-plugin: update 0.3.2 -> 0.3.3
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
X-List-Received-Date: Fri, 01 Dec 2017 11:08:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...e4-pulseaudio-plugin_0.3.2.bb => xfce4-pulseaudio-plugin_0.3.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.3.2.bb => xfce4-pulseaudio-plugin_0.3.3.bb} (73%)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.2.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.3.bb
similarity index 73%
rename from meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.2.bb
rename to meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.3.bb
index ad0b54a..c8eaa1c 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.2.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.3.bb
@@ -8,8 +8,8 @@ REQUIRED_DISTRO_FEATURES = "pulseaudio x11"
 
 DEPENDS += "pulseaudio"
 
-SRC_URI[md5sum] = "da70bb47755cccf8898dc5cfbe31a6f2"
-SRC_URI[sha256sum] = "fd4ae178912dc17ffb16ce887db24545624c7f423a02bd2eab47d52758fa99d8"
+SRC_URI[md5sum] = "d3d3e012369af6d2302d4b70a7720a17"
+SRC_URI[sha256sum] = "d6aae9409714c5ddea975c350b4d517e078a5550190165b17ca062d0eb69f9a6"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.9.5


