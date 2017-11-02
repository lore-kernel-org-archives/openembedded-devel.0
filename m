Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8A2647822B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 10:31:54 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m72so10008733wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=7/EIupalSGA8vxecqlIWQG4hqxxFbN/Tc7fLh4uDszU=;
	b=kt1+gb91E3lHwDxZR2MmgzcLxuFiIv/W8anFpJ/o5xHD/Zq6Z58A73tkFO7t0jICMy
	hfxwwbyJw4IVuKYbzEdaT5+YmH3k6jlLYsDef5nCq0MdE5Bq2YSQnBjDNIAl2tzam9M+
	bOC/4CP/ufL8a+CtTlE53rRfOCvDgS15oEyGUaHeDQdZeRGVMr/QnR8MpIaFcinWGE4/
	kGhh/Z6R2BZDlAv843kgmDnR7O/NXPKabIpR9zN/C/eq0GvHG2z7Vl+xXuzmKwQKZMET
	CZr6JbwIKVe3uu4Roj8Qsv3CmnsZDbcE44yH0nNTc3rgAupzBjLKb+URdleR7+luiUAo
	6PMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7/EIupalSGA8vxecqlIWQG4hqxxFbN/Tc7fLh4uDszU=;
	b=AaBBpptFrsdrFwWwDbiYC81V7WWovJr8Qus5cSaWBV4pUvf6BvVeQVavNDakBKPpEV
	zUDA+eEmpR2k2ex23y1kgzjHOEwd3viabYE8amuMjX0bYgP2+hdlzOlLHTPEpyo/hBbp
	R7zM2u8s5d3uNd5FHok3TcVFCSCM3EMCBsh4yDT9MEH7A7wy2BmH8AYe2scJ5OoOESFI
	b7alb5kps8QBQwCjvR0z32f7x7o+ySSk22uQYm3mVYKZab2Lnp505ru2F6DpWchrxIWh
	MM10NDh+wv/mGj9ViXwDTa+WIiWbSJEWb1lK5/nwkAFkyRLS1sMfGePRN+8/JD3B0JAm
	AFBQ==
X-Gm-Message-State: AMCzsaVtlvAn9CeKbl0iorx15OSeUc3scaD6Wx0N+UpGnRNAfJcQmUpB
	2ruxLC+4nrEsTDgt8rpvs02sDg==
X-Google-Smtp-Source: ABhQp+RDE7Eg4kw/D/5kK85pyOrNLJspWtqfcE7RNa2zdMggrQLcB6Ny2PkC2MUZFr6dgzVjgQhEKA==
X-Received: by 10.28.157.83 with SMTP id g80mr1297654wme.9.1509618714841;
	Thu, 02 Nov 2017 03:31:54 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.googlemail.com with ESMTPSA id
	g68sm340440wmc.22.2017.11.02.03.31.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 03:31:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Nov 2017 11:31:25 +0100
Message-Id: <20171102103129.3703-7-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171102103129.3703-1-schnitzeltony@googlemail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] xfce4-pulseaudio-plugin: update 0.2.4 -> 0.3.2
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
X-List-Received-Date: Thu, 02 Nov 2017 10:31:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...e4-pulseaudio-plugin_0.2.4.bb => xfce4-pulseaudio-plugin_0.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.2.4.bb => xfce4-pulseaudio-plugin_0.3.2.bb} (73%)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.4.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.2.bb
similarity index 73%
rename from meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.4.bb
rename to meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.2.bb
index 4c7ca70..ad0b54a 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.4.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.2.bb
@@ -8,8 +8,8 @@ REQUIRED_DISTRO_FEATURES = "pulseaudio x11"
 
 DEPENDS += "pulseaudio"
 
-SRC_URI[md5sum] = "e0ffde419fa030f1f9bd0b56e3264a1c"
-SRC_URI[sha256sum] = "8d9330ddf1d44a864a36d566cce4b76d4f859c5984bba7653d7dc39aa24d5c3e"
+SRC_URI[md5sum] = "da70bb47755cccf8898dc5cfbe31a6f2"
+SRC_URI[sha256sum] = "fd4ae178912dc17ffb16ce887db24545624c7f423a02bd2eab47d52758fa99d8"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.9.5


